Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AD590E36C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF4410E8AB;
	Wed, 19 Jun 2024 06:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PQWmQqEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7FD10E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:32:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52c85a7f834so7865544e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718778721; x=1719383521; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kWA6TxZL/MZl6HZnFwnJJBsYFPvFUHxiD6fzJli2OEU=;
 b=PQWmQqEQvlXScd9VkFqyBUvviMD4cNCcSzAUr50i55sKlGA/LvW2wJ8NxvE4G7o3+0
 eyfpdHze11F4paI7NxUeE/2j2a5a+vtTMf7oL7O0dNox3NBfGtQ125dUclX62p34B0dt
 o9e1hwzyP8Y6RzzEpOqIp2aYP4YtTMERMlIwTGC3atQ1nIouT0FeEJ517JJwPa5upRNF
 ZH/9z7GfiOwEu0+Leg/E3Y6tpa6AnSgKTq2TRvXuZhWCTW9GRDixwAJYZBmJkr4NZfw2
 VyNSL3a41vfoYAlcVib0YJZN7WZw/+N4eUNS555VoyO2mROxM7AXxadU+sMw+q69Vow+
 Nhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718778721; x=1719383521;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWA6TxZL/MZl6HZnFwnJJBsYFPvFUHxiD6fzJli2OEU=;
 b=YykvEPiYmgFf50Lohhf6boPC30tUH0i6JNVP9W2ZbBcn3t/ZQjLuDBNbIAxgBnzsrw
 6XSn+MUFyR7k6kxLzM+Fup9rI2bpkRSq4icpgYdDLdUL1m4GD4MalIGS7VFa544+mq8H
 FXCNFWGx33QjHEDCFL9oMH53+X2BsCz4tlCaFfQ4HibQKT0Fgc2bYQbgakpsOyYLebaD
 DqfVT0Da7uMNBkBg2h4ogaucLIKAs2M+bKhoVvYiM9/P/oqAAsHuE+O9oL+xccq84PYI
 p03P5qNuQ3KjZd8d03COyrgtcfu4iaLHgTvoWY3PcC9EXGg/PYf+57pzHWZowS6gqWy0
 2jcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3L1BNTuKSO4EZEg3zgyIWo9Qi6AmhEPWGjg1dN0a04KvcMKt627zrOHTXyhSf7ESjJG2V1u9oHaGivuSpNp763Dkrw6EEhZAHzsDdun1y
X-Gm-Message-State: AOJu0YzUjbbDo06G5282IDJD9xcSPjKb1I145LN5cYUaRV827AfuTo6G
 k/dPX0myHZkyGcjmX+r7sUdMv1mhl5n2KEm2i5GQH9CKmg6o71cQ7zc9wGcwAtA=
X-Google-Smtp-Source: AGHT+IEESoHV+TTf90PdN7pLxmBm3gZ0xMUk7VRL1azohO9LT1Z72CZ3oFQjtGbrIy3x/5u5Qu0uhQ==
X-Received: by 2002:a05:6512:3d04:b0:52b:c262:99b3 with SMTP id
 2adb3069b0e04-52ccaa5693emr1070573e87.11.1718778719107; 
 Tue, 18 Jun 2024 23:31:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cba181738sm920583e87.255.2024.06.18.23.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 23:31:58 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:31:57 +0300
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
Message-ID: <n7gvt4e6kt33lpnfivv4t2waro2t4qi4evkrfot3j2en7ubffb@gpzwolihwemr>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
 <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
 <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
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

On Tue, Jun 18, 2024 at 09:11:58PM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 20:55, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 6/18/24 19:50, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
> > > > > sdm845 has "General Purpose" clocks that can be muxed to
> > > > > SoC pins.
> > > > > 
> > > > > Those clocks may be used as e.g. PWM sources for external peripherals.
> > > > > Add more frequencies to the table for those clocks so it's possible
> > > > > for arbitrary peripherals to make use of them.
> > > > > 
> > > > > See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> > > > 
> > > > Each time I look at the table attached to the GP CLK, I feel that it's
> > > > plain wrong. In the end the GPCLK can in theory have arbitrary value
> > > > depending on the usecase.
> > > > 
> > > > Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> > > > allow more flexibility than a default clk_rcg2_ops?
> > > 
> > > If we can somehow get max m/n/d values for all possible parents, sure
> > 
> > Calculate them at runtime?
> 
> We'd be calculating the mnd values for a frequency that's either equal or
> reasonably close to the one requested. My worry is that we somehow need
> to get the maximum values they can take (unless they're well-known)

One of the options might be to force devices to use
assigned-clock-parent to set GP CLK sorource and pwm-clk as an actual
device using the clock.

-- 
With best wishes
Dmitry
