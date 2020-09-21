Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840572726EF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6468B6E2DD;
	Mon, 21 Sep 2020 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E16E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:26:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79A79AF90;
 Mon, 21 Sep 2020 14:27:17 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <20200624182648.6976-7-nirmoy.das@amd.com>
 <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
 <98c70355-1e01-a10c-099c-0a37dac5856f@amd.com>
 <5ec8d8d6-cd09-d7bd-19b1-fbd7b92d8198@suse.de>
 <6260eb85-3612-f1ed-fb65-41dc4132b238@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7331ed1f-c403-63df-2c1c-bb1ffab9afed@suse.de>
Date: Mon, 21 Sep 2020 16:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6260eb85-3612-f1ed-fb65-41dc4132b238@amd.com>
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
 sean@poorly.run, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0329374676=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0329374676==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6F6HFZDMoupxFxCkFFMLHGCd8QeL85RwX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6F6HFZDMoupxFxCkFFMLHGCd8QeL85RwX
Content-Type: multipart/mixed; boundary="k6Yc9IaR7zHkIjOgLQT1aQPfe5uEflR8b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, kraxel@redhat.com
Message-ID: <7331ed1f-c403-63df-2c1c-bb1ffab9afed@suse.de>
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <20200624182648.6976-7-nirmoy.das@amd.com>
 <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
 <98c70355-1e01-a10c-099c-0a37dac5856f@amd.com>
 <5ec8d8d6-cd09-d7bd-19b1-fbd7b92d8198@suse.de>
 <6260eb85-3612-f1ed-fb65-41dc4132b238@amd.com>
In-Reply-To: <6260eb85-3612-f1ed-fb65-41dc4132b238@amd.com>

--k6Yc9IaR7zHkIjOgLQT1aQPfe5uEflR8b
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.09.20 um 14:32 schrieb Christian K=C3=B6nig:
> Am 17.09.20 um 14:29 schrieb Thomas Zimmermann:
>> Hi Christian
>>
>> Am 17.09.20 um 13:12 schrieb Christian K=C3=B6nig:
>>> Hi Thomas,
>>>
>>> Am 17.09.20 um 12:51 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 24.06.20 um 20:26 schrieb Nirmoy Das:
>>>>> Calculate GEM VRAM bo's offset within vram-helper without depending=
 on
>>>>> bo->offset.
>>>>>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/gpu/drm/drm_gem_vram_helper.c | 11 ++++++++++-=

>>>>> =C2=A0=C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> index 0023ce1d2cf7..ad096600d89f 100644
>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> @@ -281,6 +281,15 @@ u64 drm_gem_vram_mmap_offset(struct
>>>>> drm_gem_vram_object *gbo)
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
>>>>> =C2=A0=C2=A0 +static u64 drm_gem_vram_pg_offset(struct drm_gem_vram=
_object *gbo)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 /* Keep TTM behavior for now, remove when drive=
rs are audited */
>>>>> +=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
>>>> At this line I got
>>> Sounds like ast forgot to pin the cursor to VRAM.
>>>
>>> If you look at ast_cursor_page_flip(), you see:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off =3D drm_gem_vra=
m_offset(gbo);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_WARN_ON_ONC=
E(dev, off < 0))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return; /* Bug: we didn't pin the cursor HW B=
O to
>>>> VRAM. */
>>> The drm_WARN_ON_ONCE() just never triggered before because it checks =
for
>>> the wrong condition (off < 0).
>> GEM VRAM BOs have a pin counter. drm_gem_vram_offset() returns -ENODEV=

>> if the BO's pin count is 0 (i.e., the BO has not been pinned anywhere)=
=2E
>> That's what we're testing here. Two cursor BOs are permanently pinned =
to
>> the top of VRAM memory by ast_cursor_init(). If perma-pinning in
>> ast_cursor_init() fails, driver initialization should fail entirely.
>>
>> These cursor BOs do some sort of double buffering, On successful
>> initialization, the actual cursor image is later blit-ed into one of t=
he
>> BOs.
>>
>> All this used to work from what I can tell. Is there any chance that t=
he
>> recent TTM refactoring broke this?
>=20
> Yeah, certainly possible. If you have time please bisect.

Found it.

https://patchwork.freedesktop.org/patch/391418/

Best regards
Thomas

>=20
> Thanks,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>> Regards,
>>> Christian.
>>>
>>>> [=C2=A0 146.133821] ------------[ cut here ]------------
>>>> [=C2=A0 146.133872] WARNING: CPU: 6 PID: 7 at
>>>> drivers/gpu/drm/drm_gem_vram_helper.c:284 drm_gem_vram_offset+0x59/0=
x60
>>>> [drm_vram_helper]
>>>> [=C2=A0 146.133880] Modules linked in: fuse(E) af_packet(E)
>>>> ebtable_filter(E)
>>>> ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E)
>>>> ip_tables(E) x_tables(E) bpfilter(E) rfkill(E) dmi_sysfs(E) msr(E)
>>>> intel_powerclamp(E) coretemp(E) kv)
>>>> [=C2=A0 146.134051]=C2=A0 scsi_dh_emc(E) scsi_dh_alua(E)
>>>> [=C2=A0 146.134074] CPU: 6 PID: 7 Comm: kworker/u48:0 Tainted:
>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
E
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.9.0-rc4-1-default+ #492
>>>> [=C2=A0 146.134083] Hardware name: Sun Microsystems SUN FIRE X2270 M=
2/SUN
>>>> FIRE X2270 M2, BIOS 2.05=C2=A0=C2=A0=C2=A0 07/01/2010
>>>> [=C2=A0 146.134099] Workqueue: events_unbound commit_work
>>>> [=C2=A0 146.134116] RIP: 0010:drm_gem_vram_offset+0x59/0x60
>>>> [drm_vram_helper]
>>>> [=C2=A0 146.134128] Code: 02 00 00 00 74 24 48 8d bb 80 02 00 00 e8 =
ef 27 17
>>>> d7 48 8b 83 80 02 00 00 5b 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff=
 5b
>>>> c3 <0f> 0b 31 c0 5b c3 90 66 66 66 66 90 41 56 41 55 49 89 d5 41 54 =
49
>>>> [=C2=A0 146.134137] RSP: 0018:ffffc90000107c38 EFLAGS: 00010246
>>>> [=C2=A0 146.134149] RAX: 0000000000000000 RBX: ffff888111155000 RCX:=

>>>> ffffffffc032323b
>>>> [=C2=A0 146.134158] RDX: dffffc0000000000 RSI: ffff88810e236300 RDI:=

>>>> ffff888111155278
>>>> [=C2=A0 146.134168] RBP: ffff888109090000 R08: ffffffffc0323225 R09:=

>>>> 0000000000000002
>>>> [=C2=A0 146.134177] R10: ffffed1020675020 R11: 0000000000000001 R12:=

>>>> ffff888109091050
>>>> [=C2=A0 146.134187] R13: ffff88810e236300 R14: ffff888109090000 R15:=

>>>> 0000000000000000
>>>> [=C2=A0 146.134197] FS:=C2=A0 0000000000000000(0000) GS:ffff88811600=
0000(0000)
>>>> knlGS:0000000000000000
>>>> [=C2=A0 146.134206] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
>>>> [=C2=A0 146.134215] CR2: 00007f60547d9100 CR3: 0000000029216002 CR4:=

>>>> 00000000000206e0
>>>> [=C2=A0 146.134223] Call Trace:
>>>> [=C2=A0 146.134245]=C2=A0 ast_cursor_page_flip+0x3e/0x150 [ast]
>>>> [=C2=A0 146.134272]=C2=A0 ast_cursor_plane_helper_atomic_update+0x8a=
/0xc0 [ast]
>>>> [=C2=A0 146.134300]=C2=A0 drm_atomic_helper_commit_planes+0x197/0x4c=
0
>>>> [=C2=A0 146.134341]=C2=A0 drm_atomic_helper_commit_tail_rpm+0x51/0x9=
0
>>>> [=C2=A0 146.134357]=C2=A0 commit_tail+0x103/0x1c0
>>>> [=C2=A0 146.134390]=C2=A0 process_one_work+0x56a/0xa60
>>>> [=C2=A0 146.134431]=C2=A0 ? __lock_acquired+0x1ca/0x3d0
>>>> [=C2=A0 146.134447]=C2=A0 ? pwq_dec_nr_in_flight+0x110/0x110
>>>> [=C2=A0 146.134460]=C2=A0 ? __lock_contended+0x4a0/0x4a0
>>>> [=C2=A0 146.134491]=C2=A0 ? worker_thread+0x150/0x620
>>>> [=C2=A0 146.134521]=C2=A0 worker_thread+0x8b/0x620
>>>> [=C2=A0 146.134539]=C2=A0 ? _raw_spin_unlock_irqrestore+0x41/0x50
>>>> [=C2=A0 146.134583]=C2=A0 ? process_one_work+0xa60/0xa60
>>>> [=C2=A0 146.134597]=C2=A0 kthread+0x1e4/0x210
>>>> [=C2=A0 146.134612]=C2=A0 ? kthread_create_worker_on_cpu+0xb0/0xb0
>>>> [=C2=A0 146.134637]=C2=A0 ret_from_fork+0x22/0x30
>>>> [=C2=A0 146.134698] irq event stamp: 74111
>>>> [=C2=A0 146.134711] hardirqs last=C2=A0 enabled at (74117): [<ffffff=
ff971c68f9>]
>>>> console_unlock+0x539/0x670
>>>> [=C2=A0 146.134723] hardirqs last disabled at (74122): [<ffffffff971=
c68ef>]
>>>> console_unlock+0x52f/0x670
>>>> [=C2=A0 146.134737] softirqs last=C2=A0 enabled at (73354): [<ffffff=
ff975469d5>]
>>>> wb_workfn+0x3f5/0x430
>>>> [=C2=A0 146.134749] softirqs last disabled at (73350): [<ffffffff973=
f81d0>]
>>>> wb_wakeup_delayed+0x40/0xa0
>>>> [=C2=A0 146.134758] ---[ end trace 74dd5fac6a3a2c0c ]---
>>>>
>>>>
>>>> Happens with ast when doing
>>>>
>>>> =C2=A0=C2=A0=C2=A0 weston-launch
>>>>
>>>>
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return gbo->bo.mem.start;
>>>>> +}
>>>>> +
>>>>> =C2=A0=C2=A0 /**
>>>>> =C2=A0=C2=A0=C2=A0 * drm_gem_vram_offset() - \
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Returns a GEM VRAM object's of=
fset in video memory
>>>>> @@ -297,7 +306,7 @@ s64 drm_gem_vram_offset(struct
>>>>> drm_gem_vram_object *gbo)
>>>>> =C2=A0=C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!gbo->pin_cou=
nt))
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 (s64)-ENODEV;
>>>>> -=C2=A0=C2=A0=C2=A0 return gbo->bo.offset;
>>>>> +=C2=A0=C2=A0=C2=A0 return drm_gem_vram_pg_offset(gbo) << PAGE_SHIF=
T;
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 EXPORT_SYMBOL(drm_gem_vram_offset);
>>>>> =C2=A0=20
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--k6Yc9IaR7zHkIjOgLQT1aQPfe5uEflR8b--

--6F6HFZDMoupxFxCkFFMLHGCd8QeL85RwX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9ouB0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiN8/wgAvbNa1dzR7dKEut8mvUzSyfU7V7Dc
1XgJ/TCtdYqkKGj2fgr3ZTtZYODBwVupxAvbtjoO429h6kwkneNXFl7VejgAb00v
+OwTPkLHqzdBnK9G2heSV+A530KjD7q5Ot3IsZsboN0/reay7pav1/3gX8r6SGiV
0LjyU7QnDyQ/xgqhdXCjJmAcb7XZjz24N34oZ885o+WGFDzORIk0MkkBeSspBWAJ
n8a8gZcuw5qol2lieDyEm5Mpd2qPYCjQajXyPO47xqec6uUTEQkF/tSEzk7l0kZ/
nCNmRCnmLTjutsxWXg848xaKXDpiufmxQ33DVDnQYY/QPXQKC0tYOz+zoQ==
=Eyc9
-----END PGP SIGNATURE-----

--6F6HFZDMoupxFxCkFFMLHGCd8QeL85RwX--

--===============0329374676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0329374676==--
