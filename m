Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96859112C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CF810E14C;
	Thu, 20 Jun 2024 20:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MYrbi1gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF9510E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 20:13:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso13427231fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718914426; x=1719519226; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gf88bxwZuTUs5YXwWPX6yadFRnjP9I8sFXH8/ud6MPc=;
 b=MYrbi1gIUYZoG42Nkp3cMmgDf0eFhjHXwbrhN7E4s+YF4XarIeF2Y00NuUMGdxwy4z
 hLGZBOUlua/6WKK+ZyS+ySKJJzNBBgbDGBlCmAMSrjk4KddnTFUxt3SA2hQ8AUocgxnP
 5EgYeP2OFvkz9LNqL478YXd8S3sHiUwBZfisTXCNUyGApKcV5kyL64oOZeVJcaiDGDex
 t0d2vQwotI+M/mJalJ1mxGGF9YRU9Q+ILeJx+SqOAaFO0+9UN0RWLSgTO5YBZgamLUP6
 HPjE6Uc4bSFq1/jTji7Pcy/huatzstOPSA69ECSMTjrST6okcxvyNeshRBZEQCkLKoAS
 mn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718914426; x=1719519226;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gf88bxwZuTUs5YXwWPX6yadFRnjP9I8sFXH8/ud6MPc=;
 b=MVpQSw/wmLzNe+fiztvR9UcM8rYNJPP+ntSsgw3hjalQgWVRXoMmo+BrJPpqySIuY+
 FB3K/pgKaV8D4IG6lq/5Jaa/4u//QxnkE7PUBzKApx2U/FEJvZXN92ZOtvDPHbAdp4UJ
 p6/mhoXg6WLpg6su3F8u7uFxalWvSdOo7eLkC8aDwOc7hSesqq5WwaweA4hVAoguey3Q
 0c7gO5gQvCT7dLZlVT+aUOQVSy5yW10cpfibWLZiNxf7nx1DIaAjX+SSwlQ2jYSL5N6Y
 0MbZcu9I6NQe6Xdp+LeKbfcqnbE8EfdMhw6KKg7sQhh4x+id/dEzsskBgmWRJRbhbldt
 ecIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNvQZ/6qF4lIHMAWRjcbpABxMtFmvHfvfFAaw7RUQFyW04FrqOMzdmXpg2t1E94rieQaHhqM0bvYwdZbBtc16eLaARpAJAx3PWP4gaN3gx
X-Gm-Message-State: AOJu0YzD142tVVwoW9nMWFhRSALjMoRTwmeHrZmnNDiQLJdttz5gClF/
 h3sVqhN53i+pjgO6GH463KYHqL4eJ7kelVNfNwmA2kc7FPskfBGPkm2OmCWRHFc=
X-Google-Smtp-Source: AGHT+IHmscm1ta08k7kKifcSjPxr0pk1YHMHeVkmRekDXSZgsUcQQz9WUuxqquxICdBXbipcg1QQvg==
X-Received: by 2002:a2e:9b0a:0:b0:2ec:2583:2ba5 with SMTP id
 38308e7fff4ca-2ec3cfe8b1dmr40485741fa.36.1718914426346; 
 Thu, 20 Jun 2024 13:13:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d757f9fsm104511fa.73.2024.06.20.13.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:13:45 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 11/23] drm/panel: Add support for S6E3HA8 panel driver
Message-ID: <c4g235wj3yfdftnwqe3pbupifhy5ploo7chumdgfnl4skzuahf@ftuellx4zwsn>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-11-e3f6662017ac@gmail.com>
 <pkmxbxoc4sno6mbjsftz6hp5lxefc6yhwxjlhiy2pd4wbkzpvl@as43z4t64mm6>
 <CABTCjFABEY0urmgrr5E3-oq9u_aNR8KcCTMpJpoGLOTPOfKAGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABTCjFABEY0urmgrr5E3-oq9u_aNR8KcCTMpJpoGLOTPOfKAGg@mail.gmail.com>
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

On Wed, Jun 19, 2024 at 04:27:40PM GMT, Dzmitry Sankouski wrote:
> вт, 18 июн. 2024 г. в 21:39, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>:
> >
> > > +     ret = mipi_dsi_compression_mode(dsi, true);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "Failed to set compression mode: %d\n", ret);
> > > +             return ret;
> > > +     }
> >
> > Interesting, compression mode is being set before the PPS programming?
> >
> Yes, as per vendor kernel:
> https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/e8bb63039008e1704a2f1bde68d39ded9c16ea88/drivers/gpu/drm/msm/samsung/S6E3HA8_AMB577PX01/dsi_panel_S6E3HA8_AMB577PX01_wqhd_octa_cmd.dtsi#L5508

Ack

-- 
With best wishes
Dmitry
