Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F8B0BC19
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 07:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB6410E38A;
	Mon, 21 Jul 2025 05:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R6sgbtT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500C410E252;
 Mon, 21 Jul 2025 05:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753076842;
 bh=Y6O1LeXawfH6jqCiha75wKFY04tLvXmKtw8IkQsRZzE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R6sgbtT1j4PydMnb9LKCtJbvY/h+dBwoJCRjJfAknzIQNRrlcOiG3Rk7yOIjryhEo
 oT7IdyLx4C46fpqYi16JO1SXk+maA3prPGcpfO41dZKiPy/jt/7nmEClDczTMthbjO
 f5rn1uQfLT9p/KaXVj+L7P7QFkUwyCRq8fB7KJnD12SvtbzJDgF6K2DqpC6eNNMXSc
 R4tdiCX2+c7lD3XeADrFBiihDgbCH+kYyNMl57OF7K1/z6GCmvW19PSFZ3/ayya0Kj
 Sl9U4R7JPUywoq3uTD9VyR8AzQ3zrX9cT/8qIK4KOr7oEry2iagdrQ+7cmqWFkzuq2
 qyC1Q3wjkaoUw==
Received: from [192.168.50.250] (unknown [171.76.80.183])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B508E17E0F66;
 Mon, 21 Jul 2025 07:47:19 +0200 (CEST)
Message-ID: <bcff3bed-0695-45fa-8f62-453878b6075f@collabora.com>
Date: Mon, 21 Jul 2025 11:17:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] drm/ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-6-vignesh.raman@collabora.com>
 <7c6suvc6quwwxni2nsos65btzim2lbv7f2u6mz5qbupzpmpzgb@g46wg63ubr6l>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <7c6suvc6quwwxni2nsos65btzim2lbv7f2u6mz5qbupzpmpzgb@g46wg63ubr6l>
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

Hi,

On 18/07/25 18:24, Dmitry Baryshkov wrote:
> On Fri, Jul 18, 2025 at 04:23:57PM +0530, Vignesh Raman wrote:
>> Uprev IGT to the latest version and update expectation files.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   2 +
>>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
>>   drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  11 +-
>>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   2 +
>>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +----
>>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
>>   drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   8 +-
>>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  83 ++++++++++++
>>   drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  10 +-
>>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   3 +
>>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
>>   drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
>>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   7 +-
>>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   5 +-
>>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++++
>>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
>>   .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
>>   ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
>>   .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
>>   .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |  73 +++++++++++
>>   .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
>>   .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
>>   .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
>>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  12 +-
>>   .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
>>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   9 +-
>>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
>>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   4 +
>>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   3 +
>>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
>>   31 files changed, 416 insertions(+), 63 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> index e4a8f8352cd6..9bf38c077f8e 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> @@ -15,3 +15,4 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>>   kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>> +core_setmaster@master-drop-set-user,Fail
> 
> Could you please point out the issue / failure log?

Please see the pipeline logs,
https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79793740
https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79793742

Let me know if you want me to raise an issue.

Regards,
Vignesh

> 
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> index e4a8f8352cd6..7441b363efae 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> @@ -1,3 +1,4 @@
>> +core_setmaster@master-drop-set-user,Fail
>>   kms_color@ctm-0-25,Fail
>>   kms_color@ctm-0-50,Fail
>>   kms_color@ctm-0-75,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> index 8d26b23133aa..f387c73193c6 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
>> @@ -1,3 +1,4 @@
>> +core_setmaster@master-drop-set-user,Fail
>>   kms_3d,Fail
>>   kms_cursor_legacy@forked-bo,Fail
>>   kms_cursor_legacy@forked-move,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
>> index 9450f2a002fd..84ffbe0981ea 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
>> @@ -210,3 +210,76 @@ msm/msm_mapping@ring
>>   # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
>>   # [  229.758095] Memory Limit: none
>>   # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
>> +
>> +msm/msm_recovery@gpu-fault
> 
> Hmm. I thought this should have been fixed...
> 
>> +# DEBUG - Begin test msm/msm_recovery@gpu-fault
>> +# [  153.288652] [IGT] msm_recovery: executing
>> +# [  153.295317] [IGT] msm_recovery: starting subtest gpu-fault
>> +# [  153.317588] adreno 3d00000.gpu: CP | opcode error | possible opcode=0xDEADDEAD
>> +# [  153.367412] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
>> +# [  153.383449] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
>> +# [  153.393296] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
>> +# [  153.436085] revision: 660 (6.6.0.1)
>> +# [  153.439702] rb 0: fence:    2063/2068
>> +# [  153.443659] rptr:     360
>> +# [  153.446389] rb wptr:  533
>> +# [  153.449103] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
>> +# [  153.455746] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
>> +# [  153.462387] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 2062
>> +# [  153.469293] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
>> +# [  153.475680] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
>> +# [  153.475919] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
>> +# [  153.475925] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
>> +# [  153.475928] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
>> +# [  153.475930] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 1
>> +# [  153.529587] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>> +# [  153.539837] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
>> +# [  153.549597] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
>> +# [  153.566489] revision: 660 (6.6.0.1)
>> +# [  153.570099] rb 0: fence:    2064/2068
>> +# [  153.573878] rptr:     0
>> +# [  153.576411] rb wptr:  688
>> +# [  153.579134] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
>> +# [  153.585775] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
>> +# [  153.592410] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 0
>> +# [  153.597308] [IGT] msm_recovery: finished subtest gpu-fault, FAIL
>> +# [  153.599039] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
>> +# [  153.611856] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
>> +# [  153.618498] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
>> +# [  153.625132] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
>> +# [  153.631766] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 0
>> +# [  153.639162] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
>> +# [  153.648502] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>> +# [  153.650144] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000020 dir=READ type=TRANSLATION source=CP (0,0,0,0)
>> +# [  153.650241] adreno 3d00000.gpu: CP illegal instruction error
>> +# [  153.671006] platform 3d6a000.gmu: [drm:a6xx_rpmh_start] *ERROR* Unable to power on the GPU RSC
>> +# [  153.687278] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>> +# [  363.495437] INFO: task msm_recovery:876 blocked for more than 120 seconds.
>> +# [  363.503070]       Not tainted 6.16.0-rc2-g0594d0b01a7c #1
>> +# [  363.508838] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> +# [  363.517142] task:msm_recovery    state:D stack:0     pid:876   tgid:876   ppid:274    task_flags:0x400100 flags:0x00000009
>> +# [  363.528876] Call trace:
>> +# [  363.531554]  __switch_to+0xf8/0x1a8 (T)
>> +# [  363.535703]  __schedule+0x418/0xee0
>> +# [  363.539486]  schedule+0x4c/0x164
>> +# [  363.542986]  schedule_timeout+0x11c/0x128
>> +# [  363.547281]  dma_fence_default_wait+0x13c/0x234
>> +# [  363.552123]  dma_fence_wait_timeout+0x160/0x45c
>> +# [  363.556947]  dma_resv_wait_timeout+0x70/0x11c
>> +# [  363.561582]  msm_gem_close+0xac/0xe4
>> +# [  363.565405]  drm_gem_handle_delete+0x74/0xe8
>> +# [  363.569951]  drm_gem_close_ioctl+0x38/0x44
>> +# [  363.574297]  drm_ioctl_kernel+0xc4/0x134
>> +# [  363.578442]  drm_ioctl+0x224/0x4f0
>> +# [  363.582050]  __arm64_sys_ioctl+0xac/0x104
>> +# [  363.586292]  invoke_syscall+0x48/0x110
>> +# [  363.590254]  el0_svc_common.constprop.0+0x40/0xe0
>> +# [  363.595197]  do_el0_svc+0x1c/0x28
>> +# [  363.598705]  el0_svc+0x4c/0x158
>> +# [  363.602035]  el0t_64_sync_handler+0x10c/0x138
>> +# [  363.606601]  el0t_64_sync+0x198/0x19c
>> +# [  363.610465] Showing all locks held in the system:
>> +# [  363.620406]  #0: ffff0000840200a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x18/0x24
>> +# [  363.629412]  #1: ffff800080d7c2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x15c/0x57c
>> +# [  363.643169]  #0: ffffbd9c0475d920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x18/0x1c0
>> +# [  363.654158] =============================================
> 

