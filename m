Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D39D9347
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907110E7E6;
	Tue, 26 Nov 2024 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cr5cbPmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005710E678
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 15:03:18 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-724f81aff1bso1212666b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732546998; x=1733151798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
 b=cr5cbPmLInOEDgqVlCUUObDf4FL5N1hH3n6F7Aym48S/cmVL1R5oXOa3RrBXnjipi0
 NcqRqVXg2Z4ZMudPksmPrhVz/uae8mRk3enSoHp5kCPDXQi54Sffyy+MEDAqsDiSHCEI
 HchI6i1BqOxENHCKecQv1yAdJJX47w/hzpBzvC3WREND4VtJzpiTmYGz3Va3SFfqQzJz
 f/ccM2CFPJKmUkJE9e7l/tKZoIIPko8EPEYc9zXNss25wimcPftQYU9YZrhIjJUBH91r
 Fv3sCWzfkPTAGewORs9YIExyXxWGl9/jrh47metFk3CidM3LMYyb5f67CjgiLfxito0R
 Xwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732546998; x=1733151798;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
 b=BP5U4snHPpK76S9Pr2feemGdXgFFIOEJq9OOZ5aTxLEbTTuwcIDZHRBk8QTE/OP475
 2jFSNCSDrWDT3U23pVhP++MC3MSn6uAqHK9dgN0+iDOsmQD0AzmOx4lf7eHzVfwY1fXi
 MNYE2/VbEImUuoFsjKMVVXXpkRDYscBA8WC8B1ryXCKzZQYa0Tj0FkL4tu82dcROZ3mY
 3ZFJZyagLgmxSIQ2Dg9gSrtdOG70QgtKAGDoiMBxdAfA0fNgOAgNcbMzI1nre9xnTiYf
 kN1L5xU8oOm7AxEqmSikqm7VhPDfCRQiKLMKwjsYX7bGPrZTFGmgHupBNuryS/0IkLRK
 ufSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV+HI0wpZY8N+bsQVAc/sHYjfuNv6j6RHFoAF/CUB+jArzRsTHGkHx2kLOWYJFBy5NVrkT9uA72Bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi+Pee3eEi93Qnk6O9yvPaQoVT0JOE0c8fpxNruc1c8574waK1
 wr9bZpd1Ypm69ViwOkmuOt0fMHIYAbNzKwPi+hEW5ymkHzDoFnjP
X-Gm-Gg: ASbGncs2VKREnLr2BRJqBcXVnAGFAThwgIEY4pVKV8qpdMoJ2lKD1bxtiXO3gNir2Zg
 TTc/0TIDyYFx/INtj/BBCTzZPlx9EMNnko8lkrl4bRBToTjKqooQAZEqGTevdQgVml0WLWVM4YG
 NQNxu4cEj3woe3OUtD2ISGi3/dQGG/0KlN0fRrEVDYH0fF1t8/w7rmJ1Bm5tNbvHhz5Mi+syryK
 MhZJoWYhyIeh32HciYDSsTo1WZQquXRZOj9AykDZCFpEtQbIomHPYSjhd6iEywv21po
X-Google-Smtp-Source: AGHT+IHjE12H/V8uAi6iwwQjPB/2bgurIjFDNLyLcSpLqK6GVZz5bJq2Vpx8P1om4SM6YiL6JRFESg==
X-Received: by 2002:a05:6a00:b45:b0:724:db17:f975 with SMTP id
 d2e1a72fcca58-724de984d1bmr23000668b3a.12.1732546997897; 
 Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de454aacsm6498521b3a.11.2024.11.25.07.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Message-ID: <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
Date: Mon, 25 Nov 2024 23:03:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit
 LCD
To: Krzysztof Kozlowski <krzk@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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



Krzysztof Kozlowski 於 2024/11/25 晚上10:49 寫道:
> On 24/11/2024 23:29, Sasha Finkelstein via B4 Relay wrote:
>> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>>
>> This is the display panel used for the touchbar on laptops that have it.
> 
> 
> ...
> 
> 
>> +static int summit_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct backlight_properties props = { 0 };
>> +	struct device *dev = &dsi->dev;
>> +	struct summit_data *panel;
>> +
>> +	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>> +	if (!panel)
>> +		return -ENOMEM;
>> +
>> +	mipi_dsi_set_drvdata(dsi, panel);
>> +	panel->dsi = dsi;
>> +
>> +	int ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> That's an undocumented property, which suggests you did not test your DTS.

Actually, testing the DTS would not have caught this issue. For more
context,
all summit panels found in touch bar have a max brightness of 255, but the
summit panel in Apple A11 devices like the iPhone X is latter found to have
a max brightness of 2047.

However, A11 cannot be properly supported right now due to not having a
driver
for the DART IOMMU.

In the meantime, max-brightness could documented and be made required,
and the
default 255 brightness could be removed.

> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Best regards,
> Krzysztof

Nick Chan
