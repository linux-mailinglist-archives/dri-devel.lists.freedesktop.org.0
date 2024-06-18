Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF390DA91
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 19:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A8910E72B;
	Tue, 18 Jun 2024 17:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hpRApGlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25310E72B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 17:25:51 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso67663271fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718731549; x=1719336349; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0x3UpCnFFeHobgX/UWFVCi5nUUKWM9Aq39qUpJkUIbU=;
 b=hpRApGlQ0qM15Y0NA+94MysUxuqX6w4NKuC26CiaE+96KH0B4YjWVxtWWzMpfgcXbY
 GqRNSkd/2/tgnwqZyPQO4L8JdQQ5wr+3UBgBDAyPGDTEG4V5o9yblUX6OVMpsUdErBjl
 52c2iCDQtYnyGA9FlKypQdmlzY29TnwegB3oTL1ilVCCmxbkwhhbr7iDP0dsf3SQKrsd
 8BgSvBhnMWg4Wm73+D7Wnweusb8wz/WXoHw9ACAspHHIwORU/xda6HVad4OKfpqnHFTS
 NTYryTMbNC3a4KFN2w7NIskuYmsgMIZ8NpHVbodph/2vLPpCX10OCFCYTuc2YlHp0YCO
 uMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718731549; x=1719336349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0x3UpCnFFeHobgX/UWFVCi5nUUKWM9Aq39qUpJkUIbU=;
 b=oW0D9vrX006o7PRxTMViKhcNI5cKp7Mn3aLgucdr38IJo96FLoiIUxcPI4rqxYcG7A
 2xx5TPXm9bVwKFE7OCKksyM6nRJq80c0YraAIEaMHVKpxUyOOwsepRwwMg0+bHdeKuCi
 PVTEnJGBKmqBh2m5NtdBAee4WQQBmj60DaEJIzuFK13l57KjD4E8yKJRWc4M1bp+3GNa
 2owguBWrCFfl8TeyrSY+p0k/K684eBK7TXyY/wL2EaNiZGOG4hRwxHg/Yu6cEnrDQvAL
 xAkwAUMcTwapGpaa5i3b83wxbip8l2dBHqIoOV/6BTTzIDLPcbLjwFIZHVwASP9TVV8C
 BIQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLs3Cgt2JvphhpuhtdyGpKIaxwcn8+/0Ry6JTe5yCGre/ztRPTKaTZ3AqOGzfkV+Mo1xRNwWUrJyLSpOt+Way3izxFOe9Dq638JAKjEqp2
X-Gm-Message-State: AOJu0YyeJgOTe0cei9XmyUVh9w/wD771v8U9F/B4cnwrRll+BZ9qBh6K
 orotEyEpI39r36jrPO26rpBOKIhFkJNmr1m3roMTPZYigVCTr2OrnYDbkwlEHXk=
X-Google-Smtp-Source: AGHT+IFf+j6X5dAvayfXrCIIhVNUgHdKwtrHtNwB1lo7ZJD9ArCnpH9ivkEoQ64N15sSUPSxrp47Ug==
X-Received: by 2002:a2e:9008:0:b0:2eb:d4a4:42a1 with SMTP id
 38308e7fff4ca-2ec3cfdfd78mr3710751fa.43.1718731549419; 
 Tue, 18 Jun 2024 10:25:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c8a72bsm17349601fa.115.2024.06.18.10.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:25:49 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:25:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 4/4] drm: bridge: simple-bridge: add tdp158 support
Message-ID: <a4xdofsru4cfyfg762ud2x2kpoonbxgdpmjbhp4jpyew2oryvc@kskcz3zcg2ky>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-4-df98ef7dec6d@freebox.fr>
 <hdhy5pnq4vsdn2axgu3t5vyhwqrqcrvpveeyai2lyvwadr7rbb@te6fucdqclez>
 <cad870dd-861b-433b-8598-1b8b68b72d6c@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cad870dd-861b-433b-8598-1b8b68b72d6c@freebox.fr>
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

On Tue, Jun 18, 2024 at 01:48:48PM GMT, Marc Gonzalez wrote:
> On 18/06/2024 00:33, Dmitry Baryshkov wrote:
> 
> > On Mon, Jun 17, 2024 at 06:03:02PM GMT, Marc Gonzalez wrote:
> > 
> >> +	if (sbridge->vcc) {
> >> +		ret = regulator_enable(sbridge->vcc);
> >> +		msleep(100);
> > 
> > At least this should be documented or explained in the commit message.
> > Is it absolutely necessary? Can you use regulator-enable-ramp-delay or
> > any other DT property instead?
> 
> The value comes from datasheet "8.3.2 Operation Timing"
> Table 1. Power Up and Operation Timing Requirements
> VDD supply ramp up requirements, max = 100 ms
> VCC supply ramp up requirements, max = 100 ms
> 
> Did I read the spec wrong? (Very possible)

I didn't check the spec. I was pointing that that you were adding
msleeps() into a generic path, but the commit message had no explanation
for that.

> 
> Are you saying this could/should be a property of the regulator?
> What if the regulator gates several different blocks?

I agree here. Yes, it should be done in the driver.

> 
> 
> >>  	sbridge = devm_kzalloc(dev, sizeof(*sbridge), GFP_KERNEL);
> >>  	if (!sbridge)
> >>  		return -ENOMEM;
> >> -	platform_set_drvdata(pdev, sbridge);
> > 
> > I think this call can get dropped together with the remove() being
> > gone...
> 
> Oooh, it didn't occur to me that the only reason to store drvdata was
> to have it available in the remove callback...
> 
> 
> > Does this work if the driver is built as a module?
> 
> Not sure there's any point in testing since Maxime NACKed the approach.

Yep :-(

> 
> Regards
> 

-- 
With best wishes
Dmitry
