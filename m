Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BB9C5BD9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 16:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CCF10E606;
	Tue, 12 Nov 2024 15:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XfwlvfQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF9610E604;
 Tue, 12 Nov 2024 15:28:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso1037555066b.2; 
 Tue, 12 Nov 2024 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731425303; x=1732030103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ayot+HwfR74CXO2T1cgPWYEBdAmHU6mQcSK5AjZEZ+g=;
 b=XfwlvfQkxk7+PTT8h+fktaMN+d4F5HjmQQ5IlJbU6vCGAIAGt4vUea7Mt4Jug7Knje
 9EulY18WLafS4/cNpsiWsjYR7WTmpXQwf+wAtaKhTAcTPvEmTXOxxXytaap53Imn/hmk
 4cNfZc7tQwbhLmzA9ly+g4Axbkjos+p8uDLln1hNEDnlUWw4s1AolD3kIKhYV1gNwdLu
 tjXjb6VhTuXKQFUozv0ghGCs+eVsMcApy5gEmbFraBX7BigyOVReWlmp+qzuZiEf79iD
 LZJ60nBDJ+SlT7svPZ0NfFNSsi9yGXVwibeP6ZbMQsUtplN+eG+BKvQm5aR+V/vNkule
 hqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731425303; x=1732030103;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ayot+HwfR74CXO2T1cgPWYEBdAmHU6mQcSK5AjZEZ+g=;
 b=MnKqmKoMdFh5bTu4C7SwNHuJJ2oUbqM8GYIwlcvkw+otuzN40YceAgujCz87FcpUhG
 y0fhe94zZWilAdtzLRrdbeWaaA5yVwTZuO+LcfBPUq7jM/ZkqxwG1Mq9kjgQ4GYOvNX9
 RnMtHA5WTzzy6LQxhvLHryYL6lvs+8EsH2l4vxGqwqucHa1iBzR4NL16J1B24xKVc7gS
 X0Gy0unj3QVx+ZVeR2+5XhXGTE519EFJYyDBhjWPiXdTpaawJS6nJ4B5Gm1761QaYUbv
 WqrDudcFNOKTeBqCNvwkcC6o3mXm7hEsL9QohL/LAw7yRng4jfIIJ52yzJOqhSiA3Nti
 eunQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxcU+yIzDObA07b0sC3nmHXQsZ1nampF+8GGdQ3JS248vX1vriBwQdXwu8VynVcQYuLLBSaQ3r51g=@lists.freedesktop.org,
 AJvYcCXRMHNNYoHvKbQ6Xy0zCgnkxl9DyR+ny+A2uzIJDtbY1DZb9ttZi1FW0Kg7wS+BCnoFiHKdD2xE7yif@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6WDloLpm+GTYGB1Zjk0r8a4rPkEOvFQnZXzZA3Vcm1lDPH3WH
 eb+JxugWxHTY7LrnAqUali37OiNe5RWhqWOIM6oXpcg6G/YUd8Us
X-Google-Smtp-Source: AGHT+IFk9HNfnlRuALtk4W7HEqbT7NEtlHSMqk6UkHeiuxG0PmCJQrKfLmHIBaR/9yR7cq9nw587NA==
X-Received: by 2002:a17:906:d552:b0:a9e:c4df:e3c5 with SMTP id
 a640c23a62f3a-a9ef0010e3cmr1550741766b.54.1731425302490; 
 Tue, 12 Nov 2024 07:28:22 -0800 (PST)
Received: from [87.246.220.203]
 (netpanel-87-246-220-203.pol.akademiki.lublin.pl. [87.246.220.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18b15sm730254166b.18.2024.11.12.07.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 07:28:21 -0800 (PST)
Message-ID: <34bc44c2-e1d2-4610-8a87-f20078592e7e@gmail.com>
Date: Tue, 12 Nov 2024 16:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: Fix dereference of pointer pdev before null
 check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112132005.469357-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20241112132005.469357-1-colin.i.king@gmail.com>
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



On 11/12/24 14:20, Colin Ian King wrote:
> The pointer config is dereferencing pointer pdev before pdev is null
> checked, this could lead to a potential null pointer dereference on pdev.
> Fix this by only assinging config after pdev has been null checked.
> 
> Fixes: 736a93273656 ("drm/msm/a5xx: really check for A510 in a5xx_gpu_init")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

I'd rather drop this check, the only call chain is rather
safe here

Konrad
