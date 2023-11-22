Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C279A7F3A98
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A7410E5B0;
	Wed, 22 Nov 2023 00:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6BB10E5AE;
 Wed, 22 Nov 2023 00:06:56 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b7f0170d7bso5851859b3a.2; 
 Tue, 21 Nov 2023 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700611616; x=1701216416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xKwgkeAtzmkKnSz03T4DxgRKcvAVmHnZ/2Ynp93sTY=;
 b=DHBtdzGgIB8FXOYFIEAo39VYzzrm7nBKHN6YCLBFn8GeqKPcf4xDFkE9tI9JZmUjDo
 +BMuAZmT4hrtKJ0d/NwOePKRyi6hzojz+LHbZ9hBCX/zqd9hLCAuuwZFSMZAcHMVsIsS
 /Cask/InlDAJwxq7VDNZN3IuLSbz/FYuixV5T0OjMY8rRUn2MBmeFKvKp+R3x1q4u2A6
 FWHXsFqhA+XMedw1T3EB5ztRBB1lQ0FEHTfrWvFLyTutvqKaqXa4p4SfDDcY3yyZju94
 kXPc4jNUGIX2ALNueLQItZPM/AMUcE+ltwQ2jZlugm28d/tv8gzYD0il8qYPTrlicLD4
 ILOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700611616; x=1701216416;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/xKwgkeAtzmkKnSz03T4DxgRKcvAVmHnZ/2Ynp93sTY=;
 b=AgSEMyLZaCfBSC9KcUqcpGrkJaviGwqbO3IACq0kSp4XlAte5fF4xlqEFEnP/AlHpn
 mwASD/dKjSbgvro9XkZrAc4KxdeXin+oWubIMFIa6a4PiGfwCUyG72cw/biK6WGCB4Yk
 pKkc6B4eEI9LQhbTwuBGZ+PPehTRTmz56887+lcTgfAoqeV3dAWrxn49Z6RB21WnXaYq
 NdTUJSrgtW33QGp37+u2gYu0l/RU5DXl77if/u9k6SDxO4SMx5ECo5w3eH5qzPj/7fuA
 cZRVfhQ+t6uOWJZ1K1JgK9lACDbarj3KC5T+JEtebk7V/uI5d4sYJq1VskmqYW64kVNe
 XvRg==
X-Gm-Message-State: AOJu0Yxe+IquWAzkJq0hhUGng3KXMTCMErDXweEsiySHAuxDLkVkqsOj
 WV0M9xee5TqvkQuADYZxUb2/5jQgLC2k5A==
X-Google-Smtp-Source: AGHT+IGFvSNUofC0ROKmiE0mKp1xMZ8d51fhDYVhtQKX8ZN/1XWxm8S+k3uuwHWRUMjbRvHDmBVm9g==
X-Received: by 2002:a05:6a20:431d:b0:188:f3d:ea35 with SMTP id
 h29-20020a056a20431d00b001880f3dea35mr764739pzk.50.1700611615823; 
 Tue, 21 Nov 2023 16:06:55 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7888e000000b006cb95c0fff4sm4424630pfe.71.2023.11.21.16.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 16:06:55 -0800 (PST)
Message-ID: <9057d7de-f2e0-44ba-bec7-8b0861b2a850@gmail.com>
Date: Wed, 22 Nov 2023 07:06:50 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.6.1 hangs on "loading initial ramdisk"
Content-Type: text/plain; charset=UTF-8
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
Cc: Christian Brauner <brauner@kernel.org>, River <shibedrill1@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Danilo Krummrich <dakr@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> After upgrading from 6.5.9 to 6.6.1 on my Dell Latitude E6420 (Intel i5-2520M) with EndeavourOS, the boot process would hang at "loading initial ramdisk". The issue is present on the 6.6.1 release of both Linux and Linux-zen, but not the 6.5.9 release, which makes me think this is somehow upstream in the kernel, rather than to do with packaging. My current workaround is using the Linux LTS kernel.
> 
> I have been unable to consistently reproduce this bug. Between 50 and 30 percent of the time, the "loading initial ramdisk" will display, the disk activity indicator will turn off briefly and then resume blinking, and then the kernel boots as expected. The other 50 to 70 percent of the time, the boot stops at "loading initial ramdisk" and the disk activity indicator turns off, and does not resume blinking. The disk activity light is constantly flashing during normal system operation, so I know it's not secretly booting but not updating the display. I haven't been able to replicate this issue in QEMU. I have seen similar bugs that have been solved by disabling IOMMU, but this has not had any effect. Neither has disabling graphics drivers and modesetting. I have been able to reproduce it while using Nouveau, so I don't believe it has to do with Nvidia's proprietary drivers.
> 
> Examining dmesg and journalctl, there doesn't appear to be ANY logs from the failed boots. I don't believe the kernel even is started on these failed boots. Enabling GRUB debug messages (linux,loader,init,fs,device,disk,partition) shows that the hang occurs after GRUB attempts to start the loaded image- it's able to load the image into memory, but the boot stalls after "Starting image" with a hex address (presumably the start addr of the kernel).  
> 
> I've been trying to compile the kernel myself to see if I can solve the issue, or at least aid in reproduceability, but this is not easy or fast to do on a 2012 i5 processor. I'll update if I can successfully recompile the kernel and if it yields any information.  
> 
> Please let me know if I should provide any additional information. This is my first time filing a bug here.

See Bugzilla for the full thread and attached grub output.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?id=218173
#regzbot title: initramfs loading hang on nouveau system (Dell Latitude E6420)

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218173

-- 
An old man doll... just what I always wanted! - Clara
