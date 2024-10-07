Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16F992FD3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62D10E3BE;
	Mon,  7 Oct 2024 14:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="nAfPTF6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B610E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so41695165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728312601; x=1728917401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1NyQRssNX2H+PouQCuQZFpVJ+OYp8Hk88kmYRkHCtA4=;
 b=nAfPTF6cb5jfB58xI0WFP3/vb7OwAkLj7MThaZDS2pcXXgU6zgOxYNH95yC/shY0Zr
 y4DQrzPgdd9sWb33E1XQhyKYuD3NXJLZ+I1muQKM13QiEjzrbvrY/xlyxAVL7wcTRKUI
 OOcuFQWZCL9ef47h02RHfSrzwhWOGhbyr/ng5OrMW5okyjUgD85pCfEurwiauViNQZvU
 B604DpBdoZY6t0nU59dINXoUuu62yF9r1Jqt/uGhEM5L843SxeELZBecE8+ePNM3ugja
 Y4X73KwezCK5V8CA5RAGTbfcNsKb84gFF33T7camfBXODzgtBnPCAQwjpVN5E2FhkZr4
 StVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312601; x=1728917401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1NyQRssNX2H+PouQCuQZFpVJ+OYp8Hk88kmYRkHCtA4=;
 b=sWD6eRG9tEGdlp9oWmJ0SHZ1LdCzoVxdnchmPtXYRTMYxvgAfqayOmEjQkcU4AZSO9
 Mh+ux7UU0T3Vn+QbJCPy9IwPn6bloebF0eK18Bx3dCc4+yoPRblSm+Y+8RIvZc0jBs7w
 DfMUt+RlkWSlp9JO1ymEhuXiik6/uEc6oLoZ1YalJGdFF1fpdKeY9++8iOx2IawQZXlc
 u4ZqbKqKVIWtdOCaOJ9TZGw9pqOGAcYHkLJ0wk+26O/Y3YQwn1o0vWaXYRGu9TH3CNnF
 IRhNfZNJypuK7roFMSdhapnFm1Vk5ArefpzKIjyF0wFjZwNpc4rsQlLVRzdOcx7VqJ0o
 nQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXW79XdMQDST8zkaPlFv/8zqYFM0n5Drj/74mtmpha6NWJeJ8/YjvvHT5vLGHnpcIS+wVbmWLOqXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznPgrN+UcqeBQa1bu7roZLJTc1nJw5eeKcOyQkCd5/bXvWltua
 B+ig810R+2a6GjvCLTmQC+hAPEXhCCYSlfG+NSHllfj51xmG+gCxvLL44HVjq2g=
X-Google-Smtp-Source: AGHT+IEME010xJ6NSIv9wR7Z/93/BFWW/x3u0WJ5DnL0ywdklukEZv0FJeErGQxlLa2wTRRInxBsmA==
X-Received: by 2002:a05:600c:3107:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42f85ab64b4mr98834965e9.9.1728312601201; 
 Mon, 07 Oct 2024 07:50:01 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1698e885sm5877536f8f.114.2024.10.07.07.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:01 -0700 (PDT)
Message-ID: <c48b54d2-6903-490e-a80f-ce3e04354470@freebox.fr>
Date: Mon, 7 Oct 2024 16:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
 <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
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

On 07/10/2024 16:42, Dmitry Baryshkov wrote:

> On Mon, 7 Oct 2024 at 16:33, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> On 03/09/2024 14:40, Robert Foss wrote:
>>
>>> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>>>
>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>
>>>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>>>> 1) hard-coding its configuration settings using pin-strapping resistors
>>>> 2) placing it on an I2C bus, and defer set-up until run-time
>>>>
>>>> The mode is selected by pin 8 = I2C_EN
>>>> I2C_EN = 1 ==> I2C Control Mode
>>>> I2C_EN = 0 ==> Pin Strap Mode
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/2] dt-bindings: display: bridge: add TI TDP158
>>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
>>> [2/2] drm/bridge: add support for TI TDP158
>>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb
>>
>> Hello Robert,
>>
>> I expected this series to be included in v6.12-rc1, since you applied it
>> before the v6.12 merge window opened. Did I misunderstand the process?
> 
> drm-misc-next stops propagating new changes to drm-next one or two
> weeks before the release.

Oh right, the "stop at rc6" rule of thumb that Krzysztof mentioned.

Regards

