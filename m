Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E404C7110C7
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238C610E6C2;
	Thu, 25 May 2023 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5B910E6C1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:19:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso6091795e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685031583; x=1687623583;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nNOadc/C0uHOJOm2Z/hhCLJEKXawL9GUwI52HHEok7I=;
 b=vgK+kROty/psh/wEhOCBSNd39NqRg02kwjcLCvqFVcUE3+iV2aCg5BV4uUh+nGIUMw
 2jIibMCfgxpad6UoKMP76Etmgg0QTOW+8GDzE4xNI2I8eR3KSutGR2t+jfKoI91ZiFOB
 Ugzyzdo8ct7DeiAlFUZ7gFl/AiLFCLuwELvL//jTQ6VoimEE5WfL/uTOSfQ5dlmaXZqs
 iemviwhOimC+pKe+KTcyKWEMaZz09Sw4LcQvdislOJuizqkvzAnyhlj5ZhJzhGIrLDyo
 nryub0wJEjm+oEyhM///OIkXWNzUro4oB0VUkITkDxA+wPeYJewRP42veCmRglUMGHqm
 lqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685031583; x=1687623583;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nNOadc/C0uHOJOm2Z/hhCLJEKXawL9GUwI52HHEok7I=;
 b=d47ZMyppL797Stb2ucx3HbTRr/i3mNnA6ZVSYxOkWtcSlZ4ga5QkchVaGcmoeKcmRM
 xy6idILg28M9F/Qux3YCVYMPlkbPTUsgVdwMLRQHyC2X3XCQRI32JpjGDGhDylcK7Thy
 a8M1AqbBd9T/Njk/R4OHGt9GAnIeIcXk+gpiSpetOYMm8o5ucj+vdxAp1LW/QBjNfugp
 Qs2mmdX7JaJw5YELGL6XtMoNBEZUbT2bFEKuaKotvAVtaQ7smfgb46GnvPYmxjjqT5wy
 bUg1uC2D1fs6QkWRSnSyj94dR6sII8L/7dSrr0XcDTPRUqXJfrl2stalawbMC3fURImP
 Ql4A==
X-Gm-Message-State: AC+VfDyHq6whgBx2jA2xNwHOERcoe6csruxbonJIafBootQnmAGvMT7t
 qNpR1ZKkRADlp83rx6zzvxV0Fg==
X-Google-Smtp-Source: ACHHUZ5wOsnpNtsgygenNWj4kMaoQdK3PEiKH06K1ikPFkkb/eqYGFuwkKpFGvmlKXndcHzGCojozg==
X-Received: by 2002:a7b:ce94:0:b0:3f4:2492:a91f with SMTP id
 q20-20020a7bce94000000b003f42492a91fmr2924353wmj.27.1685031583123; 
 Thu, 25 May 2023 09:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6?
 ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a5d58d0000000b002ffbf2213d4sm2283269wrf.75.2023.05.25.09.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 09:19:42 -0700 (PDT)
Message-ID: <bef20993-b831-b692-237e-b1e89ac4f34b@linaro.org>
Date: Thu, 25 May 2023 18:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Adam Ford <aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
 <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
 <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
 <CAHCN7xJBf+8KyXbqxVSUUXbKqomX+i-13Ed23QFeF0SM8nQpzw@mail.gmail.com>
 <8f50dc2c-4d74-6c0f-87bc-b96bbf1373a9@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <8f50dc2c-4d74-6c0f-87bc-b96bbf1373a9@linaro.org>
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

On 25/05/2023 18:15, neil.armstrong@linaro.org wrote:
> On 25/05/2023 17:57, Adam Ford wrote:
>> On Thu, May 25, 2023 at 10:39 AM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>>
>>> On 24/05/2023 14:49, Adam Ford wrote:
>>>> On Wed, May 24, 2023 at 7:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>>>>>
>>>>> Hi Adam,
>>>>>
>>>>> On Tue, May 23, 2023 at 8:49 PM Adam Ford <aford173@gmail.com> wrote:
>>>>>
>>>>>> Inki,
>>>>>>
>>>>>> I haven't heard back from you on whether or not you want the bindings
>>>>>> patch to be included with me resending the series as V7 or if you're
>>>>>> OK with a single, stand-alone patch.
>>>>>> Will you let me know?  I have the patch standing by waiting for
>>>>>> instructions.  If you're not the right person to ask, please let me
>>>>>> know who the right person is.
>>>>>
>>>>> Neil has also been collecting samsung-dsim patches. Maybe he can clarify.
>>>>
>>>> If it matters, my preference all along was to do the bindings as a
>>>> separate thing once the driver updates were merged into the tree.
>>>> Since the bindings can be done in different ways, I was hoping to have
>>>> a separate discussion on the right way to do the bindings. If they
>>>> need to be part of the series, I can do that.
>>>
>>> If you don't introduce compatibles, no need to send bindings, it can
>>> be send separately.
>>
>> This series doesn't change any compatibility.
>>
>>>
>>> Can I apply this serie and 20230503163313.2640898-2-frieder@fris.de ? seems all has been reviewed.
>>
>> Looking at the driver, it looks like linux-next has some newer
>> features added into the driver since I started, so this series might
>> need a re-base.  If that's the case, let me know, and I'll do the
>> re-base.
> 
> Ok I'll pull the other bits and let you know if this one needs a rebase.

Indeed, starting at patch 3 it fails to apply, a rebase on drm-misc-next is welcome!

Neil

> 
> Neil
> 
>>
>> adam
>>
>>>
>>> Neil
>>>
>>>>
>>>> adam
>>>
> 

