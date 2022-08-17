Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1059739C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 18:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62D99906;
	Wed, 17 Aug 2022 16:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E758942DD;
 Wed, 17 Aug 2022 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g7S+HCgUkbcyvwHaNgnlGuCfzudds+2a5baU/BUjvXE=; b=BNuPf0oQ3o0H+lnGwaMvy8m9Va
 2U8gn4ZOFRSSvGl/JQMPcmSG4sHav0SU4ier4en8tWzqkQ85QYPJPD69jToqQ0q4NgDEHEfMgtF29
 011wCLAEr/gAZgbdmtxlrhepPDBD0PWAXt9cWbXF5a0TuyD2y9aRh4jJSEQC3CjRLxOBm3ZAv6OLS
 MqwA6PsUMUMvKYEzqqzsOFoVbWw6vGPgoCugUcy1L5m74Q7LlzJ4nrd31vCQ92Jjd1/Jvd21BLInv
 v48ZGk8DoxOAUltroqvpfEDJx3L0QPX7o1yvqg/GBFWahCQOjsaj/dMjYDskinEoet+YKJUtRvS+t
 r5TohaCA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oOLaO-00AoqH-Bu; Wed, 17 Aug 2022 18:08:04 +0200
Date: Wed, 17 Aug 2022 15:07:51 -0100
From: Melissa Wen <mwen@igalia.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
Message-ID: <20220817160751.moqhebkiuiydraka@mail.igalia.com>
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3lobgvkimgp7exii"
Content-Disposition: inline
In-Reply-To: <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3lobgvkimgp7exii
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/17, Mikhail Gavrilov wrote:
> On Mon, Aug 15, 2022 at 3:37 PM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
> >
> > Thanks, I tested this patch.
> > But with this patch use-after-free problem happening in another place:
>=20
> Does anyone have an idea why the second use-after-free happened?
> From the trace I don't understand which code is related.
> I don't quite understand what the "Workqueue" entry in the trace means.

Hi Mikhail,

IIUC, you got this second user-after-free by applying the first version
of Ma=EDra's patch, right? So, that version was adding another unbalanced
unlock to the cs ioctl flow, but it was solved in the latest version,
that you can find here: https://patchwork.freedesktop.org/patch/497680/
If this is the situation, can you check this last version?

Thanks,

Melissa

>=20
> [ 408.358737] ------------[ cut here ]------------
> [ 408.358743] refcount_t: underflow; use-after-free.
> [ 408.358760] WARNING: CPU: 9 PID: 62 at lib/refcount.c:28
> refcount_warn_saturate+0xba/0x110
> [ 408.358769] Modules linked in: uinput snd_seq_dummy rfcomm
> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
> qrtr bnep sunrpc binfmt_misc snd_seq_midi snd_seq_midi_event mt76x2u
> mt76x2_common snd_hda_codec_realtek mt76x02_usb snd_hda_codec_generic
> iwlmvm snd_hda_codec_hdmi mt76_usb intel_rapl_msr snd_hda_intel
> mt76x02_lib intel_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi mt76
> snd_hda_codec vfat fat snd_usb_audio snd_hda_core edac_mce_amd
> mac80211 snd_usbmidi_lib snd_hwdep snd_rawmidi mc snd_seq btusb
> kvm_amd iwlwifi snd_seq_device btrtl btbcm libarc4 btintel eeepc_wmi
> snd_pcm iwlmei kvm btmtk asus_wmi ledtrig_audio irqbypass joydev
> snd_timer sparse_keymap bluetooth platform_profile rapl cfg80211 snd
> video wmi_bmof soundcore i2c_piix4 k10temp rfkill mei
> [ 408.358853] asus_ec_sensors acpi_cpufreq zram hid_logitech_hidpp
> amdgpu igb dca drm_ttm_helper ttm iommu_v2 crct10dif_pclmul gpu_sched
> crc32_pclmul ucsi_ccg crc32c_intel drm_buddy nvme typec_ucsi
> drm_display_helper ghash_clmulni_intel ccp typec nvme_core sp5100_tco
> cec wmi ip6_tables ip_tables fuse
> [ 408.358880] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
> amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
> pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
> amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
> pcc_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
> [ 408.358953] pcc_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1
> fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
> [ 408.358967] CPU: 9 PID: 62 Comm: kworker/9:0 Tainted: G W L -------
> --- 6.0.0-0.rc1.13.fc38.x86_64+debug #1
> [ 408.358971] Hardware name: System manufacturer System Product
> Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
> [ 408.358974] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sche=
d]
> [ 408.358982] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 408.358987] Code: 01 01 e8 d9 59 6f 00 0f 0b e9 a2 46 a5 00 80 3d 3e
> 7e be 01 00 75 85 48 c7 c7 70 99 8e 92 c6 05 2e 7e be 01 01 e8 b6 59
> 6f 00 <0f> 0b e9 7f 46 a5 00 80 3d 19 7e be 01 00 0f 85 5e ff ff ff 48
> c7
> [ 408.358990] RSP: 0018:ffffb124003efe60 EFLAGS: 00010286
> [ 408.358994] RAX: 0000000000000026 RBX: ffff9987a025d428 RCX: 0000000000=
000000
> [ 408.358997] RDX: 0000000000000001 RSI: ffffffff928d0754 RDI: 00000000ff=
ffffff
> [ 408.358999] RBP: ffff9994e4ff5600 R08: 0000000000000000 R09: ffffb12400=
3efd10
> [ 408.359001] R10: 0000000000000003 R11: ffff99952e2fffe8 R12: ffff9994e4=
ffc800
> [ 408.359004] R13: ffff998600228cc0 R14: ffff9994e4ffc805 R15: ffff9987a0=
25d430
> [ 408.359006] FS: 0000000000000000(0000) GS:ffff9994e4e00000(0000)
> knlGS:0000000000000000
> [ 408.359009] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 408.359012] CR2: 000027ac39e78000 CR3: 00000001a66d8000 CR4: 0000000000=
350ee0
> [ 408.359015] Call Trace:
> [ 408.359017] <TASK>
> [ 408.359020] process_one_work+0x2a0/0x600
> [ 408.359032] worker_thread+0x4f/0x3a0
> [ 408.359036] ? process_one_work+0x600/0x600
> [ 408.359039] kthread+0xf5/0x120
> [ 408.359044] ? kthread_complete_and_exit+0x20/0x20
> [ 408.359049] ret_from_fork+0x22/0x30
> [ 408.359061] </TASK>
> [ 408.359063] irq event stamp: 5468
> [ 408.359064] hardirqs last enabled at (5467): [<ffffffff91f2b9e4>]
> _raw_spin_unlock_irq+0x24/0x50
> [ 408.359071] hardirqs last disabled at (5468): [<ffffffff91f22d8c>]
> __schedule+0xe2c/0x16d0
> [ 408.359076] softirqs last enabled at (2482): [<ffffffff917acc28>]
> rht_deferred_worker+0x708/0xc00
> [ 408.359079] softirqs last disabled at (2480): [<ffffffff917ac717>]
> rht_deferred_worker+0x1f7/0xc00
> [ 408.359082] ---[ end trace 0000000000000000 ]---
>=20
>=20
> Full kernel log is here: https://pastebin.com/Lam9CRLV
>=20
> --=20
> Best Regards,
> Mike Gavrilov.

--3lobgvkimgp7exii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmL9EkoACgkQwqF3j0dL
ehzaHxAAqo/62RNz61uxfjszCUvA/LL0HSMy87gyhU/hBwcv2v+CwtCAF1bU/340
KVTFygFbB41+rOUz+0bCvyf5uAhkwYI3K1EKrijk6xjH4MSM5FesdJ5o1tNHrqLM
COFqOKJDfAtb6I83zVJvqtYQnTVGSevmRkUe0ZZ3LU/47PK/hOow3qAJiD2K0BT/
mvKBFzlh/2hUXUaj3qCmzEwDx8n7tGP8+qhiuTuIPEH2nZOd5fwtraMCdUpoxMvJ
1xl3RUkTTdCy8VXBCOU/EFcZFG15wpdo8xIc4NaD/x3mMw7hcEKmNgLNldUXYREQ
Tx0uXZMDr1+Df18QnPIsqNYFtXEFC0Oz5hJmKtblyblgQNSGjWl+VeALIN0TMEOv
W3mqvJf1BN8kdRUUANqTpYgk4W7uyzgE+Nk/I8UTsbLsd9ujxvUHCVP5N2Fh9Qmh
qE1rKZl8Sfl8fsj7fgHyJp4VHbKwWv6PDf5oZqbbHVYV83mGZ2SmfS5NjKVy1NpI
YqEGnNeiF0TaBXhs9ZHoklMHmAO0qTk4p6iCaTiCFK5DKHXJm31MTOmempqACFD0
bS90gH4DFHEk8Jz6Mw7sCmm+ssNTyGEGBZWD39PzgeroglRTIg0L/NuRmyPAnPl2
WmbYSRZemuAiJ1Hdl1gMbCoD4UHMyj8EWyhBuujIpTtN0kaJD9U=
=lGGo
-----END PGP SIGNATURE-----

--3lobgvkimgp7exii--
