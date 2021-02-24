Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD90323EA8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 14:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3856E8C9;
	Wed, 24 Feb 2021 13:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CD96E8C9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 13:46:32 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:44:37 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Message-Id: <DUC1PQ.KO33KJE3BP5L@crapouillou.net>
In-Reply-To: <20210124085552.29146-1-paul@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Some feedback for patches 1-3? Laurent?

Cheers,
-Paul


Le dim. 24 janv. 2021 =E0 8:55, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Hi,
> =

> Here are three independent fixes. The first one addresses a
> use-after-free in bridge/panel.c; the second one addresses a
> use-after-free in the ingenic-drm driver; finally, the third one makes
> the ingenic-drm driver work again on older Ingenic SoCs.
> =

> Changes from v2:
> - patch [1/4] added a FIXME.
> - patch [2/4] is new. It introduces a =

> drmm_plain_simple_encoder_alloc()
>   macro that will be used in patch [3/4].
> - patch [3/4] uses the macro introduced in patch [2/4].
> - patch [4/4] is unmodified.
> =

> Note to linux-stable guys: patch [v2 2/3] will only apply on the =

> current
> drm-misc-next branch, to fix it for v5.11 and older kernels, use the =

> V1
> of that patch.
> =

> Cheers,
> -Paul
> =

> Paul Cercueil (4):
>   drm: bridge/panel: Cleanup connector on bridge detach
>   drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
>   drm/ingenic: Register devm action to cleanup encoders
>   drm/ingenic: Fix non-OSD mode
> =

>  drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 =

> +++++++++++------------
>  include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
>  3 files changed, 42 insertions(+), 13 deletions(-)
> =

> --
> 2.29.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
