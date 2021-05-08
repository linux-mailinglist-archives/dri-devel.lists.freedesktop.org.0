Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A43773EA
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 22:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483CD89B9E;
	Sat,  8 May 2021 20:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923A89B9E;
 Sat,  8 May 2021 20:01:54 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so6949496oto.0; 
 Sat, 08 May 2021 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=PU30ZBFiv13gHE0SS2G3SAIXkJF2OmBGUDpL6SbzAj8=;
 b=XCylzsYxLucK7KJUyxyiltCkZzuG2i9r3Aec6/CZ9hqXYXNEVUAk29OOKWcfa9X+BX
 5CH7jh2qxSTQXlLho9eIviJYcL57YR0BQ9K5D/5kdq6X6QsHniVdTsohDLDDsmXjdTyK
 Xyh5pQSh08jtrntSeK4rHaAxW9OasNdVVYWfsdKoJfEETXgw5FjmCSKN6T2ksjjp21f7
 X0OVyjApl5MqIHotTOmeXr+2xanWE0D0RUTTNSfu4tMig3kJ1rQbLnVwEUVlpOz7cOs/
 ucIsCa5284aMnaVeBEhZa5JfkJWbyDmmAeAHWklFFG7q+hqf3poXi98IfEgzrDHTo5SP
 2Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:from:subject:cc:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=PU30ZBFiv13gHE0SS2G3SAIXkJF2OmBGUDpL6SbzAj8=;
 b=Hu01pCnMu8ppWGfTtKMBuzmp6JMoPkwIV85ML8JyFkzKxfwE6uUAnKgb8Xp2jysMQn
 A5eCTZF5X6e6g7Am2i+sPEghAP2paCgbMkTzh4Q0VQrbD7IBB1Juhg/NGVL1Ke/ZQB1c
 nuhqnAHL7bn8Q9SkD5BJ4Z+2+qrJiz3n38y+duuOFxw4fL/qTkzlDjMrIIRmgmLN+jry
 I+MGYL928KReNn67XIelUJeWBMK++dDGdPFw6cNrB21kRYLKwtMdkEgM9s+QWfOwird8
 N2t/t59du1wxePcKtSsu1iD+paqiQ591ZJsEmQJcOjdoDSskqu8oGn3q2pu9aLbvfizJ
 rvUw==
X-Gm-Message-State: AOAM531xOieHZz9XzbxUY5x9IaSL9LAfpxPEQ1Qk5aMCfeCDKXEg7HQp
 e79aTUXglA+Kpnylf6Fobrk=
X-Google-Smtp-Source: ABdhPJwr1xGS/rLU1sScHz6beI9MYZHLY29DHlvAZ+uEP1MQ9Ko4sw/uN0Sp2Zmsaw3rtEk0Jmfk9Q==
X-Received: by 2002:a9d:a6c:: with SMTP id 99mr14211293otg.60.1620504113402;
 Sat, 08 May 2021 13:01:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id x11sm1428694otr.36.2021.05.08.13.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 13:01:53 -0700 (PDT)
To: Ben Skeggs <bskeggs@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 nouveau@lists.freedesktop.org
From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: nouveau timeout errors with kernel 5.12
Message-ID: <e47a371b-0b23-da26-534c-a4fc866dca26@lwfinger.net>
Date: Sat, 8 May 2021 15:01:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Beginning with kernel 5.12 I started getting system hangs/freezes, particularly 
when starting the Chrome browser. At least some of these are logged as a timeout.

My hardware is a NVIDIA Corporation GF116 [GeForce GTX 550 Ti] [10de:1244] (rev 
a1). I tried to bisect the error, but the error does not show immediately, and I 
have little confidence in the bisection. For reference, my last bad commit was 
05fcc256 and my last good commit was 6fc90e18.

A typical error splat is:
: ------------[ cut here ]------------
: nouveau 0000:01:00.0: timeout
: WARNING: CPU: 3 PID: 1970 at 
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:90 
gf100_fifo_gpfifo_engine_fini+0x168/0x1b0 [nouveau]
: Modules linked in: af_packet vboxnetadp(O) vboxnetflt(O) vboxdrv(O) dmi_sysfs 
xfs raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor 
raid6_pq raid1 libcrc32c md_mod edac_mce_amd kvm_amd ccp hid_generic 
snd_hda_codec_realtek snd_hda_codec_generic kvm usbhid eeepc_wmi ledtrig_audio 
snd_hda_codec_hdmi snd_hda_intel irqbypass snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core asus_wmi snd_hwdep snd_pcm battery snd_timer 
sparse_keymap rfkill wmi_bmof pcspkr efi_pstore snd fam15h_power k10temp igb 
soundcore dca sp5100_tco i2c_piix4 acpi_cpufreq tiny_power_button nls_iso8859_1 
nls_cp437 vfat fat nfsd auth_rpcgss nfs_acl lockd grace sunrpc nfs_ssc fuse 
configfs uas usb_storage nouveau ohci_pci video drm_ttm_helper ttm i2c_algo_bit 
drm_kms_helper crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel 
aesni_intel syscopyarea sysfillrect sysimgblt crypto_simd fb_sys_fops cryptd cec 
rc_core xhci_pci xhci_pci_renesas xhci_hcd drm ehci_pci ohci_hcd
:  ehci_hcd usbcore mxm_wmi sr_mod cdrom wmi button sg dm_multipath dm_mod 
scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efivarfs
: CPU: 3 PID: 1970 Comm: gdbus Tainted: G        W  O      5.12.0-2-default #1 
openSUSE Tumbleweed
: Hardware name: To be filled by O.E.M. To be filled by O.E.M./970 PRO 
GAMING/AURA, BIOS 0901 11/07/2016
: RIP: 0010:gf100_fifo_gpfifo_engine_fini+0x168/0x1b0 [nouveau]
: Code: 8b 40 10 48 8b 78 10 48 8b 6f 50 48 85 ed 75 03 48 8b 2f e8 ca f3 d6 e4 
48 89 ea 48 c7 c7 1c b9 8a c0 48 89 c6 e8 f9 9b 05 e5 <0f> 0b 41 8b 46 38 85 c0 
0f 85 53 8c 07 00 48 8b bb d0 01 00 00 41
: RSP: 0018:ffff9fe282517a20 EFLAGS: 00010282
: RAX: 0000000000000000 RBX: ffff89c268a85400 RCX: ffff89c50ecda708
: RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff89c50ecda700
: RBP: ffff89c20116f1d0 R08: ffff89c51ef567a8 R09: 0000000000013ffb
: R10: 00000000ffffc000 R11: 3fffffffffffffff R12: 0000000000000000
: R13: ffff89c250c43de0 R14: ffff89c208350000 R15: 0000000000000000
: FS:  00007f376efb6640(0000) GS:ffff89c50ecc0000(0000) knlGS:0000000000000000
: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
: CR2: 00005567fe52cfa8 CR3: 00000001507c8000 CR4: 00000000000406e0
: Call Trace:
:  nvkm_fifo_chan_child_fini+0x79/0xf0 [nouveau]
:  nvkm_oproxy_fini+0x2c/0x90 [nouveau]
:  nvkm_object_fini+0xbc/0x150 [nouveau]
:  nvkm_object_fini+0x73/0x150 [nouveau]
:  nvkm_ioctl_del+0x2f/0x50 [nouveau]
:  nvkm_ioctl+0xe1/0x180 [nouveau]
:  nvif_object_dtor+0x5a/0x80 [nouveau]
:  nouveau_channel_del+0xad/0x160 [nouveau]
:  nouveau_abi16_chan_fini.constprop.0+0x10b/0x190 [nouveau]
:  nouveau_abi16_fini+0x2e/0x60 [nouveau]
:  nouveau_drm_postclose+0x4c/0xd0 [nouveau]
:  drm_file_free.part.0+0x1c9/0x230 [drm]
:  drm_release+0x65/0x110 [drm]
:  __fput+0x94/0x240
:  task_work_run+0x65/0xa0
:  do_exit+0x362/0xa20
:  do_group_exit+0x33/0xa0
:  get_signal+0x161/0x8b0
:  arch_do_signal_or_restart+0xef/0x830
:  ? __x64_sys_futex+0x13d/0x1c0
:  exit_to_user_mode_prepare+0xed/0x180
:  syscall_exit_to_user_mode+0x18/0x40
:  entry_SYSCALL_64_after_hwframe+0x44/0xae
: RIP: 0033:0x7f377ed6d5cf
: Code: Unable to access opcode bytes at RIP 0x7f377ed6d5a5.
: RSP: 002b:00007f376efb5a40 EFLAGS: 00000293 ORIG_RAX: 0000000000000007
: RAX: fffffffffffffdfc RBX: 00007f377eeae1e0 RCX: 00007f377ed6d5cf
: RDX: 00000000ffffffff RSI: 0000000000000003 RDI: 000055b2cd634480
: RBP: 000055b2cd634480 R08: 0000000000000000 R09: 0000000000000004
: R10: 0000000000000030 R11: 0000000000000293 R12: 0000000000000003
: R13: 00007f376efb5a84 R14: 00000000ffffffff R15: 000055b2cd634370
: ---[ end trace c85bfdc7ef3321c2 ]---
: nouveau 0000:01:00.0: fifo: channel 7 [ibus-extension-[1940]] kick timeout
: nouveau: ibus-extension-[1940]:00000000:0000906f: detach sw failed, -110
: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
: nouveau 0000:01:00.0: fifo: runlist update timeout
: nouveau 0000:01:00.0: ibus-x11[1942]: failed to idle channel 9 [ibus-x11[1942]]
: nouveau 0000:01:00.0: ibus-x11[1942]: failed to idle channel 9 [ibus-x11[1942]]
: ------------[ cut here ]------------

I will be happy to provide any additional material that may be needed.

Thanks,

Larry
