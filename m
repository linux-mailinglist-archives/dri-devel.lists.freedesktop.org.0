Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91E258913
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989C6E5BD;
	Tue,  1 Sep 2020 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383026E598
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:15:30 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200901041529epoutp0271c69c1aca142da74965937f5a864bd1~wjcFRZV562915929159epoutp02D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:15:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200901041529epoutp0271c69c1aca142da74965937f5a864bd1~wjcFRZV562915929159epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598933729;
 bh=3WdAxCuqh6cVlPfws3AsDDQng2gxwI57KUnhSvyF9tI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=XF3LTrDRqF3kfOHpqiBPEyL66Tp8CCcC5ezXioif3+rMsLuuEYE5Ujl/nZMYrq3le
 n/JAuZwwtMoH6HZWo8jPu8MTO6d9HPuASBi5Kefi3tOVXIFEgi7L/PMPl559tRYyxV
 wMwBIixzkNpCSsWrpGGFYz2zNqFotDMjqBeSOW7Y=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901041528epcas1p145d317901fc190254fc5a8fcf84a52d4~wjcE0rWDN0736407364epcas1p1l;
 Tue,  1 Sep 2020 04:15:28 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BgYdG5FqwzMqYm6; Tue,  1 Sep
 2020 04:15:14 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 AE.C6.18978.ACACD4F5; Tue,  1 Sep 2020 13:15:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200901041505epcas1p4f6bb868de0beb554e708f9aa3a578f6d~wjbvChLbr1010310103epcas1p4_;
 Tue,  1 Sep 2020 04:15:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901041505epsmtrp17553141b8b96e2004732a83f30a11e8b~wjbvBQs890331203312epsmtrp1w;
 Tue,  1 Sep 2020 04:15:05 +0000 (GMT)
X-AuditID: b6c32a35-5edff70000004a22-ac-5f4dcaca9505
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.40.08303.9CACD4F5; Tue,  1 Sep 2020 13:15:05 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200901041504epsmtip213960aef21407382983f4a7ead95547a~wjbupowAQ1597015970epsmtip2_;
 Tue,  1 Sep 2020 04:15:04 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] drm/vc4: hdmi: Add pixel bvb clock control
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, nsaenzjulienne@suse.de,
 eric@anholt.net, maxime@cerno.tech, stefan.wahren@i2se.com,
 dave.stevenson@raspberrypi.com
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <46e051f7-ba72-5960-da95-a2e9c44d2d85@samsung.com>
Date: Tue, 1 Sep 2020 13:27:33 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200901040759.29992-3-hoegeun.kwon@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHc/q4LSxldwXkUN1W73ADMh7XWnZ51BAn7A5m6GZmDDGUG7gD
 Bn2st6gbf+iYoKAT0YHY0eBEg8MHrDAeJayIRQOCDCrIOhgMSMYgtdvQwCDg+sCM/76/3/l8
 8833nBw+W/gvIuLnqHS0VkXlYYg3p+VuSERYX98+RWTHqoi49XUPh7AbajlEjeUhl3j0zIEQ
 XV9aAeGoK0WI9ke3OIRxZpRL/H3mNy5hNVUjRPmvjTyiankdEEN9CUSLvg4hbtsWEKKo08Ij
 1kd/cBqujyHEdMUkiPclCx33ENIxVsQj9ZMDCDn+cBAh2/UTPPJHm5Q01pcg5OTp+yyy6eox
 sqhnhUOeba4HZNODAnLR+JpckJobl01TmbRWTKsy1Jk5qiwZlrxf8a5CGhWJh+HRxDuYWEUp
 aRm29wN5WGJOnrMmJj5M5eU7V3KKYbCI3XFadb6OFmerGZ0MozWZeZpoTThDKZl8VVZ4hloZ
 g0dG7pQ6wfTc7BtjsZrKwKNXKu284+CxXynw4kN0F5wutYNS4M0Xom0AfmOqZHmGfwC0PbjK
 9QyLAC4O9yMvLNbxpg3KBGBTlYHjGRwAlozeYLkoXzQRnq+84nb4obUAttkOuSA2usqC1tOd
 7gMEDYXmuTG3fhndDkeWZ4BLC9DdsGWo3b3noEFwqqOV49L+6AHY23Jig3kF9l6ade+9nPxw
 4Wk3z0YDoG22huXRr8NWezXbFQzROi94bWGZ5+mwFz5uPruhfeH8/eYNLYJ/lhVv6AL4fa8F
 8ZhPAdhs/pnrOZBA87ULzgS+MyEENpgiPOvtsH3VADzBPvDJszNcFwJRATxVLPQgb0Dr1ATL
 owNh7ckS5BzA9Jvq6DdV0G+qoP8/7DLg1IMttIZRZtEMrsE3P7cRuP9AqLQNlNv/Cu8GLD7o
 BpDPxvwEXaZkhVCQSX3+Ba1VK7T5eTTTDaTOCy5ni/wz1M5PpNIpcOlOiURC7MKjpDiOBQh+
 t4kVQjSL0tG5NK2htS98LL6X6DhLNt55tDapPmZA/VVKytKbizHa+v6PnsZbSiSWpYYgS1lw
 cdBL+elp1HPHNiRzj2Sux8BbUB5+/9ubQx3+z0dO4MmrcYIdn12cMvssJYpeLffJumT0Dhxc
 MyeWriSmdrwn2+pI67prC9v2pERcVpGgCjYkrX8iOzj/S/9cRnpaj2JwLQT748LBLmOhSiQ/
 okxPYh2Q3DRMx+Yw1xtkEylM+7xuJbbm6WX52ki/tcCEV7DP9zUwvjNbg1sDBFTjYP/bs2vf
 fRx8J/qn+NvHqqn9drMcFR2iRWsrYZItA40JC8Z99FstQcMfxo5W1TUfMXuf/NQ3qmiP8E56
 7o57qRdrSYzDZFN4KFvLUP8BBZwTWIwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMURzHnb23s7dtdtzaTadELOOxRivPMx5NM4k7QpoxxvhDLa5CWzv3
 InkmxSjv0eJapQftLIUibWqkLKOHnSRSVGyZBlmsjMpEuztm+u9zvr/P579DEV5W0o/aFr+T
 5eLVcQooIUtrFAEzn9Wuippl1ktw4UkziXuv5JE4+/FzN/yyzwZx1eEmgG0F6RCbXhaSuNj6
 yg1/P9HuhpvK9RCfbbstxhd/DwHcWBuGS4UCiItaP0OcVvlYjIde3RkODC0Qf8jsACEyJsX2
 BDK2ljQxI3Q0QObtcwtkTMI7MXOvdR5TbDwOmY6MpyKmJP8Qk2YeIJlTd42AKanbx9iLx6+R
 bpAs3sLGbdvNcqrgaEnsjZZFWp3vnlxdrzgZvJanA3cK0XNR09sSkYO96DKA6j5td+2+SNdo
 JtIBNcwyVFPDpwPJsNILUGq7wenL6GXonC4XOg5yOg+gC/WFwPEg6EERMrz/BF2JGaD6snOE
 I4G0Ej3saYEOHk1PRM2/rcDBUjoYlTaanDtJT0adD+6TDvam1yFTvlXkcjzRs0tdzt192H+R
 kuH0CXoq+pP1gnCxD2rtyha5OADd79UTZ4BMGJELIxJhRCKMSK4C0gh8WS2vidHwQdrZ8Wxi
 IK/W8LviYwI3J2iKgfMfKJVloML4LbAaiChQDRBFKOTSqvLwKC/pFnXSXpZLiOJ2xbF8NRhL
 kQofaZ+Qs9GLjlHvZHewrJbl/l9FlLtfsig0aTC6Ad5oMxaYOrvak8aoqit+Ltk0bWnPQsv6
 IuFk4iKL/FQjafe3+BVJl8f2X5r28WY/ebxyXE7knIF1qq/++s8zsn6ujQiXdftPxDGwu+Qy
 U0cdud2zJnbB1+7AUCYsuIG/9kv+JqP/x75bxqMpd9vCI7iUTSGyg+drH7z2EF9XcjU+c1ce
 To0ozxzM9jB4j33aSWik0bmPRo/b+MP3SNgTVV/PsfVBHjumD6TW5TYnNK++JavIs6+wJUaB
 01p+mcpqmT5lv/2gITOSkLyfNGNCyNAH+wEyKyBM4No8dTbP1q36Vce81waMqZy3lfqb3Pfl
 Tej8qvGjLi/ffKBeHKkg+Vh1kJLgePU/4FAB8XYDAAA=
X-CMS-MailID: 20200901041505epcas1p4f6bb868de0beb554e708f9aa3a578f6d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200901040851epcas1p3124094e38175758b2310bdae6d76793c
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p3124094e38175758b2310bdae6d76793c@epcas1p3.samsung.com>
 <20200901040759.29992-3-hoegeun.kwon@samsung.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hoegeun,

It looks good to me. But, just one comment.

On 9/1/20 1:07 PM, Hoegeun Kwon wrote:
> There is a problem that the output does not work at a resolution
> exceeding FHD. To solve this, we need to adjust the bvb clock at a
> resolution exceeding FHD.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 95ec5eedea39..eb3192d1fd86 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -80,6 +80,7 @@
>  # define VC4_HD_M_ENABLE			BIT(0)
>  
>  #define CEC_CLOCK_FREQ 40000
> +#define VC4_HSM_MID_CLOCK 149985000
>  
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>  {
> @@ -380,6 +381,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
>  	HDMI_WRITE(HDMI_VID_CTL,
>  		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>  
> +	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>  	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>  	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>  
> @@ -638,6 +640,23 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>  		return;
>  	}
>  
> +	ret = clk_set_rate(vc4_hdmi->pixel_bvb_clock,
> +			(hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +		return;
> +	}
> +
> +	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
> +	if (ret) {
> +		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
> +		clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +		return;
> +	}

Generally, enable the clock before using clk and then change the clock rate.
I think that you better to change the order between clk_prepare_enable and clk_set_rate.


> +
>  	if (vc4_hdmi->variant->reset)
>  		vc4_hdmi->variant->reset(vc4_hdmi);
>  
> @@ -1593,6 +1612,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>  		return PTR_ERR(vc4_hdmi->audio_clock);
>  	}
>  
> +	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
> +	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
> +		DRM_ERROR("Failed to get pixel bvb clock\n");
> +		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
> +	}
> +
>  	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(vc4_hdmi->reset)) {
>  		DRM_ERROR("Failed to get HDMI reset line\n");
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 0806c6d9f24e..63c6f8bddf1d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -147,6 +147,7 @@ struct vc4_hdmi {
>  	struct clk *pixel_clock;
>  	struct clk *hsm_clock;
>  	struct clk *audio_clock;
> +	struct clk *pixel_bvb_clock;
>  
>  	struct reset_control *reset;
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
