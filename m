Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9F9C1F15
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D110E9CC;
	Fri,  8 Nov 2024 14:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lOrhdASv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3C10E9CC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=03Fc1fmCF/avRthU6lr7E9Jhe4IxFOTMxCL1KW92V/s=; b=lOrhdASv7gsImU9H6JBn4Q7VGa
 XTYrdXLQU1uFqre8mwmKTU7BL2IA7FOr7KlJ76A1TbEIegqSCvTSXNKT/l9kZMWoTxTpYx27f7Lll
 qy0ozFX8Xg7whfsMOBbBdnbdTbZTFzikQIkEahETI5qUNDkcju+wqjl7d3+kiLr39B02sOsphjH3z
 ostzHmMz/d9kSIVBTyJPXTeKs6UZAj4GEreNDzVcy+ZgNs1IjUZQ6sKLYeMkFdvcAa0QKVMrT1Ivn
 fHaWaUXlB5+aXZwemkFDJsQGjoS9Uwhb+LB2BNe/7o+20laNwsWIGnD/bkKQexJCELnxmRN1tG7Ju
 xbmAkMGw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9Pso-0006fc-4s; Fri, 08 Nov 2024 15:22:42 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri, 08 Nov 2024 15:22:41 +0100
Message-ID: <22484879.EfDdHjke4D@diego>
In-Reply-To: <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <10558711.nUPlyArG6x@diego>
 <047164cc6e88dcbc7701cb0e28d564db@manjaro.org>
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

Am Freitag, 8. November 2024, 15:13:33 CET schrieb Dragan Simic:
> On 2024-11-08 15:09, Heiko St=FCbner wrote:
> > Am Freitag, 8. November 2024, 15:05:02 CET schrieb Dragan Simic:
> >> On 2024-11-08 14:56, Heiko St=FCbner wrote:
> >> > Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
> >> >> Perform a few trivial code cleanups, to make one logged message a b=
it
> >> >> more
> >> >> consistent with the other logged messages by capitalizing its first
> >> >> word, and
> >> >> to avoid line wrapping by using the 100-column width better.
> >> >>
> >> >> No intended functional changes are introduced by these code cleanup=
s.
> >> >>
> >> >> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >> >> ---
> >> >>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
> >> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> index 58a44af0e9ad..f451e70efbdd 100644
> >> >> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> >> >> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct
> >> >> platform_device *pdev)
> >> >>  	}
> >> >>
> >> >>  	if (!dsi->cdata) {
> >> >> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> >> >> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);
> >> >
> >> > this is all probe-related, why not convert to dev_err_probe?
> >> >
> >> > As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_e=
rr.
> >> > So dev_err_probe would be the correct way to go?
> >>=20
> >> Thanks for your quick response!  Seeing that DRM_DEV_ERROR() is now
> >> deprecated (which I originally missed, in all honesty) makes me very
> >> happy. :)  I've never been a huge fan of the format of the messages
> >> that DRM_DEV_ERROR() produces.
> >>=20
> >> However, perhaps it would be better to keep these patches as-is, as
> >> some kind of an intermediate, limited-scope cleanup + bugfix combo,
> >> and leave the complete DRM_DEV_ERROR() --> dev_err()/dev_err_probe()
> >> conversion to separate patches.  I think it would be better to avoid
> >> a partial conversion, and I'll be more than happy to put the complete
> >> conversion on my TODO list. :)
> >=20
> > But your patch-2 really just open-codes, what dev_err_probe is meant
> > to fix. So with going this way, you're sort of making things worse=20
> > first,
> > until that second step happens.
> >=20
> > Similarly, reflowing lines for things that get removed in a week do not
> > serve a purpose - those line-breaks have been that way for years
> > already.
>=20
> Hmm, it makes sense when described that way.  I'll see to perform the
> complete conversion in the next few days.

just a note, as written on IRC earlier, I am sitting on a dev_err_probe
conversion for dw-dsi-rockchip.

I was waiting to see if more cleanups turned up, so didn't sent that yet.

Don't want to steal your spotlight though, so not sure if I should send
that or wait for your conversion ;-)


Heiko



