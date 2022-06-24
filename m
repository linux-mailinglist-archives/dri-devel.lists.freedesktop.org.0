Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF05559544
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7310C112C31;
	Fri, 24 Jun 2022 08:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jun 2022 08:22:04 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C826112C31
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 08:22:04 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220624081614epoutp018e4501708a943de2925c3003d4866f66~7gH-TN6-H0653206532epoutp016
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 08:16:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220624081614epoutp018e4501708a943de2925c3003d4866f66~7gH-TN6-H0653206532epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1656058574;
 bh=FZKEJyZFjw0T/Qua7bnSNem9kLldLXaTWqvJ2h9mH5s=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Qr10487sa5kzizpKklhGgEji/BhIC+ItoRGWhcNeuSg/mZhTaC0kWxdyzb1p/JwPs
 j5Rm95LGFNe2VWcQ5tOcPBTHXUePUUdDm90VW3iaDYJbanUsuJDd/PSksFFxZKLhm0
 fdjR0p6b8xXnTBVsb6xc2wL+Ef/6ykVwxGrioQAE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220624081614epcas1p27724b31b4a7d6303b411428cf9e4ba16~7gH_8-Yp-2849228492epcas1p21;
 Fri, 24 Jun 2022 08:16:14 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.36.132]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4LTqhF1YPrz4x9QD; Fri, 24 Jun
 2022 08:16:13 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 98.1C.09633.DC275B26; Fri, 24 Jun 2022 17:16:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220624081612epcas1p2522bebb1b25582774af413a0ce4739e6~7gH9n_BIF2849828498epcas1p2o;
 Fri, 24 Jun 2022 08:16:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220624081612epsmtrp27137b20230de1e30e1f8c2f32e9a78f0~7gH9mtxM32357323573epsmtrp2v;
 Fri, 24 Jun 2022 08:16:12 +0000 (GMT)
X-AuditID: b6c32a36-05fff700000025a1-67-62b572cd374b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.94.08905.CC275B26; Fri, 24 Jun 2022 17:16:12 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220624081612epsmtip260e0775d4ceefb6fafe207b5bd3cec4c~7gH9GzKhI1269612696epsmtip2S;
 Fri, 24 Jun 2022 08:16:12 +0000 (GMT)
Message-ID: <4e8d94c9-7dc0-039f-7d67-36f6c099ab75@samsung.com>
Date: Fri, 24 Jun 2022 17:16:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/exynos: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Content-Language: en-US
To: hongao <hongao@uniontech.com>, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie,
 daniel@ffwll.ch, krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220616072233.8302-1-hongao@uniontech.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmnu7Zoq1JBmdOsln0njvJZPFg3jY2
 i//bJjJbXPn6ns1i0apbbBZ7X29ltzjb9IbdYtPja6wWl3fNYbOYcX4fk8WMyS/ZHLg99n5b
 wOJx59oeNo/t3x6wetzvPs7ksXlJvUffllWMHieXzmDy+LxJLoAjKtsmIzUxJbVIITUvOT8l
 My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hQJYWyxJxSoFBAYnGxkr6dTVF+
 aUmqQkZ+cYmtUmpBSk6BaYFecWJucWleul5eaomVoYGBkSlQYUJ2xtGO56wFKzkr9l1ZzdzA
 +Ji9i5GTQ0LARKLj2TGmLkYuDiGBHYwS/4/+ZoNwPjFK9B4+CeV8Y5Q40XiKEaalueUqVMte
 RonHb7axQzjvGSWefr7O0sXIwcErYCfxeZYbSAOLgKrE5N4nYM28AoISJ2c+YQGxRQUiJFa2
 vgGzhQWSJA5dewxWwywgLnHryXywBSICZxklZu57BnYGs0APo8T5D0vALmcDmjpxxX02EJtT
 wFJiVeMvJohueYnmrbOZQRokBC5wSPz/e4oJ4m4XiVmLm5ghbGGJV8e3QINASuLzu71sEA2T
 GSXuXF/BAuHMYJQ4/PM61NfGEvuXTmYC+Y1ZQFNi/S59iLCixM7fc6Hu5pN497WHFaREQoBX
 oqNNCKJESeLYxRtQUyQkLiyZyAZR4iHR+iZ3AqPiLKSAmYUUALOQvDMLYe8CRpZVjGKpBcW5
 6anFhgVG8PhOzs/dxAhOxlpmOxgnvf2gd4iRiYPxEKMEB7OSCO+L/5uThHhTEiurUovy44tK
 c1KLDzGaAqNnIrOUaHI+MB/klcQbmlgamJgZGZtYGJoZKonzrpp2OlFIID2xJDU7NbUgtQim
 j4mDU6qBiXvxTEueaT2vPN4lK6w/YKD29LWY133hLaVlB07ITiy5eVH7OuvNuvAdVyrzYwSV
 Wmfwhd5bfYZzHvvPTdNjlmjLbe16YczXwiS4uaJi6cf1Zx62Tn99gd9QxlTQ1M9kyUbXuRuE
 /T4IVW9oOuT/Mf7qNumXdxTvhhkukVt0R+rlVo+EBZZ+7no1bSs5/nC+PGcV2/7lmIPJDakP
 Yi1HOS0KBaWOFST9blxdv6BezcDEuFd4mYiOzNcNK9kZb/Mfn7I9UEhGe1ne6rTna4/Hau/d
 PnmOwZ53Ey3PV/lKvFJYFGlQVCxauPhHzrX5y9Xf7fxwP3xio/aaTQXuS07tlHm7Kfx3TKDI
 TPszIk/kYpRYijMSDbWYi4oTASf1aSlPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWy7bCSvO6Zoq1JBk/eKFn0njvJZPFg3jY2
 i//bJjJbXPn6ns1i0apbbBYv7l1ksdj7eiu7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLGZMfsnm
 wOOx99sCFo871/aweWz/9oDV4373cSaPzUvqPfq2rGL0OLl0BpPH501yARxRXDYpqTmZZalF
 +nYJXBlHO56zFqzkrNh3ZTVzA+Nj9i5GTg4JAROJ5parTF2MXBxCArsZJWY0fGXrYuQASkhI
 bNnKAWEKSxw+XAxR8pZRon3PaVaQOK+AncTnWW4gY1gEVCUm9z5hBLF5BQQlTs58wgJiiwpE
 SHxaNoEVxBYWSJI4dO0xWA2zgLjErSfzwdaKCJxllHh6tJ8FxGEW6GGU2HF2JjvENiBnX0sn
 M0gLG9CKiSvus4HYnAKWEqsafzGBXMEsoC6xfp4QxFR5ieats5knMArNQnLILCQLZyF0zELS
 sYCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnAEamnuYNy+6oPeIUYmDsZDjBIc
 zEoivC/+b04S4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oq
 gcmquSB7ywqpFf9maLVPYP20Smout7GEQwCLpsnMZcFrHTfl2b/qsnhxR/FpwBvB0/Ptr92r
 murzX8Foxn2de9eaZPdqTmiyX7QrmCMs+P683QV6Thf41qxrnzLX2G7BaR6matk3LGVzs/f/
 eMC94/vZFxfmZ+9v/KjyrJe3dWWqPhfzA9bm9W31UhZSa6/oMNyyC+L6Nj/36qcA2d25H0MM
 MhMXL1H7MmGtrMQKJu4XMZqXDDry/6sWt57c9qdYrc1zD7dGXznDhKYHG13nauxnV1pau/Xd
 tfT4tVIcVQqJzc/Udlk9ai4+a/PtVeT8lbp1my+ZnWVbzxDPLj9tz/9k3mWf8u4nK/TtU0l+
 m63EUpyRaKjFXFScCAB2OGqYLwMAAA==
X-CMS-MailID: 20220624081612epcas1p2522bebb1b25582774af413a0ce4739e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220616072357epcas1p4921f90a2fe077e360688e0df00a5dde8
References: <CGME20220616072357epcas1p4921f90a2fe077e360688e0df00a5dde8@epcas1p4.samsung.com>
 <20220616072233.8302-1-hongao@uniontech.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



22. 6. 16. 16:22에 hongao 이(가) 쓴 글:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi.
> 
> This driver calls drm_detect_hdmi_monitor() to receive the same
> information, which is less efficient.
> 
> Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
> instead.
> 

Applied.

Thanks,
Inki Dae

> Signed-off-by: hongao <hongao@uniontech.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 7655142a4651..17e9f5efbcfc 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -893,7 +893,7 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  	if (!edid)
>  		return -ENODEV;
>  
> -	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
> +	hdata->dvi_mode = !connector->display_info.is_hdmi;
>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>  			  edid->width_cm, edid->height_cm);
