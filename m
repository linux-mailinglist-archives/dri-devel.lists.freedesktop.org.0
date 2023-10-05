Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B27B9C46
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F9E10E1E2;
	Thu,  5 Oct 2023 09:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EF010E1DC;
 Thu,  5 Oct 2023 09:42:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so7125525e9.1; 
 Thu, 05 Oct 2023 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696498964; x=1697103764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=693KH3zKhYevDlo1VF7tZiOPFyQxum49fs5ILYx5v8c=;
 b=mCbRI0BTQFWTcRv5HCPwasg57TA8M4BnNk4LLdgYG/mOI26J+ZhW/S3NfwJGPvRKKW
 1H/suJ1mAQNYt8cjKaDmmaWj8g14SXdedIJJHU4Z/LbpB/bsn5VK1m0GxHq9/Hf/0ibM
 1liGoU0J9hKoMH45vXjzQED50pxmbXN9vYipxexL7/zJLeIsH4o4s6G4VdCBAHy598Uj
 rkzVlAbwX2yXwo7irgyCosQcqy739UU+AcN+o1uVfg+n+mXPmLTH412r4eXCgfdY827v
 GlSDfnajRxX06aPoMJERnFmYHUDEKZdDCDAZESy3ZQ2d4Iw8sjRNWYOWA5K8O+/JlOeU
 Udhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696498964; x=1697103764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=693KH3zKhYevDlo1VF7tZiOPFyQxum49fs5ILYx5v8c=;
 b=uZSaLKdTXx2NA7dFIKJDEW2P6X0rWJzBB7SHKgHPc+0H9kgFjqKF+SJuGU8ALBJtCC
 ALI3En84Wleh+Pccdt8HMzcFWe7KZHvYdUL83/vVP8nfZaxdy4OjCSPNdjFvsHDX8QnW
 dNGq8GFxMRcZ8+26HaPkeJXhlOp6WzzkyZXbyl2OkBauirPigmsHtMYyvGR+mmpTmDFP
 WkFt7DVqZ0dewt4zLL0vOpq6P4OHdQVTYlJpg1QrSpjb53Zln7GwkrVybTPUGtT4koRb
 UKkglULZSje69Hx/wGDpIscd4UzkMW7MKSTEdkuQnV3HSSn73pKY6ofohr9C52H6QAOV
 uY+w==
X-Gm-Message-State: AOJu0YzMGEgpjo37IM23PilaNtsHRXhmweBiurtZIUc2qT/12CmqBcDF
 QFn6WMBk3LdzJwsTssvKaLw=
X-Google-Smtp-Source: AGHT+IEqCjtTNseNA7LGC5Lm5Y9+taQvSKRx7vpW4rapsxY7APIyKIIa0O5eElHs85P9+NWErlFwBw==
X-Received: by 2002:a05:600c:c9:b0:405:3dee:3515 with SMTP id
 u9-20020a05600c00c900b004053dee3515mr4625492wmm.27.1696498964439; 
 Thu, 05 Oct 2023 02:42:44 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c015500b0040535648639sm1103836wmm.36.2023.10.05.02.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 02:42:43 -0700 (PDT)
Message-ID: <d58bbe17-efa7-4548-9c7d-bf0310d31ef5@gmail.com>
Date: Thu, 5 Oct 2023 11:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
To: Kees Cook <keescook@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
 <202310020952.E7DE0948C0@keescook>
 <10644b5f-b0a7-85ef-0658-2353ee14df0d@gmail.com>
 <202310021107.9BB46FB8E@keescook>
 <0be2dfa4-b6c1-f62a-66e1-615da7aa3c76@amd.com>
 <202310021122.B6DA850FB0@keescook>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <202310021122.B6DA850FB0@keescook>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Yifan Zhang <yifan1.zhang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Le Ma <le.ma@amd.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>, John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.10.23 um 20:22 schrieb Kees Cook:
> On Mon, Oct 02, 2023 at 08:11:41PM +0200, Christian König wrote:
>> Am 02.10.23 um 20:08 schrieb Kees Cook:
>>> On Mon, Oct 02, 2023 at 08:01:57PM +0200, Christian König wrote:
>>>> Am 02.10.23 um 18:53 schrieb Kees Cook:
>>>>> On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
>>>>>> On Mon, Oct 2, 2023 at 5:20 AM Christian König
>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>> Am 29.09.23 um 21:33 schrieb Kees Cook:
>>>>>>>> On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
>>>>>>>>> This is a batch of patches touching drm for preparing for the coming
>>>>>>>>> implementation by GCC and Clang of the __counted_by attribute. Flexible
>>>>>>>>> array members annotated with __counted_by can have their accesses
>>>>>>>>> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
>>>>>>>>> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
>>>>>>>>>
>>>>>>>>> As found with Coccinelle[1], add __counted_by to structs that would
>>>>>>>>> benefit from the annotation.
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>> Since this got Acks, I figure I should carry it in my tree. Let me know
>>>>>>>> if this should go via drm instead.
>>>>>>>>
>>>>>>>> Applied to for-next/hardening, thanks!
>>>>>>>>
>>>>>>>> [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
>>>>>>>>           https://git.kernel.org/kees/c/a6046ac659d6
>>>>>>> STOP! In a follow up discussion Alex and I figured out that this won't work.
>>>>> I'm so confused; from the discussion I saw that Alex said both instances
>>>>> were false positives?
>>>>>
>>>>>>> The value in the structure is byte swapped based on some firmware
>>>>>>> endianness which not necessary matches the CPU endianness.
>>>>>> SMU10 is APU only so the endianess of the SMU firmware and the CPU
>>>>>> will always match.
>>>>> Which I think is what is being said here?
>>>>>
>>>>>>> Please revert that one from going upstream if it's already on it's way.
>>>>>>>
>>>>>>> And because of those reasons I strongly think that patches like this
>>>>>>> should go through the DRM tree :)
>>>>> Sure, that's fine -- please let me know. It was others Acked/etc. Who
>>>>> should carry these patches?
>>>> Probably best if the relevant maintainer pick them up individually.
>>>>
>>>> Some of those structures are filled in by firmware/hardware and only the
>>>> maintainers can judge if that value actually matches what the compiler
>>>> needs.
>>>>
>>>> We have cases where individual bits are used as flags or when the size is
>>>> byte swapped etc...
>>>>
>>>> Even Alex and I didn't immediately say how and where that field is actually
>>>> used and had to dig that up. That's where the confusion came from.
>>> Okay, I've dropped them all from my tree. Several had Acks/Reviews, so
>>> hopefully those can get picked up for the DRM tree?
>> I will pick those up to go through drm-misc-next.
>>
>> Going to ping maintainers once more when I'm not sure if stuff is correct or
>> not.
> Sounds great; thanks!

I wasn't 100% sure for the VC4 patch, but pushed the whole set to 
drm-misc-next anyway.

This also means that the patches are now auto merged into the drm-tip 
integration branch and should any build or unit test go boom we should 
notice immediately and can revert it pretty easily.

Thanks,
Christian.

>
> -Kees
>

