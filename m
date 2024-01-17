Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18738307E9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAAF10E6A3;
	Wed, 17 Jan 2024 14:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6751F10E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 14:22:44 +0000 (UTC)
Received: from i5e860cd7.versanet.de ([94.134.12.215] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rQ6oK-0008Gl-U3; Wed, 17 Jan 2024 15:22:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH] drm/rockchip: inno_hdmi: Explicitly include
 drm_atomic.h
Date: Wed, 17 Jan 2024 15:22:31 +0100
Message-ID: <8001861.oDFzTOozpa@diego>
In-Reply-To: <iuorynvlxp6m6u5hz3yi5d2ibfd3w6pdsm5ajlztjcsjuaczzl@f7jl7vyux2cl>
References: <20240115092434.41695-2-knaerzche@gmail.com>
 <3186012.MsWZr2WtbB@diego>
 <iuorynvlxp6m6u5hz3yi5d2ibfd3w6pdsm5ajlztjcsjuaczzl@f7jl7vyux2cl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 17. Januar 2024, 14:47:48 CET schrieb Maxime Ripard:
> On Wed, Jan 17, 2024 at 10:52:04AM +0100, Heiko St=FCbner wrote:
> > Hi Maxime,
> >=20
> > Am Mittwoch, 17. Januar 2024, 10:46:57 CET schrieb Maxime Ripard:
> > > On Mon, 15 Jan 2024 10:24:35 +0100, Alex Bee wrote:
> > > > Commit d3e040f450ec ("drm/rockchip: inno_hdmi: Get rid of mode_set")
> > > > started using drm_atomic_get_new_connector_state and
> > > > drm_atomic_get_new_crtc_state which are defined in drm_atomic.h
> > > > Building does currently only work if CONFIG_OF and CONFIG_DRM_PANEL=
_BRIDGE
> > > > are enabled since this will include drm_atomic.h via drm_bridge.h (=
see
> > > > drm_of.h).
> > > >=20
> > > > [...]
> > >=20
> > > Applied to drm/drm-misc (drm-misc-next).
> >=20
> > wouldn't have drm-misc-next-fixes been more appropriate?
> > Because I _think_ the change causing the issue made it in during the
> > current merge-window?
>=20
> AFAIK, the offending commit is in drm-misc-next only

ah, you're of course right. Mistook that for the one in the rk3066_hdmi
but that was fixed back in november already.

So all is well.

Heiko


