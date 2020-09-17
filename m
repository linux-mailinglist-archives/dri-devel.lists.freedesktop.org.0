Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473D26D991
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C256EB9C;
	Thu, 17 Sep 2020 10:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771026EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:51:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6A4BABAD;
 Thu, 17 Sep 2020 10:51:59 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <20200624182648.6976-7-nirmoy.das@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
Date: Thu, 17 Sep 2020 12:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200624182648.6976-7-nirmoy.das@amd.com>
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0825202704=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0825202704==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1VdGyfIvjSnQugoKTXV7imjwfT1BI0uBd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1VdGyfIvjSnQugoKTXV7imjwfT1BI0uBd
Content-Type: multipart/mixed; boundary="dlBt4sMzVimdaijL8QuXxkHMyTo1AZxQF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Message-ID: <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <20200624182648.6976-7-nirmoy.das@amd.com>
In-Reply-To: <20200624182648.6976-7-nirmoy.das@amd.com>

--dlBt4sMzVimdaijL8QuXxkHMyTo1AZxQF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.20 um 20:26 schrieb Nirmoy Das:
> Calculate GEM VRAM bo's offset within vram-helper without depending on
> bo->offset.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 0023ce1d2cf7..ad096600d89f 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -281,6 +281,15 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_o=
bject *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
> =20
> +static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
> +{
> +	/* Keep TTM behavior for now, remove when drivers are audited */
> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))

At this line I got

[  146.133821] ------------[ cut here ]------------
[  146.133872] WARNING: CPU: 6 PID: 7 at
drivers/gpu/drm/drm_gem_vram_helper.c:284 drm_gem_vram_offset+0x59/0x60
[drm_vram_helper]
[  146.133880] Modules linked in: fuse(E) af_packet(E) ebtable_filter(E)
ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E)
ip_tables(E) x_tables(E) bpfilter(E) rfkill(E) dmi_sysfs(E) msr(E)
intel_powerclamp(E) coretemp(E) kv)
[  146.134051]  scsi_dh_emc(E) scsi_dh_alua(E)
[  146.134074] CPU: 6 PID: 7 Comm: kworker/u48:0 Tainted: G            E
    5.9.0-rc4-1-default+ #492
[  146.134083] Hardware name: Sun Microsystems SUN FIRE X2270 M2/SUN
FIRE X2270 M2, BIOS 2.05    07/01/2010
[  146.134099] Workqueue: events_unbound commit_work
[  146.134116] RIP: 0010:drm_gem_vram_offset+0x59/0x60 [drm_vram_helper]
[  146.134128] Code: 02 00 00 00 74 24 48 8d bb 80 02 00 00 e8 ef 27 17
d7 48 8b 83 80 02 00 00 5b 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff 5b
c3 <0f> 0b 31 c0 5b c3 90 66 66 66 66 90 41 56 41 55 49 89 d5 41 54 49
[  146.134137] RSP: 0018:ffffc90000107c38 EFLAGS: 00010246
[  146.134149] RAX: 0000000000000000 RBX: ffff888111155000 RCX:
ffffffffc032323b
[  146.134158] RDX: dffffc0000000000 RSI: ffff88810e236300 RDI:
ffff888111155278
[  146.134168] RBP: ffff888109090000 R08: ffffffffc0323225 R09:
0000000000000002
[  146.134177] R10: ffffed1020675020 R11: 0000000000000001 R12:
ffff888109091050
[  146.134187] R13: ffff88810e236300 R14: ffff888109090000 R15:
0000000000000000
[  146.134197] FS:  0000000000000000(0000) GS:ffff888116000000(0000)
knlGS:0000000000000000
[  146.134206] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  146.134215] CR2: 00007f60547d9100 CR3: 0000000029216002 CR4:
00000000000206e0
[  146.134223] Call Trace:
[  146.134245]  ast_cursor_page_flip+0x3e/0x150 [ast]
[  146.134272]  ast_cursor_plane_helper_atomic_update+0x8a/0xc0 [ast]
[  146.134300]  drm_atomic_helper_commit_planes+0x197/0x4c0
[  146.134341]  drm_atomic_helper_commit_tail_rpm+0x51/0x90
[  146.134357]  commit_tail+0x103/0x1c0
[  146.134390]  process_one_work+0x56a/0xa60
[  146.134431]  ? __lock_acquired+0x1ca/0x3d0
[  146.134447]  ? pwq_dec_nr_in_flight+0x110/0x110
[  146.134460]  ? __lock_contended+0x4a0/0x4a0
[  146.134491]  ? worker_thread+0x150/0x620
[  146.134521]  worker_thread+0x8b/0x620
[  146.134539]  ? _raw_spin_unlock_irqrestore+0x41/0x50
[  146.134583]  ? process_one_work+0xa60/0xa60
[  146.134597]  kthread+0x1e4/0x210
[  146.134612]  ? kthread_create_worker_on_cpu+0xb0/0xb0
[  146.134637]  ret_from_fork+0x22/0x30
[  146.134698] irq event stamp: 74111
[  146.134711] hardirqs last  enabled at (74117): [<ffffffff971c68f9>]
console_unlock+0x539/0x670
[  146.134723] hardirqs last disabled at (74122): [<ffffffff971c68ef>]
console_unlock+0x52f/0x670
[  146.134737] softirqs last  enabled at (73354): [<ffffffff975469d5>]
wb_workfn+0x3f5/0x430
[  146.134749] softirqs last disabled at (73350): [<ffffffff973f81d0>]
wb_wakeup_delayed+0x40/0xa0
[  146.134758] ---[ end trace 74dd5fac6a3a2c0c ]---


Happens with ast when doing

  weston-launch



> +		return 0;
> +
> +	return gbo->bo.mem.start;
> +}
> +
>  /**
>   * drm_gem_vram_offset() - \
>  	Returns a GEM VRAM object's offset in video memory
> @@ -297,7 +306,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object =
*gbo)
>  {
>  	if (WARN_ON_ONCE(!gbo->pin_count))
>  		return (s64)-ENODEV;
> -	return gbo->bo.offset;
> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_offset);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dlBt4sMzVimdaijL8QuXxkHMyTo1AZxQF--

--1VdGyfIvjSnQugoKTXV7imjwfT1BI0uBd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jP6oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOJkAf/f/VsnI+yYzmiNqIBIHAht26INZia
kb3kuk6Sjf+TYZM3dhd98EMacZXNQAuSDUR7XledSs2rZ2oBvFGU+8i6XMEasgu4
HG3TzS9GylDb0ZfHHxg1hGtA61BgL5jii9G0hLfdoqsSiNDhZyybZ52ZIOIXMTGc
8YfyB/M3OogktsD9hpJlj+sM4vKT7keksrLQmB2CNUVuUuqiN378q8WUqjCOEzjd
Qx5qiToLpPcUjeqrmzGMFPmKEh3Wgn84LuZvfBRblptJvImMzo+GDNfWnZsjxtvG
X+32bDuQFcczoC9yeazpBw9O/doJtBuTTdsUge6rxSpEXE2db+Jq6BMmvA==
=6QZ5
-----END PGP SIGNATURE-----

--1VdGyfIvjSnQugoKTXV7imjwfT1BI0uBd--

--===============0825202704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0825202704==--
