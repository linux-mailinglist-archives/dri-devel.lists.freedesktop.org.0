Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270395BD83E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 01:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323910E1FC;
	Mon, 19 Sep 2022 23:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2329310E1FC;
 Mon, 19 Sep 2022 23:27:58 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id jm11so651155plb.13;
 Mon, 19 Sep 2022 16:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=xMvfvNVQtD64q8tGiwGnOVfsRnwh7XTr2/3zVgHXpHc=;
 b=ng9M6AZxxJGzK2DAPzv8G7JXiiarrTi2EMXAAzkq7M3NSGLurxQGcSaW77aXCx6J4E
 QPVxrAEGAzOCDZfT/cmnUZNFawji6hYzBjlgVu3TkqtmkLv5Aj9w8c3Q+ILb1cl3z5iz
 OqNlPhBne/YqnrsipEwB4Lb8Z2jRB+5Twv2AvZ+jGxsSm9l96Y4EKSIBQiLXBaMVck5k
 /IyfGXoAHGe+8Ml6mEx87gJVKkUfV+tryOIUNk/dG1GPofPD2233LRO+K2VdqDHsrAY+
 w2tlZNeVZkntM3l2/ULU7Qu4PgUAYz5MaSCb28QXY+2Q4HbslxwNAGxtnhreAsMDHuYl
 wADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xMvfvNVQtD64q8tGiwGnOVfsRnwh7XTr2/3zVgHXpHc=;
 b=lsOcpxuKc1fN/LtBUo5F53F7M+aue56ubMMud/zNI9a61zAuINgJ71gG9kduydVEHv
 Erj/lHpf16eYFnXaqefFo1a3hmDApxl3+4zJnyR+lDFYuiiBXDSOpgp4TcUtHOFIrJ0C
 4BYhzfJh9WYh3k9cECzpIQs2S1iAGXZyadk1RwnFCI/m3Zh4qPPkD5vi5dlWelZsvkyO
 OkWNQoPxu3BAbcvN7YSGjpxQvSn285EVPF5AqaOLHy/AVsy73ew09unvXW92pzIT+2K9
 ZQWKH09mMl71M3iD75LjT0QwDK3I/oKkChVjzMXRJ1lhUsn72qJWZKFsdI9oMK12Rsqt
 bYiA==
X-Gm-Message-State: ACrzQf30iLGusd1b3ucOlONPHf2bJNIT8lh6OpZIy2+yuvAjh8UpHP7R
 E92jOqjsWO4eSknuth93tpHcoeV7ScgVl3IboZM=
X-Google-Smtp-Source: AMsMyM7GnTGHon8J8F1T8/dNI1bf94Yvt5qoyN9JWoUnWvn6jgbH2UTtMgBP/cAsJEGf9x8UlwJyGq5TMFcU9mjz1oo=
X-Received: by 2002:a17:902:ccc2:b0:178:29e1:899e with SMTP id
 z2-20020a170902ccc200b0017829e1899emr2090041ple.114.1663630077367; Mon, 19
 Sep 2022 16:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
 <20220817160751.moqhebkiuiydraka@mail.igalia.com>
 <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
 <dd2ee57a-2ab2-db94-36d9-8faced18fe61@riseup.net>
 <CABXGCsMc_D_iJ-r-_s8q13Vq6dgfQg1tnp-0aojfv5Q8izTrfw@mail.gmail.com>
 <a588de9f-958a-fce9-b4d3-2ea45d092b44@riseup.net>
 <CABXGCsMwTWbgZ-98gcQFbCN3rqzAt01ROpqUpL1d+3gjbwUcpA@mail.gmail.com>
In-Reply-To: <CABXGCsMwTWbgZ-98gcQFbCN3rqzAt01ROpqUpL1d+3gjbwUcpA@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 20 Sep 2022 04:27:45 +0500
Message-ID: <CABXGCsMr5AZDoxhQSoHCibDOakimp5ukt=eMsUpPsYVnpL04ng@mail.gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!
Unfortunately the use-after-free issue still happens on the 6.0-rc5 kernel.
The issue became hard to repeat. I spent the whole day at the computer
when use-after-free again happened, I was playing the game Tiny Tina's
Wonderlands.
Therefore, forget about repeatability. It remains only to hope for
logs and tracing.
I didn't see anything new in the logs. It seems that we need to
somehow expand the logging so that the next time this happens we have
more information.

Sep 18 20:52:16 primary-ws gnome-shell[2388]:
meta_window_set_stack_position_no_sync: assertion
'window->stack_position >=3D 0' failed
Sep 18 20:52:27 primary-ws gnome-shell[2388]:
meta_window_set_stack_position_no_sync: assertion
'window->stack_position >=3D 0' failed
Sep 18 20:53:44 primary-ws gnome-shell[2388]: Window manager warning:
Window 0x4e00003 sets an MWM hint indicating it isn't resizable, but
sets min size 1 x 1 and max size 2147483647 x 2147483647; this doesn't
make much sense.
Sep 18 20:53:45 primary-ws kernel: umip_printk: 11 callbacks suppressed
Sep 18 20:53:45 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:14ebb0d03 sp:4ee528: SGDT instruction cannot be used by
applications.
Sep 18 20:53:45 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:14ebb0d03 sp:4ee528: For now, expensive software emulation returns
the result.
Sep 18 20:53:53 primary-ws gnome-shell[2388]:
meta_window_set_stack_position_no_sync: assertion
'window->stack_position >=3D 0' failed
Sep 18 20:53:53 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:14ebb0d03 sp:4ee528: SGDT instruction cannot be used by
applications.
Sep 18 20:53:53 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:14ebb0d03 sp:4ee528: For now, expensive software emulation returns
the result.
Sep 18 20:54:15 primary-ws kernel: umip: Wonderlands.exe[214194]
ip:15a270815 sp:6eaef490: SGDT instruction cannot be used by
applications.
Sep 18 20:56:01 primary-ws kernel: umip_printk: 15 callbacks suppressed
Sep 18 20:56:01 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:15e3a82b0 sp:4ed178: SGDT instruction cannot be used by
applications.
Sep 18 20:56:01 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:15e3a82b0 sp:4ed178: For now, expensive software emulation returns
the result.
Sep 18 20:56:03 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:15e3a82b0 sp:4edbe8: SGDT instruction cannot be used by
applications.
Sep 18 20:56:03 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:15e3a82b0 sp:4edbe8: For now, expensive software emulation returns
the result.
Sep 18 20:56:03 primary-ws kernel: umip: Wonderlands.exe[213853]
ip:15e3a82b0 sp:4ebf18: SGDT instruction cannot be used by
applications.
Sep 18 20:57:55 primary-ws kernel: ------------[ cut here ]------------
Sep 18 20:57:55 primary-ws kernel: refcount_t: underflow; use-after-free.
Sep 18 20:57:55 primary-ws kernel: WARNING: CPU: 22 PID: 235114 at
lib/refcount.c:28 refcount_warn_saturate+0xba/0x110
Sep 18 20:57:55 primary-ws kernel: Modules linked in: tls uinput
rfcomm snd_seq_dummy snd_hrtimer nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_>
Sep 18 20:57:55 primary-ws kernel:  asus_wmi ledtrig_audio
sparse_keymap platform_profile irqbypass rfkill mc rapl snd_timer
video wmi_bmof pcspkr snd k10temp i2c_piix4 soundcore acpi_cpufreq
zram amdgpu drm_ttm_helper ttm iommu_v2 crct1>
Sep 18 20:57:55 primary-ws kernel: Unloaded tainted modules:
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_eda>
Sep 18 20:57:55 primary-ws kernel:  pcc_cpufreq():1 pcc_cpufreq():1
fjes():1 fjes():1 pcc_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1
fjes():1
Sep 18 20:57:55 primary-ws kernel: CPU: 22 PID: 235114 Comm:
kworker/22:0 Tainted: G        W    L    -------  ---
6.0.0-0.rc5.20220914git3245cb65fd91.39.fc38.x86_64 #1
Sep 18 20:57:55 primary-ws kernel: Hardware name: System manufacturer
System Product Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
Sep 18 20:57:55 primary-ws kernel: Workqueue: events
drm_sched_entity_kill_jobs_work [gpu_sched]
Sep 18 20:57:55 primary-ws kernel: RIP: 0010:refcount_warn_saturate+0xba/0x=
110
Sep 18 20:57:55 primary-ws kernel: Code: 01 01 e8 69 6b 6f 00 0f 0b e9
32 38 a5 00 80 3d 4d 7d be 01 00 75 85 48 c7 c7 80 b7 8e 95 c6 05 3d
7d be 01 01 e8 46 6b 6f 00 <0f> 0b e9 0f 38 a5 00 80 3d 28 7d be 01 00
0f 85 5e ff ff ff 48 c7
Sep 18 20:57:55 primary-ws kernel: RSP: 0018:ffffa1a853ccbe60 EFLAGS: 00010=
286
Sep 18 20:57:55 primary-ws kernel: RAX: 0000000000000026 RBX:
ffff8e0e60a96c28 RCX: 0000000000000000
Sep 18 20:57:55 primary-ws kernel: RDX: 0000000000000001 RSI:
ffffffff958d255c RDI: 00000000ffffffff
Sep 18 20:57:55 primary-ws kernel: RBP: ffff8e19a83f5600 R08:
0000000000000000 R09: ffffa1a853ccbd10
Sep 18 20:57:55 primary-ws kernel: R10: 0000000000000003 R11:
ffff8e19ee2fffe8 R12: ffff8e19a83fc800
Sep 18 20:57:55 primary-ws kernel: R13: ffff8e0d44a4b440 R14:
ffff8e19a83fc805 R15: ffff8e0e60a96c30
Sep 18 20:57:55 primary-ws kernel: FS:  0000000000000000(0000)
GS:ffff8e19a8200000(0000) knlGS:0000000000000000
Sep 18 20:57:55 primary-ws kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 18 20:57:55 primary-ws kernel: CR2: 00001adc05fb2000 CR3:
00000002cf050000 CR4: 0000000000350ee0
Sep 18 20:57:55 primary-ws kernel: Call Trace:
Sep 18 20:57:55 primary-ws kernel:  <TASK>
Sep 18 20:57:55 primary-ws kernel:  process_one_work+0x2a0/0x600
Sep 18 20:57:55 primary-ws kernel:  worker_thread+0x4f/0x3a0
Sep 18 20:57:55 primary-ws kernel:  ? process_one_work+0x600/0x600
Sep 18 20:57:55 primary-ws kernel:  kthread+0xf5/0x120
Sep 18 20:57:55 primary-ws kernel:  ? kthread_complete_and_exit+0x20/0x20
Sep 18 20:57:55 primary-ws kernel:  ret_from_fork+0x22/0x30
Sep 18 20:57:55 primary-ws kernel:  </TASK>
Sep 18 20:57:55 primary-ws kernel: irq event stamp: 63606683
Sep 18 20:57:55 primary-ws kernel: hardirqs last  enabled at
(63606691): [<ffffffff9418ce0e>] __up_console_sem+0x5e/0x70
Sep 18 20:57:55 primary-ws kernel: hardirqs last disabled at
(63606698): [<ffffffff9418cdf3>] __up_console_sem+0x43/0x70
Sep 18 20:57:55 primary-ws kernel: softirqs last  enabled at
(63490566): [<ffffffff940ff749>] __irq_exit_rcu+0xf9/0x170
Sep 18 20:57:55 primary-ws kernel: softirqs last disabled at
(63490561): [<ffffffff940ff749>] __irq_exit_rcu+0xf9/0x170
Sep 18 20:57:55 primary-ws kernel: ---[ end trace 0000000000000000 ]---
Sep 18 20:57:56 primary-ws abrt-dump-journal-oops[1409]:
abrt-dump-journal-oops: Found oopses: 1
Sep 18 20:57:56 primary-ws abrt-dump-journal-oops[1409]:
abrt-dump-journal-oops: Creating problem directories
Sep 18 20:57:57 primary-ws abrt-notification[261766]: [=F0=9F=A1=95] System
encountered a non-fatal error in kthread_complete_and_exit()
Sep 18 20:57:57 primary-ws abrt-dump-journal-oops[1409]: Reported 1
kernel oopses to Abrt
Sep 18 20:58:23 primary-ws gsd-power[2776]: Failed to acquire idle
monitor proxy: Timeout was reached
Sep 18 20:58:23 primary-ws gsd-power[2776]: Error setting property
'PowerSaveMode' on interface org.gnome.Mutter.DisplayConfig: Timeout
was reached (g-io-error-quark, 24)
Sep 18 20:58:53 primary-ws gsd-power[2776]: Failed to acquire idle
monitor proxy: Timeout was reached
Sep 18 20:58:53 primary-ws gsd-power[2776]: Error setting property
'PowerSaveMode' on interface org.gnome.Mutter.DisplayConfig: Timeout
was reached (g-io-error-quark, 24)
Sep 18 20:58:54 primary-ws gsd-power[2776]: Failed to acquire idle
monitor proxy: Timeout was reached

Full kernel log: https://pastebin.com/nj2syLPM

--=20
Best Regards,
Mike Gavrilov.
