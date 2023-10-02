Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6D7B4EE7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 11:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4D310E26E;
	Mon,  2 Oct 2023 09:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751D10E26C;
 Mon,  2 Oct 2023 09:20:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso14945850f8f.0; 
 Mon, 02 Oct 2023 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696238416; x=1696843216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNiEun8BJgZFmuZelXrrpN/XVazT12AxKny5brwsu7w=;
 b=hpul48jc5wRgYuuq7rjWOuldRr3Cz9nGdNrRFKhLCSavyavqMoagsUnusKybAJHuKA
 xE046GUSPsZTRflARG4QV+okYn9/EzkY3povCmvJ5Ik1GrCj5Ln9lbAmh48xN4moydyS
 Ob0E2wJN29J2EQksMeSZ09nE0LGVTMfQwQYSuQk0qsMjIhriV7625WbkTiavmwYjaLqD
 UHXgnOE3qWqbwPTE1XChcntGdNGGp7w49mOcrOfHtkSnNRlfSSMvU1dMNWke9VL0l3zU
 sCHGzEt0FvM1pGp6qohTFb5z2sf0rVb6W87Vmo3P3pPk/heYC/hymC4KcrnC0WYc0EL+
 MVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696238416; x=1696843216;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNiEun8BJgZFmuZelXrrpN/XVazT12AxKny5brwsu7w=;
 b=EV+IoY/hoj/U/elpIXBrMJjo2eti6i/r6uC0vZ7zP36Ogv4Ehbm+OV2vjkvsAHmIcN
 DYEslUo4u6DNhyJOUEWXr2dJPqFSu24/OZiG36ERZus5uME1+uPKJK16ycwjwDRVokMu
 h5eF68WrC1H59Y9xt1X4nbNZcWn3T068qLW4JiowOcH0He62g2zwsxhbn2GST4BcXNh9
 3ayItguHqMVMyj8uyBQ8MfYpTPkqGPRqzHEJLdHQWGOPlLsw3vHG9yE2TVK/A4LDNVzu
 0Ez17qAq9s+Hxrgd3DAvWjFmnidUAdES7WVwSff99TOeMYrKboJ5az85F6wByCnvwSXu
 Gb1w==
X-Gm-Message-State: AOJu0Yxuxi6j+6ZPC8jWUDKviP1iS9xz8P3l4OeXzr1B/1a65fSaNCnL
 dOiz5T1a81XUOektcnKGqU8=
X-Google-Smtp-Source: AGHT+IHbGguNFjowt/WUg4Hv4Wpy0nhMxW4/Lz37ilFeyba8QPT16aUDMsJeXvW8elMT4DQ7Chc9QA==
X-Received: by 2002:adf:ee10:0:b0:319:71be:9248 with SMTP id
 y16-20020adfee10000000b0031971be9248mr9703358wrn.19.1696238415942; 
 Mon, 02 Oct 2023 02:20:15 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b0030ae53550f5sm27500038wrv.51.2023.10.02.02.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 02:20:15 -0700 (PDT)
Message-ID: <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
Date: Mon, 2 Oct 2023 11:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, David Airlie <airlied@gmail.com>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Evan Quan <evan.quan@amd.com>,
 Emma Anholt <emma@anholt.net>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Lijo Lazar <lijo.lazar@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, llvm@lists.linux.dev,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Melissa Wen <mwen@igalia.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.09.23 um 21:33 schrieb Kees Cook:
> On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
>> This is a batch of patches touching drm for preparing for the coming
>> implementation by GCC and Clang of the __counted_by attribute. Flexible
>> array members annotated with __counted_by can have their accesses
>> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
>> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
>>
>> As found with Coccinelle[1], add __counted_by to structs that would
>> benefit from the annotation.
>>
>> [...]
> Since this got Acks, I figure I should carry it in my tree. Let me know
> if this should go via drm instead.
>
> Applied to for-next/hardening, thanks!
>
> [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
>        https://git.kernel.org/kees/c/a6046ac659d6

STOP! In a follow up discussion Alex and I figured out that this won't work.

The value in the structure is byte swapped based on some firmware 
endianness which not necessary matches the CPU endianness.

Please revert that one from going upstream if it's already on it's way.

And because of those reasons I strongly think that patches like this 
should go through the DRM tree :)

Regards,
Christian.

> [2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
>        https://git.kernel.org/kees/c/4df33089b46f
> [3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
>        https://git.kernel.org/kees/c/ffd3f823bdf6
> [4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
>        https://git.kernel.org/kees/c/2de35a989b76
> [5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
>        https://git.kernel.org/kees/c/188aeb08bfaa
> [6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
>        https://git.kernel.org/kees/c/59a54dc896c3
> [7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
>        https://git.kernel.org/kees/c/5cd476de33af
> [8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
>        https://git.kernel.org/kees/c/b426f2e5356a
> [9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
>        https://git.kernel.org/kees/c/dc662fa1b0e4
>
> Take care,
>

