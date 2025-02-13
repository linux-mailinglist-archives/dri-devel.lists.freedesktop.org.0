Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A720A33B4F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333CE10E2B3;
	Thu, 13 Feb 2025 09:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="pN00AFFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929C910EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:36:24 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id BD9018D;
 Thu, 13 Feb 2025 10:36:22 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id vyuxYidFWxHH; Thu, 13 Feb 2025 10:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 42DDE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1739439377; bh=tekiVTTfZtySu8YWP1V86LIjTypYcpB753wIT4hhcTQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pN00AFFhtcM/umMlPMpNtIod+kHg6/wtNEoFt1g8Q/qNL1lyVAhggf++Y5MyoysB5
 zaAPRiVtk0kSOn1A35vOe1o5vsye3N4BRbCCMFHSCD9q2AIY2wwt1A2do53Z9gRCFJ
 LaXJxi8B6UXJgBomP+hW7bQqo95G3sG9j5OqkrgDb9A//C+JtmJ1zxEH15DL1dGHgY
 Jk0Nfn0AmxCC0ZbQb9JsKkvSNNIKcwObqK0YGZYbi2sASF0U4Yve8EU6GgElxKWqcH
 XR1QJFsoexjwZ08gLBBcxbboAcLUQjuobyubqXUBm926/6umPy4t6Jnl5ZTowNTIix
 TiB2dtW42I2zg==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 42DDE8C;
 Thu, 13 Feb 2025 10:36:17 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 10:36:17 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, Jocelyn Falempe
 <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <984c317de1027f5886390a65f1f66126@3xo.fr>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr>
Message-ID: <f3035876f984f7439fa66ab8ec13dfc0@3xo.fr>
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

Sorry for the noise, html was rejected by linux-kernel@vger.kernel.org 
so resending this mail in plain text

Regards
Nicolas

Le 2025-02-13 10:27, Nicolas Baranger a écrit :

> Dear Thomas
> 
> Thanks for answer and help.
> 
> Yes, due to .date total removal in linux 6.14 
> (https://github.com/torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd) 
> the last DKMS sources are :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/
> 
> You can also find this sources in directory drivers/gpu/drm/ast_new of 
> the tarball 
> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz
> 
> I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
> than Aspeed version 1.15.1 because on my system it has very poor 
> rendering and is very slow, twinkle is high and had poor colors.
> The screen flickering is high and it's like if I was using a very old 
> cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor which 
> is perfectly functionnal and which display a nice and eyes confortable 
> picture when using ast 1.15.1 driver or the video output of the Nvidia 
> GPU ).
> 
> My testing system is a test Xeon server with an AST2400 BMC with its 
> AST VGA card as the main video output (to be able to have a screen on 
> the BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D 
> rendering with Nvidia prime render offload.
> What I constat with embed kernel driver 0.1.0 is that the Xeon 
> processor is doing the video job for example when watching a video, and 
> it's not the case with version 1.15.1 even when displaying on the AST 
> VGA card a vulkan rotating cube (compute by nvidia GPU with nvidia 
> prime but display by the AST VGA card of the AST2400).
> Note that with in-kernel version 0.1.0 it's nearly impossible to make 
> round the vulkan cube at more than half a round by  second where it's 
> working (very) fine for a 32MB video memory card with version 1.15.1 as 
> you can see in the video present in the online directory
> 
> I'm not developer or kernel developer so be sure that I wouldn't have 
> done all this work if the in-kernel ast version 0.1.0 was usable 
> out-of-the-box
> 
> Sure you can give me a patch I will test on this server (building 
> mainline+ast_new yesterday tooks 19 minutes on this server)
> 
> PS:
> here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
> linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast-fullpatch.patch
> Diff is about 250+ kb so the 2 drivers seems to have nothing to do with 
> each others...
> 
> Thanks again for help
> 
> Kind regards
> Nicolas
> 
> Le 2025-02-13 08:57, Thomas Zimmermann a écrit :
> Hi Nicolas
> 
> Am 12.02.25 um 19:58 schrieb Nicolas Baranger: Dear maintener
> That's mostly me and Jocelyn.
> 
> I did include ast-drm driver version 1.15.1 (in replacement of version 
> 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
> dkms patch
> 
> Last DKMS patch had been sucessfully tested on mainline.
> And last ast.ko version 1.15.1 included in linux tree had also been 
> sucessfully tested
> 
> Online directory is updated with :
> - new DKMS patch
> - new DKMS srouces
> - new DKMS debian package
> - new tarball of mainline included ast_new ported in kernel tree
> - new kernel debian package (mainline with ast_new)
> 
> NB: online directory is here: 
> https://xba.soartist.net/ast-drm_nba_20250211/
> 
> Please let me know what I should do to see this change in linux-next
> I'm having a little trouble with figuring out which of the many driver 
> sources is the relevant one. Am I correct to assume it's the one at
> 
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/
> 
> About that driver: Although the official driver reports an ancient 
> version number, it is an up-to-date driver. It is actually more 
> up-to-date than Aspeed's package. Both drivers share source code and a 
> few years ago there was an effort to bring the kernel's driver up to 
> the same feature set. Since then, the kernel's driver has been updated, 
> reworked and improved.
> 
> About the performance: From what I can tell, the only significant 
> difference in these drivers is memory management. Your ast_new driver 
> uses an older algorithm that we replaced quite a few releases ago. The 
> old version was unreliable on systems with little video memory, so we 
> had to replace it.  I don't know why the new code should be slower 
> though.
> 
> If I give you a patch against a recent Linux kernel, are you capable of 
> building the patched kernel and testing that change on your system?
> 
> Best regards
> Thomas
> 
> Thanks for help
> 
> Kind regards
> Nicolas Baranger
> 
> Le 2025-02-11 19:15, Nicolas Baranger a écrit :
> 
> Dear maintener
> 
> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
> driver on mainline kernel (6.13.0 + 6.13.1).
> 
> ASPEED video driver is availiable here:
> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
> 
> But it only work for LTS kernel
> So I modify the DKMS package and I build a new Debian DKMS package with 
> the adapted  source.
> My patch can be find here :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
> See the README:
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
> 
> Using this new 'ast 1.15.1' driver, performance are amazing compared to 
> the 'ast' driver include in kernel tree, specially when using a 
> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card as 
> the main video card and as the main and only video output (the discrete 
> GPU is used only for offloading 3D or for cuda/opencl)
> 
> So to make things easier, I include the new 'ast 1.15.1' driver in 
> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
> It's working fine as you can see on this video :
> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 
> I upload all the work I've done here :
> https://xba.soartist.net/ast-drm_nba_20250211/
> 
> See the global README :
> https://xba.soartist.net/ast-drm_nba_20250211/README
> 
> and the README in nba-kernel sub-directory :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
> 
> I'm not a developer so please let me know if I made the things the 
> right way and if this new 'ast 1.15.1' driver can be ported to 
> linux-next or linux-? ?
> If you need more explanations, do not hesitate to contact me, I would 
> be happy to help
> 
> Kind regards
> Nicolas Baranger
