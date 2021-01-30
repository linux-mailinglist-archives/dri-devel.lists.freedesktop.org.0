Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A702230979D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 19:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22686E103;
	Sat, 30 Jan 2021 18:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0057.hostedemail.com
 [216.40.44.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6696E103
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:47:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 9F2FF182CED34;
 Sat, 30 Jan 2021 18:47:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3355:3622:3868:4321:5007:7652:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12555:12740:12895:12986:13439:13894:14181:14659:14721:21080:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: root04_1201875275b3
X-Filterd-Recvd-Size: 3185
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Sat, 30 Jan 2021 18:47:29 +0000 (UTC)
Message-ID: <49b8e2550e661d5f8a5d0b353ec23819cdcae3d2.camel@perches.com>
Subject: Re: [PATCH 09/29] drm/gma500: Avoid comma separated statements
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>
Date: Sat, 30 Jan 2021 10:47:28 -0800
In-Reply-To: <e96626cd1301ff44e5101e0e5913d8439b425c9f.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
 <e96626cd1301ff44e5101e0e5913d8439b425c9f.1598331148.git.joe@perches.com>
User-Agent: Evolution 3.38.1-1 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

Ping?
 =

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0drivers/gpu/drm/gma500/mdfld_intel_display.c | 44 +++++++++++++-------
> =A01 file changed, 28 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/d=
rm/gma500/mdfld_intel_display.c
> index aae2d358364c..bfa330df9443 100644
> --- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
> +++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> @@ -824,33 +824,45 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crt=
c,
> =A0		if ((ksel =3D=3D KSEL_CRYSTAL_19) || (ksel =3D=3D KSEL_BYPASS_19)) {
> =A0			refclk =3D 19200;
> =A0
> =

> -			if (is_mipi || is_mipi2)
> -				clk_n =3D 1, clk_p2 =3D 8;
> -			else if (is_hdmi)
> -				clk_n =3D 1, clk_p2 =3D 10;
> +			if (is_mipi || is_mipi2) {
> +				clk_n =3D 1;
> +				clk_p2 =3D 8;
> +			} else if (is_hdmi) {
> +				clk_n =3D 1;
> +				clk_p2 =3D 10;
> +			}
> =A0		} else if (ksel =3D=3D KSEL_BYPASS_25) {
> =A0			refclk =3D 25000;
> =A0
> =

> -			if (is_mipi || is_mipi2)
> -				clk_n =3D 1, clk_p2 =3D 8;
> -			else if (is_hdmi)
> -				clk_n =3D 1, clk_p2 =3D 10;
> +			if (is_mipi || is_mipi2) {
> +				clk_n =3D 1;
> +				clk_p2 =3D 8;
> +			} else if (is_hdmi) {
> +				clk_n =3D 1;
> +				clk_p2 =3D 10;
> +			}
> =A0		} else if ((ksel =3D=3D KSEL_BYPASS_83_100) &&
> =A0					dev_priv->core_freq =3D=3D 166) {
> =A0			refclk =3D 83000;
> =A0
> =

> -			if (is_mipi || is_mipi2)
> -				clk_n =3D 4, clk_p2 =3D 8;
> -			else if (is_hdmi)
> -				clk_n =3D 4, clk_p2 =3D 10;
> +			if (is_mipi || is_mipi2) {
> +				clk_n =3D 4;
> +				clk_p2 =3D 8;
> +			} else if (is_hdmi) {
> +				clk_n =3D 4;
> +				clk_p2 =3D 10;
> +			}
> =A0		} else if ((ksel =3D=3D KSEL_BYPASS_83_100) &&
> =A0					(dev_priv->core_freq =3D=3D 100 ||
> =A0					dev_priv->core_freq =3D=3D 200)) {
> =A0			refclk =3D 100000;
> -			if (is_mipi || is_mipi2)
> -				clk_n =3D 4, clk_p2 =3D 8;
> -			else if (is_hdmi)
> -				clk_n =3D 4, clk_p2 =3D 10;
> +			if (is_mipi || is_mipi2) {
> +				clk_n =3D 4;
> +				clk_p2 =3D 8;
> +			} else if (is_hdmi) {
> +				clk_n =3D 4;
> +				clk_p2 =3D 10;
> +			}
> =A0		}
> =A0
> =

> =A0		if (is_mipi)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
