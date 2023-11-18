Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12667F030D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 22:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C1210E030;
	Sat, 18 Nov 2023 21:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7910E030
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 21:49:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so8243885a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700344194; x=1700948994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
 b=FfU50dZgFA+wCa+5JFnfsn/HmC5dl25c5HoRz8A4robCENYeDSAAxZq1WZA9amZ/h4
 VQmN+mV+GfyiRpLJkxnR+4AfxFKWlrEkGPHNM0zUJNT0trVauDe1WuMrBdkDpUeZ25of
 1dREtQ4bZlViuvBiYo18Kii0UGOhoiueh6iJij9FKRomshVp9NlN6Npxbau4lpvqtSol
 aGBrZO8XGZnbMcIZJcT2iL4kH2hx1jWde5YJ3zZhwNcoNU//PVB6+T11ZYl4v/Ccg0UA
 dcItrYrMyVlD1Jy/sLudZ0UYr7zWvbgghDnnMvOaCSWhh8q0205S/THerdu2/9pCIDe/
 cdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700344194; x=1700948994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
 b=eC0991OeOivPNCudI2WulkdZq1okKMmIW/kwlvaxPtULQ8TCOxaniomUU0GGedIVD3
 btJk+eTz3hUrLE2h9lZzxGYJ3MvOoVyBDjrXYVAAAPYQxl5CILM3mMm4HsZPJFO6e8QC
 5FqKQcRmKJo7zCyuFZZPtFV3jM8iQJV6Tt+WqacQ6ZL2/rFtR5He4U4ATH3pjiM4NUYY
 YDEX7X3pUe9AuopFN5k99TOGz3cpDX8g1UaS1yDdS37Ujxm1MB8+CjcENkdILPx9aCMG
 L1+LRHaERnLIgmHlQChv/DKILViB0W0hrOraFZ5RnMCva9i3+fEUfHcyIt3JcXE310ah
 zNEw==
X-Gm-Message-State: AOJu0Yy9BHHioXkkDtUfs/OujqjtlEbXDs8Eoob7um2CyfbTy9U7ucNL
 Xtxaa5gGcJbFNNJjKERilnI=
X-Google-Smtp-Source: AGHT+IGvGe/YhVqfTTgGOZH6rxAZKgoCFGPA+F4kHVoXMK1rmU/eIymVSurR+kzjcJHGaQ8dnTci8A==
X-Received: by 2002:a17:906:38da:b0:9ae:50ec:bd81 with SMTP id
 r26-20020a17090638da00b009ae50ecbd81mr6889839ejd.21.1700344193504; 
 Sat, 18 Nov 2023 13:49:53 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 cm7-20020a170906f58700b009e5e1710ae7sm1028955ejd.191.2023.11.18.13.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 13:49:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 22:49:51 +0100
Message-ID: <2705713.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231118174221.851-5-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
 <20231118174221.851-5-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sobota, 18. november 2023 ob 18:42:04 CET je Heiner Kallweit napisal(a):
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> index d1a65a921..f5f62eb0e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
>  		return -ENOMEM;
>  
>  	adap->owner = THIS_MODULE;
> -	adap->class = I2C_CLASS_DDC;
>  	adap->algo = &sun4i_hdmi_i2c_algorithm;
>  	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
>  	i2c_set_adapdata(adap, hdmi);
> 
> 




