Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F380D090
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 17:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB4E10E108;
	Mon, 11 Dec 2023 16:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1712710E108
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:07:49 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1fb9a22b4a7so2759560fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702310868; x=1702915668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=olWTkTTTDMqyGniJrt96EJYeNEaxv5XjfscB27aHKBI=;
 b=E1qtS7BgsYC3VlXQEGjiaOp4Tpw8hWhdDba++Jjl8/ZMz449jvvTZBmtA4ih4QZSXC
 K7YfV84Z7/xfc4+HSPUAzUw6SPLY4jfFUUYL1pWc2+zppGDMAHeMRnRJFC9qvfiBT8WZ
 eonrOMyD9CcFgd2Noq0+aRfSbzUkLuzijW+Gi+WAKgwyeh+oU6Ic4OKiUIUzZEO14Dmg
 Bf7UC0WS9+vKQyw2XJlxLSchst2pYHGJ2S9tWq/ms3OHqjl2TMEC12FcuBg6QqefK7yn
 ohDOEVYzj7UihNO6oLsJBHYECBoR9eOpNiZN5iTNUNCbHvuCkxVW0j35qWtOA4c8MAxg
 mWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702310868; x=1702915668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=olWTkTTTDMqyGniJrt96EJYeNEaxv5XjfscB27aHKBI=;
 b=wh8Q3VXedMmAJXwqcBCZIS5VmfZ/ZKzk8j8MUiHe19lyPdpHyc7OWNo25vBY1ZEVZN
 ZAm2+PRxNTyACwXAOxf7wfY/zSJllv04+59qvTA363IHtPcPKVNNGUmyehhbhBlS8d0v
 38K6S4Bvy5LatE7GVNLPMcMbJOh6xZCpMOSVl9UK1j611sNQN3FeibrVi7B7wLruKD6Y
 zzbiTZj+VmqfBmFMXVacn2ATOqutHVG1bW3Uy+a4bxsddfwIMdZGPJciHd+u8Zqc+jZ9
 8mdtGqElat9vg17rtlxOUtKiiO5Hy1tBwwPJBST4NHja3mN70kbDFOjj1eqvp8IxNVt+
 qe0Q==
X-Gm-Message-State: AOJu0Yx6CmAPMus+OpoqLNXPzFvTqXJxeqLLd06yO1/5xWdFzSEumHth
 5p7bcsCvprwQokM8HbGFgAYRV6lcAsl6kRdW1pqZhQ==
X-Google-Smtp-Source: AGHT+IHkgREgetJtJ3CpZeBOhCg+lo0iJmAL4cDPZHyGGcooXLGdNWNZrDMNjy7Xl75SejBdf5W5Lg==
X-Received: by 2002:a05:6358:9209:b0:170:1d30:56e0 with SMTP id
 d9-20020a056358920900b001701d3056e0mr5134113rwb.30.1702309233725; 
 Mon, 11 Dec 2023 07:40:33 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e?
 ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a0cf646000000b0067ec9faed23sm1463005qvm.142.2023.12.11.07.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 07:40:33 -0800 (PST)
Message-ID: <ae9b5592-549d-4a6a-82c8-9545ab8eb924@sifive.com>
Date: Mon, 11 Dec 2023 09:40:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
 <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
 <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Leo Li <sunpeng.li@amd.com>, llvm@lists.linux.dev,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 2023-12-11 9:17 AM, Alex Deucher wrote:
> On Sun, Dec 10, 2023 at 5:10 AM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>>
>> Hi Arnd,
>>
>> On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
>>> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>>>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>>>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>>>>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>>>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>>>>>> architectures. Enabling hardware FP requires overriding the ISA string
>>>>>>> for the relevant compilation units.
>>>>>>
>>>>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>>>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>>>>>
>>>>> :(
>>>>>
>>>>>> Nathan, have you given up on these being sorted out?
>>>>>
>>>>> Does your configuration have KASAN (I don't think RISC-V supports
>>>>> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
>>>>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
>>>>> or KCSAN in dml2")?
>>>>>
>>>>> I am not really interested in playing whack-a-mole with these warnings
>>>>> like I have done in the past for the reasons I outlined here:
>>>>>
>>>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>>>
>>>> I also see one of these with clang 17 even with KASAN disabled:
>>>>
>>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>>>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>>>> [-Wframe-larger-than]
>>>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>>>
>>>>      ^
>>>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>>>
>>>> So I'm in favor of just raising the limit for these files for clang, like you
>>>> suggested in the linked thread.
>>>
>>> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
>>> in that function? That should also avoid the build failure
>>> but give a better indication of where the problem is
>>> if someone actually runs into that function and triggers
>>> a runtime stack overflow.
>>
>> Won't that break actual users of the driver, trading an unlikely but
>> theoretically possible stack overflow for a guaranteed crash? The intent of this
>> series is that I have one of these GPUs plugged in to a RISC-V board, and I want
>> to use it.
> 
> Does this patch address the issue?
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/72ada8603e36291ad91e4f40f10ef742ef79bc4e

No, I get the warning without any of these debugging options enabled. I can
reproduce with just defconfig + CONFIG_DRM_AMDGPU=m when built with clang 17.

Regards,
Samuel

