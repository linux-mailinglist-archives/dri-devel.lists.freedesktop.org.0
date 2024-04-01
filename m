Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABAC893B04
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 14:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA27A10F012;
	Mon,  1 Apr 2024 12:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="i2Hh69xQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94F910E226
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 12:39:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so2891689f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1711975177; x=1712579977;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H2EUwRDkkeNDukcge3a1iBvqeXFfUokc8SHBEfVM2e0=;
 b=i2Hh69xQ2ukaYrYuBrYNwyTNuhLaL7gEsUnI3PXSUjcBGDScVZ1AC9qxp6Ru3/6TVl
 HuOTylazRxCewYX/NmC4ABy3lgjlJMNHX4WKPcCqiYV5Nt914X1p3uoAF3T5j0CJM9Zr
 5XrytOozLswige9DYq8TPlU/q7m6rvJbARxR0zudCg5R0H/FlaNH6Pbn0Q8YLWksegY5
 mEXf5W1uowN5ZqCLRBVMHp6Z04Q8i0qa3HHOKBeGp4pFDJ8Tsf6usEamZNkHE9LHUQRI
 L6H0pH7wR24g9FFdG39a+Zsc81fzLYIOVtkPv+d2b4bO7Q5atUyXcnh2nDo4MUfotB+g
 gvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711975177; x=1712579977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H2EUwRDkkeNDukcge3a1iBvqeXFfUokc8SHBEfVM2e0=;
 b=Uihs8jtItIZh1VApa98U4AFWf3gtW9xeQ7ydrno9B1aGwXuDgHAa3crAXV8Ca9P2/T
 j2fbDfBP6Ug2gMES6dV3x/Pp8uETY86Wu8AkFqs4CEWCfXqRRXvVkRhzdfQT1U/1+0yq
 xR8GHlp6/swNq03HuLHBDihjVx3ky43Olqg0T9Uxl3qYMqcWFAYB8nGdljXNi0Zd5ijZ
 PHWIY87dHwjfVGTYE6DyLF5wLsJ0MjzmmePU86HcRAST55v1NF6+U3PL2AjLshBj8B8h
 V0Mz93LV89YCjj0rEkyUSr5vG+vJJGpKcRzgq21q3EmpnpFtTMleMqVH5Xb38aohTdR2
 LXhg==
X-Gm-Message-State: AOJu0YxVD3mB/kprq5130mnHap/Q0nyL3jktw0YRR2y14f2gVZGuLp6f
 XUXBWjOAm0Vmq4buTUZcxaEqS+YjFhc7fovGhnbzPMf+RdnKI19xNhX8QlqnDIs=
X-Google-Smtp-Source: AGHT+IEUsV4QyGJ5s7eoDrQbcC+vTg7j36Tkp+hsSatBFYgXS89bO8YfYY7FFaMQJP+SiVLtsTp+Kg==
X-Received: by 2002:a5d:598e:0:b0:343:4c43:b38a with SMTP id
 n14-20020a5d598e000000b003434c43b38amr2695374wri.17.1711975177452; 
 Mon, 01 Apr 2024 05:39:37 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a5d5e85000000b0034349225fbcsm4284757wrb.114.2024.04.01.05.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 05:39:37 -0700 (PDT)
Message-ID: <9a063c39-6d2f-43c3-98b3-e4f8c3c6e9c4@ursulin.net>
Date: Mon, 1 Apr 2024 13:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
Content-Language: en-GB
To: "T.J. Mercier" <tjmercier@google.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20240328145323.68872-1-tursulin@igalia.com>
 <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 29/03/2024 00:00, T.J. Mercier wrote:
> On Thu, Mar 28, 2024 at 7:53 AM Tvrtko Ursulin <tursulin@igalia.com> wrote:
>>
>> From: Tvrtko Ursulin <tursulin@ursulin.net>
>>
>> There is no point in compiling in the list and mutex operations which are
>> only used from the dma-buf debugfs code, if debugfs is not compiled in.
>>
>> Put the code in questions behind some kconfig guards and so save some text
>> and maybe even a pointer per object at runtime when not enabled.
>>
>> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks!

How would patches to dma-buf be typically landed? Via what tree I mean? 
drm-misc-next?

Regards,

Tvrtko
