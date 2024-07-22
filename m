Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A5938B74
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D2110E443;
	Mon, 22 Jul 2024 08:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zbu9VCjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC710E443;
 Mon, 22 Jul 2024 08:43:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4267300145eso33759305e9.3; 
 Mon, 22 Jul 2024 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721637800; x=1722242600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g+PBfNzfyUUsqlo6xuJq2KzuHaAI09zpwcW3cyT8Tfo=;
 b=Zbu9VCjBFV+kuIqjrHGX9U2GC8fxPk8Rhc0qDPxDB5ZGTPb2slZZGeT96lHKr5Fw2N
 KV+rx0a1nff9jOrRReZIQ3O4U2yYCfB5K9bIrxgSFEnCbe3hHImVcyuYVrxEK+QGkomp
 zYwo7rlRkKPqXBUZLyiyGZ4u4vfZkmdg8TQ12xHLqieSNDcrG9eQXbLmQYe+x5AVV1WD
 Bz3/0QtrIxesVLLN9sc3KX0e0MEGb9Qbri7x51EWEAP8iMKh/YzyJzxSlyaF9z5mGTkd
 LJCQJNrcY20azQ2LNmS+PTy3vXtf+ZXa87exHlLNiD44Ff+XrsbNuR0p8HF50X2XkA5n
 fqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637800; x=1722242600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+PBfNzfyUUsqlo6xuJq2KzuHaAI09zpwcW3cyT8Tfo=;
 b=IT1F3AfhCDum7CJnfO9DA1MF27iJ5hEqWl74OggMM8ZkIjmbMQM0DHUVqJD+Wvnb+J
 6L5dBOT9MdkC5QKToFdR+1aL5IwHV/Y7VohX7rb3dx6muf183nvUL8EP6C5ZFpDcvR2G
 Mjpfz+gbMVQk1iqhlHUfTnb01F9f6qPcO3Uif4dTHxnwFkWJJ27lNFMldxUNaYonSivu
 4j5eIwyXB1t4i8nug/KwN0XIwaqg+g0X8r//1IUf+VHntySy4Ok3D2qnSTxwcZsk6H3q
 rzXmG174yx0SzFLtjYIhbuorMKLwrfyfScPax8f16g9UL0btu9MFHvEXU5HR5WjdkmL6
 eCyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5E5KER4RH/QPyqdEB0o+QkzkDy9YbQRnPYfUOYqkXImkpIQiNs5EoQ5HHGOBL8HDOhl5H7qOJ0xft3PGOfuLaXM3s/rhD7gRxjNAfcv+/sgPXI0mWprYLR+SwCskq8uDJ1z+OM2Uq5c9N6Mp1/w==
X-Gm-Message-State: AOJu0YyyHOe1mfPMBx6DvuBSmP4dH+7BGGgufQ0KbEf8XwbiUv/2p8lV
 www0+8ajK8hzIgdTojNd44afCpOh3rZzqmBii+ts3PmUblkv/eDY
X-Google-Smtp-Source: AGHT+IG9TWmyekMunn7arqTs6wK7XiKa21iN8IJ94PIvH6V44kpdRLR4KO7UF6usEPYmOfmXAPPE0Q==
X-Received: by 2002:a05:600c:1d92:b0:426:5e1c:1ac2 with SMTP id
 5b1f17b1804b1-427dcf67fe1mr52890585e9.8.1721637800042; 
 Mon, 22 Jul 2024 01:43:20 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878695165sm7857306f8f.62.2024.07.22.01.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:43:19 -0700 (PDT)
Message-ID: <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
Date: Mon, 22 Jul 2024 10:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - Since commit e356d321d024 in the
 kernel log appears the message "MES failed to respond to msg=MISC
 (WAIT_REG_MEM)" which were never seen before
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, mukul.joshi@amd.com,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
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

That's a known issue and we are already working on it.

Regards,
Christian.

Am 20.07.24 um 19:08 schrieb Mikhail Gavrilov:
> Hi,
> I spotted "MES failed to respond to msg=MISC (WAIT_REG_MEM)" messages
> in my kernel log since 6.10-rc5.
> After this message, usually follow "[drm:amdgpu_mes_reg_write_reg_wait
> [amdgpu]] *ERROR* failed to reg_write_reg_wait".
>
> [ 8972.590502] input: Noble FoKus Mystique (AVRCP) as
> /devices/virtual/input/input21
> [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748494] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748476] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748479] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748661] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9964.748770] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9977.224893] Bluetooth: hci0: ACL packet for unknown connection handle 3837
> [ 9980.347061] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.347077] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> msg=MISC (WAIT_REG_MEM)
> [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349868] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349890] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349869] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> failed to reg_write_reg_wait
> [10037.250083] Bluetooth: hci0: ACL packet for unknown connection handle 3837
> [12054.238867] workqueue: gc_worker [nf_conntrack] hogged CPU for
>> 10000us 1027 times, consider switching to WQ_UNBOUND
> [12851.087896] fossilize_repla (45968) used greatest stack depth:
> 17440 bytes left
>
> Unfortunately, it is not easily reproducible.
> Usually it appears when I play several hours in the game "STAR WARS
> Jedi: Survivor".
> So it is why I bisected it so long.
>
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [f2661062f16b2de5d7b6a5c42a9a5c96326b8454] Linux 6.10-rc5
> git bisect bad f2661062f16b2de5d7b6a5c42a9a5c96326b8454
> # good: [50736169ecc8387247fe6a00932852ce7b057083] Merge tag
> 'for-6.10-rc4-tag' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> git bisect good 50736169ecc8387247fe6a00932852ce7b057083
> # bad: [d4ba3313e84dfcdeb92a13434a2d02aad5e973e1] Merge tag
> 'loongarch-fixes-6.10-2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
> git bisect bad d4ba3313e84dfcdeb92a13434a2d02aad5e973e1
> # good: [264efe488fd82cf3145a3dc625f394c61db99934] Merge tag
> 'ovl-fixes-6.10-rc5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
> git bisect good 264efe488fd82cf3145a3dc625f394c61db99934
> # bad: [35bb670d65fc0f80c62383ab4f2544cec85ac57a] Merge tag
> 'scsi-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> git bisect bad 35bb670d65fc0f80c62383ab4f2544cec85ac57a
> # good: [f0d576f840153392d04b2d52cf3adab8f62e8cb6] drm/amdgpu: fix
> UBSAN warning in kv_dpm.c
> git bisect good f0d576f840153392d04b2d52cf3adab8f62e8cb6
> # bad: [07e06189c5ea7ffe897d12b546c918380d3bffb1] Merge tag
> 'amd-drm-fixes-6.10-2024-06-19' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
> git bisect bad 07e06189c5ea7ffe897d12b546c918380d3bffb1
> # bad: [ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc] drm/amdgpu: init TA
> fw for psp v14
> git bisect bad ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc
> # bad: [e356d321d0240663a09b139fa3658ddbca163e27] drm/amdgpu: cleanup
> MES11 command submission
> git bisect bad e356d321d0240663a09b139fa3658ddbca163e27
> # first bad commit: [e356d321d0240663a09b139fa3658ddbca163e27]
> drm/amdgpu: cleanup MES11 command submission
>
> Author: Christian König <christian.koenig@amd.com>
> Date:   Fri May 31 10:56:00 2024 +0200
>
>      drm/amdgpu: cleanup MES11 command submission
>
>      The approach of having a separate WB slot for each submission doesn't
>      really work well and for example breaks GPU reset.
>
>      Use a status query packet for the fence update instead since those
>      should always succeed we can use the fence of the original packet to
>      signal the state of the operation.
>
>      While at it cleanup the coding style.
>
>      Fixes: eef016ba8986 ("drm/amdgpu/mes11: Use a separate fence per
> transaction")
>      Reviewed-by: Mukul Joshi <mukul.joshi@amd.com>
>      Signed-off-by: Christian König <christian.koenig@amd.com>
>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> And I can confirm after reverting e356d321d024 I played the whole day,
> and the "MES failed to respond" error message does not appear anymore.
>
> My hardware specs are: https://linux-hardware.org/?probe=78d8c680db
>
> Christian, can you look into it, please?
>

