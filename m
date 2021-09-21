Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7DD413442
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 15:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C656E982;
	Tue, 21 Sep 2021 13:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79C6E982
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:33:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t18so39269589wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=A31aJO/5YcdUocsEcyn0bhc0bNHd+7HvWCL+8pVGDDU=;
 b=XXnHlbsVJeiz43Y3LESLsOdS/m8OXgkzBDvNRuXaOhzIFk9XPGFB8+4fzF+fhcPttK
 FvPwPmNgxuEnz6VX/pugMXfkccU1NnwbfTphH095zmWsunddDBDkNpBwv0V6s+OvfSzw
 oHQOgUsamKJGEUduN/kILiR81SKXt0x7/e7DUk55aAFS+TH1KIz3NoJsw1cXsVNhgXL7
 RUkPzrz2CYT8e+24iQOzYwtNzVSKtcauNmzjGdxTocSiSIJ9HlrP9Ke2CSkTPRxCPCUK
 o9AyIB91PX/qD/ilB+5C7p1rcqcTBgGtp8O3JY68Tf3s61h1FgmkmmUG1rxJe5oz4d0U
 Xs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=A31aJO/5YcdUocsEcyn0bhc0bNHd+7HvWCL+8pVGDDU=;
 b=s31Bj2piO4CXlBsbMKcXysTtEvuGcHao2mLEwzllvEsB4+LIcBTnuNezHn0+Q9qJu2
 MGC/tRSK1WgbYqblFSKMpFA6nHX6ROGUC3i7hKFApmClkO4joiSlYfteaL6WhvaOPwqu
 88/o+OBZuRH+m+y3jkDk4babwOCG0TxTYpm/h4fBMfQWF+B/5OhSFmjnWgzTlA7dT47X
 3L+esuy0VJifyP2WDnntYxwu0uHA0luXNRppjj4bsVgoxb23vg7jtnZULwxCP05zjjoR
 1EY9P/EvwTnmCAIVizwW8m9ydNweB8VQ1rHEt6zie4wbbt2a7xRcW/dsdQHDqWETeutJ
 /eLA==
X-Gm-Message-State: AOAM5306b/PIBhtlKp3dxiRQJv+zpAG6peoq9ns8ysES2FUZ1/GTsmGN
 y/H0GwdnwqdTY+FaIrYLPcvFlg==
X-Google-Smtp-Source: ABdhPJxs/pQcAS2zvnJ16CTjs9g477Rs5JMYYC8B5kkiiA0dn7lD3oQ/W7AtqrHOuibodbiz+oZI3Q==
X-Received: by 2002:a1c:2351:: with SMTP id j78mr4690686wmj.40.1632231203097; 
 Tue, 21 Sep 2021 06:33:23 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id g1sm4434940wmk.2.2021.09.21.06.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 06:33:22 -0700 (PDT)
Date: Tue, 21 Sep 2021 14:33:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, stable@vger.kernel.org,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH V2] video: backlight: Drop maximum brightness override
 for brightness zero
Message-ID: <YUnfIFllpOMnie4l@google.com>
References: <20210713191633.121317-1-marex@denx.de>
 <072e01b7-8554-de4f-046a-da11af3958d6@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <072e01b7-8554-de4f-046a-da11af3958d6@denx.de>
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

On Sat, 11 Sep 2021, Marek Vasut wrote:

> On 7/13/21 9:16 PM, Marek Vasut wrote:
> > The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> > in backlight.c") says that gpio-backlight uses brightness as power state.
> > This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
> > Correct initial power state handling") and other backlight drivers do not
> > require this workaround. Drop the workaround.
> > 
> > This fixes the case where e.g. pwm-backlight can perfectly well be set to
> > brightness 0 on boot in DT, which without this patch leads to the display
> > brightness to be max instead of off.
> > 
> > Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
> > Acked-by: Noralf Trønnes <noralf@tronnes.org>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: <stable@vger.kernel.org> # 5.4+
> > Cc: <stable@vger.kernel.org> # 4.19.x: ec665b756e6f7: backlight: gpio-backlight: Correct initial power state handling
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> > Cc: Noralf Trønnes <noralf@tronnes.org>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Thierry Reding <treding@nvidia.com>
> > ---
> > V2: Add AB/RB, CC stable
> > ---
> >   drivers/video/backlight/backlight.c | 6 ------
> >   1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> > index 537fe1b376ad7..fc990e576340b 100644
> > --- a/drivers/video/backlight/backlight.c
> > +++ b/drivers/video/backlight/backlight.c
> > @@ -688,12 +688,6 @@ static struct backlight_device *of_find_backlight(struct device *dev)
> >   			of_node_put(np);
> >   			if (!bd)
> >   				return ERR_PTR(-EPROBE_DEFER);
> > -			/*
> > -			 * Note: gpio_backlight uses brightness as
> > -			 * power state during probe
> > -			 */
> > -			if (!bd->props.brightness)
> > -				bd->props.brightness = bd->props.max_brightness;
> >   		}
> >   	}
> > 
> 
> Any news on this ?
> 
> Expanding CC list.

Looks like I was left off of the original submission.

I can't apply a quoted patch.  Please re-submit.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
