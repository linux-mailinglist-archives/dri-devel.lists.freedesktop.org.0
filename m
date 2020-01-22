Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72814634F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9367C6FB28;
	Thu, 23 Jan 2020 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4500A6F53A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 14:14:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579702488; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GI7hdrNAJlyxnB92IBUS6zfqib3jokI2WLz6CZfnlE4=;
 b=fq9+VZLyHSwxl5di4pve7BxIzyGS5V6rvMXp2+4k/jOvPh51mv2w0Y218EovA6wcy0XGp1Pr
 XJh8/enFnPb5JRoCWS41c+lzQYR/Juc0/dJ/HUghZd8nxpeLThzFac0aORd96LdB3X56xmfF
 38jU7qHUMD8gY9DqUKAvGNJl6tE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2858d1.7fd4c6525ed8-smtp-out-n01;
 Wed, 22 Jan 2020 14:14:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6E976C447A4; Wed, 22 Jan 2020 14:14:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AD7F1C433CB;
 Wed, 22 Jan 2020 14:14:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 22 Jan 2020 19:44:38 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>, Douglas Anderson <dianders@chromium.org>
Subject: Re: [REPOST PATCH] drm/msm: Set dma maximum segment size for mdss
In-Reply-To: <CAF6AEGtBwcFqe9nfohz8D5mo_V1mfR84bBtEUPmnkO2cjeDrfw@mail.gmail.com>
References: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
 <CAF6AEGtBwcFqe9nfohz8D5mo_V1mfR84bBtEUPmnkO2cjeDrfw@mail.gmail.com>
Message-ID: <74a88f1a4d2ce17e25ecb52b8d1ccbc1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2020-01-22 00:56, Rob Clark wrote:
> On Tue, Jan 21, 2020 at 11:19 AM Douglas Anderson 
> <dianders@chromium.org> wrote:
>> 
>> From: Sean Paul <seanpaul@chromium.org>
>> 
>> Turning on CONFIG_DMA_API_DEBUG_SG results in the following error:
>> 
>> [   12.078665] msm ae00000.mdss: DMA-API: mapping sg segment longer 
>> than device claims to support [len=3526656] [max=65536]
>> [   12.089870] WARNING: CPU: 6 PID: 334 at 
>> /mnt/host/source/src/third_party/kernel/v4.19/kernel/dma/debug.c:1301 
>> debug_dma_map_sg+0x1dc/0x318
>> [   12.102655] Modules linked in: joydev
>> [   12.106442] CPU: 6 PID: 334 Comm: frecon Not tainted 4.19.0 #2
>> [   12.112450] Hardware name: Google Cheza (rev3+) (DT)
>> [   12.117566] pstate: 60400009 (nZCv daif +PAN -UAO)
>> [   12.122506] pc : debug_dma_map_sg+0x1dc/0x318
>> [   12.126995] lr : debug_dma_map_sg+0x1dc/0x318
>> [   12.131487] sp : ffffff800cc3ba80
>> [   12.134913] x29: ffffff800cc3ba80 x28: 0000000000000000
>> [   12.140395] x27: 0000000000000004 x26: 0000000000000004
>> [   12.145868] x25: ffffff8008e55b18 x24: 0000000000000000
>> [   12.151337] x23: 00000000ffffffff x22: ffffff800921c000
>> [   12.156809] x21: ffffffc0fa75b080 x20: ffffffc0f7195090
>> [   12.162280] x19: ffffffc0f1c53280 x18: 0000000000000000
>> [   12.167749] x17: 0000000000000000 x16: 0000000000000000
>> [   12.173218] x15: 0000000000000000 x14: 0720072007200720
>> [   12.178689] x13: 0720072007200720 x12: 0720072007200720
>> [   12.184161] x11: 0720072007200720 x10: 0720072007200720
>> [   12.189641] x9 : ffffffc0f1fc6b60 x8 : 0000000000000000
>> [   12.195110] x7 : ffffff8008132ce0 x6 : 0000000000000000
>> [   12.200585] x5 : 0000000000000000 x4 : ffffff8008134734
>> [   12.206058] x3 : ffffff800cc3b830 x2 : ffffffc0f1fc6240
>> [   12.211532] x1 : 25045a74f48a7400 x0 : 25045a74f48a7400
>> [   12.217006] Call trace:
>> [   12.219535]  debug_dma_map_sg+0x1dc/0x318
>> [   12.223671]  get_pages+0x19c/0x20c
>> [   12.227177]  msm_gem_fault+0x64/0xfc
>> [   12.230874]  __do_fault+0x3c/0x140
>> [   12.234383]  __handle_mm_fault+0x70c/0xdb8
>> [   12.238603]  handle_mm_fault+0xac/0xc4
>> [   12.242473]  do_page_fault+0x1bc/0x3d4
>> [   12.246342]  do_translation_fault+0x54/0x88
>> [   12.250652]  do_mem_abort+0x60/0xf0
>> [   12.254250]  el0_da+0x20/0x24
>> [   12.257317] irq event stamp: 67260
>> [   12.260828] hardirqs last  enabled at (67259): [<ffffff8008132d0c>] 
>> console_unlock+0x214/0x608
>> [   12.269693] hardirqs last disabled at (67260): [<ffffff8008080e0c>] 
>> do_debug_exception+0x5c/0x178
>> [   12.278820] softirqs last  enabled at (67256): [<ffffff8008081664>] 
>> __do_softirq+0x4d4/0x520
>> [   12.287510] softirqs last disabled at (67249): [<ffffff80080be574>] 
>> irq_exit+0xa8/0x100
>> [   12.295742] ---[ end trace e63cfc40c313ffab ]---
>> 
>> The root of the problem is that the default segment size for sgt is
>> (UINT_MAX & PAGE_MASK), and the default segment size for device dma is
>> 64K. As such, if you compare the 2, you would deduce that the sg 
>> segment
>> will overflow the device's capacity. In reality, the hardware can
>> accommodate the larger sg segments, it's just not initializing its max
>> segment properly. This patch initializes the max segment size for the
>> mdss device, which gets rid of that pesky warning.
>> 
>> Reported-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> Tested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> This patch has been floating in the ether for over a year [1].  I know
>> next to nothing about it, but I'm told it's still useful so I'm
>> helpfully reposting it.  Please enjoy.
> 
> This looks like the right thing to do.. sorry I overlooked the patch
> first time around
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> (since I've already sent PR for msm-next, could we pick this up via 
> drm-misc?)
> 

This also fixes a similar warning seen on SC7180 during video playback.

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Logs for reference,

localhost ~ # [  647.100504] ------------[ cut here ]------------
[  647.105748] DMA-API: msm ae00000.mdss: mapping sg segment longer than 
device claims to support [len=524288] [max=65536]

<...snip...>

[  647.184254] pstate: 60400009 (nZCv daif +PAN -UAO)
[  647.189211] pc : debug_dma_map_sg+0x1a8/0x2c4
[  647.193708] lr : debug_dma_map_sg+0x1a8/0x2c4
[  647.198202] sp : ffffffc010f6ba80
[  647.201626] x29: ffffffc010f6ba90 x28: 0000000000010000
[  647.207110] x27: 00000000ffffffff x26: ffffff8174840b80
[  647.212592] x25: ffffffe9f4fe5000 x24: 0000000000000003
[  647.218075] x23: ffffff815c223780 x22: ffffff81742d0810
[  647.223557] x21: 0000000000000003 x20: 0000000000000001
[  647.229041] x19: 0000000000000001 x18: 0000000000000000
[  647.234524] x17: 000000000000003c x16: ffffffe9f4444a14
[  647.240006] x15: 0000000000000006 x14: 0720072007200720
[  647.245489] x13: 0720072007200720 x12: 0000000000000000
[  647.250969] x11: 0000000000000000 x10: 0000000000000000
[  647.256452] x9 : 4be0233cf8ef6200 x8 : 4be0233cf8ef6200
[  647.261935] x7 : 0720072007200720 x6 : ffffff8175ea0f00
[  647.267417] x5 : 0000000000000000 x4 : 0000000000000000
[  647.272898] x3 : 0000000000000000 x2 : ffffff81771d1680
[  647.278380] x1 : ffffff81771c10c0 x0 : 000000000000006b
[  647.283863] Call trace:
[  647.286409]  debug_dma_map_sg+0x1a8/0x2c4
[  647.290569]  vb2_dma_sg_dmabuf_ops_map+0x138/0x18c [videobuf2_dma_sg]
[  647.297215]  dma_buf_map_attachment+0x6c/0xb0
[  647.301724]  drm_gem_prime_import_dev+0xa4/0x134
[  647.306495]  drm_gem_prime_fd_to_handle+0xc4/0x194
[  647.311444]  drm_prime_fd_to_handle_ioctl+0x40/0x58
[  647.316483]  drm_ioctl_kernel+0x94/0x10c
[  647.320538]  drm_ioctl+0x264/0x3f8
[  647.324059]  drm_compat_ioctl+0xcc/0xdc
[  647.328033]  __se_compat_sys_ioctl+0x100/0x2074
[  647.332715]  __arm64_compat_sys_ioctl+0x20/0x2c
[  647.337406]  el0_svc_common+0xa4/0x154
[  647.341279]  el0_svc_compat_handler+0x2c/0x38
[  647.345781]  el0_svc_compat+0x8/0x10
[  647.349474] ---[ end trace 2f188eb70b295b6c ]---
[  648.282197] ------------[ cut here ]------------


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
