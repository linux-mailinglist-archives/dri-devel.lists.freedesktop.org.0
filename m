Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D0906A00
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1210EA12;
	Thu, 13 Jun 2024 10:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="c3P2t+An";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCD510EA11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:29:29 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so10004971fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718274567; x=1718879367;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZxuLlsV5/HxSCsfyaW+dyt2RGmy5lhX6pvuM1WCCtM=;
 b=c3P2t+AnCJsxZK4Nh0zKk8jng3gcAbSCYztWvH+HH2C3GbDgMGnvkvT8FHIcfi/lqU
 HhztcQ1F7RsoqjafYHd9hsYHQv3nXqDPlbt+9k/yO4UibOYjP0KRlOgCG/VLHraUrncV
 AI4wtGSsjbNHkkXmVdGOenGuTywG+UO++Bf3PNUD+Cs8BvZMiScaNTQhbL0sFEZmKtaS
 0EUYiXz77Ce//rwGYctfMhtj5cz4UcbdfuYmFzzySNxpN9TgEL/RM+WphgI9KPvwb6KF
 laRoyi2/8aFhhXyOhT/zR6lKHEMpA30CY3Apo5ysk2zdtcxPc3NIu7fMW6ypfNfcpLwA
 u7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718274567; x=1718879367;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZxuLlsV5/HxSCsfyaW+dyt2RGmy5lhX6pvuM1WCCtM=;
 b=o/psGuX4UC53VL+RzpxkwemudJqcuU7lrDLrr+u8uKxielE1P8vFGDgpnx7v/GK6u1
 eo1sUrqyyAfzz8xOqnlKO20QUdIFiEnbWLsfDXAgalUfWEo+SeeZOkejmHqemiHBRDn1
 NFQKmUwQz2vRa49LEhu38+ObNMYqfWg1CDoxbeoETltYHp7aJfEEICOy6q5eFdt1tr0T
 SvG5jg0Gj6G1mVVA1nRIwcB+nfj1WB2Oxx3G/+3RP3MAaD0hpNxnooQLfxDr0Na4W1LV
 HnEVjcpUoP1XcBzoeNOENZ+Vgmxb2UxKPvbLO0OeIFhvqW3bXltIvt9JqvGbsKEXf7KL
 HU+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqSn7J71I/LpaPHs9WlkYdTqvsxPlRqxxE47qwsxyWLYcTkGn0K5b5cTjtaCwuGeC9ZVPJX6g9kUbM9ysITxtvr6sI1R+1dDq8mCfed+l
X-Gm-Message-State: AOJu0Yws0kf36fD4KCMc3i6/Oiay6xXTUxBVBuEb6uYUwmTvi67w7gq9
 76i36hOMRGNOJXfjKWDE6bDUf8SDGxTw9wH22q9G+cIMVNPMY2/cchwIfmtmW3c=
X-Google-Smtp-Source: AGHT+IEARCt4rajMh5v8BmZSwp1HSKbKznnkyh/9x16H+Zo0ztDMQxe8NPc6j+36h60AoS0aj5i+9w==
X-Received: by 2002:a2e:9bc4:0:b0:2ea:eaf1:a18 with SMTP id
 38308e7fff4ca-2ebfc9ad9e8mr25851991fa.47.1718274567164; 
 Thu, 13 Jun 2024 03:29:27 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093a29sm1287611f8f.12.2024.06.13.03.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 03:29:26 -0700 (PDT)
Message-ID: <a18a165c-0635-49a8-8036-9967304fd019@freebox.fr>
Date: Thu, 13 Jun 2024 12:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
 <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
 <rdptet6pxdr3cmulrux24tevnlejgblnl5byjb2ypo7fm6tjn3@e4l6qdbr74ss>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <rdptet6pxdr3cmulrux24tevnlejgblnl5byjb2ypo7fm6tjn3@e4l6qdbr74ss>
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

On 13/06/2024 12:26, Dmitry Baryshkov wrote:

> On Thu, Jun 13, 2024 at 04:12:22AM +0200, Marc Gonzalez wrote:
>
>> On 28/05/2024 03:13, Dmitry Baryshkov wrote:
>>
>>> Bindings please. Also, note that per the datasheet the bridge uses two
>>> supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
>>> simple-bridge.c (which might need to be adjusted for the second supply).
>>> Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
>>> before Vdd.
>>
>> Is something simple like below acceptable?
> 
> Note, I'd really suggest extending simple-bridge.c instead to handle the
> second regulator.

I'm confused.

simple-bridge.c is not "I2C-aware" ?

Both you and Maxime mentioned there should be some I2C handling?

Regards

