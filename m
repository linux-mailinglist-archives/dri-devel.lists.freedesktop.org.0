Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2092C20F6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 10:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916C6E207;
	Tue, 24 Nov 2020 09:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696536E207;
 Tue, 24 Nov 2020 09:16:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9128AFA7;
 Tue, 24 Nov 2020 09:16:18 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
Message-ID: <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
Date: Tue, 24 Nov 2020 10:16:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0146599377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0146599377==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="s7343sXofuVZxunpR1baOYNrmHQXf0Y0E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s7343sXofuVZxunpR1baOYNrmHQXf0Y0E
Content-Type: multipart/mixed; boundary="uTONGUrvAmzUp8SKoF2mZqWFiMKMXd4Tz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
In-Reply-To: <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>

--uTONGUrvAmzUp8SKoF2mZqWFiMKMXd4Tz
Content-Type: multipart/mixed;
 boundary="------------3070C15B61E88049E2E1AD19"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3070C15B61E88049E2E1AD19
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Christian

Am 16.11.20 um 12:28 schrieb Christian K=C3=B6nig:
> Am 13.11.20 um 08:59 schrieb Thomas Zimmermann:
>> Hi Christian
>>
>> Am 12.11.20 um 18:16 schrieb Christian K=C3=B6nig:
>>> Am 12.11.20 um 14:21 schrieb Thomas Zimmermann:
>>>> In order to avoid eviction of vmap'ed buffers, pin them in their GEM=

>>>> object's vmap implementation. Unpin them in the vunmap implementatio=
n.
>>>> This is needed to make generic fbdev support work reliably. Without,=

>>>> the buffer object could be evicted while fbdev flushed its shadow=20
>>>> buffer.
>>>>
>>>> In difference to the PRIME pin/unpin functions, the vmap code does n=
ot
>>>> modify the BOs prime_shared_count, so a vmap-pinned BO does not=20
>>>> count as
>>>> shared.
>>>>
>>>> The actual pin location is not important as the vmap call returns
>>>> information on how to access the buffer. Callers that require a
>>>> specific location should explicitly pin the BO before vmapping it.
>>> Well is the buffer supposed to be scanned out?
>> No, not by the fbdev helper.
>=20
> Ok in this case that should work.
>=20
>>> If yes then the pin location is actually rather important since the
>>> hardware can only scan out from VRAM.
>> For relocatable BOs, fbdev uses a shadow buffer that makes all any
>> relocation transparent to userspace. It flushes the shadow fb into the=

>> BO's memory if there are updates. The code is in
>> drm_fb_helper_dirty_work(). [1] During the flush operation, the vmap
>> call now pins the BO to wherever it is. The actual location does not
>> matter. It's vunmap'ed immediately afterwards.
>=20
> The problem is what happens when it is prepared for scanout, but can't =

> be moved to VRAM because it is vmapped?
>=20
> When the shadow is never scanned out that isn't a problem, but we need =

> to keep that in mind.
>=20

I'd like ask for your suggestions before sending an update for this patch=
=2E

After the discussion about locking in fbdev, [1] I intended to replace=20
the pin call with code that acquires the reservation lock.

First I wanted to put this into drm_gem_ttm_vmap/vunmap(), but then=20
wondered why ttm_bo_vmap() doe not acquire the lock internally? I'd=20
expect that vmap/vunmap are close together and do not overlap for the=20
same BO. Otherwise, acquiring the reservation lock would require another =

ref-counting variable or per-driver code.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/patch/401088/?series=3D83918&rev=3D=
1

> Regards,
> Christian.
>=20
>>
>> For dma-buf sharing, the regular procedure of pin + vmap still apply.
>> This should always move the BO into GTT-managed memory.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F=
tree%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_fb_helper.c%23n432&amp;data=3D04%7C01%7C=
christian.koenig%40amd.com%7C31b890664ca7429fc45808d887aa0842%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637408511650629569%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DRLauuAuXkcl0rXwWWJ%2FrKP%2BsCr2wAzU1ejGV1bnQ80w%3D&amp;r=
eserved=3D0=20
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>> =C2=A0=C2=A0 drivers/gpu/drm/radeon/radeon_gem.c | 51=20
>>>> +++++++++++++++++++++++++++--
>>>> =C2=A0=C2=A0 1 file changed, 49 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>>> index d2876ce3bc9e..eaf7fc9a7b07 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>> @@ -226,6 +226,53 @@ static int radeon_gem_handle_lockup(struct
>>>> radeon_device *rdev, int r)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 +static int radeon_gem_object_vmap(struct drm_gem_objec=
t *obj,
>>>> struct dma_buf_map *map)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 static const uint32_t any_domain =3D RADEON_GEM_=
DOMAIN_VRAM |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RADEON_GE=
M_DOMAIN_GTT |
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RADEON_GE=
M_DOMAIN_CPU;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 struct radeon_bo *bo =3D gem_to_radeon_bo(obj);
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_reserve(bo, false);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* pin buffer at its current location */
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_pin(bo, any_domain, NULL);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_radeon_bo_unres=
erve;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_ttm_vmap(obj, map);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_radeon_bo_unpin=
;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +
>>>> +err_radeon_bo_unpin:
>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unpin(bo);
>>>> +err_radeon_bo_unreserve:
>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>> +}
>>>> +
>>>> +static void radeon_gem_object_vunmap(struct drm_gem_object *obj,
>>>> struct dma_buf_map *map)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct radeon_bo *bo =3D gem_to_radeon_bo(obj);
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D radeon_bo_reserve(bo, false);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 drm_gem_ttm_vunmap(obj, map);
>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unpin(bo);
>>>> +=C2=A0=C2=A0=C2=A0 radeon_bo_unreserve(bo);
>>>> +}
>>>> +
>>>> =C2=A0=C2=A0 static const struct drm_gem_object_funcs radeon_gem_obj=
ect_funcs =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D radeon_gem_object_fre=
e,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .open =3D radeon_gem_object_ope=
n,
>>>> @@ -234,8 +281,8 @@ static const struct drm_gem_object_funcs
>>>> radeon_gem_object_funcs =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pin =3D radeon_gem_prime_pin,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unpin =3D radeon_gem_prime_unp=
in,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_sg_table =3D radeon_gem_pr=
ime_get_sg_table,
>>>> -=C2=A0=C2=A0=C2=A0 .vmap =3D drm_gem_ttm_vmap,
>>>> -=C2=A0=C2=A0=C2=A0 .vunmap =3D drm_gem_ttm_vunmap,
>>>> +=C2=A0=C2=A0=C2=A0 .vmap =3D radeon_gem_object_vmap,
>>>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D radeon_gem_object_vunmap,
>>>> =C2=A0=C2=A0 };
>>>> =C2=A0=C2=A0 =C2=A0 /*
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%=
7Cchristian.koenig%40amd.com%7C31b890664ca7429fc45808d887aa0842%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637408511650629569%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3Dh1U9Po83K7webxsiKpn3ZGFz9Fcg6SRkxtrXWZ1%2B%2FEc%3D&amp=
;reserved=3D0=20
>>>
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

--------------3070C15B61E88049E2E1AD19
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

--------------3070C15B61E88049E2E1AD19--

--uTONGUrvAmzUp8SKoF2mZqWFiMKMXd4Tz--

--s7343sXofuVZxunpR1baOYNrmHQXf0Y0E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+8z2IFAwAAAAAACgkQlh/E3EQov+Ca
cxAAnJEhX5sEYDWHu2tTvbLkYuhKUWoT5uNtvoLSMGgjsRMe+6kdrDk2Acxxtv/LHeFr5HoOISR3
1f6aMqVWgOxK/Pjp/SQ0scqh59kDVTD2gmTgkAeg/3abYmSXbFEnqeM5U/UtBtDXdLrymUW2bJ/V
WS3HZNrIj0iWpYdslW8008+Fx8lhOZArhqdMgNTY/KhONPKBpVK9pEGGbjyT++jrTiJRiGr42WqH
YxiBDCBWPCmo50FA1QyGekBxmJ0t1yG7WqfrSOGxIcdul1QX7gga4Ie0qtbXeBGRJK3wsAcHYa3/
fXPpF5kSoRYsb+0KC4Kq25awNlHjIdI2jEvjpnhUaYPjo866tYHNSPkBwRiP5l3CM64jGeReEy/I
VwBfTgfGtAgtY1Xr1tHgrrcPu2DUSM6DrghKJZa8uPCy0OuL0YUg+9lokj5nS7h85MJc0uUwSxwX
UeJrbRtvZNRy/Ecx7h0NgxG047EY1ByiXej5cOIafx43C3croFE90ckv8eDsSm/3Cou3pJP2Kjsq
0GL32gOLW5W1l8JjKVoTYuvjzOTNMqkkcMuR2CnJ+jlAQSKTyqXmND1DMsKdZHcPIkpb6mZttukp
do+WtTAwdGE8cHQvYm7QOWUMfsH0/ueXh9bDtMHgqK4gesEMy0Um2W+VRK8Yaj4h2+7gkuQSx5Zd
yrI=
=Ficl
-----END PGP SIGNATURE-----

--s7343sXofuVZxunpR1baOYNrmHQXf0Y0E--

--===============0146599377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0146599377==--
