Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AD2EC181
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 17:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE4989C19;
	Wed,  6 Jan 2021 16:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AC189C19
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=khS/FLphc7R/IbLm7Ll2vF9nSPuMOBjpWH9ZNVCML3Q=; b=MuI+QnkdInfWYmlY7nVg/lwuvZ
 /g+J+wL8a+/BnK74XR4MqNgx0o2t8iGtsUqItk+Sq3XZhyhPss1rgEetJqM8BORJ8nsktvyYgH/ia
 t4iOjK3e3tvSSC1kFiXfxFzHgsUujTLZw+Y42AaBK0v+8t8O48Vfda8I0K7yGk0Y+1wvBMsZR6ESV
 TMw9kcWuFvTRNL4Gq0naqDK3KWaDiZgPJF3yj5REvmJSjGmm7dC3dh/D4RgsKstRvZonjBMtZ41YV
 0ea/AZamhD1i0uoIIw5chMKqsAZqL9nehiqk5RvPM+bGw0IvH/HkH3OnroRCNDGgRmV36c7Nkdd21
 43bp8CEg==;
Received: from [54.239.6.177] (helo=freeip.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxC4s-0005yf-Kt; Wed, 06 Jan 2021 16:54:30 +0000
Message-ID: <1b4a03ee5b5c0fc08063c5924ebbaef7a2fb7dce.camel@infradead.org>
Subject: Re: 5.11-rc1 TTM list corruption
From: David Woodhouse <dwmw2@infradead.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Borislav Petkov <bp@alien8.de>
Date: Wed, 06 Jan 2021 16:54:27 +0000
In-Reply-To: <fa11e930-d8ee-a291-7d6a-6fdd6653ffa8@amd.com>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic> <20210105110852.GA1052081@hr-amd>
 <20210105114351.GD28649@zn.tnic> <20210105122026.GA227519@hr-amd>
 <fa11e930-d8ee-a291-7d6a-6fdd6653ffa8@amd.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1362356225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1362356225==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-lCgB89qt5rXK7xuWWiWX"


--=-lCgB89qt5rXK7xuWWiWX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-01-05 at 16:40 +0100, Christian K=C3=B6nig wrote:
> Am 05.01.21 um 13:20 schrieb Huang Rui:
> > On Tue, Jan 05, 2021 at 07:43:51PM +0800, Borislav Petkov wrote:
> > > On Tue, Jan 05, 2021 at 07:08:52PM +0800, Huang Rui wrote:
> > > > Ah, this asic is a bit old and still use radeon driver. So we didn'=
t
> > > > reproduce it on amdgpu driver. I don't have such the old asic in my=
 hand.
> > > > May we know whether this issue can be duplicated after SI which is =
used
> > > > amdgpu module (not sure whether you have recent APU or GPU)?
> > >=20
> > > The latest I have (I think it is the latest) is:
> > >=20
> > > [    1.826102] [drm] initializing kernel modesetting (RENOIR 0x1002:0=
x1636 0x17AA:0x5099 0xD1).
> > >=20
> > > and so far that hasn't triggered it. Which makes sense because that
> > > thing uses amdgpu:
> > >=20
> > > [    1.810260] [drm] amdgpu kernel modesetting enabled.
> >=20
> > Yes! Renoir is late enough for amdgpu kernel module. :-)
> > Please let us know if you still encounter the issue.
>=20
> Thanks for the hints guys. You need a rather specific configuration, but=
=20
> I can reproduce this now.
>=20
> Let's see what the problem is here.

FWIW I'm seeing it here on my workstation too.

[    3.952102] [drm] radeon kernel modesetting enabled.
[    3.952885] checking generic (90000000 300000) vs hw (90000000 10000000)
[    3.952898] fb0: switching to radeondrmfb from EFI VGA
[    3.953665] Console: switching to colour dummy device 80x25
[    3.953696] radeon 0000:03:00.0: vgaarb: deactivate vga console
[    3.953898] [drm] initializing kernel modesetting (CYPRESS 0x1002:0x6898=
 0x1462:0x8032 0x00).
[    3.953940] resource sanity check: requesting [mem 0x000c0000-0x000dffff=
], which spans more than PCI Bus 0000:00 [mem 0x000c4000-0x000cbfff window]
[    3.953945] caller pci_map_rom+0x6c/0x1b0 mapping multiple BARs
[    3.953972] ATOM BIOS: 113
[    3.954028] radeon 0000:03:00.0: VRAM: 1024M 0x0000000000000000 - 0x0000=
00003FFFFFFF (1024M used)
[    3.954032] radeon 0000:03:00.0: GTT: 1024M 0x0000000040000000 - 0x00000=
0007FFFFFFF
[    3.954037] [drm] Detected VRAM RAM=3D1024M, BAR=3D256M
[    3.954039] [drm] RAM width 256bits DDR
[    3.954087] [TTM] Zone  kernel: Available graphics memory: 16389788 KiB
[    3.954090] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    3.954105] [drm] radeon: 1024M of VRAM memory ready
[    3.954107] [drm] radeon: 1024M of GTT memory ready.
[    3.954114] [drm] Loading CYPRESS Microcode
[    3.954168] [drm] Internal thermal controller with fan control
[    3.954531] usb 3-1.1.1: New USB device found, idVendor=3D10d5, idProduc=
t=3D1234, bcdDevice=3D 9.02
[    3.954539] usb 3-1.1.1: New USB device strings: Mfr=3D0, Product=3D0, S=
erialNumber=3D0
[    3.958098] hub 3-1.1.1:1.0: USB hub found
[    3.959704] hub 3-1.1.1:1.0: 4 ports detected
[    3.975098] [drm] radeon: dpm initialized
[    3.975159] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    3.976074] [drm] enabling PCIE gen 2 link speeds, disable with radeon.p=
cie_gen2=3D0
[    3.979669] igb 0000:01:00.0 eno0: renamed from eth0
[    3.993789] [drm] PCIE GART of 1024M enabled (table at 0x000000000014C00=
0).
[    3.993912] radeon 0000:03:00.0: WB enabled
[    3.993915] radeon 0000:03:00.0: fence driver on ring 0 use gpu addr 0x0=
000000040000c00
[    3.993918] radeon 0000:03:00.0: fence driver on ring 3 use gpu addr 0x0=
000000040000c0c
[    3.994359] radeon 0000:03:00.0: fence driver on ring 5 use gpu addr 0x0=
00000000005c418
[    3.994531] radeon 0000:03:00.0: radeon: MSI limited to 32-bit
[    3.994563] radeon 0000:03:00.0: radeon: using MSI.
[    3.994581] [drm] radeon: irq initialized.
[    4.011086] [drm] ring test on 0 succeeded in 1 usecs
[    4.011094] [drm] ring test on 3 succeeded in 2 usecs
[    4.030666] EXT4-fs (md127): mounted filesystem with ordered data mode. =
Opts: (null)
[    4.188159] [drm] ring test on 5 succeeded in 1 usecs
[    4.188165] [drm] UVD initialized successfully.
[    4.188326] [drm] ib test on ring 0 succeeded in 0 usecs
[    4.188371] [drm] ib test on ring 3 succeeded in 0 usecs
...
[    4.839982] [drm] ib test on ring 5 succeeded
[    4.841079] [drm] Radeon Display Connectors
[    4.841087] [drm] Connector 0:
[    4.841090] [drm]   DP-1
[    4.841094] [drm]   HPD4
[    4.841097] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643=
c 0x643c
[    4.841104] [drm]   Encoders:
[    4.841107] [drm]     DFP1: INTERNAL_UNIPHY2
[    4.841111] [drm] Connector 1:
[    4.841114] [drm]   HDMI-A-1
[    4.841118] [drm]   HPD5
[    4.841120] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646=
c 0x646c
[    4.841127] [drm]   Encoders:
[    4.841130] [drm]     DFP2: INTERNAL_UNIPHY2
[    4.841133] [drm] Connector 2:
[    4.841136] [drm]   DVI-I-1
[    4.841139] [drm]   HPD1
[    4.841142] [drm]   DDC: 0x6450 0x6450 0x6454 0x6454 0x6458 0x6458 0x645=
c 0x645c
[    4.841149] [drm]   Encoders:
[    4.841151] [drm]     DFP3: INTERNAL_UNIPHY1
[    4.841155] [drm]     CRT2: INTERNAL_KLDSCP_DAC2
[    4.841159] [drm] Connector 3:
[    4.841162] [drm]   DVI-I-2
[    4.841165] [drm]   HPD6
[    4.841168] [drm]   DDC: 0x6470 0x6470 0x6474 0x6474 0x6478 0x6478 0x647=
c 0x647c
[    4.841174] [drm]   Encoders:
[    4.841177] [drm]     DFP4: INTERNAL_UNIPHY
[    4.841180] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    4.921539] [drm] fb mappable at 0x9034D000
[    4.921547] [drm] vram apper at 0x90000000
[    4.921549] [drm] size 9216000
[    4.921552] [drm] fb depth is 24
[    4.921555] [drm]    pitch is 7680
[    4.921680] fbcon: radeondrmfb (fb0) is primary device
[    4.943121] Console: switching to colour frame buffer device 240x75
[    4.950509] radeon 0000:03:00.0: [drm] fb0: radeondrmfb frame buffer dev=
ice
[    4.959011] [drm] Initialized radeon 2.50.0 20080528 for 0000:03:00.0 on=
 minor 0


...

[27221.673320] list_del corruption. next->prev should be ffffffffc02e4e40, =
but was ffff98de96e40ed0
[27221.673355] ------------[ cut here ]------------
[27221.673357] kernel BUG at lib/list_debug.c:54!
[27221.673365] invalid opcode: 0000 [#1] SMP PTI
[27221.673370] CPU: 9 PID: 263 Comm: kswapd0 Tainted: G S        I       5.=
10.0+ #701
[27221.673373] Hardware name: Intel Corporation S2600CW/S2600CW, BIOS SE5C6=
10.86B.01.01.0008.021120151325 02/11/2015
[27221.673376] RIP: 0010:__list_del_entry_valid.cold+0x1d/0x47
[27221.673386] Code: c7 c7 08 b7 40 9d e8 77 3f fe ff 0f 0b 48 89 fe 48 c7 =
c7 98 b7 40 9d e8 66 3f fe ff 0f 0b 48 c7 c7 48 b8 40 9d e8 58 3f fe ff <0f=
> 0b 48 89 f2 48 89 fe 48 c7 c7 08 b8 40 9d e8 44 3f fe ff 0f 0b
[27221.673389] RSP: 0000:ffffac17007f3c20 EFLAGS: 00010286
[27221.673394] RAX: 0000000000000054 RBX: ffffffffc02e4e40 RCX: 00000000000=
00000
[27221.673396] RDX: ffff98e5df866ba0 RSI: ffff98e5df858ac0 RDI: ffff98e5df8=
58ac0
[27221.673398] RBP: 0000000000000080 R08: 0000000000000000 R09: ffffac17007=
f3a58
[27221.673401] R10: ffffac17007f3a50 R11: ffffffff9d744ca8 R12: 00000000000=
00000
[27221.673403] R13: 0000000000000000 R14: 0000000000000084 R15: ffffffffc02=
e4ba0
[27221.673405] FS:  0000000000000000(0000) GS:ffff98e5df840000(0000) knlGS:=
0000000000000000
[27221.673408] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27221.673411] CR2: 00000000004fea86 CR3: 000000079a9e4001 CR4: 00000000001=
726e0
[27221.673414] Call Trace:
[27221.673420]  ttm_pool_shrink+0x53/0xb0 [ttm]
[27221.673433]  ttm_pool_shrinker_scan+0xa/0x20 [ttm]
[27221.673440]  do_shrink_slab+0x145/0x240
[27221.673447]  shrink_slab+0x9c/0x280
[27221.673451]  shrink_node+0x2c2/0x6f0
[27221.673456]  balance_pgdat+0x2ff/0x620
[27221.673461]  kswapd+0x1e6/0x360
[27221.673464]  ? finish_wait+0x80/0x80
[27221.673471]  ? balance_pgdat+0x620/0x620
[27221.673474]  kthread+0x11b/0x140
[27221.673479]  ? __kthread_bind_mask+0x60/0x60
[27221.673483]  ret_from_fork+0x22/0x30
[27221.673491] Modules linked in: vhost_net vhost vhost_iotlb tap xt_MASQUE=
RADE xt_conntrack xt_CHECKSUM ip6t_REJECT ipt_REJECT nf_nat_tftp nft_objref=
 nf_conntrack_tftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_rejec=
t_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security tun bridge iptable_nat nf_nat nf_conntrack stp llc nf_defra=
g_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security rfkill ip=
_set nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_f=
ilter vfat fat intel_rapl_msr intel_rapl_common sb_edac snd_hda_codec_realt=
ek x86_pkg_temp_thermal snd_hda_codec_generic intel_powerclamp ledtrig_audi=
o snd_hda_codec_hdmi coretemp kvm_intel snd_hda_intel joydev snd_intel_dspc=
fg apple_mfi_fastcharge snd_hda_codec kvm snd_hda_core iTCO_wdt irqbypass i=
ntel_pmc_bxt snd_hwdep iTCO_vendor_support snd_seq ipmi_si rapl snd_seq_dev=
ice ipmi_devintf intel_cstate
[27221.673569]  snd_pcm mei_me intel_uncore i2c_i801 ipmi_msghandler pcspkr=
 snd_timer i2c_smbus mei snd lpc_ich ioatdma soundcore acpi_power_meter acp=
i_pad auth_rpcgss binfmt_misc sunrpc ip_tables radeon uas usb_storage drm_t=
tm_helper ttm drm_kms_helper igb cec crct10dif_pclmul crc32_pclmul crc32c_i=
ntel dca drm raid0 ghash_clmulni_intel wmi i2c_algo_bit fuse ecryptfs
[27221.673609] ---[ end trace 98f04a1b0e5570b4 ]---
[27221.726254] RIP: 0010:__list_del_entry_valid.cold+0x1d/0x47
[27221.726277] Code: c7 c7 08 b7 40 9d e8 77 3f fe ff 0f 0b 48 89 fe 48 c7 =
c7 98 b7 40 9d e8 66 3f fe ff 0f 0b 48 c7 c7 48 b8 40 9d e8 58 3f fe ff <0f=
> 0b 48 89 f2 48 89 fe 48 c7 c7 08 b8 40 9d e8 44 3f fe ff 0f 0b
[27221.726281] RSP: 0000:ffffac17007f3c20 EFLAGS: 00010286
[27221.726284] RAX: 0000000000000054 RBX: ffffffffc02e4e40 RCX: 00000000000=
00000
[27221.726286] RDX: ffff98e5df866ba0 RSI: ffff98e5df858ac0 RDI: ffff98e5df8=
58ac0
[27221.726288] RBP: 0000000000000080 R08: 0000000000000000 R09: ffffac17007=
f3a58
[27221.726290] R10: ffffac17007f3a50 R11: ffffffff9d744ca8 R12: 00000000000=
00000
[27221.726292] R13: 0000000000000000 R14: 0000000000000084 R15: ffffffffc02=
e4ba0
[27221.726294] FS:  0000000000000000(0000) GS:ffff98e5df840000(0000) knlGS:=
0000000000000000
[27221.726296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27221.726298] CR2: 00000000004fea86 CR3: 000000079a9e4001 CR4: 00000000001=
726e0


--=-lCgB89qt5rXK7xuWWiWX
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEw
MTA2MTY1NDI4WjAvBgkqhkiG9w0BCQQxIgQglYKYstZyKihYBWjgrP0d9za8ZhhhwUgIAO+M7C3U
+Ccwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAG7hUr8n7c+r8v7MUxoJ4sfBcL/Z8KcLpbbIc/yfJyms/m000DYpFfvSsgshpmZP
La8Wnr/E2+5tIzvfdtnsoTjcFleBpowGem9yKWBKxId9iPRzf7gH7hg+WnkaXeWG2x8t7KHnYqx8
ud+gLWsCDgKBwFR0++9J45362maQj7VuqgWyE1dmXKd9zEebVRdGKCmFMczCYJfcrLnV1+x9Mg28
ydISTh8vMdMAHZk/udL00Gqbkh47zOCwj6xQEaub3Q7P4NJcKs7qgquvop+wLgf8itqYaVc7P3dx
/CbKNZmYcb8sDRKr7icCd0QQBiITkrCuB/g9TXsAax6k/E3G/EUAAAAAAAA=


--=-lCgB89qt5rXK7xuWWiWX--


--===============1362356225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1362356225==--

