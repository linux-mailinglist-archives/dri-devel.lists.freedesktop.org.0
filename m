Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECC34D41D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FA1890BB;
	Mon, 29 Mar 2021 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5759890BB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:39:16 +0000 (UTC)
Date: Mon, 29 Mar 2021 16:39:02 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
To: Maxime Ripard <maxime@cerno.tech>
Message-Id: <25MQQQ.YYKN0GE2YPZN1@crapouillou.net>
In-Reply-To: <20210329153541.a3yil2aqsrtf2nlj@gilmour>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <S1LQQQ.K5HO8ISMBGA02@crapouillou.net>
 <20210329153541.a3yil2aqsrtf2nlj@gilmour>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 29 mars 2021 =E0 17:35, Maxime Ripard <maxime@cerno.tech> a =

=E9crit :
> On Mon, Mar 29, 2021 at 04:15:28PM +0100, Paul Cercueil wrote:
>>  Hi Maxime,
>> =

>>  Le lun. 29 mars 2021 =E0 16:07, Maxime Ripard <maxime@cerno.tech> a =

>> =E9crit :
>>  > On Sat, Mar 27, 2021 at 11:22:14AM +0000, Paul Cercueil wrote:
>>  > >  The ingenic-drm driver has two mutually exclusive primary =

>> planes
>>  > >  already; so the fact that a CRTC must have one and only one =

>> primary
>>  > >  plane is an invalid assumption.
>>  >
>>  > I mean, no? It's been documented for a while that a CRTC should =

>> only
>>  > have a single primary, so I'd say that the invalid assumption was =

>> that
>>  > it was possible to have multiple primary planes for a CRTC.
>> =

>>  Documented where?
>> =

>>  I did read the doc of "enum drm_plane_type" in <drm/drm_plane.h>, =

>> and the
>>  DRM_PLANE_TYPE_PRIMARY describes my two planes, so I went with that.
> =

> At least since 4.9, this was in the documentation generated for DRM:
> https://elixir.bootlin.com/linux/v4.9.263/source/drivers/gpu/drm/drm_plan=
e.c#L43

Ok, I read that as "all drivers should provide AT LEAST one primary =

plane per CRTC", and not as "all drivers should provide ONE AND ONLY =

ONE primary plane per CRTC". My bad.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
