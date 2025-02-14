Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B3A360DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2E10E339;
	Fri, 14 Feb 2025 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="LkW2gBTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0410E339
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:01:24 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id EFC488D;
 Fri, 14 Feb 2025 16:01:22 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id hSgcNNp2-I9J; Fri, 14 Feb 2025 16:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 518698C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1739545277; bh=w4sDD8MxAOHDlUbUlrcSuxmSW1QqEtk5k/7HZjGgV+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LkW2gBTTOJCEA5ZkblG4FJM789Tw0dMg5avlypDBDbE0jdDgq0k2rxu5+my7Uf8Lc
 Zpd85+vni84zwrUUI4UuuDSXKA8cWYEQ+JrJvjeufC0lmEPTdWjTbMSzhNQpXreoRQ
 0bF8KVfZyimgqJGDUBtAa4qTxMwhBnLwL412tYefGbiKMtXftZeazQMpKHA8WgtP17
 OQCvTUbK0D0opH9dkIlYpCYWYVinn7DPr1ZJriXWxqmIQ2sMcPOPSfciKxvchYEEka
 jPnyYLCMVBUxHdQSLGMgz7lPDrlX9hWVEh4GGw3PArK5yU8DeuGxfajZtfQ0D4nBom
 hqZaRLZRcsZ5w==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 518698C;
 Fri, 14 Feb 2025 16:01:17 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 16:01:17 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <7c378bfb-96e4-435d-8e6c-581d6851835f@suse.de>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr>
 <cd7a9908-d4ba-45ca-a5cb-de8ac7ef72d0@redhat.com>
 <7c378bfb-96e4-435d-8e6c-581d6851835f@suse.de>
Message-ID: <963e8bf72515f68e1b788383361dbe74@3xo.fr>
X-Sender: nicolas.baranger@3xo.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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


Hi Thomas

Thanks again for help

> Nicolas, if you find an old kernel version that works correctly, and if 
> you know how to git-bisect the kernel, it would be helpful if you could 
> bisect to the commit that introduced the problem.

Ok, I will try to find a working kernel and to git bisect to find the 
commit which introduce the problem.
I will start with longterm 6.1.128

Kind regards
Nicolas



> Le 2025-02-14 13:36, Thomas Zimmermann a écrit :
> 
>> Hi Jocelyn
>> 
>> Am 14.02.25 um 10:11 schrieb Jocelyn Falempe: On 13/02/2025 10:27, 
>> Nicolas Baranger wrote: Dear Thomas
>> 
>> Thanks for answer and help.
>> 
>> Yes, due to .date total removal in linux 6.14 (https://github.com/ 
>> torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd 
>> <https:// github.com/torvalds/linux/commit/ 
>> cb2e1c2136f71618142557ceca3a8802e87a44cd>) the last DKMS sources are :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>> 
>> You can also find this sources in directory drivers/gpu/drm/ast_new of 
>> the tarball https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/ 
>> linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz <https:// 
>> xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1- 
>> ast1.15.1-rc2_nba0_20250212.tar.gz>
>> 
>> I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
>> than Aspeed version 1.15.1 because on my system it has very poor 
>> rendering and is very slow, twinkle is high and had poor colors.
>> The screen flickering is high and it's like if I was using a very old 
>> cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor 
>> which is perfectly functionnal and which display a nice and eyes 
>> confortable picture when using ast 1.15.1 driver or the video output 
>> of the Nvidia GPU ).
>> 
>> My testing system is a test Xeon server with an AST2400 BMC with its 
>> AST VGA card as the main video output (to be able to have a screen on 
>> the BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D 
>> rendering with Nvidia prime render offload.
>> What I constat with embed kernel driver 0.1.0 is that the Xeon 
>> processor is doing the video job for example when watching a video, 
>> and it's not the case with version 1.15.1 even when displaying on the 
>> AST VGA card a vulkan rotating cube (compute by nvidia GPU with nvidia 
>> prime but display by the AST VGA card of the AST2400).
>> Note that with in-kernel version 0.1.0 it's nearly impossible to make 
>> round the vulkan cube at more than half a round by  second where it's 
>> working (very) fine for a 32MB video memory card with version 1.15.1 
>> as you can see in the video present in the online directory
>> 
>> I'm not developer or kernel developer so be sure that I wouldn't have 
>> done all this work if the in-kernel ast version 0.1.0 was usable 
>> out-of- the-box
>> 
>> Sure you can give me a patch I will test on this server (building 
>> mainline+ast_new yesterday tooks 19 minutes on this server)
>> 
>> PS:
>> here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
>> linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast- 
>> fullpatch.patch 
>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ 
>> ast-fullpatch.patch>
>> Diff is about 250+ kb so the 2 drivers seems to have nothing to do 
>> with each others...
>> 
>> Thanks again for help
>> 
>> Kind regards
>> Nicolas
>> 
>> Le 2025-02-13 08:57, Thomas Zimmermann a écrit :
>> 
>> Hi Nicolas
>> 
>> Am 12.02.25 um 19:58 schrieb Nicolas Baranger: Dear maintener
>> That's mostly me and Jocelyn.
>> 
>> I did include ast-drm driver version 1.15.1 (in replacement of version 
>> 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
>> dkms patch
>> 
>> Last DKMS patch had been sucessfully tested on mainline.
>> And last ast.ko version 1.15.1 included in linux tree had also been 
>> sucessfully tested
>> 
>> Online directory is updated with :
>> - new DKMS patch
>> - new DKMS srouces
>> - new DKMS debian package
>> - new tarball of mainline included ast_new ported in kernel tree
>> - new kernel debian package (mainline with ast_new)
>> 
>> NB: online directory is here: https://xba.soartist.net/ast- 
>> drm_nba_20250211/ <https://xba.soartist.net/ast-drm_nba_20250211/>
>> 
>> Please let me know what I should do to see this change in linux-next
>> I'm having a little trouble with figuring out which of the many driver 
>> sources is the relevant one. Am I correct to assume it's the one at
>> 
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>> 
>> About that driver: Although the official driver reports an ancient 
>> version number, it is an up-to-date driver. It is actually more up-to- 
>> date than Aspeed's package. Both drivers share source code and a few 
>> years ago there was an effort to bring the kernel's driver up to the 
>> same feature set. Since then, the kernel's driver has been updated, 
>> reworked and improved.
>> 
>> About the performance: From what I can tell, the only significant 
>> difference in these drivers is memory management. Your ast_new driver 
>> uses an older algorithm that we replaced quite a few releases ago. The 
>> old version was unreliable on systems with little video memory, so we 
>> had to replace it.  I don't know why the new code should be slower 
>> though.
> 
> Regarding the performances of ast driver, I remember doing profiling 
> some times ago, and when running glxgears (with llvmpipe), 65% of the 
> CPU time was wasted in page fault 
> (https://elixir.bootlin.com/linux/v6.13.2/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L534)
> But as this driver is mostly used for console/basic desktop usage, I 
> didn't investigate more.
> Now that's an interesting find. The GEM shmem helpers vunmap ASAP to 
> make pages swappable, I think. IIRC there was a patchset circulating 
> that implements a shrinker [1] for shmem helpers. With that in place, 
> we'd only update the page tables if necessary. If it's really that 
> easy, we should try to merge that.
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.13.2/source/include/linux/shrinker.h#L82
> 
>> If I remember correctly, the switch to shmem, is because some devices 
>> have only 16MB of memory, and 1920x1200x32bits takes ~9MB, so it's not 
>> possible to have double buffering in this case. (And this is required 
>> by most desktop environment).
> 
> Exactly. There are ast devices with as little as 8 MiB of video memory. 
> But FullHD@32bit already requires ~8 MiB. Atomic modesetting with the 
> old memory manager requires overcommitting by a factor of 3 (to ~24 
> MiB) to account for all corner cases. Hence we sometimes had failed 
> display updates with lower-end devices.
> 
>> The switch to shmem was done with "f2fa5a99ca81c drm/ast: Convert ast 
>> to SHMEM", and introduced in v6.2. So maybe if you can try with a v6.1 
>> kernel, using the built-in ast driver and report if it has better 
>> performances.
> 
> Nicolas, if you find an old kernel version that works correctly, and if 
> you know how to git-bisect the kernel, it would be helpful if you could 
> bisect to the commit that introduced the problem.
> 
> Best regards
> Thomas
> 
>> Best regards,
