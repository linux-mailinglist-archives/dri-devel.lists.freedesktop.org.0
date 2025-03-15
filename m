Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2EA62B1F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 11:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4C610E22A;
	Sat, 15 Mar 2025 10:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="Oso+icer";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5AB10E22A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 10:34:04 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id AF0BC8D;
 Sat, 15 Mar 2025 11:33:53 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id FVSGc59RihuH; Sat, 15 Mar 2025 11:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 08E8511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1742034831; bh=GgfJ/JrF7hd3clnHhIW/AmTX6oUXaQbLExOyOT9tiqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oso+icerfHlu2UJtj+18K3NDv6pFOkllZ9gCP93eI6ZpSY6Sce1K0FRjmyxvom8EX
 NS0H1FtdoSCft05PU+PBx6uaqaZO4QjB78VLn9Y6OAzIlUa2gZMSqiIZk642M74BRR
 9WaC45ZMi/7CrTsqiOGyGb9Lxd8GRrGo59IAgeNtNXu534JQgGxY98MTB5g5mxyNI4
 YrsqgtSmVMPrXzCUCnEWucqoxxdRR4RylDzsL82Q1k3+1/86Gsv3WN3/Nrl/8HnMbw
 IMxxkbAKPtP5lVCDUTtCaalI9onMM0RLb5dvChvoPwAUgXIHEOl4W7+dtXlxMud5id
 Rr3QJZwycuUZA==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 08E8511;
 Sat, 15 Mar 2025 11:33:51 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 11:33:50 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, Jocelyn Falempe
 <jfalempe@redhat.com>
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <cec03d41-f04d-4fb4-b76d-2c1e6fd02c11@suse.de>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <bc089e81-2e09-41e9-a9d1-68b2f4372e7f@suse.de>
 <183881a57671db7eebada5ac8cbcb8cf@3xo.fr>
 <17888ffd-4311-436b-9fec-dfb041268643@suse.de>
 <aceb4e94f0a08ce62879a5b976407507@3xo.fr>
 <cec03d41-f04d-4fb4-b76d-2c1e6fd02c11@suse.de>
Message-ID: <8bfac12ceef3cbf6a3da661a925620bc@3xo.fr>
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

I'm really sorry for the delay of 2 weeks (I lost a big raid array and 
it tooks days++ to recover, sorry)

As asked, I did patch linux-6.13.1 with the provided patch and I did use 
the original (but just patched) ast driver
Here you can find the video of the test:
https://xba.soartist.net/ast-drm_nba_20250211/vkcube_linux-6.13.1.2-ast-warn-nba0-1_20250315.webm

You will constat catastrophic performances, and CPU is doing all the job 
(from 4 to 10 core used for displaying Gnome Desktop)
Please note:
In the first minute of the video, I was sliding the 'file' window on the 
desktop (not too fast) from left to right and from up to down
It was lagging at a point that the sliding of the window does not 
appears on the video as if I was not sliding the window at all

In the second part (with vulkan cube) you can see that the cube round 
very very slowly and nvtop report 5% or 6% of usage of the discrete GPU 
(vs 25% to 50% with ast_new driver or linux 6.1.128 ast embeded driver).
It seems to be caused by ast very poor rendering (as if the driver was 
not doing its job)

Unfortunatly, no shared GEM objects were reported by dmesg or in regular 
syslog (I can email you privatly the whole dmesg output if needed)
dmesg -T  | grep -iE "obj|gem"
[sam. 15 mars 10:31:37 2025] SLUB: HWalign=64, Order=0-3, MinObjects=0, 
CPUs=40, Nodes=1

I was require to patch ast_mod.c at line 634 because in Linux 6.13.1 
static void ast_handle_damage start at line 629
Is there something I'm doing bad ?

Please note that linux-6.1.128 is the last version where the included 
ast driver as the same rendering and performance as ast_new I included 
in Linux 6.13+
Issues starting from Linux 6.2 and is more and more degraded until Linux 
6.13.1 which is currently the worst I constat (desktop becomes limit 
unusable without a big Xeon to do the video job and with that unsusable 
for doing something else than using a terminal).

Thanks again for help

Kind regards
Nicolas Baranger


Le 2025-03-03 11:16, Thomas Zimmermann a écrit :

> (cc'ing Jocelyn)
> 
> Am 03.03.25 um 09:44 schrieb Nicolas Baranger: Hi Thomas
> 
> I do have an idea what might be happening here. You are using 6.13.1, 
> right?  If I give you a patch file for this kernel, are you able to 
> apply it (with 'git am') for testing and report the kernel's logging 
> output?
> Yes I'm using Linux 6.13.1 but I can also test with the latest 
> linux-stable 6.13.5 or on mainline, whatever help you the best.
> The only thing is I cannot go before Linux 6.13+ because it it fix DIO 
> write on netfs (regression introduced in 6.10) and I'm using this 
> feature for backups.
> 
> I think I should be able to patch and use 'git am' (In the worst 
> there's always https://git-scm.com/docs/git-am), and I would be happy 
> to report the kernel logging output

Great. You'll find a patch attached against the 6.13 kernel. Let me know 
if it doesn't apply.

If it applies, please run your performance test and look at the dmesg 
output. It should contain warnings about shared GEM objects. Can you 
please report some of this output?

Best regards
Thomas

> Thanks again for help
> 
> Kind regards
> Nicolas Baranger
> 
> Le 2025-03-03 09:19, Thomas Zimmermann a écrit :
> 
>> Hi
>> 
>> Am 03.03.25 um 09:07 schrieb Nicolas Baranger: Dear Thomas
>> 
>> You are using NVidia's proprietary driver, right? Did you reach out to 
>> them wrt this problem? Or searched their support forums, online help, 
>> etc? If so, what are the results?
>> Yes I'm using NVidia propriétary driver.
>> Maybe I'm wrong but I did not ask their support directly because 
>> first, for me it seems that there is no issue with the NVidia driver 
>> and unfortunately NVidia is not as opensource mind as Linux kernel 
>> community (as an example you can have a look on my last PR here 
>> https://github.com/NVIDIA/open-gpu-kernel-modules/pull/783 which had 
>> not been reviewed since 3+ weeks... and without this PR, it's 
>> impossible to build open or closed source NVidia drivers on mainline)
> 
> I see.
> 
> I do have an idea what might be happening here. You are using 6.13.1, 
> right?  If I give you a patch file for this kernel, are you able to 
> apply it (with 'git am') for testing and report the kernel's logging 
> output?
> 
> Best regards
> Thomas
> 
>> Second, I thought I already report it here but on my system using a 
>> recent kernel and embeded ast 0.1.0 driver has a very poor rendering 
>> and graphic is very slow, twinkle is high, had poor colors and it's 
>> happenning even if the NVidia driver is unloaded
>> The screen flickering is high too and it's like if I was using an old 
>> cathode ray tube monitor (I'm using an LCD monitor which display a 
>> nice and eyes confortable picture when using ast 1.15.1 driver or when 
>> displaying directly the video output of the Nvidia GPU(using HDMI 
>> output)).
>> Third, approximately from Linux 6.10+ using the embeded ast driver I 
>> have some lag when sliding a window on Gnome desktop (Xorg not 
>> Wayland) and CPU is highly used (some coreS at 100%), but I do not 
>> have those lag with ast 1.15.1 and CPU is less used (1 core at less 
>> than 80% max)
>> For the moment, I think Linux 6.12.9 is the worst I constat
>> 
>> Last, I found that Linux 6.1.128 is working perfectly out of the box 
>> with embeded ast 0.1.0 driver and there is a manifest lost of 
>> performances with Vulkan and Nvidia prime render offload when 
>> upgrading to Linux 6.2 (using same NVidia driver version, I did test 
>> those 3 versions  535.216.01, 550.142, and 550.144.03 with similar 
>> results).
>> But in Linux 6.2, except the lost of performances, I did not constat 
>> the poor rendering and twinkle on the screen nor lag when sliding a 
>> window on the desktop or too high CPU usage.
>> 
>> So I suspect there is something else introduced between Linux 6.2 and 
>> mainline which cause this behavior.
>> 
>> I'm continuing bissection and I'm sorry, it's not as fast as I would 
>> as each tests tooks some times and I must never tell something wrong 
>> to git if I don't want to restart all the work...
>> 
>> Thanks again for answer and help
>> 
>> Kind regards
>> Nicolas Baranger
>> 
>> Le 2025-02-28 11:06, Thomas Zimmermann a écrit :
>> 
>> Hi
>> 
>> Am 11.02.25 um 19:15 schrieb Nicolas Baranger:
>> 
>> Dear maintener
>> 
>> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
>> driver on mainline kernel (6.13.0 + 6.13.1).
>> 
>> ASPEED video driver is availiable here:
>> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
>> 
>> But it only work for LTS kernel
>> So I modify the DKMS package and I build a new Debian DKMS package 
>> with the adapted  source.
>> My patch can be find here :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
>> See the README:
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
>> 
>> Using this new 'ast 1.15.1' driver, performance are amazing compared 
>> to the 'ast' driver include in kernel tree, specially when using a 
>> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card 
>> as the main video card and as the main and only video output (the 
>> discrete GPU is used only for offloading 3D or for cuda/opencl)
>> You are using NVidia's proprietary driver, right? Did you reach out to 
>> them wrt this problem? Or searched their support forums, online help, 
>> etc? If so, what are the results?
>> 
>> Best regards
>> Thomas
>> 
>> So to make things easier, I include the new 'ast 1.15.1' driver in 
>> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
>> It's working fine as you can see on this video :
>> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 
>> I upload all the work I've done here :
>> https://xba.soartist.net/ast-drm_nba_20250211/
>> 
>> See the global README :
>> https://xba.soartist.net/ast-drm_nba_20250211/README
>> 
>> and the README in nba-kernel sub-directory :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
>> 
>> I'm not a developer so please let me know if I made the things the 
>> right way and if this new 'ast 1.15.1' driver can be ported to 
>> linux-next or linux-? ?
>> If you need more explanations, do not hesitate to contact me, I would 
>> be happy to help
>> 
>> Kind regards
>> Nicolas Baranger
