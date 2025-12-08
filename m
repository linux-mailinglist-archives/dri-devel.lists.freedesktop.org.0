Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B35CAC73D
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55710E3BE;
	Mon,  8 Dec 2025 08:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MplZ2uoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2210E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5959b2f3fc9so4300344e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
 b=MplZ2uoRcn/vXS74GqZu0uIocW0HO5qVWWQz4bgHxYH6fgM/0MUfoTcBtGMFiNAft6
 UMcN9LApgvIyHdeMAbsq4PT/Tb01fduQwSMlgKDdzDpsM2s5AYIhjWN+ycrT2HTNgFon
 mvO6peZGVeyh+VZ3mSkJ/jTpQ1/EbR439puax5Mj+t1jiQApsC73OkTRdukXefyN1+r/
 4Osj+1zPusH0KOg94jEa8PxaoanSMpPghq5m0j5u6hM+SOpnHpQzMcVeeBWpsGkomaWS
 L1PpScKNAb5Wvmd/sLhFXY13fEUUyC2jmtt8SZmo6mQy9cmd8YDsRli+kAdM3+emZJdP
 rFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765181045; x=1765785845;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
 b=W0dZkOEORb9a1eDi3VclN+mU3v1nIQ/D1qOgtxJLMtXndN+sXkDtWNIK8CwKlRPrrA
 9WqtUBM1VDHn8W2T9Zs3ODPA3IwxWl8r7T0w2pDGzQqkpykIFoe3MzV1672NMok5zy60
 Pt067zRyFtJEdNQf0s3IiZgWBK6OJOkF0EVzK4UaOMsG9UrgAGUdu7fcYHXi0pupYuMX
 rWicALF/GH34+B7fkzvdg/z2FbUNoK2KCb1R0EWWtIkDjSwyjJrJ8eiCkb2E+u0s+H7E
 zeoJ26ii3c2YafbySuhwzsxAK+iysWM5RRS3YE3mwiXTisVt/ilns9cFFr0eL5RXPutZ
 z54A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/B+IYIIR0t086UpL0jtAMx2mFEGH/lWFWWKR+L4bsN4R1v+Mk8uo31yhRFlPf7EYhhCIWYo5Boig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1sgNkbqh/mR/7/TS9v25PZeIl4vx6ltu2LeBI+q2qXBnqD7Cn
 g/nisS1Kr5sRxh9+8X3Bhas90UtiZUXB/a4CLxenhag8iMjI0WL8s+nM
X-Gm-Gg: ASbGnct9mA9kwP7EEJh0gFDuqN2iAJHyKPZXKgwMoSJh7fbaNtvLFUPR/31sZ+JMc8W
 Wsiepl/58DnP5oTdwB4hP49MFd4v1JWWjlhbRJT/ScV2C0eiskuqJk9W5UR8tLv9wG7sV7Cgfpu
 +5mStzRu1+UhblEEdbFlsoSGQi1FKUdBtMd9KkRDWx7ePgugFE8XNrreBdoP4NB/giurivVYrNw
 g8FpqtKSPtzAC5eD51aiSRFJxL8dB+Sd+GmQcGgClT8zEU5m2WzDCLx2jWPgXdnUFXEejdmQv3L
 5Vsi/m0pBRZq387wM8j+xDiAsMYX5Ou3mHJNi8BJEksV6egGiEhw/nV9GDxg4AZoGRrP8RFfCiX
 7ceO+lYg1u69p9p6B1KWvHYeNtTMvybUhJd5SmaTOW4k/tqvKV3KZa45uCOCsIKdg+F/hqQjsGm
 yLIrurRyJEVLEBnU72qr0ayccAs1ksHyacAJLgsQN4+7F1DqtTZM4DQW4BYnM5JiaW46kK8rnKN
 2sUV2A=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id
 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203; 
 Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703?
 ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
