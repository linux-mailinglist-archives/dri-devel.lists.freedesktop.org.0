Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623AB07FDB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 23:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E210E2DB;
	Wed, 16 Jul 2025 21:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="AACRkPJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
 [136.143.188.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1FB10E102
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 21:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752702517; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JCgbVQKeF8fPuBzymCpZ6ocDt/uZa4MaRcWzaPxap4+fqhJ//Yn5jxFwCa1aag4/UxhdfF9KrZTAhE4gHRUY26bA85Ujkon1a0STuaW3ACNjM5xijp2UbYvF7Ko5nBugM4BmAdayuXL2U6E3d0HcdSkswioWAJyFcaZGo6cjwMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752702517;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jykymLpcIuD1F/ilyuxCAh0D/DhSx5X6vDiB9nbBDi8=; 
 b=ButG1eaqH+j60qJkVSoXIcjoc5i6ITbNl5SylW2URa4C71UcRL57jA6Tu1cXT5W8SMs/70mbuQ22ZMr+mUUJCttZWaBGlv4/WsaF7/e9L/YvdPc2Dz7Md+eTLKXdJt1WFCwCAN7MRP5raSG3SeEM0rqAWoiD6SbhD3Tsmpowbyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
 dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752702517; 
 s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=jykymLpcIuD1F/ilyuxCAh0D/DhSx5X6vDiB9nbBDi8=;
 b=AACRkPJF1sTJJnG4JmepNkWcwoHEUoNZ6piD+VdqiwTXoQgtrnzgjTSnWSA+Q3aM
 SZmDOIuTx8+ySKjUD0lVl0gqkL7UCAeQOyFMiwro2v6Yn23g2/qHh8CI3p3nlRJx7WC
 9z/QlLkKbe/IPHdTdv4z0VgZQc7kO69yj0sb7VjM=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 17527025142865.420431262086026;
 Wed, 16 Jul 2025 14:48:34 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
 with HTTP;Wed, 16 Jul 2025 14:48:34 -0700 (PDT)
Date: Thu, 17 Jul 2025 01:48:34 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: "ryasuoka" <ryasuoka@redhat.com>, "airlied" <airlied@gmail.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "kraxel" <kraxel@redhat.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 "mripard" <mripard@kernel.org>, "simona" <simona@ffwll.ch>,
 "tzimmermann" <tzimmermann@suse.de>,
 "virtualization" <virtualization@lists.linux.dev>
Message-ID: <1981535f461.11e01ca3b21091.7915707831085255756@zohomail.com>
In-Reply-To: <05c40a0a-d2b0-4f55-981f-6da3765eebb2@redhat.com>
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <20250714000456.14-1-safinaskar@zohomail.com>
 <1961897d-cf42-4495-aec7-f4c20dfe7566@redhat.com>
 <1980fcccefe.10a7c92b36705.2744765212931179004@zohomail.com>
 <05c40a0a-d2b0-4f55-981f-6da3765eebb2@redhat.com>
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011227c5463886fdf22997189eff70000061a5f1d7e53860d826172f6061090962bf5ae90f91ad8289de:zu080112276f196aec0a095a0a879bbc740000301014a8f874aef8db273d280520c189b8235d3de26de00cbf:rf0801122b6eb97275627a4a89c5a2933c000051fc395a76030f971dc85125368a1f3ccbb2b641e979217cbffce946b8:ZohoMail
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

 ---- On Wed, 16 Jul 2025 02:00:56 +0400  Jocelyn Falempe <jfalempe@redhat.com> wrote --- 
 > Yes, that's the default if you use a drm driver like bochs with fbdev 

Thank you for answer! I just tried kernel from drm-tip with this config with drm_panic in qemu. And panic works.
But I don't like result.
When drm panic happens, messages printed to /dev/console disappear. Only kernel messages remain.

Here are steps to reproduce. And then I will describe how this breaks my workflow.

Compile kernel from drm-tip ( https://gitlab.freedesktop.org/drm/tip ). I used commit b012f04b5be909a307ff629b297387e0ed55195a .
It seems to include this bochs patch (i. e. "drm/bochs: Add support for drm_panic").
Use this miniconfig:

$ cat mini
CONFIG_64BIT=y

CONFIG_EXPERT=y

CONFIG_PRINTK=y
CONFIG_PRINTK_TIME=y

CONFIG_PCI=y

CONFIG_TTY=y
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_DRM=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_BOCHS=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_PROC_FS=y

CONFIG_DRM_PANIC=y
CONFIG_DRM_PANIC_SCREEN="kmsg"

CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
$ make KCONFIG_ALLCONFIG=mini allnoconfig

Create initramfs, which contains exactly these files:
$ find /tmp/i -ls
     2861      0 drwxrwxr-x   3 user     user           80 Jul 16 23:56 /tmp/i
     2891      0 drwxrwxr-x   2 user     user           80 Jul 16 23:56 /tmp/i/bin
     2893      0 lrwxrwxrwx   1 user     user            7 Jul 16 23:56 /tmp/i/bin/sh -> busybox
     2892   1980 -rwxr-xr-x   1 user     user      2024544 Jul 16 23:56 /tmp/i/bin/busybox
     2864      4 -rwxrwxr-x   1 user     user           43 Jul 16 23:18 /tmp/i/init

This is "init":
===
#!/bin/sh

set -e

echo hello
sleep 3
exit 0
===

Now boot this in Qemu. I used this command:
$ qemu-system-x86_64 -enable-kvm -m 1024  -kernel arch/x86/boot/bzImage -initrd /tmp/ini.cpio.gz

You will see word "hello", then after 3 seconds the system will fail into drm panic.

What I saw: word "hello" disappeared, when the system falled into panic
What I expected to see: word "hello" should remain.

Now let me describe how this breaks my workflow.

I often use hand-crafted shell scripts as PID 1. Both in Qemu and on real hardware.
I use them to reproduce and bisect various kernel bugs.
I always put "set -e" in the beginning of shell script. This means that script fails after first error.
And thus system fails into kernel panic.
I also sometimes put "set -x" to debug these scripts.
Thus, when script fails and panic happens, then faulty shell command will be last thing printed on screen before panic stacktrace.
But with drm_panic everything printed to /dev/console disappears.
This breaks my workflow.

In Qemu I can easily workaround this by using serial console.

But I cannot do this on real hardware.

And yes, I experience fbcon panic problems on real hardware, too, this is why I'm interested in drm panic: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14658

(I have not yet tested whether drm_panic fixes that fbcon i915 panic problem, but I assume it does.)

I can workaround this by using efi fb with fb panic as opposed to i915. But this will not work if I attempting to catch bug in i915 itself.
(And yes, I recently found another i915-related bug, and I'm trying to debug it using shell scripts running as PID 1.
Here it is: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14598 .)

I can workaround this by logging everything to disk.
But this will not work when everything is mounted read-only.
And this is exactly what happens, when I try to catch that kexec-related bug:
immediately before issuing "kexec -e" command I mount everything read-only.

The only remaining workaround is to redirect everything to /dev/kmsg.
I. e. put "exec > /dev/kmsg 2>&1" to the script.
This will work.
But I still don't like this.

--
Askar Safin
https://types.pl/@safinaskar

