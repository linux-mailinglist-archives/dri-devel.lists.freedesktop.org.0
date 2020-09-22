Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345227528E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5394E6E452;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 22 Sep 2020 07:47:31 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA016E7DA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:47:29 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id 727AB120143
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 15:40:18 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.184])
 by regular2.263xmail.com (Postfix) with ESMTP id 7F270232
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 15:40:10 +0800 (CST)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id D9F278D5;
 Tue, 22 Sep 2020 15:40:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.127] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1665T140084565235456S1600760407091705_; 
 Tue, 22 Sep 2020 15:40:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <618a05ef9dc6f4f46f8c8d808fa8263e>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: algea.cao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_1/3=5d_drm=3a_rockchip=3a_hdmi=3a_remove_v?=
 =?UTF-8?B?b3BfY3J0Y19tb2RlX2ZpeHVwIHRvIGZpeCBjbG9jayBoYW5kbGluZ+OAkOivtw==?=
 =?UTF-8?B?5rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlh?=
 =?UTF-8?B?bj1yb2NrLWNoaXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
To: Vicente Bergas <vicencb@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 algea.cao@rock-chips.com
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
Date: Tue, 22 Sep 2020 15:40:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921181803.1160-2-vicencb@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add our HDMI driver owner Algea to list.

On 9/22/20 2:18 AM, Vicente Bergas wrote:
> Under certain conditions vop_crtc_mode_fixup rounds the clock
> 148500000 to 148501000 which leads to the following error:
> dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 148501000)
>
> The issue was found on RK3399 booting with u-boot. U-boot configures the
> display at 2560x1440 and then linux comes up with a black screen.
> A workaround was to un-plug and re-plug the HDMI display.
>
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 45 ---------------------
>   1 file changed, 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index c80f7d9fd13f..fe80da652994 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1142,50 +1142,6 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>   }
>   
> -static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
> -				const struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> -{
> -	struct vop *vop = to_vop(crtc);
> -	unsigned long rate;
> -
> -	/*
> -	 * Clock craziness.
> -	 *
> -	 * Key points:
> -	 *
> -	 * - DRM works in in kHz.
> -	 * - Clock framework works in Hz.
> -	 * - Rockchip's clock driver picks the clock rate that is the
> -	 *   same _OR LOWER_ than the one requested.
> -	 *
> -	 * Action plan:
> -	 *
> -	 * 1. When DRM gives us a mode, we should add 999 Hz to it.  That way
> -	 *    if the clock we need is 60000001 Hz (~60 MHz) and DRM tells us to
> -	 *    make 60000 kHz then the clock framework will actually give us
> -	 *    the right clock.
> -	 *
> -	 *    NOTE: if the PLL (maybe through a divider) could actually make
> -	 *    a clock rate 999 Hz higher instead of the one we want then this
> -	 *    could be a problem.  Unfortunately there's not much we can do
> -	 *    since it's baked into DRM to use kHz.  It shouldn't matter in
> -	 *    practice since Rockchip PLLs are controlled by tables and
> -	 *    even if there is a divider in the middle I wouldn't expect PLL
> -	 *    rates in the table that are just a few kHz different.
> -	 *
> -	 * 2. Get the clock framework to round the rate for us to tell us
> -	 *    what it will actually make.
> -	 *
> -	 * 3. Store the rounded up rate so that we don't need to worry about
> -	 *    this in the actual clk_set_rate().
> -	 */
> -	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
> -	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
> -
> -	return true;
> -}
> -
>   static bool vop_dsp_lut_is_enabled(struct vop *vop)
>   {
>   	return vop_read_reg(vop, 0, &vop->data->common->dsp_lut_en);
> @@ -1512,7 +1468,6 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>   }
>   
>   static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
> -	.mode_fixup = vop_crtc_mode_fixup,
>   	.atomic_check = vop_crtc_atomic_check,
>   	.atomic_begin = vop_crtc_atomic_begin,
>   	.atomic_flush = vop_crtc_atomic_flush,


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
