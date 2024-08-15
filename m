Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797A953981
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 19:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAAE10E4CE;
	Thu, 15 Aug 2024 17:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="BtbN0gqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Thu, 15 Aug 2024 17:54:16 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F073E10E4CE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1723744455; x=1724349255; i=christian@heusel.eu;
 bh=i17Do2CHDdhiq+K0XPxEeh54Rx7NpaU9ydKHVt+MESs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
 MIME-Version:Content-Type:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BtbN0gqxYb2FXZdviPQwLY5j04BD/XvA6bECbxl8lBd4a4ebFz46fLBEMN20kfrw
 01H6jw3SQptmTWXACgiL8H16XqAsrcg/BWTTTfr6cmZLkF6MZPFH8LXlcq/Zi6VQ4
 XK1SECbmTjZinMXCSlAzWZabnYLLJA6hvhFY1MhMGagnGoHkVLyWCCiDyGipMhjYo
 MJ7taNLlipSIa9/TbS5Z6bqJL/BdXjclb6wogpeuB1xHa6jG8Y2W7IUZO/27PQGA3
 ZQ0spV+jM5eLD3QwA+OBdm+vUV8zBnmd5POmT9YGd2lguZIVzHYb41aT8WTXunM8I
 Mjr2VgEqK5O6VZDDDA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([93.196.140.133]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MdNLi-1s5aoy3DQO-00kYMC; Thu, 15 Aug 2024 19:48:48 +0200
Date: Thu, 15 Aug 2024 19:48:47 +0200
From: Christian Heusel <christian@heusel.eu>
To: Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>, 
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 dri-devel@lists.freedesktop.org
Cc: Brad Spengler <spender@grsecurity.net>, rdkehn@gmail.com, 
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
Message-ID: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xeshpdgka26cyf6x"
Content-Disposition: inline
X-Provags-ID: V03:K1:JUPgxU1ZmsfwMUV62viBWTiW20EgwxgFi3H0LoPMYdVQhtzV9P8
 W9vkJ34+Ux+q7q7W4iDCxi6Hpqj1kvSbOO5yZu6LAvr29WeKtNxFLjV+MZ0Z6zVNXgfaUro
 nvreKBZVDlkoUmXnG4ZbKnwYdyCRLgc3NLOCxV5sqwygl6VOEzjHnQhJabTgInOcAq+Dp4/
 weisKGI7ImDuFclJHHjgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uSoygrvlxLc=;IuKl1QxzSjIJ9wG1CZWYlwkFNLG
 hIi6h2MlV4fel+SCeNH4ItqR+hnz081y7rhVmrs0ev836AVXtiT8WOCitd1NSxhujLtBd1Sw+
 LdygNJePOEFMXUVlIr7f+9kKhQFp/McouY4uAeAG5eVT6M9//AXyv2bvg5Lxq6CFpiw4u7Vjh
 TMhn1JwJvjmP/VlbRNcjaW7O9f0zT9UrmC1UhS3cu/tqdQwQVGLSnS34Kt5qGEsWjZwwgKMt+
 ZaLsz82EMprjseQedx5cV4KGRaahG1QtbbC4b5afXQS0wBvmcJQMH1sTtsva1iC7FUmQ5lD82
 twAY3zVXiNnOUcnFyVFxMillV1qKFn7VrCz15wUXtN90xrZUgJW9/0xmCwEVkq6L7Nf3bmDHE
 iNVDsrlj8XrTH68B+KdNznrhkYr2AlHb7M6yti3Mr4wQJdRQzSD96na+SUZczeEZlmGyEdiTt
 HACfDWRjVG4ESl97XkMc1YUCR7hwEyjJsyRTeWfS5CGsxJ8M0c8l5UCh4DQcRhp3+V8uBSf85
 fAnifvi6EeQls8iiOGoZ4z2wtT8lE5oIpGYt5CmHq4rGhncRo+cI4u07vQvTP2Knhg+CuNDiX
 Tuh1T7XuJS2HdI3IL2NtTVhqHl5AkPyViqrwZd4u9xJQrXA5uB9HXP4Q7pIvOYrZGBuTQuA6y
 WAcwDfdcr/xzc6bm/6bYeRcjFgzme9aKXSYz+c3C3iyxgQFUSOkyeODB9Kx8t610cfU3dDOLL
 GXN27Nt1IyYR/vGZ6AtbYSjgEoYqyNEzg==
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


--xeshpdgka26cyf6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Zack,

the user rdkehn (in CC) on the Arch Linux Forums reports that after
updating to the 6.10.4 stable kernel inside of their VM Workstation the
driver crashes with the error attached below. This error is also present
on the latest mainline release 6.11-rc3.

We have bisected the issue together down to the following commit:

    d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")

Reverting this commit on top of 6.11-rc3 fixes the issue.

While we were still debugging the issue Brad (also CC'ed) messaged me
that they were seeing similar failures in their ESXi based test
pipelines except for one box that was running on legacy BIOS (so maybe
that is relevant). They noticed this because they had set panic_on_warn.

Cheers,
Chris

---

#regzbot introduced: d6667f0ddf46
#regzbot title: drm/vmwgfx: driver crashes due to command buffer error
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=298491

---

dmesg snippet:
[   13.297084] ------------[ cut here ]------------
[   13.297086] Command buffer error.
[   13.297139] WARNING: CPU: 0 PID: 186 at drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:399 vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx]
[   13.297160] Modules linked in: uas usb_storage hid_generic usbhid mptspi sr_mod cdrom scsi_transport_spi vmwgfx serio_raw mptscsih ata_generic atkbd drm_ttm_helper libps2 pata_acpi vivaldi_fmap ttm mptbase crc32c_intel xhci_pci intel_agp xhci_pci_renesas ata_piix intel_gtt i8042 serio
[   13.297172] CPU: 0 PID: 186 Comm: irq/16-vmwgfx Not tainted 6.10.4-arch2-1 #1 517ed45cc9c4492ee5d5bfc2d2fe6ef1f2e7a8eb
[   13.297174] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
[   13.297175] RIP: 0010:vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx]
[   13.297186] Code: 01 00 01 e8 ba 8c 4f f9 0f 0b 4c 89 ff e8 40 fb ff ff e9 9d fe ff ff 48 c7 c7 99 d9 3f c0 c6 05 52 2f 01 00 01 e8 98 8c 4f f9 <0f> 0b e9 1f fe ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[   13.297187] RSP: 0018:ffffb9c1805e3d78 EFLAGS: 00010282
[   13.297188] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000003
[   13.297189] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
[   13.297190] RBP: ffff907fc8274c98 R08: 0000000000000000 R09: ffffb9c1805e3bf8
[   13.297191] R10: ffff9086dbdfffa8 R11: 0000000000000003 R12: ffff907fc4db5b00
[   13.297192] R13: ffff907fc83fd318 R14: ffff907fc8274c88 R15: ffff907fc83fd300
[   13.297193] FS:  0000000000000000(0000) GS:ffff9086dbe00000(0000) knlGS:0000000000000000
[   13.297194] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   13.297194] CR2: 0000774dc57671ca CR3: 00000006b9e20005 CR4: 00000000003706f0
[   13.297196] Call Trace:
[   13.297198]  <TASK>
[   13.297199]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297209]  ? __warn.cold+0x8e/0xe8
[   13.297211]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297221]  ? report_bug+0xff/0x140
[   13.297222]  ? console_unlock+0x84/0x130
[   13.297225]  ? handle_bug+0x3c/0x80
[   13.297226]  ? exc_invalid_op+0x17/0x70
[   13.297227]  ? asm_exc_invalid_op+0x1a/0x20
[   13.297230]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297238]  ? vmw_cmdbuf_ctx_process+0x268/0x270 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297245]  vmw_cmdbuf_man_process+0x5d/0x100 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297253]  vmw_cmdbuf_irqthread+0x25/0x30 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297261]  vmw_thread_fn+0x3a/0x70 [vmwgfx a4fe13044bca4eda782d964fb8c4ca15afb325e9]
[   13.297271]  irq_thread_fn+0x20/0x60
[   13.297273]  irq_thread+0x18a/0x270
[   13.297274]  ? __pfx_irq_thread_fn+0x10/0x10
[   13.297276]  ? __pfx_irq_thread_dtor+0x10/0x10
[   13.297277]  ? __pfx_irq_thread+0x10/0x10
[   13.297278]  kthread+0xcf/0x100
[   13.297281]  ? __pfx_kthread+0x10/0x10
[   13.297282]  ret_from_fork+0x31/0x50
[   13.297285]  ? __pfx_kthread+0x10/0x10
[   13.297286]  ret_from_fork_asm+0x1a/0x30
[   13.297288]  </TASK>
[   13.297289] ---[ end trace 0000000000000000 ]---

--xeshpdgka26cyf6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAma+P38ACgkQwEfU8yi1
JYVwiA/9G36ZEUXT70hvlbG4U2Z7QA7bWC90b8QurNshc6Xr7tmJuLcf79HlNo4l
sJdDhUQg1L2e9wKzaBMcUOZ5lSRZ3SY5/ga6MX6bODNcxqtwif0BVT0BCWdb1qPl
zlmpE3YIkf4PsaWmrQJQJqP83aB7rl0xPv7XAHD2W6sYE15nbi2hzg6wygIfJKK7
Vv0UgYAINiVMHX0i8lH+cmtXc9bQSHDHMsZRxpvor70IrWvKFBAaztXkttAqG8LK
bDC3MPysbnOwY2wPuAWbTCw1Sll1zoPlEOPn3CaNQWBOFhzXj4JkRooJLmBxWKsc
/D423XYX2/fto5MOt2WLKeg/lb+xImLpUyVB3J+6saeuNWyIP+7/tBOr8KKlDhWj
2py/ArAOxwDFth5f1XeqRutUgyC2loPf9gQ+TiFSqCbkKVtG99ApY1VsctKsrXVW
t8/d1OCq7xJOOHc8MJN+gKWfT8gJokFG+g5TsHPO+QOrGEX4iJ/dUbLNWomO871M
6wZb88FazgBRAQdS0UUno8AF+GypG5BA55iN+ltQ81V5PEunfwB2vcB4ebNE5ISm
27bM3cS1w42ov7T3O16wIn7eOenhbcM8ppNlyvQBOMJzSRXk1YwC9H85RgVYR3uC
sPgw+g5tyj4OG/5LS9Ow2mY735c3TGCddC+kkkrb4NFtJhi1RvQ=
=d3pZ
-----END PGP SIGNATURE-----

--xeshpdgka26cyf6x--
