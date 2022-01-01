Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F74827C6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 15:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368E89C17;
	Sat,  1 Jan 2022 14:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B789C17
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 14:40:06 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1n3fYB-0005Wh-3r; Sat, 01 Jan 2022 15:40:03 +0100
Message-ID: <a4c11429-4e08-dac2-61ce-3a6b468c1172@leemhuis.info>
Date: Sat, 1 Jan 2022 15:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Regression report on laptop suspend
Content-Language: en-BS
To: Christian Casteyde <casteyde.christian@free.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <2141133765.114843316.1640622535018.JavaMail.root@zimbra40-e7.priv.proxad.net>
 <256689953.114854578.1640622738334.JavaMail.root@zimbra40-e7.priv.proxad.net>
 <CAJZ5v0hC1_8z=VmBOgSU360KPj6N7YfDQBevsvyMNkdffyta6Q@mail.gmail.com>
 <52933493.dBzk7ret6Y@geek500>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <52933493.dBzk7ret6Y@geek500>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1641048006;
 e8f600a9; 
X-HE-SMSGID: 1n3fYB-0005Wh-3r
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linux PM <linux-pm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker speaking.

On 30.12.21 16:55, Christian Casteyde wrote:
> Le lundi 27 décembre 2021 17:40:28 Rafael J. Wysocki a écrit :
>> CC Daniel, Thomas and dri-devel.
>>
>> On Mon, Dec 27, 2021 at 5:32 PM <casteyde.christian@free.fr> wrote:
>>> Hello
>>>
>>> I've noticed my laptop totally freeze when going to hibernation.
>>> The git bisect log is appended below.
>>> Please note however that even the previous good commit was "good" (ie :
>>> laptop managed to suspend and resume), the system was unstable and froze
>>> few minutes later.
>> So the breakage need not be related to the first bad commit.
>>
>> Have you tried to revert that commit?  If so, has it helped?
> Reverting the last bad commit on 5.16-rc7, the problem is still there.
> I'm still convinced from bisection that it is related to graphic.

TWIMC: Christian afaics is plagued by an older issue wrt suspend: "
Touchpad is not working anymore after suspend to RAM since kernel 5.14 -
AMD Ryzen 5 4600H". For details see:
https://bugzilla.kernel.org/show_bug.cgi?id=214667
https://lore.kernel.org/regressions/12b9a10a-626b-cafd-05d6-cf0a116aa39b@leemhuis.info/

I wonder if that might interfere somehow and if there is a easy way to
rule that out (I wonder if unloading the hid modules involved is a good
idea or stupid advice -- I fear it's the latter).

Ciao, Thorsten

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply, that's in everyone's interest.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.



>>> Hardware specs: AMD Ryzen 5 4600H with Vega graphics + Nvidia 1650Ti
>>> (unused) Software: Slackware 14.2 / X.org.
>>>
>>> Seems to be related to drm stuff.
>>> I've issued bugzilla https://bugzilla.kernel.org/show_bug.cgi?id=215427
>>>
>>> Thanks
>>>
>>> git bisect start
>>> # good: [8bb7eca972ad531c9b149c0a51ab43a417385813] Linux 5.15
>>> git bisect good 8bb7eca972ad531c9b149c0a51ab43a417385813
>>> # bad: [a7904a538933c525096ca2ccde1e60d0ee62c08e] Linux 5.16-rc6
>>> git bisect bad a7904a538933c525096ca2ccde1e60d0ee62c08e
>>> # bad: [43e1b12927276cde8052122a24ff796649f09d60] Merge tag 'for_linus' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost git bisect bad
>>> 43e1b12927276cde8052122a24ff796649f09d60
>>> # good: [fc02cb2b37fe2cbf1d3334b9f0f0eab9431766c4] Merge tag
>>> 'net-next-for-5.16' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next git bisect
>>> good fc02cb2b37fe2cbf1d3334b9f0f0eab9431766c4
>>> # bad: [d9bd054177fbd2c4762546aec40fc3071bfe4cc0] Merge tag
>>> 'amd-drm-next-5.16-2021-10-29' of
>>> https://gitlab.freedesktop.org/agd5f/linux into drm-next git bisect bad
>>> d9bd054177fbd2c4762546aec40fc3071bfe4cc0
>>> # skip: [797d72ce8e0f8fa8a808cb189b5411046432cfd3] Merge tag
>>> 'drm-misc-next-2021-10-06' of git://anongit.freedesktop.org/drm/drm-misc
>>> into drm-next git bisect skip 797d72ce8e0f8fa8a808cb189b5411046432cfd3
>>> # skip: [bf72ca73aaa6629568cb9b0761be6efdd02a2591] drm/amd/display: [FW
>>> Promotion] Release 0.0.85 git bisect skip
>>> bf72ca73aaa6629568cb9b0761be6efdd02a2591
>>> # good: [bc41f059a080e487c235b539f1e5cdbf605aba9f] drm/i915/dp: fix DG1
>>> and RKL max source rates git bisect good
>>> bc41f059a080e487c235b539f1e5cdbf605aba9f
>>> # skip: [58144d283712c9e80e528e001af6ac5aeee71af2] drm/amdgpu: unify BO
>>> evicting method in amdgpu_ttm git bisect skip
>>> 58144d283712c9e80e528e001af6ac5aeee71af2
>>> # skip: [a5b51a9f8523a0b88ce7e8e8059f75a43c34c57f] drm/i915/gt: add
>>> asm/cacheflush.h for use of clflush() git bisect skip
>>> a5b51a9f8523a0b88ce7e8e8059f75a43c34c57f
>>> # skip: [40348baedfbc6500e7a090c7da1d55b6c94c334f] drm/amd/display: fix
>>> duplicated inclusion git bisect skip
>>> 40348baedfbc6500e7a090c7da1d55b6c94c334f
>>> # skip: [7547675b84bf452542463db29adb113cadb7dd6d] drm/virtio: implement
>>> context init: track {ring_idx, emit_fence_info} in virtio_gpu_fence git
>>> bisect skip 7547675b84bf452542463db29adb113cadb7dd6d
>>> # good: [f01ee019586220c86f238263a4fbde6e72085e11] drm/amd/display: Add DP
>>> 2.0 SST DC Support git bisect good
>>> f01ee019586220c86f238263a4fbde6e72085e11
>>> # good: [f3ede209d44d71636890a78fa89c5b1c83340320] drm/i915/pci: rename
>>> functions to have i915_pci prefix git bisect good
>>> f3ede209d44d71636890a78fa89c5b1c83340320
>>> # skip: [4fb530e5caf7cb666948db65f245b350ce520436] drm/virtio: implement
>>> context init: support init ioctl git bisect skip
>>> 4fb530e5caf7cb666948db65f245b350ce520436
>>> # good: [c7c4dfb6fe704ae3cce1a8f438db75b1a0a9061f] drm/i915/display: Some
>>> code improvements and code style fixes for DRRS git bisect good
>>> c7c4dfb6fe704ae3cce1a8f438db75b1a0a9061f
>>> # skip: [7a28bee067d524c1b8770aa72a82263eb9fc53f0] drm/amd/display:
>>> Disable dpp root clock when not being used git bisect skip
>>> 7a28bee067d524c1b8770aa72a82263eb9fc53f0
>>> # good: [5b116c17e6babc6de2e26714bc66228c74038b71] drm/i915/guc: Drop pin
>>> count check trick between sched_disable and re-pin git bisect good
>>> 5b116c17e6babc6de2e26714bc66228c74038b71
>>> # skip: [9878844094703fbae1c3b301c9bb71253a30efe7] drm/amdgpu: drive all
>>> vega asics from the IP discovery table git bisect skip
>>> 9878844094703fbae1c3b301c9bb71253a30efe7
>>> # skip: [7194dc998dfffca096c30b3cd39625158608992d] drm/i915/tc: Fix TypeC
>>> port init/resume time sanitization git bisect skip
>>> 7194dc998dfffca096c30b3cd39625158608992d
>>> # skip: [5c3720be7d46581181782f5cf9585b532feed947] drm/amdgpu: get VCN and
>>> SDMA instances from IP discovery table git bisect skip
>>> 5c3720be7d46581181782f5cf9585b532feed947
>>> # skip: [a53f2c035e9832d20775d2c66c71495f2dc27699] drm/panfrost: Calculate
>>> lock region size correctly git bisect skip
>>> a53f2c035e9832d20775d2c66c71495f2dc27699
>>> # skip: [d04287d062a4198ec0bf0112db03618f65d7428a] drm/amdgpu: During s0ix
>>> don't wait to signal GFXOFF git bisect skip
>>> d04287d062a4198ec0bf0112db03618f65d7428a
>>> # skip: [9ced12182d0d8401d821e9602e56e276459900fc] drm/i915: Catch yet
>>> another unconditioal clflush git bisect skip
>>> 9ced12182d0d8401d821e9602e56e276459900fc
>>> # skip: [dac3c405b9aedee301d0634b4e275b81f0d74363] drm/amd/display: [FW
>>> Promotion] Release 0.0.87 git bisect skip
>>> dac3c405b9aedee301d0634b4e275b81f0d74363
>>> # skip: [9f620f1dde3e3e984837163d7930dc4b2abffe82] drm/i915: Call
>>> intel_ddi_init_dp_buf_reg() earlier git bisect skip
>>> 9f620f1dde3e3e984837163d7930dc4b2abffe82
>>> # skip: [178fbb6d552f294037291bf62d41b31d30186f31] drm/amd/display:
>>> Implement DPIA training loop git bisect skip
>>> 178fbb6d552f294037291bf62d41b31d30186f31
>>> # good: [253a55918ce128f15a3be66db5e2072665143554] drm/amd/display: Fix
>>> issue with dynamic bpp change for DCN3x git bisect good
>>> 253a55918ce128f15a3be66db5e2072665143554
>>> # skip: [50638f7dbd0b3969b47d2772c4db02ed92b6c47b]
>>> drm/amdgpu/pm/amdgpu_smu: convert more IP version checking git bisect
>>> skip 50638f7dbd0b3969b47d2772c4db02ed92b6c47b
>>> # bad: [3605eacc8ae055d699f7fa3adb9123c4c36ecd82] drm/panfrost: Make use
>>> of the helper function devm_platform_ioremap_resource() git bisect bad
>>> 3605eacc8ae055d699f7fa3adb9123c4c36ecd82
>>> # bad: [47ddb72f789333a8ccb792b0fd6d6fe8a7906694] drm: zte: remove
>>> obsolete DRM Support for ZTE SoCs git bisect bad
>>> 47ddb72f789333a8ccb792b0fd6d6fe8a7906694
>>> # bad: [072e70d52372c44df90b44fb4cd949a709bb5bef] drm:
>>> panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro git bisect bad
>>> 072e70d52372c44df90b44fb4cd949a709bb5bef
>>> # bad: [82ade934dde45b9d9008954b297f7727233e37af] drm/arm: malidp: Use
>>> fourcc_mod_is_vendor() helper git bisect bad
>>> 82ade934dde45b9d9008954b297f7727233e37af
>>> # bad: [8b4e02c70fca482c5b947d8ba92b45093b4390e7] drm/panel: Add DT
>>> bindings for Samsung S6D27A1 display panel git bisect bad
>>> 8b4e02c70fca482c5b947d8ba92b45093b4390e7
>>> # bad: [804b6e5ee613b019b942ba6be52cccecd9d33655] drm/shmem-helpers:
>>> Allocate wc pages on x86 git bisect bad
>>> 804b6e5ee613b019b942ba6be52cccecd9d33655
>>> # good: [8b93d1d7dbd578fd296e70008b29c0f62d09d7cb] drm/shmem-helper:
>>> Switch to vmf_insert_pfn git bisect good
>>> 8b93d1d7dbd578fd296e70008b29c0f62d09d7cb
>>> # first bad commit: [804b6e5ee613b019b942ba6be52cccecd9d33655]
>>> drm/shmem-helpers: Allocate wc pages on x86

