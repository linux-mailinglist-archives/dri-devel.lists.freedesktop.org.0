Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22B66591C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81AD10E6FD;
	Wed, 11 Jan 2023 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197B610E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:34:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso9304739wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=s3KqGObhsHrRbnSdUxruE0y4nmn0w6bjS57+0xuPZcw=;
 b=nGcDPPgC2WNOGZZX/rmF0U0iF7x/ue7sd1UMOIHUj1uob1tYj7ae2czwU/aivZKVgX
 IPIeb1sYJVOH+GBZc53rnGhZ98KHkGnJCjQZLswPLSyZR1q66lGzwNETb3tII+ZGZFQ4
 /V4ZPz+uwruLwi2sll7x7vFuPNuIec0MYiGCriDXfiQHgUdOJWVSUzHxvGYQ4DLv63pC
 1Vwlbgp0Z3v52gJLbVaP5fbwtGMjOjt62iOUEj323zu6uX45OGXisPUgNxsJSQdJTzEk
 hqUzwMxsuVh0xJz+aseAYFCe6L2pdUefKpb+oAwgL4D3VgaPro/O25YRfIKWirwtz/o9
 ltLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s3KqGObhsHrRbnSdUxruE0y4nmn0w6bjS57+0xuPZcw=;
 b=Dd0xMbxCXQDsGTa1YqP6daczniG5uBftIi+J7UWCMz5C+KWI5MwC6CuntBd4L7kur2
 q5PmQhMXcIg2AKpq7SjQhvIEkijKHS7ssUHM7TjgYSaxNtyuz1IQnJfAnPtcea5JJL6b
 3fxJSmE8Kjvzv/yE5wJ+OhyLUX0MdL3iGThT/tIkm/Icge36F5IOhxzqzVAlyLPACHNu
 xcEGohegkf/bbCSil8ezIZERBjjnm4sXEK/W5XSjXZXRHy0UEQG6+A79P0zM4StZH/PQ
 uULCkDKqaEYsOJRYUqUOHfI6OSr5dTKwarmwUiG5Q/pd0TMvRi8OfY0mDvd/5yyMf39L
 cyjw==
X-Gm-Message-State: AFqh2kqqX95xREBeF5RBGIGfFk8tqaE0b10rUxofmRaoMSsIvymfDSCp
 P5VnjupXafp2UsdMBEeNye8EWg==
X-Google-Smtp-Source: AMrXdXsiVT2Ik4PaTpMH4v3+Fd28GSMuNrgLUSmkBeKKRGAbgp7CrBXwz6c9B180jCrYSRemQSQTXw==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr55084313wmq.33.1673433282477; 
 Wed, 11 Jan 2023 02:34:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5?
 ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm25394292wms.15.2023.01.11.02.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:34:42 -0800 (PST)
Message-ID: <19423616-79d4-9478-c6df-4f226f87a27f@linaro.org>
Date: Wed, 11 Jan 2023 11:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: next-20230110: arm64: defconfig+kselftest config boot failed -
 Unable to handle kernel paging request at virtual address fffffffffffffff8
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, linux-next <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev
References: <CA+G9fYsns3krivbPSjQ1c1EQpVyd-bkW84MaUvqMTQr9c=iEaw@mail.gmail.com>
 <77342621-d67f-4d47-a33b-6f721576bf9d@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <77342621-d67f-4d47-a33b-6f721576bf9d@app.fastmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Mark Rutland <mark.rutland@arm.com>, Aishwarya TCV <aishwarya.tcv@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/01/2023 17:41, Arnd Bergmann wrote:
> On Tue, Jan 10, 2023, at 17:14, Naresh Kamboju wrote:
>> [ please ignore this email if this regression already reported ]
>>
>> Today's Linux next tag next-20230110 boot passes with defconfig but
>> boot fails with
>> defconfig + kselftest merge config on arm64 devices and qemu-arm64.
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> We are bisecting this problem and get back to you shortly.
>>
>> GOOD: next-20230109  (defconfig + kselftests configs)
>> BAD: next-20230110 (defconfig + kselftests configs)
>>
>> kernel crash log [1]:
>>
>> [   15.302140] Unable to handle kernel paging request at virtual
>> address fffffffffffffff8
>> [   15.309906] Mem abort info:
>> [   15.312659]   ESR = 0x0000000096000004
>> [   15.316365]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   15.321626]   SET = 0, FnV = 0
>> [   15.324644]   EA = 0, S1PTW = 0
>> [   15.327744]   FSC = 0x04: level 0 translation fault
>> [   15.332619] Data abort info:
>> [   15.335422]   ISV = 0, ISS = 0x00000004
>> [   15.339226]   CM = 0, WnR = 0
>> [   15.342154] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000001496c000
>> [   15.348795] [fffffffffffffff8] pgd=0000000000000000, p4d=0000000000000000
>> [   15.355524] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> [   15.361729] Modules linked in: meson_gxl dwmac_generic
>> snd_soc_meson_gx_sound_card snd_soc_meson_card_utils lima gpu_sched
>> drm_shmem_helper meson_drm drm_dma_helper crct10dif_ce meson_ir
>> rc_core meson_dw_hdmi dw_hdmi meson_canvas dwmac_meson8b
>> stmmac_platform meson_rng stmmac rng_core cec meson_gxbb_wdt
>> drm_display_helper snd_soc_meson_aiu snd_soc_meson_codec_glue pcs_xpcs
>> snd_soc_meson_t9015 amlogic_gxl_crypto crypto_engine display_connector
>> snd_soc_simple_amplifier drm_kms_helper drm nvmem_meson_efuse
>> [   15.405976] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted
>> 6.2.0-rc3-next-20230110 #1
>> [   15.413563] Hardware name: Libre Computer AML-S905X-CC (DT)
>> [   15.419086] Workqueue: events_unbound deferred_probe_work_func
>> [   15.424863] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   15.431762] pc : of_drm_find_bridge+0x38/0x70 [drm]
>> [   15.436594] lr : of_drm_find_bridge+0x20/0x70 [drm]
> 
> The line is
> 
> drivers/gpu/drm/drm_bridge.c:1310:      if (bridge->of_node == np) {
> 
> The list_head here is a NULL pointer, so ->of_node points
> to address negative 8, i.e. fffffffffffffff8
> 
> This is linked list corruption, which typically happens as
> part of a use-after-free, and could be the result of a
> failed registration causing an object to be freed after
> it is added to the list.
> 
> Unfortunately, there are no patches to this file between
> next-20230109 and next-20230110, so the bug probably is
> not actually in this file.
> 
>> [   15.515426] Call trace:
>> [   15.517863] Insufficient stack space to handle exception!
>> [   15.517867] ESR: 0x0000000096000047 -- DABT (current EL)
>> [   15.517871] FAR: 0xffff80000a047ff0
>> [   15.517873] Task stack:     [0xffff80000a048000..0xffff80000a04c000]
>> [   15.517877] IRQ stack:      [0xffff800008008000..0xffff80000800c000]
>> [   15.517880] Overflow stack: [0xffff00007d9c1320..0xffff00007d9c2320]
>> [   15.517884] CPU: 1 PID: 9 Comm: kworker/u8:0 Not tainted
>> 6.2.0-rc3-next-20230110 #1
>> [   15.517890] Hardware name: Libre Computer AML-S905X-CC (DT)
>> [   15.517895] Workqueue: events_unbound deferred_probe_work_func
>> [   15.517915] pstate: 800003c5 (Nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   15.517923] pc : el1_abort+0x4/0x5c
>> [   15.517932] lr : el1h_64_sync_handler+0x60/0xac
>> [   15.517939] sp : ffff80000a048020
> 
> Not sure about the missing stack trace: I can see that the stack
> pointer is on a task stack, which is reported as having overflown,
> but I don't see why it's unable to print the stack while running
> from the overflow stack.
> 
> A stack overflow is often caused by unbounded recursion, which
> can happen when a device driver binds itself to a device that it
> has just created. The log does look a bit suspicious here,
> with multiple registrations for c883a000.hdmi-tx:
> 
>    986 08:02:56.487871  [   15.141218] meson-drm d0100000.vpu: Queued 2 outputs on vpu
>    987 08:02:56.493572  [   15.141615] meson8b-dwmac c9410000.ethernet: Ring mode enabled
>    988 08:02:56.504769  [   15.150744] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
>    989 08:02:56.515743  [   15.154970] meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
>    990 08:02:56.521531  [   15.159175] lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0
>    991 08:02:56.526718  [   15.161436] meson-drm d0100000.vpu: Failed to find HDMI transceiver bridge
>    992 08:02:56.532417  [   15.168933] lima d00c0000.gpu: pp1 - mali450 version major 0 minor 0
>    993 08:02:56.537747  [   15.206102] meson-drm d0100000.vpu: Queued 2 outputs on vpu
>    994 08:02:56.543435  [   15.209608] lima d00c0000.gpu: pp2 - mali450 version major 0 minor 0
>    995 08:02:56.554307  [   15.217027] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
>    996 08:02:56.559929  [   15.221169] lima d00c0000.gpu: l2 cache 8K, 4-way, 64byte cache line, 128bit external bus
>    997 08:02:56.565229  [   15.231561] meson-drm d0100000.vpu: Failed to find HDMI transceiver bridge
>    998 08:02:56.576490  [   15.238133] lima d00c0000.gpu: l2 cache 64K, 4-way, 64byte cache line, 128bit external bus
>    999 08:02:56.581759  [   15.253879] lima d00c0000.gpu: bus rate = 166666667
>   1000 08:02:56.587248  [   15.257128] lima d00c0000.gpu: mod rate = 24000000
>   1001 08:02:56.593344  [   15.261862] lima d00c0000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
>   1002 08:02:56.612809  [   15.286143] [drm] Initialized lima 1.1.0 20191231 for d00c0000.gpu on minor 1
>   1003 08:02:56.618428  [   15.292259] meson-drm d0100000.vpu: Queued 2 outputs on vpu
>   1004 08:02:56.623866  [   15.293715] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
>   1005 08:02:56.634771  [   15.302140] Unable to handle kernel paging request at virtual address fffffffffffffff8
> 
> Again, I don't see any recent changes in that driver or the
> corresponding dts file.

I merged a fix that could be related: https://lore.kernel.org/all/20230109220033.31202-1-m.szyprowski@samsung.com/

This could make the driver to return from probe while not totally probed, and explain such error.

Neil

> 
>        Arnd

