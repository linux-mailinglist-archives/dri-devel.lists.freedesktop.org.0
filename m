Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9397110A3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0B410E6BC;
	Thu, 25 May 2023 16:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49010E6BC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:15:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so7272375e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685031315; x=1687623315;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qw4bDyc63g82jaXETgAK3DKuZQRJm9Ds+IOjxXZdyQE=;
 b=LBetds4lvVt/9C3Onsyn93AIbZ5UerI8ht6Vc7MFWM9xTE+Jby6/EoJVpRWis/55sT
 xBOiZD5DHu9pfzYQdg+MHwuFQgHG/QDlI2qKwlTHy+8fYGZt9kFf6jOup9gFYBHH7wqp
 X4VhFlgXD60WBs1ff3UfHHqvx84rK4hKtZMDQkft78QO9paURPfg68F/xLfaD+0NP86M
 HjRS8Ykssd4f8ilGXNzrigZolYyl3Jva2wgqQEOU/XJmkzJl/7QRalDryL8wM3Ta+/PF
 8fDM4OF4wleDRc+xwbvw9DY1Uv6th6empkhfvzIOTGvBntikXLPQ1+lGXzpWXEqxMaoc
 hr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685031315; x=1687623315;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qw4bDyc63g82jaXETgAK3DKuZQRJm9Ds+IOjxXZdyQE=;
 b=DKIspVwVm9aNH4P8PFxiA8yNe4ji8TuGB1+aWTsv42ify8PJQ9c9k60lysJIrC9wYl
 d6RYwLJAVJmidsa4uD84CPXX3w1qW9jBOSKLr9QgDdui/uoxImAE/mDiwHVRc0Kl3TY7
 pf4ANTZUBMmgfxmAtdgrwKNc0KM3BxLG2Yem9kvPVYKzSt9bu1tXBF0PQ8fvjKMdi0uS
 p/KUzvxMl9V84dJWXGfOn8p8ZoR8MFmW/cGhrDvsOFXUDGehCh3ZT4UtgM/dhkq7Aas7
 Ho7Ir0ZSlGvTjUFPpCgHBAANd2tsie/9GDDV5Vu45Qee5gxIw4HoDd3mwQuqV/V3RMjZ
 vOug==
X-Gm-Message-State: AC+VfDweJ4MaW24vhSCc4U5D7YktVk9MVouk0DDh2UI02occ0w3pIjd7
 kE3xV7mLnNL0nhukWZFNBaNZ4w==
X-Google-Smtp-Source: ACHHUZ5kyNl0bzWpbiUpvhXd9Dr7sDW4/WbiwkStmcoUHq9Yw1ttAp0H7i8fvDMgcxSJA8icsrI1Aw==
X-Received: by 2002:a7b:ce95:0:b0:3f1:72e2:5d13 with SMTP id
 q21-20020a7bce95000000b003f172e25d13mr3035787wmj.16.1685031315379; 
 Thu, 25 May 2023 09:15:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6?
 ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a7bc4d2000000b003f427687ba7sm2463085wmk.41.2023.05.25.09.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 09:15:14 -0700 (PDT)
Message-ID: <8f50dc2c-4d74-6c0f-87bc-b96bbf1373a9@linaro.org>
Date: Thu, 25 May 2023 18:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
 <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
 <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
 <CAHCN7xJBf+8KyXbqxVSUUXbKqomX+i-13Ed23QFeF0SM8nQpzw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAHCN7xJBf+8KyXbqxVSUUXbKqomX+i-13Ed23QFeF0SM8nQpzw@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/05/2023 17:57, Adam Ford wrote:
> On Thu, May 25, 2023 at 10:39 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 24/05/2023 14:49, Adam Ford wrote:
>>> On Wed, May 24, 2023 at 7:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>>>>
>>>> Hi Adam,
>>>>
>>>> On Tue, May 23, 2023 at 8:49 PM Adam Ford <aford173@gmail.com> wrote:
>>>>
>>>>> Inki,
>>>>>
>>>>> I haven't heard back from you on whether or not you want the bindings
>>>>> patch to be included with me resending the series as V7 or if you're
>>>>> OK with a single, stand-alone patch.
>>>>> Will you let me know?  I have the patch standing by waiting for
>>>>> instructions.  If you're not the right person to ask, please let me
>>>>> know who the right person is.
>>>>
>>>> Neil has also been collecting samsung-dsim patches. Maybe he can clarify.
>>>
>>> If it matters, my preference all along was to do the bindings as a
>>> separate thing once the driver updates were merged into the tree.
>>> Since the bindings can be done in different ways, I was hoping to have
>>> a separate discussion on the right way to do the bindings. If they
>>> need to be part of the series, I can do that.
>>
>> If you don't introduce compatibles, no need to send bindings, it can
>> be send separately.
> 
> This series doesn't change any compatibility.
> 
>>
>> Can I apply this serie and 20230503163313.2640898-2-frieder@fris.de ? seems all has been reviewed.
> 
> Looking at the driver, it looks like linux-next has some newer
> features added into the driver since I started, so this series might
> need a re-base.  If that's the case, let me know, and I'll do the
> re-base.

Ok I'll pull the other bits and let you know if this one needs a rebase.

Neil

> 
> adam
> 
>>
>> Neil
>>
>>>
>>> adam
>>

