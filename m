Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF245AD94
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038E89343;
	Tue, 23 Nov 2021 20:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918B86E483
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:47:57 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b11so55701pld.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 12:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1DlKjIX0GvttlD0KftHE+xb1h7J4cGQUK0n8LLiZzc=;
 b=iQox2Xqe8GQnB7MOtKe+GDl8V5pNIMO+UKZ8OnKkBbtLGkKdhreZ1AlmYtqdRZ/U8T
 K5XTSrSm3eDr0GkJdrQVBQkfVL6cCunMo5htujZ3sv/ZALt392WkHnawLhcjj5Rl5y3d
 Atm/zTLO8zQsr7dXdhK2sGPjNGpPWgYtU/H3lSo+tXQB/KPuGBWZVLSjjgu5r+r3JlnE
 g/4lt/mQDmSV3Zms3HibXi+AnqJ3+dbYmbcwpUiQqS+I6d2gjC3TsXOjPFUt7dyD8TJl
 CH9gT8tewUq+9JytIskLqE6mOIuw5qTg9kODt9RokDf5NJ92yXJrIXfnOQQkXuA+684y
 2uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1DlKjIX0GvttlD0KftHE+xb1h7J4cGQUK0n8LLiZzc=;
 b=kP+SZnMaGRO27RRD3MtaSl7kpO6sOrhJF4b3FD0PsEpQbEb8ZY6Bx1y7Z2Rlr4tDU+
 J/74ZpayM4lFFSxUNdNsOtzMUn8SqOWAB+umpNKAQ2pIThDN1nZ+J+P2aJ1anuOIycpw
 5VoILj62pDel0Xmk+owiVUGRmVV24yoD0dVDgMptZW/JDhQxJbO4wiNXlODXHFxNkgKj
 VWq1g+jzx+bVpLnajdxiZFN3/CSJRkteh0ZGJZfYmFnRS4ePOpf7H4tkawxnnUZ1930Z
 fU8v/3TOaLcDzdeC4KpFWAzh8hJ02Dj7GVFXlhIuwEp6FAFgJxJcx/pS6pR39gVfZmkx
 hcHQ==
X-Gm-Message-State: AOAM531b9V1oS/sKIDU9bPn1hilxv+szU0M9DN2mNmGEfY0UIcYb0UR9
 gS/ri3LWcPQK8N65huoRE5+z+8D5kHOamyAa5lI=
X-Google-Smtp-Source: ABdhPJyFAyyQFl1AqzYGHzxf5y2xhEs7lyhD/XVSJ6CIS5NeRI7vviNnwT3rkChTL6q6S0kY3EdyQgj/j5xB93lbnXE=
X-Received: by 2002:a17:902:d395:b0:141:a913:1920 with SMTP id
 e21-20020a170902d39500b00141a9131920mr10177669pld.81.1637700477066; Tue, 23
 Nov 2021 12:47:57 -0800 (PST)
MIME-Version: 1.0
References: <CAK2bqVJWOj=MOy++zNHzzF8UvmsGcOAtNxvosa60L2NMOAxnGg@mail.gmail.com>
 <CADnq5_NP81XJe0J9bBaFFaUL5YB7Y_OObYiJpQ+m9r_5sdBg=w@mail.gmail.com>
In-Reply-To: <CADnq5_NP81XJe0J9bBaFFaUL5YB7Y_OObYiJpQ+m9r_5sdBg=w@mail.gmail.com>
From: Chris Rankin <rankincj@gmail.com>
Date: Tue, 23 Nov 2021 20:47:45 +0000
Message-ID: <CAK2bqVKTqPCEE3+WM_hQY1TdZa9zNq36FSkTzvUT-SVEMCBTSQ@mail.gmail.com>
Subject: Re: [WARN][AMDGPU] Linux 5.15.4 with AMD Bonaire GPU
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002f22ba05d17adb76"
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
Cc: "for 3.8" <stable@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002f22ba05d17adb76
Content-Type: text/plain; charset="UTF-8"

Alas no, other than to observe that the issue is not present in 5.13.15,
but is present in 5.14.3; i.e. the last 5.13.x and first 5.14.x kernels
that I compiled myself.

Cheers,
Chris

On Tue, 23 Nov 2021 at 20:14, Alex Deucher <alexdeucher@gmail.com> wrote:

> On Sun, Nov 21, 2021 at 9:47 AM Chris Rankin <rankincj@gmail.com> wrote:
> >
> > Hi,
> >
> > i have found this warning in my vanilla 5.15.4 kernel's dmesg log:
> >
> > [   87.687139] ------------[ cut here ]------------
> > [   87.710799] WARNING: CPU: 1 PID: 1 at
> > drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x1c/0x266 [ttm]
> > [   87.718965] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
> > af_packet nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> > nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
> > nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat
> > ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
> > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle
> > iptable_raw iptable_security nfnetlink ebtable_filter ebtables
> > ip6table_filter ip6_tables iptable_filter bnep it87 hwmon_vid dm_mod
> > dax snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
> > snd_hda_codec_hdmi snd_hda_intel uvcvideo videobuf2_vmalloc
> > videobuf2_memops snd_intel_dspcfg snd_hda_codec snd_usb_audio
> > snd_usbmidi_lib snd_hwdep videobuf2_v4l2 snd_virtuoso snd_oxygen_lib
> > videobuf2_common btusb snd_mpu401_uart input_leds snd_hda_core
> > videodev btbcm snd_rawmidi btintel joydev snd_seq mc led_class
> > bluetooth ecdh_generic rfkill snd_seq_device ecc snd_pcm r8169
> > coretemp snd_hrtimer i2c_i801 psmouse
> > [   87.719024]  i2c_smbus pcspkr kvm_intel realtek kvm snd_timer
> > gpio_ich mdio_devres iTCO_wdt snd libphy mxm_wmi irqbypass soundcore
> > tiny_power_button lpc_ich i7core_edac acpi_cpufreq button wmi nfsd
> > auth_rpcgss nfs_acl lockd grace sunrpc binfmt_misc fuse configfs zram
> > zsmalloc ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
> > hid_microsoft usbhid sr_mod cdrom sd_mod amdgpu uhci_hcd
> > drm_ttm_helper ehci_pci ttm mfd_core ehci_hcd gpu_sched xhci_pci
> > xhci_hcd i2c_algo_bit crc32c_intel serio_raw drm_kms_helper
> > firewire_ohci ahci libahci pata_jmicron firewire_core libata crc_itu_t
> > cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops
> > cfbcopyarea cec rc_core scsi_mod usbcore drm bsg scsi_common
> > usb_common drm_panel_orientation_quirks ipmi_devintf ipmi_msghandler
> > msr sha256_ssse3 sha256_generic ipv6 crc_ccitt
> > [   87.876267] CPU: 1 PID: 1 Comm: systemd Tainted: G          I
>  5.15.4 #1
> > [   87.882109] Hardware name: Gigabyte Technology Co., Ltd.
> > EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
> > [   87.889800] RIP: 0010:ttm_bo_release+0x1c/0x266 [ttm]
> > [   87.893615] Code: 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 41 56
> > 41 55 41 54 4c 8d a7 90 fe ff ff 55 53 83 7f 4c 00 48 89 fb 48 8b 6f
> > e8 74 02 <0f> 0b 80 7b 18 00 48 8b 43 88 0f 85 ac 00 00 00 4c 8d 6b 90
> > 49 39
> > [   87.911829] RSP: 0018:ffffc90000023e00 EFLAGS: 00010202
> > [   87.915886] RAX: 0000000000000001 RBX: ffff888123a449c8 RCX:
> 000000000000004c
> > [   87.921825] RDX: 00000000000001f3 RSI: ffffffffa02ee0e5 RDI:
> ffff888123a449c8
> > [   87.927750] RBP: ffff88810d6652f0 R08: 0000000000000001 R09:
> 0000000000000003
> > [   87.933869] R10: 0000000040000000 R11: ffff888109970600 R12:
> ffff888123a44858
> > [   87.939767] R13: ffff888146e35ad0 R14: ffff888146dad6c0 R15:
> 0000000000000000
> > [   87.945604] FS:  00007f901262ab40(0000) GS:ffff888343c40000(0000)
> > knlGS:0000000000000000
> > [   87.952390] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   87.956837] CR2: 000055d9edfa8fa0 CR3: 0000000102180000 CR4:
> 00000000000006e0
> > [   87.962704] Call Trace:
> > [   87.963876]  <TASK>
> > [   87.964742]  amdgpu_bo_unref+0x15/0x1e [amdgpu]
> > [   87.968219]  amdgpu_gem_object_free+0x2b/0x45 [amdgpu]
> > [   87.972135]  drm_gem_dmabuf_release+0x11/0x1a [drm]
> > [   87.975792]  dma_buf_release+0x36/0x7d
> > [   87.978363]  __dentry_kill+0xf5/0x12f
> > [   87.980749]  dput+0xfc/0x136
> > [   87.982386]  __fput+0x17a/0x1cc
> > [   87.984234]  task_work_run+0x64/0x75
> > [   87.986615]  exit_to_user_mode_prepare+0x88/0x112
> > [   87.990111]  syscall_exit_to_user_mode+0x14/0x1f
> > [   87.993513]  do_syscall_64+0x7a/0x80
> > [   87.995873]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [   87.999798] RIP: 0033:0x7f9013160fdb
> > [   88.002129] Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 41 c3 48
> > 83 ec 18 89 7c 24 0c e8 33 81 f8 ff 8b 7c 24 0c 41 89 c0 b8 03 00 00
> > 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 81 81 f8 ff
> > 8b 44
> > [   88.020215] RSP: 002b:00007ffda9891d20 EFLAGS: 00000293 ORIG_RAX:
> > 0000000000000003
> > [   88.026698] RAX: 0000000000000000 RBX: 00007f901262a8f0 RCX:
> 00007f9013160fdb
> > [   88.032789] RDX: 0000000000000000 RSI: 000000055d9edfc6 RDI:
> 0000000000000069
> > [   88.038864] RBP: 0000000000000069 R08: 0000000000000000 R09:
> 000000000000007f
> > [   88.045044] R10: 0000000000000000 R11: 0000000000000293 R12:
> 0000000000000000
> > [   88.051033] R13: 000055d9ecadd680 R14: 000055d9eca96719 R15:
> 000055d9edf412f0
> > [   88.056868]  </TASK>
> > [   88.057758] ---[ end trace bf3184763fd2083a ]---
> >
> > I have seen a warning like this one in every dmesg log from 5.14.x
> > onwards, and it is clearly still present in the 5.15.x series too.
> >
> > My GPU is a Radeon R7 360 (Bonaire).
>
> Can you bisect?
>
> Alex
>

--0000000000002f22ba05d17adb76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Alas no, other than to observe that the issue is not =
present in 5.13.15, but is present in 5.14.3; i.e. the last 5.13.x and firs=
t 5.14.x kernels that I compiled myself.<br></div><div><br></div><div>Cheer=
s,</div><div>Chris<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 23 Nov 2021 at 20:14, Alex Deucher &l=
t;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Nov=
 21, 2021 at 9:47 AM Chris Rankin &lt;<a href=3D"mailto:rankincj@gmail.com"=
 target=3D"_blank">rankincj@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; i have found this warning in my vanilla 5.15.4 kernel&#39;s dmesg log:=
<br>
&gt;<br>
&gt; [=C2=A0 =C2=A087.687139] ------------[ cut here ]------------<br>
&gt; [=C2=A0 =C2=A087.710799] WARNING: CPU: 1 PID: 1 at<br>
&gt; drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x1c/0x266 [ttm]<br>
&gt; [=C2=A0 =C2=A087.718965] Modules linked in: nf_nat_ftp nf_conntrack_ft=
p cfg80211<br>
&gt; af_packet nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib<br>
&gt; nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct<br>
&gt; nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat<br>
&gt; ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat<br>
&gt; nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle<br=
>
&gt; iptable_raw iptable_security nfnetlink ebtable_filter ebtables<br>
&gt; ip6table_filter ip6_tables iptable_filter bnep it87 hwmon_vid dm_mod<b=
r>
&gt; dax snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio<br>
&gt; snd_hda_codec_hdmi snd_hda_intel uvcvideo videobuf2_vmalloc<br>
&gt; videobuf2_memops snd_intel_dspcfg snd_hda_codec snd_usb_audio<br>
&gt; snd_usbmidi_lib snd_hwdep videobuf2_v4l2 snd_virtuoso snd_oxygen_lib<b=
r>
&gt; videobuf2_common btusb snd_mpu401_uart input_leds snd_hda_core<br>
&gt; videodev btbcm snd_rawmidi btintel joydev snd_seq mc led_class<br>
&gt; bluetooth ecdh_generic rfkill snd_seq_device ecc snd_pcm r8169<br>
&gt; coretemp snd_hrtimer i2c_i801 psmouse<br>
&gt; [=C2=A0 =C2=A087.719024]=C2=A0 i2c_smbus pcspkr kvm_intel realtek kvm =
snd_timer<br>
&gt; gpio_ich mdio_devres iTCO_wdt snd libphy mxm_wmi irqbypass soundcore<b=
r>
&gt; tiny_power_button lpc_ich i7core_edac acpi_cpufreq button wmi nfsd<br>
&gt; auth_rpcgss nfs_acl lockd grace sunrpc binfmt_misc fuse configfs zram<=
br>
&gt; zsmalloc ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2<br>
&gt; hid_microsoft usbhid sr_mod cdrom sd_mod amdgpu uhci_hcd<br>
&gt; drm_ttm_helper ehci_pci ttm mfd_core ehci_hcd gpu_sched xhci_pci<br>
&gt; xhci_hcd i2c_algo_bit crc32c_intel serio_raw drm_kms_helper<br>
&gt; firewire_ohci ahci libahci pata_jmicron firewire_core libata crc_itu_t=
<br>
&gt; cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops<br=
>
&gt; cfbcopyarea cec rc_core scsi_mod usbcore drm bsg scsi_common<br>
&gt; usb_common drm_panel_orientation_quirks ipmi_devintf ipmi_msghandler<b=
r>
&gt; msr sha256_ssse3 sha256_generic ipv6 crc_ccitt<br>
&gt; [=C2=A0 =C2=A087.876267] CPU: 1 PID: 1 Comm: systemd Tainted: G=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I=C2=A0 =C2=A0 =C2=A0 =C2=A05.15.4 #1<br>
&gt; [=C2=A0 =C2=A087.882109] Hardware name: Gigabyte Technology Co., Ltd.<=
br>
&gt; EX58-UD3R/EX58-UD3R, BIOS FB=C2=A0 05/04/2009<br>
&gt; [=C2=A0 =C2=A087.889800] RIP: 0010:ttm_bo_release+0x1c/0x266 [ttm]<br>
&gt; [=C2=A0 =C2=A087.893615] Code: 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f =
c3 41 56<br>
&gt; 41 55 41 54 4c 8d a7 90 fe ff ff 55 53 83 7f 4c 00 48 89 fb 48 8b 6f<b=
r>
&gt; e8 74 02 &lt;0f&gt; 0b 80 7b 18 00 48 8b 43 88 0f 85 ac 00 00 00 4c 8d=
 6b 90<br>
&gt; 49 39<br>
&gt; [=C2=A0 =C2=A087.911829] RSP: 0018:ffffc90000023e00 EFLAGS: 00010202<b=
r>
&gt; [=C2=A0 =C2=A087.915886] RAX: 0000000000000001 RBX: ffff888123a449c8 R=
CX: 000000000000004c<br>
&gt; [=C2=A0 =C2=A087.921825] RDX: 00000000000001f3 RSI: ffffffffa02ee0e5 R=
DI: ffff888123a449c8<br>
&gt; [=C2=A0 =C2=A087.927750] RBP: ffff88810d6652f0 R08: 0000000000000001 R=
09: 0000000000000003<br>
&gt; [=C2=A0 =C2=A087.933869] R10: 0000000040000000 R11: ffff888109970600 R=
12: ffff888123a44858<br>
&gt; [=C2=A0 =C2=A087.939767] R13: ffff888146e35ad0 R14: ffff888146dad6c0 R=
15: 0000000000000000<br>
&gt; [=C2=A0 =C2=A087.945604] FS:=C2=A0 00007f901262ab40(0000) GS:ffff88834=
3c40000(0000)<br>
&gt; knlGS:0000000000000000<br>
&gt; [=C2=A0 =C2=A087.952390] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033<br>
&gt; [=C2=A0 =C2=A087.956837] CR2: 000055d9edfa8fa0 CR3: 0000000102180000 C=
R4: 00000000000006e0<br>
&gt; [=C2=A0 =C2=A087.962704] Call Trace:<br>
&gt; [=C2=A0 =C2=A087.963876]=C2=A0 &lt;TASK&gt;<br>
&gt; [=C2=A0 =C2=A087.964742]=C2=A0 amdgpu_bo_unref+0x15/0x1e [amdgpu]<br>
&gt; [=C2=A0 =C2=A087.968219]=C2=A0 amdgpu_gem_object_free+0x2b/0x45 [amdgp=
u]<br>
&gt; [=C2=A0 =C2=A087.972135]=C2=A0 drm_gem_dmabuf_release+0x11/0x1a [drm]<=
br>
&gt; [=C2=A0 =C2=A087.975792]=C2=A0 dma_buf_release+0x36/0x7d<br>
&gt; [=C2=A0 =C2=A087.978363]=C2=A0 __dentry_kill+0xf5/0x12f<br>
&gt; [=C2=A0 =C2=A087.980749]=C2=A0 dput+0xfc/0x136<br>
&gt; [=C2=A0 =C2=A087.982386]=C2=A0 __fput+0x17a/0x1cc<br>
&gt; [=C2=A0 =C2=A087.984234]=C2=A0 task_work_run+0x64/0x75<br>
&gt; [=C2=A0 =C2=A087.986615]=C2=A0 exit_to_user_mode_prepare+0x88/0x112<br=
>
&gt; [=C2=A0 =C2=A087.990111]=C2=A0 syscall_exit_to_user_mode+0x14/0x1f<br>
&gt; [=C2=A0 =C2=A087.993513]=C2=A0 do_syscall_64+0x7a/0x80<br>
&gt; [=C2=A0 =C2=A087.995873]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa=
e<br>
&gt; [=C2=A0 =C2=A087.999798] RIP: 0033:0x7f9013160fdb<br>
&gt; [=C2=A0 =C2=A088.002129] Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 =
41 c3 48<br>
&gt; 83 ec 18 89 7c 24 0c e8 33 81 f8 ff 8b 7c 24 0c 41 89 c0 b8 03 00 00<b=
r>
&gt; 00 0f 05 &lt;48&gt; 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 81 81=
 f8 ff<br>
&gt; 8b 44<br>
&gt; [=C2=A0 =C2=A088.020215] RSP: 002b:00007ffda9891d20 EFLAGS: 00000293 O=
RIG_RAX:<br>
&gt; 0000000000000003<br>
&gt; [=C2=A0 =C2=A088.026698] RAX: 0000000000000000 RBX: 00007f901262a8f0 R=
CX: 00007f9013160fdb<br>
&gt; [=C2=A0 =C2=A088.032789] RDX: 0000000000000000 RSI: 000000055d9edfc6 R=
DI: 0000000000000069<br>
&gt; [=C2=A0 =C2=A088.038864] RBP: 0000000000000069 R08: 0000000000000000 R=
09: 000000000000007f<br>
&gt; [=C2=A0 =C2=A088.045044] R10: 0000000000000000 R11: 0000000000000293 R=
12: 0000000000000000<br>
&gt; [=C2=A0 =C2=A088.051033] R13: 000055d9ecadd680 R14: 000055d9eca96719 R=
15: 000055d9edf412f0<br>
&gt; [=C2=A0 =C2=A088.056868]=C2=A0 &lt;/TASK&gt;<br>
&gt; [=C2=A0 =C2=A088.057758] ---[ end trace bf3184763fd2083a ]---<br>
&gt;<br>
&gt; I have seen a warning like this one in every dmesg log from 5.14.x<br>
&gt; onwards, and it is clearly still present in the 5.15.x series too.<br>
&gt;<br>
&gt; My GPU is a Radeon R7 360 (Bonaire).<br>
<br>
Can you bisect?<br>
<br>
Alex<br>
</blockquote></div>

--0000000000002f22ba05d17adb76--
