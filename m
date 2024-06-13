Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE49069E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7E10EA1B;
	Thu, 13 Jun 2024 10:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TgWUmaTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830CB10EA06
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:25:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52c8c0d73d3so1067134e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718274340; x=1718879140; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sHGMgPc9G/z+2lw7yf2nSXgC88t1z5lABEQL0E9GiO0=;
 b=TgWUmaTsihxFFlpzqPhFGqRatQIY85iQAFlZVi0xPBYFCkelcPhtueMFF3iLGj7MSU
 8SDrcvFLEuldx+5KBL/HQJIe9kyeszVE4xyJhpCxcnBDtnTscIXoH3hup8VDEaAY97lR
 up9GrtDpY+nb1OXSnA30Fl7VAMB2UK8DvvXsP1B5BZKuIaipbkwBDBKgYK5oJOvCYvT6
 TVskISPUSCPgh182BEdNRQUtaCyhGVhA99nVom2anH8Zh7mM/KvfDPDscetriFz9BLiV
 vjC1iez4mbRST6NJrU5ZtsqO74QPPLjllhLFALLHcIvPvho9nK1vtJhGuvKF5Wc3YxKX
 buOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718274340; x=1718879140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHGMgPc9G/z+2lw7yf2nSXgC88t1z5lABEQL0E9GiO0=;
 b=LfFl5eCIzc6yKOKrNrs6cAkIszBdTpHcwO0ylecYSzD6DCu2fE2F+UMcXpqArXms5Y
 NcAK92pPEsJnkYsIgjX9hONIoCGbgUcTKAg+URR1fu7O9lbSp2WCiwQLyBGdQlr04b1u
 VnlzCtBan0Gl3nJVmdQjO/vUotyqB9yptz73Dn6lSX6/M0i6o2QhZXq4AE+3h6d9o/Zz
 OKtxBDa+M1ZSKmyAxE9XF1khVuPuJ+g6jGdHcVb13HuGT5sVik794MBRcv53zVPEEOyR
 p3B9u3ldDI0BZS48bhHRNqY76a3Y+KioqiV1NiRuYDffPRP8/l+TEauL1mUFKJfEzxfp
 tLOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz16Ch+ubK8Lt2gHVAWEh5f5Ks7jItUh22+k86aUyeN5vkkGruQb3BPeDZoM+hEi9/on44atkjcqp9eNcbX7iyCr+SDV/WFI5/mxLJtr6W
X-Gm-Message-State: AOJu0YwgcAHF+r+EBx5XfIm4h6jfQ2KG2jDn6EqBsfnjqN6MW+e4oPL5
 WPV4PTlUiseSffPn7Dyk4yFwCNe0Kqgzcq/SdFM7GYyx1BItTWda5sHYqrg+eCo=
X-Google-Smtp-Source: AGHT+IHTJQ7V8f1jGqJMe5oLIQTgVRHUYzAMHjKvf6kh93g1Iz79Scj+iB82cWFELEn+MzjKEkpoSA==
X-Received: by 2002:a05:6512:398f:b0:529:b6b4:7e3c with SMTP id
 2adb3069b0e04-52c9a8f1b49mr1452171e87.45.1718274340429; 
 Thu, 13 Jun 2024 03:25:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872332sm152631e87.171.2024.06.13.03.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:25:40 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:25:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <i7lyy2gd74up76ubuw2xygwtayezvqxnt5gog5qn3h2youi6op@3ng4muunvpvv>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
 <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
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

On Thu, Jun 13, 2024 at 04:12:22AM +0200, Marc Gonzalez wrote:
> On 28/05/2024 03:13, Dmitry Baryshkov wrote:
> 
> > Bindings please. Also, note that per the datasheet the bridge uses two
> > supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
> > simple-bridge.c (which might need to be adjusted for the second supply).
> > Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
> > before Vdd.
> 
> Is something simple like below acceptable?

Well, the question was about bindings, not for the driver snippet.
Anyway:

> 	err = devm_regulator_get_enable(dev, "Vcc"); // 3.3V

Usually all regulators are lowercase. so "vcc"

Nit: I think enabling regulators should be deferred to the enable (or
pre_enable) time.

> 	msleep(100);
> 	if (err)
> 		return dev_err_probe(dev, err, "Vcc");
> 
> 	err = devm_regulator_get_enable(dev, "Vdd"); // 1.1V

And here.

> 	msleep(100);
> 	if (err)
> 		return dev_err_probe(dev, err, "Vdd");
> 
> 	tdp158->OE = devm_gpiod_get(dev, "OE", GPIOD_OUT_LOW);
> 	if (IS_ERR(tdp158->OE))
> 		return dev_err_probe(dev, PTR_ERR(tdp158->OE), "OE pin");

"enable"

> 	gpiod_set_value_cansleep(tdp158->OE, 1);

Again, set it at runtime, please.

> 
> 	tdp158->bridge.of_node = dev->of_node;
> 
> 	return devm_drm_bridge_add(dev, &tdp158->bridge);
> }
> 
> static const struct of_device_id tdp158_match_table[] = {
> 	{ .compatible = "ti,tdp158" },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, tdp158_match_table);
> 
> static struct i2c_driver tdp158_driver = {
> 	.probe = tdp158_probe,
> 	.driver = {
> 		.name = "tdp158",
> 		.of_match_table = tdp158_match_table,
> 	},
> };
> 
> module_i2c_driver(tdp158_driver);
> 
> MODULE_DESCRIPTION("TI TDP158 driver");
> MODULE_LICENSE("GPL");
> 

-- 
With best wishes
Dmitry
