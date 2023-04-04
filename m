Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BD6D5B73
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931B10E1F8;
	Tue,  4 Apr 2023 09:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D0D10E1F8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 09:02:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PrMGJ73z5z4wj7;
 Tue,  4 Apr 2023 19:02:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1680598937;
 bh=Fg1IEgg00jbj6kC4Xvhi2Dhkw2r/BzGnqSbvMCetg+Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XrDnCBxmaDrF1D+E1yWRIwJ0FutbdU/49/X6lGjjZOxLApT7CpF5QFgmpcYmaflRu
 FQ5sDalVMMdyCMlPOeh5Yk1dRZA/krvBF1cv35BWEWkkG9pXvOFuoDo9bLn6+xlOX8
 VRtnff2v/WbO2+O4rnuY8qxMoRR3jWQcqoroZ88zDhyQUQB1h5OeCNu8XmX0f7Sm0J
 eliD1kq/l8KIJZLRYtmx8cOz/wkMZxHAnXd/39nGc/yItQY33dOQWgzB2SjHo915+E
 wZr9d2kD0bKTFZqd7fta/PljwwX007R3Eo9MkJHVbc6NySSelky5ON3TV8RbuJric7
 pSm3G/+lBLWGw==
Date: Tue, 4 Apr 2023 19:02:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Aithal, Srikanth" <sraithal@amd.com>
Subject: Re: next-20230404: amd64: drm_crtc_next_vblank_start - kernel NULL
 pointer dereference, address: 0000000000000074
Message-ID: <20230404190215.6a480861@canb.auug.org.au>
In-Reply-To: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
References: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QELA+RTmtD/5gXWGj0yRgMi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-next@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QELA+RTmtD/5gXWGj0yRgMi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Srikanth,

[Just cc'ing a few people who may be able to help]

On Tue, 4 Apr 2023 13:26:47 +0530 "Aithal, Srikanth" <sraithal@amd.com> wro=
te:
>
> Hello,
>=20
> Observing below kernel crash on AMD arch, from next-20230330 onwards till=
 recent build [next-20230404]:
>=20
> [   68.282610] BUG: kernel NULL pointer dereference, address: 00000000000=
00074
> [   68.282611] #PF: supervisor read access in kernel mode
> [   68.282613] #PF: error_code(0x0000) - not-present page
> [   68.282614] PGD 0 P4D 0
> [   68.282615] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   68.282618] CPU: 24 PID: 905 Comm: kworker/24:1 Not tainted 6.3.0-rc5-=
next-20230403next-20230403 #1
> [   68.282620] Hardware name: Dell Inc. PowerEdge R6515/07PXPY, BIOS 2.8.=
5 08/18/2022
> [   68.282621] Workqueue: events fbcon_register_existing_fbs
> [   68.282626] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
> [   68.282653] Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 4=
8 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <=
8b> 53 74 85 d2 74 3f 8b 43 78 85 c0 74 38 31 d2 49 89 f4 e8 1c ff
> [   68.282655] RSP: 0018:ffffb30e0fbf7b00 EFLAGS: 00010246
> [   68.282656] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
> [   68.282657] RDX: ffff896b06f26000 RSI: ffffb30e0fbf7b20 RDI: ffff896b0=
6f26928
> [   68.282657] RBP: ffffb30e0fbf7b10 R08: ffff898a7fcd4000 R09: ffff896b1=
078f580
> [   68.282658] R10: 0000000000000100 R11: 0000000000000000 R12: 000000000=
0000000
> [   68.282659] R13: ffff896b12280600 R14: 0000000000000000 R15: ffff896b2=
f375330
> [   68.282659] FS:  0000000000000000(0000) GS:ffff898a00400000(0000) knlG=
S:0000000000000000
> [   68.282660] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   68.282661] CR2: 0000000000000074 CR3: 00000001513b8001 CR4: 000000000=
0770ee0
> [   68.282662] PKRU: 55555554
> [   68.282663] Call Trace:
> [   68.282664]  <TASK>
> [   68.282667]  drm_atomic_helper_wait_for_fences+0x87/0x1f0 [drm_kms_hel=
per]
> [   68.282679]  ? drm_gem_begin_shadow_fb_access+0x29/0x40 [drm_kms_helpe=
r]
> [   68.282691]  drm_atomic_helper_commit+0x9e/0x150 [drm_kms_helper]
> [   68.282701]  drm_atomic_commit+0x9d/0xd0 [drm]
> [   68.282722]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   68.282745]  drm_client_modeset_commit_atomic+0x1e2/0x220 [drm]
> [   68.282767]  drm_client_modeset_commit_locked+0x5b/0x170 [drm]
> [   68.282788]  drm_client_modeset_commit+0x2a/0x50 [drm]
> [   68.282808]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xa1/0xd0 [dr=
m_kms_helper]
> [   68.282819]  drm_fb_helper_set_par+0x3d/0x70 [drm_kms_helper]
> [   68.282829]  fbcon_init+0x27d/0x500
> [   68.282831]  visual_init+0xd5/0x140
> [   68.282834]  do_bind_con_driver+0x1a0/0x3b0
> [   68.282836]  do_take_over_console+0x112/0x1b0
> [   68.282838]  do_fbcon_takeover+0x60/0xc0
> [   68.282840]  do_fb_registered+0x1bc/0x1d0
> [   68.282842]  fbcon_register_existing_fbs+0x51/0x90
> [   68.282843]  process_one_work+0x215/0x430
> [   68.282847]  worker_thread+0x38/0x3d0
> [   68.282848]  ? __pfx_worker_thread+0x10/0x10
> [   68.282850]  kthread+0xfd/0x130
> [   68.282852]  ? __pfx_kthread+0x10/0x10
> [   68.282853]  ret_from_fork+0x2c/0x50
> [   68.282856]  </TASK>
> [   68.282857] Modules linked in: stp llc nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set=
 nf_tables nfnetlink sunrpc nls_iso8859_1 ipmi_ssif intel_rapl_msr intel_ra=
pl_common amd64_edac kvm_amd kvm crct10dif_pclmul crc32_pclmul ghash_clmuln=
i_intel sha512_ssse3 aesni_intel acpi_ipmi crypto_simd cryptd ipmi_si ccp r=
apl sp5100_tco ipmi_devintf input_leds joydev wmi_bmof pcspkr efi_pstore i2=
c_piix4 k10temp ipmi_msghandler acpi_power_meter evbug mac_hid sch_fq_codel=
 xfs libcrc32c hid_generic usbkbd usbmouse usbhid hid mgag200 drm_kms_helpe=
r syscopyarea sysfillrect sysimgblt i2c_algo_bit drm_shmem_helper drm mpt3s=
as tg3 raid_class scsi_transport_sas wmi msr autofs4
> [   68.282891] CR2: 0000000000000074
> [   68.282892] ---[ end trace 0000000000000000 ]---
> [   68.302761] pstore: backend (erst) writing error (-28)
> [   68.302763] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
>=20
>=20
> Commit d39e48ca80c0  is causing the issue. I have verified same issue exi=
sts on https://gitlab.freedesktop.org/drm/msm [tag: dma-fence-deadline].
>=20
> Thanks,
> Srikanth Aithal <sraithal@amd.com>



--=20
Cheers,
Stephen Rothwell

--Sig_/QELA+RTmtD/5gXWGj0yRgMi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQr55gACgkQAVBC80lX
0Gy3iwgAgHbK/99rubJMumiuUUzRb4Yr41YKSCycEaCgj5I4cjf6V1M03XsV4CW0
s8+A1AQM28YU1qbEYMUji3t9G4Wv+4SD5D6esDUT91gS1n+DwxrxFMB3VR5HYm8C
KldTYduw+xfBq8J4l5LPQJCfMxgmabaVw5NY+LgsScN4mCKaS118Pi1entuEXrhx
Eay6Y4XFZgAwS0RX9SOpmTu1Aesx1JXmrDNYRHQXJcerpFkDVo6CeZA8isjcXxSG
keTcSeefk3M89MyXxku32CPxGrPuuMokHAlWBOx3NhqpDnFyyvWooeavi+Tmlg0M
Kdqu9ylg/r4BhdWiAuBuV/M4FTJriA==
=67gh
-----END PGP SIGNATURE-----

--Sig_/QELA+RTmtD/5gXWGj0yRgMi--
