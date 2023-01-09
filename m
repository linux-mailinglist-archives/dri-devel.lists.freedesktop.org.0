Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ABC662797
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 14:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467F10E0B8;
	Mon,  9 Jan 2023 13:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDAB10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 13:46:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230109134647euoutp02ec7af835749a60fedb03ecbee1376059~4qAZ1sR3i1723517235euoutp02D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 13:46:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230109134647euoutp02ec7af835749a60fedb03ecbee1376059~4qAZ1sR3i1723517235euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673272007;
 bh=0nwkwv/Rw0/gOSHiBDWJzOYYgdsO4mbdAhH0BIWIEsM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ZpMQdlE+rZ4RiykOwHOQIZ28A/ktqDt5NlA3gEw7w/syJcgl8HL9tSOxWYJe4bH+C
 wqm28M4hJWvTh4ECenuav1VCxkdmD4I+TGmYIQOPTzpryGvB88Ayk+JHwIYB25Onf+
 40p8V0IdYvM2gf4428Zcu+0bxUVKKD5YFvqUeG3E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230109134646eucas1p1e9146c0edaa99ab48cf13e1e27e712c7~4qAZjFLms0769807698eucas1p1g;
 Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.1F.43884.6CA1CB36; Mon,  9
 Jan 2023 13:46:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83~4qAZANu6f2042520425eucas1p1p;
 Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230109134646eusmtrp260122d9ff5535c5e6238658f3e998993~4qAY-ej8R0582105821eusmtrp2j;
 Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-7d-63bc1ac6d7ee
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A0.10.23420.6CA1CB36; Mon,  9
 Jan 2023 13:46:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230109134645eusmtip20ab292f975ca377bab1cc28ed2389967~4qAYSybTE0962109621eusmtip2P;
 Mon,  9 Jan 2023 13:46:45 +0000 (GMT)
Message-ID: <6c865dd8-b6c3-4491-48ca-df3e3fa45a2d@samsung.com>
Date: Mon, 9 Jan 2023 14:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RESEND2,v4,2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGKsWRmVeSWpSXmKPExsWy7djPc7rHpPYkG8w/bmQx9eETNosrX9+z
 Wbx5dITZ4mf7FiaLb1c6mCwWzOa22PT4GqvF5V1z2CyOLTrJYrH92yM2izlLT7BYvN95i9GB
 x+P9jVZ2j99HH7N77Jx1l93j6YTJ7B6bVnWyedy5tofN4373cSaPzUvqPT5vkgvgjOKySUnN
 ySxLLdK3S+DKuL7AuWC6WMXWyfvZGhj/CHYxcnJICJhIvJ2xl7mLkYtDSGAFo8SHdddYIZwv
 jBI3GnezQzifGSWaJh9jgWmZsec2I0RiOaPE5RetUP0fGSXOrnoAVsUrYCfx9P8RNhCbRUBF
 4vfJxewQcUGJkzOfANVwcIgKpEhs+lMGEhYWCJXY9vAdWDmzgLjErSfzmUBsEYFUibuzz0LF
 u5kl7l2QArHZBAwlut52sYGM4RSIl7jywwiiRF5i+9s5YOdICMzmlHh5/iMTxNEuElc/PICy
 hSVeHd/CDmHLSPzfCbILpKGdUWLB7/tQzgRGiYbntxghqqwl7pz7BbaNWUBTYv0ufRBTQsBR
 4sNifgiTT+LGW0GIG/gkJm2bzgwR5pXoaBOCmKEmMev4OritBy9cYp7AqDQLKUxmIXl+FpJv
 ZiGsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwqZ3+d/zrDsYVrz7qHWJk4mA8
 xCjBwawkwruSc0+yEG9KYmVValF+fFFpTmrxIUZpDhYlcd4ZW+cnCwmkJ5akZqemFqQWwWSZ
 ODilGpj838Y/nfzb/93VLuUTfp71i99P9y7+H1aZKim35FCCyWWZBXzM+lLFvFWZDF9/8HsY
 BktcV5dfcntXzOKpRzxEuv+/T9vFsSvp2PYQ45eT5/N/rjw/mX/7sUeTN09tvrPbkDmDyXyJ
 gL78/Tu/Shed37XnXWK3ROyWZTmaR/7fXFLhpf7ReIPyYf7lRwp9a9Ly57NszpnOeeY1i3fm
 rtZq1tjNWkaP3r3bIfdowv4Hcu84Ja9zNpT0/3qsUL277lHP3jkquvN8N3gtC28RPx2+cWeq
 gJ/o5ep3N/eJrLnqxW2c/t1kq52qK+OmmeZXb3yc51TI8/6VrtF9z9uOP173a6/7FnuBzaWx
 Vm3nR8FOJZbijERDLeai4kQAW8SEvNkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7rHpPYkG9xcwGsx9eETNosrX9+z
 Wbx5dITZ4mf7FiaLb1c6mCwWzOa22PT4GqvF5V1z2CyOLTrJYrH92yM2izlLT7BYvN95i9GB
 x+P9jVZ2j99HH7N77Jx1l93j6YTJ7B6bVnWyedy5tofN4373cSaPzUvqPT5vkgvgjNKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLuL7AuWC6WMXW
 yfvZGhj/CHYxcnJICJhIzNhzm7GLkYtDSGApo8SbZy/ZIRIyEienNbBC2MISf651sUEUvWeU
 +DZ9BViCV8BO4un/I2wgNouAisTvk4vZIeKCEidnPmEBsUUFUiSan58EqxcWCJXY9vAdWD2z
 gLjErSfzmUBsEYFUiY8L9zBDxLuZJa68yQWxhQTiJBZ3nAabwyZgKNH1FuQIDg5OgXiJKz+M
 IMrNJLq2djFC2PIS29/OYZ7AKDQLyRWzkGybhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz
 0vWS83M3MQLjeNuxn5t3MM579VHvECMTB+MhRgkOZiUR3pWce5KFeFMSK6tSi/Lji0pzUosP
 MZoCg2Iis5Rocj4wkeSVxBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBK
 NTCxWMxkXZnRFaw2z2YL538jtcIfTRsOSnAu3+RrbJrxyrfwROt3o9w1O9OTX/FtbNNZmCiz
 /OOPWZ0LUuLWZ9UvZl2jl1ySPrOlkv9Lz68MkVCeY39zbLxU2RlPp3n52Pv4d/c53plxdqb3
 uX+XzdoNF66MY7DU7vh+bo6OtWl9NQv/SZZiQ42u1DPyatYnHn5YO2l9+i2PAy435jbczLzh
 Nymj4WTiC4dZ88+vuz/3/PJi25OqpycE/9vEULnyearL8RMmS3dsVDY68ePR7BcTkzj+ib7h
 strRKfhk960DFx3eCTu4GgekXTuSrGTwsGL5L7mVnk9SPjmdTV6R+HL606jUWs87D816Du+e
 dGyCEktxRqKhFnNRcSIApjGZ0mwDAAA=
X-CMS-MailID: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
References: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
 <CGME20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83@eucas1p1.samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matti,

On 30.11.2022 10:23, Matti Vaittinen wrote:
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> now unused struct member 'hdmi_supply'.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> v4 resend 2:
> Respinning unchanged code with the commit title changed as wa suggested
> by Robert Foss and commit message changed as was suggested by Martin.
>
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>   	struct reset_control *hdmitx_apb;
>   	struct reset_control *hdmitx_ctrl;
>   	struct reset_control *hdmitx_phy;
> -	struct regulator *hdmi_supply;
>   	u32 irq_stat;
>   	struct dw_hdmi *hdmi;
>   	struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_regulator(void *data)
> -{
> -	regulator_disable(data);
> -}
> -
>   static void meson_disable_clk(void *data)
>   {
>   	clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi->data = match;
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		meson_dw_hdmi->hdmi_supply = NULL;
> -	} else {
> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -					       meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +	if (ret != -ENODEV)

The above line should be "if (ret < 0)", otherwise it breaks hdmi support.

I've noticed this once this change has been merged to linux-next and all 
my Amlogic Meson based boards failed to initialize HDMI. Is it possible 
to fix this in drm tree or do I need to send the incremental fixup?

> +		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_apb");

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

