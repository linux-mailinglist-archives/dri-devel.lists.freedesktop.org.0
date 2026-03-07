Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ATRCJqGrWk04AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A984E230AD9
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0C10E436;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ymail.com header.i=@ymail.com header.b="mUqcAdT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic321-27.consmr.mail.bf2.yahoo.com
 (sonic321-27.consmr.mail.bf2.yahoo.com [74.6.133.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E0410E345
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 05:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s2048;
 t=1772862313; bh=qfnVvxFsAViARBm27pDNfaS3yLo0BB6+D2kWP/nCpME=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=mUqcAdT7oOPRw7AOqphBDJMoWoUhbB2v9mZH+irvdfj/AX1VDmiTN26TYXNRJAtJyf9ONFxurH+dUAtkr4zsJQYjt8V8RtMrPlTLYgoYYfskY6i5ZvVFjE8mgsN6cjykWCf2ZXqgWdGVeo8cfPqCNea57YimSZZyT29fnv09FWl4IiKOzIwK2nwXwUpr0yQ2+IGjO4xsIQkv1FogDK8sX9Yz81M9KioCFFsE0FGnDoFmvypqGBC3p7tDh/XaQk2Y2LHCj7O+0YBaL5ldddqbuZbFpFIcpU23FnwF4XWTpmjxPKA68Q9USlP0swhZMj4QwZn5b9jGmt4/h37o+aR9wg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1772862313; bh=D7097GC36MBgRBJ2I+l/gzf9Q3BYeOZ/goOURQMXY4h=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=KT2jKt6ucnV/Vmy5Bv/xls1JHgGe5IullO0VCN9szH9NrPtWbUs71C7bjCi0liKfLiFP7l4HuDVE/PurBjoOFkXF8oOEsDZLjuO1LhAlMAMcmGnNUSlfrqNI99M9xJMwQQDClmpOtoQyQIF+x6meF0pTgk9sHGxpfQ0NA2nZYNU08X4HF5kyUtWQ7dxOq8eWC+EaPEyxM8E4iqNoPweaghJChld8qyRGTrwi+1TcqxqQO3gctYYxLPDtzPB+EdHeY3IxkKtuZQBLG7u9KkBKuckiCD2tl3gI1omKu2bcMDsjEOcBDoL0Hs3rDnGm2OFJKQ0wvbGhsMuQ3F72XyN5ug==
X-YMail-OSG: G.Dk4ncVM1ktbvY3wWuhfjYdJr0LyECkcbz4pMKxO3JKzd5KdZ43ZRqRXze40v7
 2oqV1TdcbXo1F.w1nC.rZjesCBh.9D9ACpvmYwUs9KboDUg13Bw4x9NbbMh_ZJFdqsvs2840qShi
 S9XWy7BxYCG0Sqq4jYmjBvlgnLDW2pOk9eEsUKQwGZ9kS162jQ6YdZaRgZ6v8fsLhY289Cnb0pUN
 p_W13LMKOiykyriJ6QJRGPLZqPLZJvil3X_TCy2sLxlqTAjVjww4RaTGDVzSp.R.ISuEeTyzBO6V
 RwYQHUuqqM0j.fLuG66pKN5s9Z.ZH78fmYoYKUrLxuznOhfYrI5OQFGBysIAJbQ93bQXu_RyLoCb
 yYjDSQH7z152kYhLHlRCjI5C2s3EmWDwh3IyR6VbNmakXnzg9yq5UIdP4Bt98kyHM6s3lNfC7lSA
 XFol4jTsgoVI9PiBX.ab76X2Xx8hibQwryAozuvHNQadrCXcIqt3F.a5k755EkdxxM0dH.6zoMTb
 1.Ay88SYbxa3XRupg36RgLgm0U9Kcv1UCgJl222Gq_OzDVx6Rqe.epHg.NgnJ0J4ttVA_D93Sck5
 O2I_yc5fO0Ih3sFcagTjS2StO2kQjn9lVcSu3K2H_Mj8qs._mO7dOCFrKCP7w_EjsCmg4VoUp8EI
 Sbaz9MLuyGYv5.frwbmGrLb6HtnEeUb1TZ9TsOJ9uK7ohTdhRB2Nu5Gg0vVlS7oSFBSKIgWx00b.
 K.MXvRjAHCDByagXafRpgNImrTJ_mW9ZtTXgL.ZKjskR7U8zYh8VF7VcnwVP0CPrBfNxMPUZrF1P
 F1qgFQpdAkiPF7CEg67QVDEJvkRDd.4XhnfyaB89V5ifTBjyzeQ1jH88xX9El4nFdZ817p4a6Py4
 WWR549nOxr77BinOPGK3FxVHIptmdH1gNoC37WMjLmcpadfXkeHYvdxMne_KZ9aerYoTSEHaXI9n
 VDHCqQupOO.oEmJz55aBWcF_wdiycJsDUX5I_2peUoIXd307BCouxu8DdblcMlb.fd4EDmHM6MGI
 SNPjnSDsP6m_a4obujToVaVike8hQ3KY0YvGDSkf1o_h5OeniE1DiLSMvGK8ejH48Xjqp2zBwy6O
 2bKyYDdx4LCUOFwuTpIqRSHY9uatGQ3Yw6aALAafFME6t18alOtmGe5gV4NcS3Q7ABtoelmNUXAo
 0amJ3.t6Zzt6tUG_Hya2JrbjY1V2prgALbZemRD0owJh8LmVstxSmmUZ0fQwPayxEBVSeMbkEfGC
 GopyR6BXncrxl_iIWZT77SUi.PhBoKbeiv3Srr1F4l5FR8_Q.0Fx.qlIDaRDv1GHdLtKMJHb1mhH
 whCc78SPKVHNWyS5KY2PcANamNsvVFzti79CWiBdFNWTDNuqZnQdg6J3JU_YY3aYE8Bu34ugztoa
 iICnjtJm_8EZzyHfqoY_Q5NXl8vEsd.m7PXyFRjAAyiz4YLVNcFsf7iK4GNso.k2H62QLBfx3Dwf
 GZoWTTdtXgZ5q4.OwPkymnX91MJs56yqQ_YdElNop.7OHieV2LWGSOhW2dhyPOUMYZa5hf3fCniB
 DCo4tdVVRyHUEUyQS0T2oBGUgr2Qi5qoXSfgrsZDrLsoT3f.tfgKQc2hu9hWZvFsHlPBBWnOVkpZ
 t.epVyrZu6PrFWqOIWF0ih3O0n8UWLiOuuqMqMHEWymaoMyByOeREmZiKIExVO1PFtmuA6Eu1dFs
 unUw5L_xf55TyP5ymgO5YBbEdpdTquTmx74aee6o6RxWVUD6gk.nuUQbhLVszZcKqNHOizyiqyeN
 jLRKq1pOc5NyHeNFdAsgpeXNj1117Z3w1uYLw6zngffK6i2at3RKYM8kwXKDe6W9zk44t8tNqCbL
 YHiqj1tPiHm9BnnbmTnFCeNC5raZ.fAqZ0DwZ5RIFewfPADMPZQG_zEgcryMwuHUW_nNrvUDMwnF
 EpkeCO0GH9slNLw2xCgBSmHYJSPAh3kiv1i3xI.fVHzC8OTkTjvf9wkfouTtwu7Xol_gSuNB9anB
 i9t7QEox4.SP8R1mq9RfNK5jzdVncZHY8vo_gt9HdirPctW7h8mPiamKEQOVhMlRU3PrYRZoOz_J
 cI5EC9z9ptXw1Df3tJz2Dl5PZ1Pk8nvZ9YEsuoJent.sRq5Lz_MPMpADTw7H2WlL8kan_0fwfrPK
 6M3d84C4RJ13mLyCjBzsO1FC_6gViWYHQ2hDPpkeGdHMm4cbia2hnb4FWYVhOxPUt57Wg4.NUiYv
 PNrNvv7RvjDSFMQ--
X-Sonic-MF: <neotheuser@ymail.com>
X-Sonic-ID: 026cbf3f-0bbb-457b-ad01-af6ff09e8767
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic321.consmr.mail.bf2.yahoo.com with HTTP; Sat, 7 Mar 2026 05:45:13 +0000
Date: Sat, 7 Mar 2026 05:45:11 +0000 (UTC)
From: Alec Ari <neotheuser@ymail.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <1147950918.4095111.1772862311801@mail.yahoo.com>
Subject: atomic remove_fb failed with -22
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1147950918.4095111.1772862311801.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.25198 YMailNovation
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: A984E230AD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[32];
	DMARC_POLICY_ALLOW(-0.50)[ymail.com,reject];
	R_DKIM_ALLOW(-0.20)[ymail.com:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neotheuser@ymail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FREEMAIL_FROM(0.00)[ymail.com];
	DKIM_TRACE(0.00)[ymail.com:+]
X-Rspamd-Action: no action

Hello,

I am seeing this warning on the 6.19 fedora and custom mainline kernels with the AMDGPU driver. This is on a Radeon R9 290.

[ 20.184650] atomic remove_fb failed with -22
[ 20.184652] WARNING: drivers/gpu/drm/drm_framebuffer.c:1176 at drm_framebuffer_remove+0x343/0x500, CPU#13: kworker/13:0/83
[ 20.184661] Modules linked in: af_packet snd_hrtimer nft_ct nf_conntrack nf_defrag_ipv4 nf_tables vfat fat xfs mt76x2u mt76x2_common mt76x02_usb mt76x02_lib mt76_usb mt76 ma
c80211 libarc4 sha256 cfg80211 r8169 realtek mdio_devres bfq libphy mdio_bus snd_hda_codec_alc662 snd_hda_codec_realtek_lib snd_hda_codec_generic led_class snd_hda_codec_atihdm
i snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_seq snd_seq_device snd_pcm snd_timer snd soundcore mousedev evdev loop nfnetlink f2fs hid_gen
eric usbhid hid amdgpu sr_mod sd_mod cdrom drm_panel_backlight_quirks hwmon mfd_core drm_buddy drm_suballoc_helper video drm_exec i2c_algo_bit drm_display_helper ahci nvme cec
libahci backlight nvme_core gpu_sched xhci_pci amdxcp drm_client_lib libata xhci_hcd drm_ttm_helper scsi_mod drm_kms_helper usbcore bsg ttm scsi_common usb_common wmi ntsync fu
se
[ 20.184710] CPU: 13 UID: 0 PID: 83 Comm: kworker/13:0 Not tainted 6.19.5-RYZEN #1 PREEMPTLAZY 
[ 20.184713] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470 GAMING PLUS (MS-7B79), BIOS A.M7 08/28/2025
[ 20.184715] Workqueue: events drm_mode_rmfb_work_fn
[ 20.184718] RIP: 0010:drm_framebuffer_remove+0x346/0x500
[ 20.184720] Code: e7 be 03 00 00 00 e8 39 2c f1 ff e9 5c fd ff ff 48 8d 7c 24 18 e8 3a b2 00 00 41 bd f4 ff ff ff 48 8d 3d 9d 9b 65 00 44 89 ee <67> 48 0f b9 3a 48 8b 3c 24
e9 3e 01 00 00 48 8b 3c 24 45 85 ed 0f
[ 20.184722] RSP: 0018:ffffc9000039bd90 EFLAGS: 00010282
[ 20.184724] RAX: ffff8881008f0e01 RBX: ffffc9000039bda8 RCX: ffff8881008f0efe
[ 20.184725] RDX: 0000000000001bcd RSI: 00000000ffffffea RDI: ffffffff81cd4510
[ 20.184726] RBP: ffff888121b00010 R08: 0000000000000000 R09: 0000000000000002
[ 20.184727] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888128fff280
[ 20.184728] R13: 00000000ffffffea R14: 00000000000000a0 R15: ffff888121b002d0
[ 20.184730] FS: 0000000000000000(0000) GS:ffff88889cf4e000(0000) knlGS:0000000000000000
[ 20.184731] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 20.184732] CR2: 00007f8cf3d81c70 CR3: 0000000109dc7000 CR4: 00000000003506f0
[ 20.184734] Call Trace:
[ 20.184736] <TASK>
[ 20.184739] drm_mode_rmfb_work_fn+0x33/0x90
[ 20.184742] process_scheduled_works+0x1b1/0x300
[ 20.184746] worker_thread+0x24a/0x2f0
[ 20.184748] ? pr_cont_work+0x1b0/0x1b0
[ 20.184749] kthread+0x237/0x290
[ 20.184752] ? kthread_blkcg+0x30/0x30
[ 20.184753] ret_from_fork+0xad/0x510
[ 20.184756] ? __switch_to+0x12c/0x3d0
[ 20.184758] ? kthread_blkcg+0x30/0x30
[ 20.184759] ret_from_fork_asm+0x11/0x20
[ 20.184762] </TASK>

Please CC me directly as I am not on the mailing list, thanks!

Alec
