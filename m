Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A790CA38
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366D10E64F;
	Tue, 18 Jun 2024 11:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="CSPYrmwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F48C10E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:48:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4217990f8baso47833085e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718711329; x=1719316129;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JSGPriNhJecr2X/1oYlqBsQu7u8ElPp6aKxGUZ+T2tc=;
 b=CSPYrmwuCJGsC8o2/hl6/zQ3I2BjtJIzhXDPVcj7fhEmr9cMtKlQUNvsddDFikGjgf
 dgbtyRWbg3QslIr6mmCp6PZproIdKMVxaKZJ66F2yidBPtDIrltb/zmeKW55Snk6CpJm
 XIng5eKsPoQgAgsr/uCmq8Nrzdyic1C1KkGVUbFnu8FOFWDxy0hnWUlKjquE+0yVzpzA
 j33JY/dOCcFhXJgNaWhg3NUgslGUrLvoNDg0YdPW4liJ+0ns30e9CCkS0Od+pwrEkKJe
 /MenEvgBjfW6P1o+BTgfGX1NTT3cQdYj5kvvS07kmgtjDUpqtGaM+3j3LcKlgvGo7GY8
 ycnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718711329; x=1719316129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSGPriNhJecr2X/1oYlqBsQu7u8ElPp6aKxGUZ+T2tc=;
 b=VOcam7RTlPjCbfxq5vf6VGdGC28ffpidh40fqWRiLq4q1uIiEksag36vItM05ctj9O
 W43dsMEmyCUJKrZm7EFf2K1bAuiU+3pl1j5In6vUxAvN4oGAYTl/4+IUKExptMrcjesX
 0N1s6YyBSJKpDwJSOMBw0hy4cyvTAr3+1yzqxfZZ1VTzVVAYDV51oU9DdF9Mcy/gpbr9
 3iP/MY7FJf/gnFOlTSK6k7JohJCsq7if5cqvAefOq04TvTjVER4LZCHEVvelx0kIiQWK
 eCRfE+znsuxvaJwpFiLmVizLGs5/52R+hM0ZnCfZvpgziruk5fNJE0N3zkKLPMiR0sFc
 yegg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiA//aYjhBFdYrICfVGwTRYQrjl4VFcq6CNbDw8kkRii8wRupxhLBawZUhXgvb9Fw/8GIWkQ0imlyN8iGMay9FAVT7EtUWeYhSBtS5CVu6
X-Gm-Message-State: AOJu0YwY107s/DgPsCa1Pn8A+0pcDK6K0zhXDtkPln4xUsCc5KEDmXwj
 nnv7VxsoeEh+QJpOh7ndo/7v2t5QC2ZRZSxWxtW+6rF0gc68aT5WT2o6t3gfx0k=
X-Google-Smtp-Source: AGHT+IFy0Uinm2ekdyGrSwOzD+HZWNMhNIX2b6b7Cs//1O1myZ0TJYvBgmSiUt11zlMHDiIFPmrAtg==
X-Received: by 2002:a05:600c:3496:b0:421:7b3d:1fdb with SMTP id
 5b1f17b1804b1-4230482b8a8mr82010485e9.21.1718711329358; 
 Tue, 18 Jun 2024 04:48:49 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e71dcsm221053485e9.44.2024.06.18.04.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:48:48 -0700 (PDT)
Message-ID: <cad870dd-861b-433b-8598-1b8b68b72d6c@freebox.fr>
Date: Tue, 18 Jun 2024 13:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm: bridge: simple-bridge: add tdp158 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-4-df98ef7dec6d@freebox.fr>
 <hdhy5pnq4vsdn2axgu3t5vyhwqrqcrvpveeyai2lyvwadr7rbb@te6fucdqclez>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <hdhy5pnq4vsdn2axgu3t5vyhwqrqcrvpveeyai2lyvwadr7rbb@te6fucdqclez>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2024 00:33, Dmitry Baryshkov wrote:

> On Mon, Jun 17, 2024 at 06:03:02PM GMT, Marc Gonzalez wrote:
> 
>> +	if (sbridge->vcc) {
>> +		ret = regulator_enable(sbridge->vcc);
>> +		msleep(100);
> 
> At least this should be documented or explained in the commit message.
> Is it absolutely necessary? Can you use regulator-enable-ramp-delay or
> any other DT property instead?

The value comes from datasheet "8.3.2 Operation Timing"
Table 1. Power Up and Operation Timing Requirements
VDD supply ramp up requirements, max = 100 ms
VCC supply ramp up requirements, max = 100 ms

Did I read the spec wrong? (Very possible)

Are you saying this could/should be a property of the regulator?
What if the regulator gates several different blocks?


>>  	sbridge = devm_kzalloc(dev, sizeof(*sbridge), GFP_KERNEL);
>>  	if (!sbridge)
>>  		return -ENOMEM;
>> -	platform_set_drvdata(pdev, sbridge);
> 
> I think this call can get dropped together with the remove() being
> gone...

Oooh, it didn't occur to me that the only reason to store drvdata was
to have it available in the remove callback...


> Does this work if the driver is built as a module?

Not sure there's any point in testing since Maxime NACKed the approach.

Regards

