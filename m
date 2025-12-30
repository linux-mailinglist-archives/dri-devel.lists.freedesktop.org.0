Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956DCEA61A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767F710E930;
	Tue, 30 Dec 2025 18:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XtMqxknf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9610E92E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:01:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a0fe77d141so110187155ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767117708; x=1767722508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
 b=XtMqxknfmgpllDIS715b2GDTzRV39lNdFYGa2oLIFY+0RUXQcuZbevcPqv+QHa5ZC5
 L+QV33RwZDav2o6wpeAm5NkG0mdkzuLeKvtY4uwikMclNxZy/5qpsrTI3rm6y5ub4htO
 eq8ZdvItVfCQsvfETAzyAPb7QF4nV3VtYMXnVLxGKFo8eR2zSxcTb/vmdMew10S6mowl
 4+F/ksa0LgE8fTxuaJNG2BUXTyaRwhN0PxwbJ7utPIW3n2c06CJ2M1XnSlSh/mH8RsBx
 tyheabyAPUGNgbjcI6MGmyfNRrQSWICItmB455LuMzq7o0aU0WIsXsc/V4/b0WQZ05Z1
 G4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767117708; x=1767722508;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
 b=Y7P0tx8QsvRM5aJHoglgeymNzKvRNeolesbW3kNCtO8nYCSxj2Oh1TVmryzG6zYJC6
 f7W4sREPDaCKikDvSsNP/j1n6Iq7YP/RR7lE0hWqTv0YN1nqaxCBROzaMwvE89u6ObzS
 VKJz4Pijh3yTWDQ/zeas7HhYl1FmMVXPbsk1TMqDtNvApjYClJ2OxoDdbbjfGz5RReUX
 kOzA2q3Z0AzEq3BGgKdK+uJDhzrbNnb9FBuNTBXoybQ/HJlQ04CtLZ9iN/kjudGXs0jV
 wxPk/s9JRqXYcrO9nInDeUFkspFMtqsomwU02xoRIuE8Bl0rzb+WcdkPZ0FRcZi6xijf
 PU1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdU03x21pf/EB0hK9E88xdrjcNrFzJz3abpRB2hJxMX7cg/MJfSunWO9G5bNUtOIh8CRche4WQoJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlFVRLe7aqYFwjGaAvba4DMRbUj8MzD8mzn7oaQ3rkuT6eF1wf
 RXB+LguOaVXAYTVtNisBSPU/X6RKIKs0ikkG7v8qfWU8RA2mvvF7wMkK
X-Gm-Gg: AY/fxX5+Ov7CQDSabwejKR0ZKmBInp+a7V/CchLKKg5vgtlqVdxWw0Gaf2q/KtaRCB6
 IhoxnwDQ2pLnYC8sxfLdvWcsXKwkEs6fVhSfWpLKghLTrOdFGDmSklk+RWwvht2Vm9hlMEy3h8u
 dsvQM5qZoxLnjiqOKcE/wHw7rvRx6r+QMbc1hxN0IJnXdBDteESmXAgUDygVBf7OaZkfTaeY9+O
 gBRFo/rMdpr0Qab3vCU2mJdOHohhU26y+Q4fI7H0D9TofxqvI4/XWvbv5l/9IsunvapwDueAdJi
 kx7iD4mcFotm1FBycdSrQ0tY7zecvYSfCmrYW/1fwnHFlg3vBGY+R28wzPCLKS8nSDr/D334THY
 cFTrXe9V72xMcSkugBxP80bkPA49e8XKwlfeZwL2vVgc6XyKXDoBinKAqySzkFLqDNpiDN8uir0
 bD3DOVem0RrG+TVEzPDuqFOMNvu7+X4T0GFIwMtGK+e5yhw3M8nJ79p/ucgzU5
X-Google-Smtp-Source: AGHT+IFCY5D2OrgQbO8T1ac5XgJ7Dh5PRosYfy4bjpWjfeV/DmYMVgVyyX6wvp70OFg3Iu7Fy2RfYQ==
X-Received: by 2002:a17:903:38cd:b0:2a3:6b54:5d42 with SMTP id
 d9443c01a7336-2a36b545df5mr162573995ad.59.1767117707570; 
 Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd?
 ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4d2c6sm301374495ad.49.2025.12.30.10.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Message-ID: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
Date: Tue, 30 Dec 2025 10:01:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
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



On 12/30/25 03:37, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:
>> omapfb provides several sysfs interfaces for framebuffer configuration
>> and debugging, but these are not required for the core driver.
>>
>> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
>> When FB_DEVICE is disabled, sysfs operations are skipped while the code
>> still builds and is type-checked.
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
> 
> Still the same issue I pointed out in v2 review.
> 
>>   		int t;
>> +
>> +		if (!dev)
>> +			continue;
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
>> +
>> +		if (!dev)
>> +			continue;
> 
> Ditto.
Sorry about that. I had actually made your suggested changes but somehow 
I mistakenly send old patches instead of updated one. I will send 
updated one. Should I send v4 or v3 is fine?



