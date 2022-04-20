Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737FE5084D5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 11:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16C210E192;
	Wed, 20 Apr 2022 09:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6DF10E192
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 09:24:12 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b21so1748462lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u55Ek4ovTu93jGC6owGr6QZtrHl98TBOqnvlwoTCUt0=;
 b=VCx/HeNdAIrVvK22LWtPVkq9Bv1IKELkDsHc9ZDCJpEzPZXiUk1L12Dy+mMZouB4Kb
 Sm5gqeWiHiAo7O1rqL4fR/FRWrLwV1sxcNCEE/ser/ng6KnPEXuXeI6mJT4hEuhbpkyR
 CnEwq7dF8XjnevURjfPXlQSPsthUbrMgXmTx0ftPiqNOdHSrKFkOiwbXMIgL4L8pif1x
 S2OC7crPo4slcyULVJrhskiIc37n3wR0KWOXQ2sj5i0hsb8hGWYGa7c9kFuF9uQx1Lrd
 PnwrnrwZvh2dBVEvqkQHhB/xuL6v+vJ4eVgGVRgIh8ublrifvFa02qV7bdCp+CMifVZv
 cETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u55Ek4ovTu93jGC6owGr6QZtrHl98TBOqnvlwoTCUt0=;
 b=aq7Tod/i7OSg7tOAca/rShKh4qzD2VYFn46gNyqvrceaYxqLSn2mx8tzFmP3firEci
 w665iTCbGmCzdD3knUR+EfnsgaSRqobe7UuBBvKZ4CuGZK6GLs6zUw0mHOHp+mssBOq7
 1tpV2qLtSWE3E7wZCgesr6cfuoCYqu1M1n9ApxC6WNIrADQ+W2f4bKc6U6Qrn/wWtgjO
 lSJQcaw17qEQA9AnVCBgNQoWOYRNiQ7kmoQEFX4mumGwaZUgUhgrVXmyp/HDpleVW15F
 Et09nGhULRoeblmEOhLVCHpwu4VuAqNGCH3+57mAYnNecnydG3pSe3TLTrrSwKJHfxKe
 mf5g==
X-Gm-Message-State: AOAM531x/Afj26pvPFb5dDF0DbV9aJNmZhGtiytTxqjTRtAea12OmbRb
 kyGH77dmLsRfyV//NUqkxcpC7BgSxtp9+w==
X-Google-Smtp-Source: ABdhPJwBIjGhPQR/MG3suNBpw+sG1uqlbM+4wIOJy5ZknDOvMCYopGuZbVrLmdXv8OTjIhB4lEs0Kw==
X-Received: by 2002:a05:6512:168d:b0:471:6cb9:c20f with SMTP id
 bu13-20020a056512168d00b004716cb9c20fmr11611107lfb.229.1650446651069; 
 Wed, 20 Apr 2022 02:24:11 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.74.70])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a19384b000000b0046bbd144dfesm1760268lfj.125.2022.04.20.02.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 02:24:10 -0700 (PDT)
Subject: Re: [PATCH 01/41] video: fbdev: omapfb: lcd_ams_delta: fix unused
 variable warning
To: Arnd Bergmann <arnd@kernel.org>, linux-omap@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, jmkrzyszt@gmail.com
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-2-arnd@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <ddaf112d-f997-84b7-2c57-bab3d0cca382@gmail.com>
Date: Wed, 20 Apr 2022 12:24:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220419133723.1394715-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 4/19/22 4:36 PM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent cleanup patch removed the only reference to a local variable
> in some configurations.
> 
> Move the variable into the one block it is still used in, inside
> of an #ifdef, to avoid this warning.
> 
> Fixes: 9d773f103b89 ("video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/video/fbdev/omap/lcd_ams_delta.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
> index bbf871f9d862..01944ce46aa1 100644
> --- a/drivers/video/fbdev/omap/lcd_ams_delta.c
> +++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
[...]
> @@ -145,7 +144,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
>  						&ams_delta_lcd_ops);
>  
>  	if (IS_ERR(lcd_device)) {
> -		ret = PTR_ERR(lcd_device);
> +		int ret = PTR_ERR(lcd_device);

   How about inserting an empty line after declaration?

>  		dev_err(&pdev->dev, "failed to register device\n");
>  		return ret;
>  	}

MBR, Sergey
