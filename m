Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72357C899
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 12:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2B58D51A;
	Thu, 21 Jul 2022 10:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80C8D50F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 10:09:52 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id o12so1323125pfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JsNvQYgS7LcjVv/c6iexGN5Si+fKRd5f5BAbC7QtYk4=;
 b=eAa08a3+tl/ZofuTfcSSlCIRAq8gzsE5weAOP7UsxCGX7Y3mEwbV149NCokUNAuKe5
 EN8JAjfmhP9N9CspG2jqaZSyIaGbkZUhDaW7qofKWFu8aKMXKSZIN/OslbLhdpG3vXAe
 Ur/lyWqy91Q56Es+2f1zy2dzQ+hj8jlo3qE0YiObY2S52rcdXtLGShkNUGJiecJGeLOG
 GtukmBHV1TgkmoL4837XnIBFnmUr7cQbqEUii+cPTEyr6HZ7158GO1PQ1FREaPNHpO3p
 +zxpj8UH5CIEkJ0zMqYXxrZuHhPdN0LgPYLVzbKBbdgveUmcPeMuT3v6VXPjNd763lsV
 k55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JsNvQYgS7LcjVv/c6iexGN5Si+fKRd5f5BAbC7QtYk4=;
 b=r91AirdwDjrBreSPSjpkNFxBaGjDUdNTgebBtqBYVR8wXxN0F0mqC2sCciePIYG5li
 AZM5/hr7F1cT6D900mUXd9BY91svqcwFIFNrWGoBk8ZXkvIDXqQPSIQ1c/250FWxQPMk
 7y2Wq2SnxomqV7hivZsqRS9pU+V+NN9jlnA9SKs0MduD+vbv4yyrZPIIfwIqevopKc2u
 u2ywqJzgPo2nOhMoGGmYjYpE/1+eS5DXmwzICnIjx3qqyKWJuJ0tQW9JLEaAOHTuyJKg
 vb4SBoQRvCT0kzitEojXo57LFuit0I0+Rn7NBNxnSUzwEggT6EBqi0EExSBPwZQztDNO
 ggsQ==
X-Gm-Message-State: AJIora+BOBegSlbLZhaR7BbzX2Wj2+bgBr3M0lTnxAfc41TG1GkeVkr4
 9ffygOopNHpgv4YESHZ9ZlM=
X-Google-Smtp-Source: AGRyM1tMdDKZ5ydOiuf36WZNOlcNoDOh7UeG2Wl5nFnV3DeSsvm2YGSyx3q8fnZshmx3L5mTpd0DGQ==
X-Received: by 2002:a05:6a00:23c9:b0:52a:cedd:3992 with SMTP id
 g9-20020a056a0023c900b0052acedd3992mr42915651pfc.43.1658398191449; 
 Thu, 21 Jul 2022 03:09:51 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt
 ([2402:7500:56a:cec2:d9ce:3b52:7023:4b90])
 by smtp.gmail.com with ESMTPSA id
 x187-20020a6286c4000000b0052ac2e23295sm1351501pfd.44.2022.07.21.03.09.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jul 2022 03:09:50 -0700 (PDT)
Date: Thu, 21 Jul 2022 18:09:37 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
Message-ID: <20220721100933.GA17618@cyhuang-hp-elitebook-840-g3.rt>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
 <20220717084643.GA14285@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717084643.GA14285@duo.ucw.cz>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 alice_chen@richtek.com, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ChiaEn Wu <peterwu.pub@gmail.com>, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, sre@kernel.org,
 linux-kernel@vger.kernel.org, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 17, 2022 at 10:46:43AM +0200, Pavel Machek wrote:
> Hi!
> 
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> > 
> > In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> > support hardware pattern for constant current, PWM, and breath mode.
> > Isink4 channel can also be used as a CHG_VIN power good indicator.
> > 
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> 
> > index a49979f..71bacb5 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -244,6 +244,20 @@ config LEDS_MT6323
> >  	  This option enables support for on-chip LED drivers found on
> >  	  Mediatek MT6323 PMIC.
> >  
> > +config LEDS_MT6370_RGB
> > +	tristate "LED Support for MediaTek MT6370 PMIC"
> > +	depends on LEDS_CLASS
> > +	depends on MFD_MT6370
> > +	select LINEAR_RANGE
> > +	help
> > +	  Say Y here to enable support for MT6370_RGB LED device.
> > +	  In MT6370, there are four channel current-sink LED drivers that
> > +	  support hardware pattern for constant current, PWM, and breath mode.
> > +	  Isink4 channel can also be used as a CHG_VIN power good
> 
> Should this go to leds/rgb directory, and should it depend on
> multicolor framework?
Yes, and I may also want to change the file name from 'leds-mt6370'
to 'leds-mt6370-rgb'. Is it ok?
> 
> Best regards,
> 							Pavel
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.


