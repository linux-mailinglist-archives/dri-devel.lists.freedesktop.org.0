Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427EE992F71
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5995010E3B2;
	Mon,  7 Oct 2024 14:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="0z15yXaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE2610E3B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:33:10 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37ccfbbd467so3327625f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728311588; x=1728916388;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UMAFoCXqjuHb1lmLD9ke8NMYSK0rUZ7bu48RlZlzxuY=;
 b=0z15yXaX4ah5g18zA2w/lQ6Rie0mZkN+m/iB5enbEJrBmt4yEdNi97/9S89kOhm9O4
 ihxYkv3WSnEetsGofr7sZCHfGa7T86Z7D+EaM0O/molnvyp7UvgLTkBzzNPN810Sd92/
 ZhqvZJg6u9g+yx10mH24+ly8FGnGrPDHQXFQNXKmiXzgleFihnc6NhAKUr8N9YedF9P0
 L4qynW1CxE3hC00fvyaHzmqI6rmOxqB9/ruolAekCGPyddnA1KY0EWa5kCl7K/iMBiHw
 t5u+c7K/+W3MaK8/CXdKZg6vpOoJAqyE/StTwLu8lxtdSAgO3DZSj+LXXkQmjJaBgOa+
 9kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728311588; x=1728916388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMAFoCXqjuHb1lmLD9ke8NMYSK0rUZ7bu48RlZlzxuY=;
 b=Pt5NOw9otmbG8eJmWIfz3p7mmHT5ZeXLa/ftkMrt2xZBBIlwwJPHsfDLzYwSBDZkiI
 OkeXDt4A8oGUyU9q5RfY6Nvp7oe2Xozo7Vp8985pOLuh9Ki/FFOZG/nRPqTXMjMiRrFy
 z5+YymsqIbMVmx2D47v6SVs/Z+vw6X3BJoKs9uAX67HCpQFa+KiB70G1tfdWkqBNYkEF
 2IMcXV7RiNgcFZbUEGnkkULPRAZkSy4A7/KvPg0lUq5+fuIb7NtYStHlwQbV6hpVFNK1
 WPR4mDEFhhL359MnR+4FJ51n8g9n6rbwlzQ4oq5FyYNokNLfgOa1GK0CojWNF5NolQ6v
 maxg==
X-Gm-Message-State: AOJu0YyBQZHCZks8Dsw6sLVDOCpd7z+OuMwPXAhdCKkApVUe8lnC3BDk
 UrneLYRNtVOnCwMh2ZcSaD2hcXvf7jdgiuErF7f6S4GyCBNq7XEKH7vDEQIzeb8EXmi+nI1hwyf
 i
X-Google-Smtp-Source: AGHT+IHjU4qIU64tLyI9KmgXNtQlDjO7hYL8LHMhQRre1FTvX5v+cM/Os/a9DuMPHr2ZCyjqbSTTRQ==
X-Received: by 2002:a5d:66d1:0:b0:371:844f:e0c with SMTP id
 ffacd0b85a97d-37d0e6f28b0mr7100118f8f.10.1728311588332; 
 Mon, 07 Oct 2024 07:33:08 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1691a48asm5824269f8f.32.2024.10.07.07.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:33:07 -0700 (PDT)
Message-ID: <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
Date: Mon, 7 Oct 2024 16:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
To: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
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

On 03/09/2024 14:40, Robert Foss wrote:

> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>
>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>
>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>> 1) hard-coding its configuration settings using pin-strapping resistors
>> 2) placing it on an I2C bus, and defer set-up until run-time
>>
>> The mode is selected by pin 8 = I2C_EN
>> I2C_EN = 1 ==> I2C Control Mode
>> I2C_EN = 0 ==> Pin Strap Mode
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: display: bridge: add TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
> [2/2] drm/bridge: add support for TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb

Hello Robert,

I expected this series to be included in v6.12-rc1, since you applied it
before the v6.12 merge window opened. Did I misunderstand the process?

If not in v6.12, does that mean it will be in v6.13?

Regards

