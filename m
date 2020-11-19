Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F42B8C8C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 08:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3C89FE8;
	Thu, 19 Nov 2020 07:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CA389FE8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:51:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3FDAAD31;
 Thu, 19 Nov 2020 07:51:45 +0000 (UTC)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201119011423.14224-1-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vram: fix incorrect flag variable usage.
Message-ID: <44339c9e-782b-c3fa-cfcc-ee86b3a46937@suse.de>
Date: Thu, 19 Nov 2020 08:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119011423.14224-1-airlied@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, David Laight <David.Laight@aculab.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Wen Pu <puwen@hygon.cn>
Content-Type: multipart/mixed; boundary="===============0685933966=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0685933966==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vieafkd0YcBeoJm5794wcHCfuPu4wZpec"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vieafkd0YcBeoJm5794wcHCfuPu4wZpec
Content-Type: multipart/mixed; boundary="U3uyXDLs3jfhuYyr4sh3IaregWthGg6m6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, David Laight <David.Laight@aculab.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Wen Pu <puwen@hygon.cn>
Message-ID: <44339c9e-782b-c3fa-cfcc-ee86b3a46937@suse.de>
Subject: Re: [PATCH] drm/vram: fix incorrect flag variable usage.
References: <20201119011423.14224-1-airlied@gmail.com>
In-Reply-To: <20201119011423.14224-1-airlied@gmail.com>

--U3uyXDLs3jfhuYyr4sh3IaregWthGg6m6
Content-Type: multipart/mixed;
 boundary="------------8631830A8223B14070847BA7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8631830A8223B14070847BA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

we already have

   b8f8dbf64958 ("drm/vram-helper: Fix use of top-down placement")

in drm-tip. And it does exactly the same. I guess it went in through=20
drm-misc-next instead of -misc-fixes.

Am 19.11.20 um 02:14 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> In 7053e0eab473119503f6565b4e398f9a73122481
> drm/vram-helper: stop using TTM placement flags

The subject line might be a bit misleading.

In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>=20
> it appears the flags got mixed up.
>=20
> This should fix a regression on ast
> [   64.782340] WARNING: CPU: 51 PID: 1964 at drivers/gpu/drm/drm_gem_vr=
am_helper.c:284 drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]
> [   64.782411] CPU: 51 PID: 1964 Comm: Xorg Not tainted 5.10.0-rc3 #12
> [   64.782413] Hardware name: To be filled.
> [   64.782419] RIP: 0010:drm_gem_vram_offset+0x35/0x40 [drm_vram_helper=
]
> [   64.782424] Code: 00 48 89 e5 85 c0 74 17 48 83 bf 78 01 00 00 00 74=
 18 48 8b 87 80 01 00 00 5d 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff 5d =
c3 <0f> 0b 31 c0 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 18 06
> [   64.782427] RSP: 0018:ffffa9128909fa68 EFLAGS: 00010246
> [   64.782431] RAX: 0000000000000002 RBX: ffff95a5c25e1ec0 RCX: fffffff=
fc02b6600
> [   64.782433] RDX: ffff959e49824000 RSI: ffff95a5c25e0b40 RDI: ffff959=
e4b1c2c00
> [   64.782434] RBP: ffffa9128909fa68 R08: 0000000000000040 R09: ffff95a=
9c5dcb688
> [   64.782436] R10: 0000000000000000 R11: 0000000000000001 R12: ffff959=
e49824000
> [   64.782437] R13: 0000000000000000 R14: 0000000000000000 R15: ffff95a=
5c5c56f00
> [   64.782440] FS:  00007f485d466a80(0000) GS:ffff95a9afcc0000(0000) kn=
lGS:0000000000000000
> [   64.782442] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   64.782444] CR2: 00007f485e202000 CR3: 0000000c82a0e000 CR4: 0000000=
0003506e0
> [   64.782446] Call Trace:
> [   64.782455]  ast_cursor_page_flip+0x22/0x100 [ast]
> [   64.782460]  ast_cursor_plane_helper_atomic_update+0x46/0x70 [ast]
> [   64.782477]  drm_atomic_helper_commit_planes+0xbd/0x220 [drm_kms_hel=
per]
> [   64.782493]  drm_atomic_helper_commit_tail_rpm+0x3a/0x70 [drm_kms_he=
lper]
> [   64.782507]  commit_tail+0x99/0x130 [drm_kms_helper]
> [   64.782521]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
> [   64.782551]  drm_atomic_commit+0x4a/0x50 [drm]
> [   64.782565]  drm_atomic_helper_update_plane+0xe7/0x140 [drm_kms_help=
er]
> [   64.782592]  __setplane_atomic+0xcc/0x110 [drm]
> [   64.782619]  drm_mode_cursor_universal+0x13e/0x260 [drm]
> [   64.782647]  drm_mode_cursor_common+0xef/0x220 [drm]
> [   64.782654]  ? tomoyo_path_number_perm+0x6f/0x200
> [   64.782680]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [   64.782706]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
> [   64.782727]  drm_ioctl_kernel+0xae/0xf0 [drm]
> [   64.782749]  drm_ioctl+0x241/0x3f0 [drm]
> [   64.782774]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [   64.782781]  ? tomoyo_file_ioctl+0x19/0x20
> [   64.782787]  __x64_sys_ioctl+0x91/0xc0
> [   64.782792]  do_syscall_64+0x38/0x90
> [   64.782797]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: Wen Pu <puwen@hygon.cn>
> Cc: David Laight <David.Laight@aculab.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 50cad0e4a92e..2896a057b771 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -140,7 +140,7 @@ static void drm_gem_vram_placement(struct drm_gem_v=
ram_object *gbo,
>   	unsigned int c =3D 0;
>  =20
>   	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_TOPDOWN)
> -		pl_flag =3D TTM_PL_FLAG_TOPDOWN;
> +		invariant_flag =3D TTM_PL_FLAG_TOPDOWN;
>  =20
>   	gbo->placement.placement =3D gbo->placements;
>   	gbo->placement.busy_placement =3D gbo->placements;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------8631830A8223B14070847BA7
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------8631830A8223B14070847BA7--

--U3uyXDLs3jfhuYyr4sh3IaregWthGg6m6--

--vieafkd0YcBeoJm5794wcHCfuPu4wZpec
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+2JBEFAwAAAAAACgkQlh/E3EQov+Dg
6Q//cNe4/vzGmPkaEJFSj04mQmCJbOpjTs1IT3wa4pG9L6FiuKgbrGpeEbBLssY/7L+RJrspeuRe
AyMiq1t6WZ3jAh+kr1kuW93hkT/0Tbl5hbZ6glrtsWafzYpGADKNb2OxfeWa78ANsqs+BpnD6ZVY
YCGTwzFywavpps0OrXuHc1JZOSQbBow989y6IrKfY9d+ua+cDO6jSvwRcgFr3ten6w7x+NwgpGrS
g3tG5UewUkCfH5bbNxLOal/ISMHCaHiR9rC7eSrG3ikZq9YXJjuLZYWn6jDCbZiwF3Eh09WM3EeH
HLSTdw5/guk+uIcFlFpmyJk2wf4OAeW4WISQ/xZWd2zj+zcQnztvZqb4+k1ZhbJOYBGTWHc81v8U
Ue543Yf8wv88K7XESPtoN2one2qodR7pgvrfpFtve37fHHXRU1iJELhiZDPcszjmNhbbWxmIORg1
al1SADJFrg0CX4dzCDhteyAQWjsZTBooelJmLAHe1VLGOmEMPVrZx1kuEEdiAeJ1ykfjNxRKcm0P
6JyWfUnb0NPcgKAFTOeHXs/TYVQCFM3ZllOF/AnI44X2SHcVuXxt2484xzZvtTeTDBM35g2xLnab
zkdesH995+vysnTJDH4pQWPcuft33tYw7QP/K9Mc3Om9vTqs+j94HFCVo83k+JpDFgDGh+sxSmjA
lms=
=YPnk
-----END PGP SIGNATURE-----

--vieafkd0YcBeoJm5794wcHCfuPu4wZpec--

--===============0685933966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0685933966==--
