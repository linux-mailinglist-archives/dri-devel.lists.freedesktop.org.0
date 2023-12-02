Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D88023B2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 13:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9DD10E2CA;
	Sun,  3 Dec 2023 12:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2024 seconds by postgrey-1.36 at gabe;
 Sat, 02 Dec 2023 17:47:12 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8410E203;
 Sat,  2 Dec 2023 17:47:12 +0000 (UTC)
Received: from merlin by mail1.merlins.org with local (Exim 4.94.2 #2)
 id 1r9TYU-0007ZD-K8 by authid <merlin>; Sat, 02 Dec 2023 09:13:26 -0800
Date: Sat, 2 Dec 2023 09:13:26 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Subject: Thinkpad P17 gen 2 kernel 6.4 and 6.6 lack of support for nvidia
 GA104GLM [RTX A5000 Mobile] and missing module firmware
Message-ID: <20231202171326.GB24486@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: marc@merlins.org
X-Mailman-Approved-At: Sun, 03 Dec 2023 12:21:36 +0000
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Howdy,

I'm trying a Thnkpad P17 gen2, the last thinkpad that still comes in 17"
4K (newer ones are 16" only, so I'm looking for other worthwhile linux
laptops with 17" or bigger LCD that also does 4K, the alienware I saw
was 18" but not 4K)

Unfortunately I seem to need the nouveau driver to turn off the nvidia
chip I don't plan on using (intel graphics is fine for me), and bios
only allows 'bybrid' or nvidia only)
On my P73, nouveau never really worked in the 3 years I've had it, but
it could at least turn off the nvidia chip. On P17gen2 it does not seem
to be able to do so.

Firmware is missing even from the latest firmware-linux-nonfree or from upstream
git https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
sauron:~# update-initramfs -v -c -k `uname -r` 2>&1 |grep W:
W: Possible missing firmware /lib/firmware/nvidia/ga107/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/acr/ucode_ahesasc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/acr/ucode_asb.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/acr/ucode_unload.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/nvdec/scrubber.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/sec2/hs_bl_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga107/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/sec2/hs_bl_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga106/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/sec2/hs_bl_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga104/sec2/desc.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/sec2/hs_bl_sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/sec2/sig.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/sec2/image.bin for module nouveau
W: Possible missing firmware /lib/firmware/nvidia/ga103/sec2/desc.bin for module nouveau

During boot, the nvidia module hangs for 2mn and fails to do any work,
including being able to turn off the nvidia chip (which it could do
on P73 without otherwise ever being able to use that chip for proper
display). I want to turn off the nvidia chip so that I can get multi
hour runtime on batteries without some useless chip that is using power
for no reason.

sauron:~# lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation Tiger Lake-H GT1 [UHD Graphics] (rev 01)
01:00.0 VGA compatible controller: NVIDIA Corporation GA104GLM [RTX A5000 Mobile] (rev a1)


Boot looks like this:
[    0.210932] Kernel command line: BOOT_IMAGE=/vmlinuz-6.6.3-amd64-preempt-sysrq-20220227 root=/dev/mapper/cryptroot ro rootflags=subvol=root cryptopts=source=/dev/nvme0n1p7,keyscript=/sbin/cryptgetpw usbcore.autosuspend=1 pcie_aspm=force resume=/dev/dm-1 thinkpad-acpi.brightness_enable=1 acpi_backlight=native nouveau.modset=0 systemd.unified_cgroup_hierarchy=0
[    3.184525] nouveau: unknown parameter 'modset' ignored
[    3.184800] nouveau: detected PR support, will not use DSM
[    3.184813] nouveau 0000:01:00.0: vgaarb: pci_notify
[    3.184816] nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
[    3.184821] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    3.184959] nouveau 0000:01:00.0: NVIDIA GA104 (b74000a1)
[    3.295682] nouveau 0000:01:00.0: bios: version 94.04.51.00.34
[   64.941381] nouveau 0000:01:00.0: acr: firmware unavailable
[  126.381361] nouveau 0000:01:00.0: sec2: firmware unavailable
[  126.381484] nouveau 0000:01:00.0: enabling bus mastering
[  126.382073] nouveau 0000:01:00.0: fb: 16384 MiB GDDR6
[  183.695282] nouveau 0000:01:00.0: fb: VPR locked, but no scrubber binary!
[  183.702321] nouveau 0000:01:00.0: DRM: error initialising bo driver, -12
[  183.709419] nouveau: probe of 0000:01:00.0 failed with error -12
[  183.711498] nouveau 0000:01:00.0: vgaarb: pci_notify

What is the next recommended step?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/  
