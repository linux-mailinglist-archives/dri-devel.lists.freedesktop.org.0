Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D065DD8F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 21:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ED010E48B;
	Wed,  4 Jan 2023 20:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041510E081
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 20:18:27 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x11so12297820ljh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 12:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W+gyoedcg1b3GPs62Bs9hwSPV70xPMrrXrnC4iIqMBk=;
 b=objM5sQOjxbefY9lgL4n7fMyUZth5SW6tHMFYfMAJMn4dl2Flg3V4ekcnlb0RoZHiV
 B4MxUDSWwAlHmHYOoQn2NF8iVI+NWAr0m4hrQ3gdKKdkvlPag/osoIuZBmjKoOokN+pL
 uiQ8ZaWyQiwESlADvTIpB2OARvl9oZ9EUSqy0HHFI0hsXXWB8EXyL8zgo1gnG+u4baam
 q5bx2AB5zfFkefTTsBBrLyTHF7f4ch9YYdPMzzBLwFsPMFadGBAO5kGKUI0C6vvzdc31
 NSjzg8gzLSpKVZjKU+3ukdkV7CR99yz5ffQQw7UE4+8sjfHDvnumlwPEXt1WRUfkP2D+
 4L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+gyoedcg1b3GPs62Bs9hwSPV70xPMrrXrnC4iIqMBk=;
 b=hXxCyqU0O3uKfS9hukBxi6AWuABkOBUllL3bjUpPMzlcIL1ZIXvoogd+sO6YybdxNx
 ct+TMijRmhrxRjnYtlXYV1zV+srU+05qq1sq7Q7toxJYrvq8SA/75VB2Z2D9p/pG9K6F
 yGIk9dKhYFncJ+Vqt5xxSj3McKeRCaY/UCxgg//1J4TqzbfUFdv4GVJEfrvTWNGgCmbJ
 GTh3lKzgIGIQYNQx8/2ZYjXAjoLXXMio8ri8DGxdnoLVUhZYxDk354KTjcJKS1Ck7gBX
 XAPqWQ58wB6ND5kh922aJ42GK0VuWP9cldtflIqi53w6FuTERGRmVj0comPLIZFILtUK
 f9PA==
X-Gm-Message-State: AFqh2krmLyfshqLs3NsxNoOCSo4IAdrxAbIOA0MMjifGkir7eku8Qpz8
 DV7CB6pO/67A7k78EhKx1MTLhQ==
X-Google-Smtp-Source: AMrXdXvk459ipOAIqy378qgjkzaFpvFZXUkEZkjl/g6YqefSW7sfbox2anP4yYta96wvZPQaz1aP8Q==
X-Received: by 2002:a05:651c:1a27:b0:27f:af16:e8aa with SMTP id
 by39-20020a05651c1a2700b0027faf16e8aamr12913450ljb.22.1672863505879; 
 Wed, 04 Jan 2023 12:18:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a05651c220500b0027ff46dfb83sm682229ljq.133.2023.01.04.12.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:18:25 -0800 (PST)
Message-ID: <93022355-773c-ac00-699a-1c00df05e10b@linaro.org>
Date: Wed, 4 Jan 2023 22:18:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/msm: another fix for the headless Adreno GPU
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230103155122.1170930-1-dmitry.baryshkov@linaro.org>
 <6c058038-130c-6de6-3554-053f7d94f732@quicinc.com>
 <CAF6AEGujbM-LYme4LYmGk_xV8-AUoEkPNvk1cTAg9jUoLUOVOg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGujbM-LYme4LYmGk_xV8-AUoEkPNvk1cTAg9jUoLUOVOg@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 20:15, Rob Clark wrote:
> On Wed, Jan 4, 2023 at 10:09 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/3/2023 7:51 AM, Dmitry Baryshkov wrote:
>>> Fix another oops reproducible when rebooting the board with the Adreno
>>> GPU wokring in the headless mode (e.g. iMX platforms).
>> wokring ---> working
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
>>> [00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
>>> Internal error: Oops: 17 [#1] ARM
>>> CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
>>> Hardware name: Freescale i.MX53 (Device Tree Support)
>>> PC is at msm_atomic_commit_tail+0x50/0x970
>>> LR is at commit_tail+0x9c/0x188
>>> pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
>>> sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
>>> r10: 00000058  r9 : c2193014  r8 : c4310000
>>> r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
>>> r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
>>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>> Control: 10c5387d  Table: 74910019  DAC: 00000051
>>> Register r0 information: NULL pointer
>>> Register r1 information: NULL pointer
>>> Register r2 information: NULL pointer
>>> Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
>>> Register r4 information: NULL pointer
>>> Register r5 information: NULL pointer
>>> Register r6 information: non-paged memory
>>> Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
>>> Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
>>> Register r9 information: non-slab/vmalloc memory
>>> Register r10 information: non-paged memory
>>> Register r11 information: non-paged memory
>>> Register r12 information: non-paged memory
>>> Process reboot (pid: 51, stack limit = 0xc80046d9)
>>> Stack: (0xe0851d30 to 0xe0852000)
>>> 1d20:                                     c4759380 fbd77200 000005ff 002b9c70
>>> 1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
>>> 1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
>>> 1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
>>> 1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
>>> 1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
>>> 1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
>>> 1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
>>> 1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
>>> 1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
>>> 1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
>>> 1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>> 1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
>>> 1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
>>> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
>>> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
>>>    msm_atomic_commit_tail from commit_tail+0x9c/0x188
>>>    commit_tail from drm_atomic_helper_commit+0x160/0x188
>>>    drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
>>>    drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
>>>    drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
>>>    drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
>>>    device_shutdown from kernel_restart+0x38/0x90
>>>    kernel_restart from __do_sys_reboot+0x174/0x224
>>>    __do_sys_reboot from ret_fast_syscall+0x0/0x1c
>>> Exception stack(0xe0851fa8 to 0xe0851ff0)
>>> 1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
>>> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
>>> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
>>> Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
>>> ---[ end trace 0000000000000000 ]---
>>>
>>> Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> How is this null pointer hitting?
>>
>> priv->kms is assigned in the msm_drm_init() which happens in the bind.

The headless A200 (e.g. on i.MX53) doesn't have KMS. This has been a 
frequent case causing issues in .shutdown path.

> 
> I think we want to solve this higher up.. hitting atomic commit path
> on a device which has no kms resources (planes, CRTCs, etc) seems
> pretty wrong

Fine with me. Would it be better to skip a call to 
drm_atomic_helper_shutdown() if there is no drm->kms?

> 
> BR,
> -R
> 
>> Only then we register the dri card for the commit which means commit
>> cannot come before that.
>>
>> So, how can this sequence be possible?
-- 
With best wishes
Dmitry

