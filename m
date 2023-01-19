Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A5673263
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80810E8B8;
	Thu, 19 Jan 2023 07:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5110E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:24:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id j17so805678wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aEd8ywzEyZqNLP8z3RvHNAWRLYCIYe43IS8HvDJaJlU=;
 b=dovgD9io5K1IKRnUJXgbCsePY8SoKt2zeVtMeGplnip4hXjRluS3V1kRANIT/yg9Eh
 sBvas0MtKInpFh2WvZMDZGD3Wj1BFr6wtUaddPf0CgiIaKIYj7DW0nHgw07EPLwsLICA
 /YJBb7XqcbVOnF3fundG0IU6TrVXPde3WKeX5zV1BBcjDyrGFy3iM6D+D+uv7AiN+wqi
 UFVV7L5wtOQ9bysrRQeFGXT1XaepbkupuX35grDiBrzR3MWI2DbH9jw8T4ZcyPq+JZjJ
 70f+uvBQcl+lUsT19ZpiEMJIrIVxdTD6vWqmoSPygRyzbGsdnT77i+EAURw0pdHZ6C7w
 GRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aEd8ywzEyZqNLP8z3RvHNAWRLYCIYe43IS8HvDJaJlU=;
 b=1A1J5dNQ2AnRxx1tUm5QAK90aVdCjoABlAdb7QAdE65nWUogsY+npqmUHbNhoSLRTa
 HxSvnIdUlmm84Hpwxm3K80ru6y6H+I5K69sctS55dRv4tbQn8ku9fuKU+f3/yqOpxYac
 Ax5mB89L0jJwVBDd75IUv+KVCoW89vKMrkk6TMgbeOjcUF2ySUj8uXHLfmwpjnW4CzFn
 1CzpJL17Fqzkb4oJl2re6LwoZTXyOymXE3B1EnDiE1N6FYtcuHEq6K7X/R+IfFICR3An
 hDCgxIlJ1Byyy+D8fJ65IKKaS4NYXkrdxq3W4He1XR+XrAlynV+yJi8zhrySWbD+hrNA
 H7oA==
X-Gm-Message-State: AFqh2kqv8ERBTImfxt1jOK2f6DE9SQuqgwJ0UeAZjp/F/J+3RSqjmyys
 xw3r/bQ0ZmOglgj0WWaU1UZSkg==
X-Google-Smtp-Source: AMrXdXuTtMWRoLVJs60XnsQgHoSm9apaQuv0n+Pfe2Ca847eT4R/09muekNZk/GQTSH5iTPhPianFw==
X-Received: by 2002:a05:600c:4928:b0:3d3:4aa6:4fe6 with SMTP id
 f40-20020a05600c492800b003d34aa64fe6mr9323563wmp.3.1674113093343; 
 Wed, 18 Jan 2023 23:24:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e?
 ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b003d9b87296a9sm4032602wmo.25.2023.01.18.23.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:24:52 -0800 (PST)
Message-ID: <a7a9d6cc-3602-7a41-86a8-c8be564c4062@linaro.org>
Date: Thu, 19 Jan 2023 08:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v3 0/3] drm/mipi-dsi: 16-bit Brightness Endianness Fix
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Richard Acayan <mailingradian@gmail.com>
References: <20230116224909.23884-1-mailingradian@gmail.com>
 <Y8jtucG3MMk8Oqk8@ravnborg.org>
Organization: Linaro Developer Services
In-Reply-To: <Y8jtucG3MMk8Oqk8@ravnborg.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Caleb Connolly <caleb@connolly.tech>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Vinay Simha BN <simhavcs@gmail.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 08:14, Sam Ravnborg wrote:
> Hi Richard.
> On Mon, Jan 16, 2023 at 05:49:06PM -0500, Richard Acayan wrote:
>> Changes since v2 (20230114010006.50471-1-mailingradian@gmail.com):
>>   - patch vtdr6130 to use _large (3/3)
>>   - remove Change-Id again (1/3)
>>   - change patch subject (1-2/3)
>>   - correct function name in patch description (2/3)
>>   - add Tested-by tags (1-2/3)
>>
>> Changes since v1 (20230113041848.200704-1-mailingradian@gmail.com):
>>   - move 16-bit brightness handling to new functions and revert API
>>     change (1/2)
>>   - remove Change-Id in compliance with checkpatch.pl (1/2)
>>   - separate panel driver changes (2/2)
>>
>> This series adds proper support for 16-bit MIPI DSI brightness and
>> cleans up existing panel drivers with 16-bit brightness.
> 
> The series is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Neil - I hope you can land this in drm-misc.

Sure, done !

Thanks,
Neil

> 
> 	Sam

