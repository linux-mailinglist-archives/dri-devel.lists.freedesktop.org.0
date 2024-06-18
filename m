Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22590DBF5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 20:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7710E76F;
	Tue, 18 Jun 2024 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b+DGnEJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BE110E76F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 18:56:00 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ec1e5505abso991001fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718736958; x=1719341758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YzQHQlKHxgZaRZfXLT1ynkXMYrdCKCTUr57+vqG9rY0=;
 b=b+DGnEJFxqXzvRDog4NfdMOW5JewQPPtAiCireR9DAtpIPFgDv9WUDO4xf2DDE81+u
 qBUS49UFNSRaXKPR6Eu6R9bY36NVzWm4XIfWD/2TzsmCivRWgHSWK89rijZH7BqAdvFO
 zHd5lm2mp558E9T01geHOTf3uBon0NSze6p07cz1QPwUGXUZ3dofBjzzWNq1bJDVb999
 am0JZdSSMCM0AmzO885lrC6Ue5Qo9pg5kJ6lr7lTPFhkbZDb8e+EhBqk06wNd0jTDk6e
 uRqXtyXwa9jDpNHagrKi78YkiqhXQzOhNft61pYRIwXeSfOXuIsxAS+XgECH5Ow7+rgg
 3YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718736958; x=1719341758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzQHQlKHxgZaRZfXLT1ynkXMYrdCKCTUr57+vqG9rY0=;
 b=OfTYVBx1z7ZKnjNdIUbxUQI1Q3Anfw0RlBsMhXyOSKh1ZvQaexMVTB/7UYpA6vtUzi
 wSbLhnkqgTLZG+CNlOr8wr/gbZ+ez/H4TQ+aD/CKkxobKnOLE3oTC2t0Zi6vYnk2BLIA
 X01eZhyuhLWnRliajrysnjTQImWNMEeJMj8CPNgIUMMx87qw0Fz8lpcNf39tuYNe17Df
 5tJhrlAfZ4hr4Q1cShSamjpYe8A5BG//aycwKrnrTdkP5C+ZcHDLk+uqqq85D7ffTCQP
 sfBwmXQKMQHAVwpotHLwrvS4tTlKufyz/f59MEJmxAn+ZaZoAaziPyeLcsvSiE8sMgUE
 dzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTxUbJVan4dhUnLYfnvTiH/N866nwobRBXbW6UIRv0aYyuoG7EUFDBQMdagoTcXJi4tAliisuqzwxC9oO7cS6SLKbVUbkWDVyDj5p/58L0
X-Gm-Message-State: AOJu0YzlOTAyghn8kLNgnQV1nMe3uCa/EnqT7O9hqgPdjpn+ED2NAxCR
 zmLDShYV/oSArcgob2DGNxyMOuaQRmUdnJTFxpyDdL5+gGkKLnJmhXtF44RgqUE=
X-Google-Smtp-Source: AGHT+IGC5OJR3gZ0AgVkD1dpAKYbvhHSigXJJVNaqgqzU/pJEsxEJFZWPzPeEkSJ7Z7mUZbZszMNQQ==
X-Received: by 2002:a2e:9257:0:b0:2eb:fcea:2f18 with SMTP id
 38308e7fff4ca-2ec3ce7dfdbmr2013211fa.2.1718736958673; 
 Tue, 18 Jun 2024 11:55:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec07126057sm17344181fa.59.2024.06.18.11.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 11:55:58 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:55:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
Message-ID: <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
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

On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 19:50, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
> > > sdm845 has "General Purpose" clocks that can be muxed to
> > > SoC pins.
> > > 
> > > Those clocks may be used as e.g. PWM sources for external peripherals.
> > > Add more frequencies to the table for those clocks so it's possible
> > > for arbitrary peripherals to make use of them.
> > > 
> > > See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> > 
> > Each time I look at the table attached to the GP CLK, I feel that it's
> > plain wrong. In the end the GPCLK can in theory have arbitrary value
> > depending on the usecase.
> > 
> > Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> > allow more flexibility than a default clk_rcg2_ops?
> 
> If we can somehow get max m/n/d values for all possible parents, sure

Calculate them at runtime?


-- 
With best wishes
Dmitry
