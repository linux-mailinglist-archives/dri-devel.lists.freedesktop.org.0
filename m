Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB96A16F6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 08:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD110E080;
	Fri, 24 Feb 2023 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3B310E080;
 Fri, 24 Feb 2023 07:13:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id da10so52456282edb.3;
 Thu, 23 Feb 2023 23:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wsjqPSfnm3Ygi4Io01Tn1OMFABOCofeh5v8NtS11/2E=;
 b=MS6F7AAs7jHnE7fpitncvB/tOyt/BH+4OtiAQ++pmhoXc2Nrd8nWNcTi7MnStOK66S
 WFLwNPExELXJzfDlVroEcr7AC38mvcygnpohlB1vvoVnYFT1cnPePrurC9kmQvZ6jRbE
 f+WUHihlJCB8j0BMVSFrotHfvFg8wDU/vkosbsDczhGBHywYoie4AvwvNdf+imyjHkZ0
 F+s3LkYobHyl/PMjIa7aveSXSItDHgza2C+CGJ0iBNwd5082/Yjq+Xnjqv3247//PeJb
 Wk9oL+1ioxEVSAF22/WF/Ln1Em1cQfCik/7T8ismTBmGWtaA2N+CTj22bhbt0YZe9+no
 h2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsjqPSfnm3Ygi4Io01Tn1OMFABOCofeh5v8NtS11/2E=;
 b=YGpOAIwtFak5Cc3YtkZU5hAnyXrMCkQ4WZj+EmSkVTcOalA7x97tTytIqPPhBAdQtD
 CqZLXWvtCYeOWREbMQXxSNR6qd6fQJ4OnSAaK7Usf6jxhCFYSmhdQR6jSFEk1/I7DE5j
 Le1JNPi89Pc5ip7MOZRkegwOgKRTr9tWikLyxAun+vdjX7x8Wnetl2Czh6zqfVE6Lc+l
 55n1Yx/0vfa6KGe+0ks5E3Z8WcglDG7VU7NGI7fvj/OZaGv02NmkZzf0aeuvIC/H193+
 FrILpwUIsiNTG3XoU3tHcfDBqXlwsKcLcoKayzXHceoqF2ud8f7XzsqkY4ui+vAUoQDt
 gVfA==
X-Gm-Message-State: AO0yUKUAvGe+kpWrYQE1PP2RyK3/iNN3If/nkHflQa3J+ZCX8RKPVpGw
 4PTD8lcubdBQ/5f2dHqJvL+8LmcXOSOWEQ==
X-Google-Smtp-Source: AK7set9KADS+TjTlENdlakaJIRZvUPjmQJ37PpokD1mzD+mepSGXCw+VINEwWPzHUm07ZarqHDYmbA==
X-Received: by 2002:a17:907:961c:b0:8f1:dfa5:8117 with SMTP id
 gb28-20020a170907961c00b008f1dfa58117mr4046581ejc.51.1677222835683; 
 Thu, 23 Feb 2023 23:13:55 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:35e:38c6:dafc:5dd2?
 ([2a02:908:1256:79a0:35e:38c6:dafc:5dd2])
 by smtp.gmail.com with ESMTPSA id
 dv4-20020a170906b80400b008b904cb2bcdsm8504505ejb.11.2023.02.23.23.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:13:54 -0800 (PST)
Message-ID: <a99e6def-68be-3f2b-4e01-ac26cdb80f49@gmail.com>
Date: Fri, 24 Feb 2023 08:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: amdgpu didn't start with pci=nocrs parameter, get error "Fatal
 error during GPU init"
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
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

Hi Mikhail,

this is pretty clearly a problem with the system and/or it's BIOS and 
not the GPU hw or the driver.

The option pci=nocrs makes the kernel ignore additional resource windows 
the BIOS reports through ACPI. This then most likely leads to problems 
with amdgpu because it can't bring up its PCIe resources any more.

The output of "sudo lspci -vvvv -s $BUSID_OF_AMDGPU" might help 
understand the problem, but I strongly suggest to try a BIOS update first.

Regards,
Christian.

Am 24.02.23 um 00:40 schrieb Mikhail Gavrilov:
> Hi,
> I have a laptop ASUS ROG Strix G15 Advantage Edition G513QY-HQ007. But
> it is impossible to use without AC power because the system losts nvme
> when I disconnect the power adapter.
>
> Messages from kernel log when it happens:
> nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> nvme nvme0: Does your device have a faulty power saving mode enabled?
> nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off"
> and report a bug
>
> I tried to use recommended parameters
> (nvme_core.default_ps_max_latency_us=0 and pcie_aspm=off) to resolve
> this issue, but without successed.
>
> In the linux-nvme mail list the last advice was to try the "pci=nocrs"
> parameter.
>
> But with this parameter the amdgpu driver refuses to work and makes
> the system unbootable. I can solve the problem with the booting system
> by blacklisting the driver but it is not a good solution, because I
> don't wanna lose the GPU.
>
> Why amdgpu not work with "pci=nocrs" ?
> And is it possible to solve this incompatibility?
> It is very important because when I boot the system without amdgpu
> driver with "pci=nocrs" nvme is not losts when I disconnect the power
> adapter. So "pci=nocrs" really helps.
>
> Below that I see in kernel log when adds "pci=nocrs" parameter:
>
> amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from ATRM
> amdgpu: ATOM BIOS: SWBRT77321.001
> [drm] VCN(0) decode is enabled in VM mode
> [drm] VCN(0) encode is enabled in VM mode
> [drm] JPEG decode is enabled in VM mode
> Console: switching to colour dummy device 80x25
> amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature
> disabled as experimental (default)
> [drm] GPU posting now...
> [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment
> size is 9-bit
> amdgpu 0000:03:00.0: amdgpu: VRAM: 12272M 0x0000008000000000 -
> 0x00000082FEFFFFFF (12272M used)
> amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> amdgpu 0000:03:00.0: amdgpu: AGP: 267894784M 0x0000008400000000 -
> 0x0000FFFFFFFFFFFF
> [drm] Detected VRAM RAM=12272M, BAR=16384M
> [drm] RAM width 192bits GDDR6
> [drm] amdgpu: 12272M of VRAM memory ready
> [drm] amdgpu: 31774M of GTT memory ready.
> amdgpu 0000:03:00.0: amdgpu: (-14) failed to allocate kernel bo
> [drm] Debug VRAM access will use slowpath MM access
> amdgpu 0000:03:00.0: amdgpu: Failed to DMA MAP the dummy page
> [drm:amdgpu_device_init [amdgpu]] *ERROR* sw_init of IP block
> <gmc_v10_0> failed -12
> amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_init failed
> amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
> amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
>
> Of course a full system log is also attached.
>

