Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27B9C1EE0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944C10E9C0;
	Fri,  8 Nov 2024 14:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="SKx0n5Eh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711F810E9C0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTfR9AhVV8McI4g4aOI6ukS+LiMUl23jlY0qQyPzn+s=; b=SKx0n5EhMqWfn+/C4Mo8k1ACYd
 DXJQeah3aR3Hd20oz1rmgnJ9vWJCRFOosRNEUlio9UcJ2oYXShmKcec+wC+oWCKPNUl++cSuhJ44e
 mwanlL6kp53EgD5b197zHXo4dcVOpGxDxxTNciz9BWhpw2phg+woANJYXIMR3K/s3tpRwJyYhVgvG
 ezPITg6HHnZtCK8BzlA1ZU/BO3uk0u1oWPIQMFOS723QGf2fRl5o0dIbIabmOkRuwpCZLchMeZKuM
 PSrcDGsvq+eC1v49Xc3U7h065Iv22j1+HzREdlaGtX+FR2NpsUufq60mFottxfYcGOF3MWeIhwBwV
 kgjhzZlQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9Pfp-0006aO-Qt; Fri, 08 Nov 2024 15:09:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri, 08 Nov 2024 15:09:16 +0100
Message-ID: <10558711.nUPlyArG6x@diego>
In-Reply-To: <3734f6a5424e3537d717c587a058fc85@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <13633881.uLZWGnKmhe@diego>
 <3734f6a5424e3537d717c587a058fc85@manjaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2024-11-08 14:56, Heiko St=FCbner wrote:
> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
> >> Perform a few trivial code cleanups, to make one logged message a bit=
=20
> >> more
> >> consistent with the other logged messages by capitalizing its first=20
> >> word, and
> >> to avoid line wrapping by using the 100-column width better.
> >>=20
> >> No intended functional changes are introduced by these code cleanups.
> >>=20
> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >> ---
> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c=20
> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> index 58a44af0e9ad..f451e70efbdd 100644
> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct=20
> >> platform_device *pdev)
> >>  	}
> >>=20
> >>  	if (!dsi->cdata) {
> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> >=20
> > this is all probe-related, why not convert to dev_err_probe?
> >=20
> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
> > So dev_err_probe would be the correct way to go?
>=20
> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
> deprecated (which I originally missed, in all honesty) makes me very
> happy. :)  I've never been a huge fan of the format of the messages
> that DRM_DEV_ERROR() produces.
>=20
> However, perhaps it would be better to keep these patches as-is, as
> some kind of an intermediate, limited-scope cleanup + bugfix combo,
> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
> conversion to separate patches.  I think it would be better to avoid
> a partial conversion, and I'll be more than happy to put the complete
> conversion on my TODO list. :)

But your patch-2 really just open-codes, what dev_err_probe is meant
to fix. So with going this way, you're sort of making things worse first,
until that second step happens.

Similarly, reflowing lines for things that get removed in a week do not
serve a purpose - those line-breaks have been that way for years
already.


