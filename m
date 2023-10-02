Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74457B597F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 20:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352610E0C3;
	Mon,  2 Oct 2023 18:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B610E063;
 Mon,  2 Oct 2023 18:02:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so73801f8f.3; 
 Mon, 02 Oct 2023 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696269724; x=1696874524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zam6JpvTJFSRB7Mf1N6WASAM0s+ax1vMTASmJwGp/GQ=;
 b=OWyGp/gEByRgyM4MY9Ye5RpslnTSZ2ikYlWyXs3wBpkwUYLljzKUnb32PT8SD96zdT
 ILULchDT9/U+v9c8aHQL5z4depnGr/yKc7Me1ifAZvHB6o4ioQw3fNmTK1GVSR1RzaMK
 rgcREADI3fgdEFUTvBcRnpJ1KjvpQliCjIzQPxbAXMcRvZhTfiPjaMt7eNh1l6p+5VeD
 Z6+nutPI/hL9cPvvVllnmrfTka6dUMiaFg0L1BAvQ01a1Q1RgnbFTcicnFQg4J5HxSvq
 JzqkXyGtVvSedD8GnIeQZx1+J19IFgZh2qCOdhccJ9OdMjJ+VoufRo5eIbAiCDyXIzEL
 yqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696269724; x=1696874524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zam6JpvTJFSRB7Mf1N6WASAM0s+ax1vMTASmJwGp/GQ=;
 b=jHuvBE1XxLQvua1CvNxPd+fRhVQIkz58FSV/NAuuxWFqijsKeg2KCRCrSWyS71NWcD
 PpECTy5zrPziq9S5ySWNIaJ12KITuExm6/YB2lruuc+buVWbPEkDPeaNBjQcLHIeO/pu
 Zxp6R9Ble0STZJf7z23U7oRXdLa/R18prlxxra+CwTVPkcviNEU6Z7l/PecPrGGhHSPa
 7N1rA9uoDSIbpTUjF25eNwObVyK++RcrPPKeuEpCTVcGH0tgS2LgQXlEjqTmHsANlMXy
 tehvV/svFA7pLgQcRopyfCA+sp9pgCsPpqjt7dE1ngEK8YCsylupAJyOWz6+qD2umzb8
 JVHQ==
X-Gm-Message-State: AOJu0Yz/rNVvj6AZ2v82S6l1HCxEFNAFVDkISa5ec4FfINH5TyatZJyt
 obBQuyFmMHjQ9d3tq9YnOIs=
X-Google-Smtp-Source: AGHT+IHXROz9dJDWlLZd0E9oyaIxp9J/Vso2ikdsfsbdxkJUFVX9OGXOEmAj9p/hMQ4gi+RMtS0pLQ==
X-Received: by 2002:adf:d4c2:0:b0:317:ddd3:1aed with SMTP id
 w2-20020adfd4c2000000b00317ddd31aedmr10422745wrk.68.1696269723540; 
 Mon, 02 Oct 2023 11:02:03 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adfa490000000b003232380ffd5sm20650839wrb.106.2023.10.02.11.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 11:02:02 -0700 (PDT)
Message-ID: <10644b5f-b0a7-85ef-0658-2353ee14df0d@gmail.com>
Date: Mon, 2 Oct 2023 20:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alex Deucher <alexdeucher@gmail.com>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
 <202310020952.E7DE0948C0@keescook>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <202310020952.E7DE0948C0@keescook>
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
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Yifan Zhang <yifan1.zhang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.10.23 um 18:53 schrieb Kees Cook:
> On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
>> On Mon, Oct 2, 2023 at 5:20 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 29.09.23 um 21:33 schrieb Kees Cook:
>>>> On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
>>>>> This is a batch of patches touching drm for preparing for the coming
>>>>> implementation by GCC and Clang of the __counted_by attribute. Flexible
>>>>> array members annotated with __counted_by can have their accesses
>>>>> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
>>>>> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
>>>>>
>>>>> As found with Coccinelle[1], add __counted_by to structs that would
>>>>> benefit from the annotation.
>>>>>
>>>>> [...]
>>>> Since this got Acks, I figure I should carry it in my tree. Let me know
>>>> if this should go via drm instead.
>>>>
>>>> Applied to for-next/hardening, thanks!
>>>>
>>>> [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
>>>>         https://git.kernel.org/kees/c/a6046ac659d6
>>> STOP! In a follow up discussion Alex and I figured out that this won't work.
> I'm so confused; from the discussion I saw that Alex said both instances
> were false positives?
>
>>> The value in the structure is byte swapped based on some firmware
>>> endianness which not necessary matches the CPU endianness.
>> SMU10 is APU only so the endianess of the SMU firmware and the CPU
>> will always match.
> Which I think is what is being said here?
>
>>> Please revert that one from going upstream if it's already on it's way.
>>>
>>> And because of those reasons I strongly think that patches like this
>>> should go through the DRM tree :)
> Sure, that's fine -- please let me know. It was others Acked/etc. Who
> should carry these patches?

Probably best if the relevant maintainer pick them up individually.

Some of those structures are filled in by firmware/hardware and only the 
maintainers can judge if that value actually matches what the compiler 
needs.

We have cases where individual bits are used as flags or when the size 
is byte swapped etc...

Even Alex and I didn't immediately say how and where that field is 
actually used and had to dig that up. That's where the confusion came from.

Regards,
Christian.

>
> Thanks!
>
> -Kees
>
>
>>> Regards,
>>> Christian.
>>>
>>>> [2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
>>>>         https://git.kernel.org/kees/c/4df33089b46f
>>>> [3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
>>>>         https://git.kernel.org/kees/c/ffd3f823bdf6
>>>> [4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
>>>>         https://git.kernel.org/kees/c/2de35a989b76
>>>> [5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
>>>>         https://git.kernel.org/kees/c/188aeb08bfaa
>>>> [6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
>>>>         https://git.kernel.org/kees/c/59a54dc896c3
>>>> [7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
>>>>         https://git.kernel.org/kees/c/5cd476de33af
>>>> [8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
>>>>         https://git.kernel.org/kees/c/b426f2e5356a
>>>> [9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
>>>>         https://git.kernel.org/kees/c/dc662fa1b0e4
>>>>
>>>> Take care,
>>>>

