Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8491D45DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4076E3E3;
	Fri, 15 May 2020 06:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310B6E119;
 Fri, 15 May 2020 06:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F35C7AA6F;
 Fri, 15 May 2020 06:26:30 +0000 (UTC)
Subject: Re: [PATCH 3/9] drm/doc: Some polish for shmem helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-4-daniel.vetter@ffwll.ch>
 <d4088d21-8351-6afb-ae90-cab3e30f83e8@suse.de>
 <20200514200559.GE206103@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <027cb88f-ff54-aa85-2d53-839399d33c44@suse.de>
Date: Fri, 15 May 2020 08:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514200559.GE206103@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1621735174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1621735174==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XqqPw1zEO6klucqdXHcAJ1fGUO2ue5ZHP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XqqPw1zEO6klucqdXHcAJ1fGUO2ue5ZHP
Content-Type: multipart/mixed; boundary="CEeOuTjzCGCn5JRSBQWF9uRmgjOAqhcqf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <027cb88f-ff54-aa85-2d53-839399d33c44@suse.de>
Subject: Re: [PATCH 3/9] drm/doc: Some polish for shmem helpers
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-4-daniel.vetter@ffwll.ch>
 <d4088d21-8351-6afb-ae90-cab3e30f83e8@suse.de>
 <20200514200559.GE206103@phenom.ffwll.local>
In-Reply-To: <20200514200559.GE206103@phenom.ffwll.local>

--CEeOuTjzCGCn5JRSBQWF9uRmgjOAqhcqf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.20 um 22:05 schrieb Daniel Vetter:
> On Mon, May 11, 2020 at 01:12:49PM +0200, Thomas Zimmermann wrote:
>>
>>
>> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
>>> - Move the shmem helper section to the drm-mm.rst file, next to the
>>>   vram helpers. Makes a lot more sense there with the now wider scope=
=2E
>>>   Also, that's where the all the other backing storage stuff resides.=

>>>   It's just the framebuffer helpers that should be in the kms helper
>>>   section.
>>>
>>> - Try to clarify which functiosn are for implementing
>>>   drm_gem_object_funcs, and which for drivers to call directly. At
>>>   least one driver screwed that up a bit.
>>>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> See below for a suggestion on the help text.
>>
>>> ---
>>>  Documentation/gpu/drm-kms-helpers.rst  | 12 --------
>>>  Documentation/gpu/drm-mm.rst           | 12 ++++++++
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 39 +++++++++++++++++++++---=
--
>>>  3 files changed, 44 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gp=
u/drm-kms-helpers.rst
>>> index ee730457bf4e..b89ddd06dabb 100644
>>> --- a/Documentation/gpu/drm-kms-helpers.rst
>>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>>> @@ -411,15 +411,3 @@ Legacy CRTC/Modeset Helper Functions Reference
>>> =20
>>>  .. kernel-doc:: drivers/gpu/drm/drm_crtc_helper.c
>>>     :export:
>>> -
>>> -SHMEM GEM Helper Reference
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>> -   :doc: overview
>>> -
>>> -.. kernel-doc:: include/drm/drm_gem_shmem_helper.h
>>> -   :internal:
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>> -   :export:
>>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.=
rst
>>> index 1839762044be..c01757b0ac25 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -373,6 +373,18 @@ GEM CMA Helper Functions Reference
>>>  .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
>>>     :export:
>>> =20
>>> +GEM SHMEM Helper Function Reference
>>> +-----------------------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +   :doc: overview
>>> +
>>> +.. kernel-doc:: include/drm/drm_gem_shmem_helper.h
>>> +   :internal:
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +   :export:
>>> +
>>>  GEM VRAM Helper Functions Reference
>>>  -----------------------------------
>>> =20
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm=
/drm_gem_shmem_helper.c
>>> index df31e5782eed..2a70159d50ef 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -103,7 +103,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>>>   * @obj: GEM object to free
>>>   *
>>>   * This function cleans up the GEM object state and frees the memory=
 used to
>>> - * store the object itself.
>>> + * store the object itself. It should be used to implement
>>> + * &drm_gem_object_funcs.free.
>>
>> It should 'only' be used? Or maybe you can say that it should be used =
by
>> drivers that don't implement struct drm_driver.gem_create_object.
>=20
> Just looked at this, and I'm not clear what you're aiming for. There
> doesn't seem to be any misuse for this for other places than the free
> hook. And I can't really come up with ideas where that would even work.=

>=20
> What kind of confusion are you trying to clarify with your suggestion?
> Maybe I can then reword that into something that also makes sense for m=
e.

It was just nit picking.

I just worried that drivers might try to call this function for cleaning
up an embedded instance of the structure; although the function's name
clearly indicates otherwise.

Kind of related, I think we should be more strict to use the abstract
GEM interfaces. For example, several drivers call drm_gem_shmem_vmap()
instead of drm_gem_vmap(). For this free function, we should require
drivers to call  drm_gem_object_free() instead of the shmem function.

Best regards
Thomas

>=20
> Thanks, Daniel
>=20
>>
>>>   */
>>>  void drm_gem_shmem_free_object(struct drm_gem_object *obj)
>>>  {
>>> @@ -214,7 +215,8 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
>>>   * @obj: GEM object
>>>   *
>>>   * This function makes sure the backing pages are pinned in memory w=
hile the
>>> - * buffer is exported.
>>> + * buffer is exported. It should only be used to implement
>>> + * &drm_gem_object_funcs.pin.
>>>   *
>>>   * Returns:
>>>   * 0 on success or a negative error code on failure.
>>> @@ -232,7 +234,7 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
>>>   * @obj: GEM object
>>>   *
>>>   * This function removes the requirement that the backing pages are =
pinned in
>>> - * memory.
>>> + * memory. It should only be used to implement &drm_gem_object_funcs=
=2Eunpin.
>>>   */
>>>  void drm_gem_shmem_unpin(struct drm_gem_object *obj)
>>>  {
>>> @@ -285,8 +287,14 @@ static void *drm_gem_shmem_vmap_locked(struct dr=
m_gem_shmem_object *shmem)
>>>   * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM obj=
ect
>>>   * @shmem: shmem GEM object
>>>   *
>>> - * This function makes sure that a virtual address exists for the bu=
ffer backing
>>> - * the shmem GEM object.
>>> + * This function makes sure that a contiguous kernel virtual address=
 mapping
>>> + * exists for the buffer backing the shmem GEM object.
>>> + *
>>> + * This function can be used to implement &drm_gem_object_funcs.vmap=
=2E But it can
>>> + * also be called by drivers directly, in which case it will hide th=
e
>>> + * differences between dma-buf imported and natively allocated objec=
ts.
>>> + *
>>> + * Acquired mappings should be cleaned up by calling drm_gem_shmem_v=
unmap().
>>>   *
>>>   * Returns:
>>>   * 0 on success or a negative error code on failure.
>>> @@ -330,7 +338,13 @@ static void drm_gem_shmem_vunmap_locked(struct d=
rm_gem_shmem_object *shmem)
>>>   * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM obj=
ect
>>>   * @shmem: shmem GEM object
>>>   *
>>> - * This function removes the virtual address when use count drops to=
 zero.
>>> + * This function cleans up a kernel virtual address mapping acquired=
 by
>>> + * drm_gem_shmem_vmap(). The mapping is only removed when the use co=
unt drops to
>>> + * zero.
>>> + *
>>> + * This function can be used to implement &drm_gem_object_funcs.vmap=
=2E But it can
>>> + * also be called by drivers directly, in which case it will hide th=
e
>>> + * differences between dma-buf imported and natively allocated objec=
ts.
>>>   */
>>>  void drm_gem_shmem_vunmap(struct drm_gem_object *obj, void *vaddr)
>>>  {
>>> @@ -559,6 +573,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
>>>   * @p: DRM printer
>>>   * @indent: Tab indentation level
>>>   * @obj: GEM object
>>> + *
>>> + * This implements the &drm_gem_object_funcs.info callback.
>>>   */
>>>  void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int in=
dent,
>>>  			      const struct drm_gem_object *obj)
>>> @@ -577,7 +593,12 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
>>>   * @obj: GEM object
>>>   *
>>>   * This function exports a scatter/gather table suitable for PRIME u=
sage by
>>> - * calling the standard DMA mapping API.
>>> + * calling the standard DMA mapping API. Drivers should not call thi=
s function
>>> + * directly, instead it should only be used as an implementation for=

>>> + * &drm_gem_object_funcs.get_sg_table.
>>> + *
>>> + * Drivers who need to acquire an scatter/gather table for objects n=
eed to call
>>> + * drm_gem_shmem_get_pages_sgt() instead.
>>>   *
>>>   * Returns:
>>>   * A pointer to the scatter/gather table of pinned pages or NULL on =
failure.
>>> @@ -599,6 +620,10 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>>   * the sg table doesn't exist, the pages are pinned, dma-mapped, and=
 a sg
>>>   * table created.
>>>   *
>>> + * This is the main function for drivers to get at backing storage, =
and it hides
>>> + * and difference between dma-buf imported and natively allocated ob=
jects.
>>> + * drm_gem_shmem_get_sg_table() should not be directly called by dri=
vers.
>>> + *
>>>   * Returns:
>>>   * A pointer to the scatter/gather table of pinned pages or errno on=
 failure.
>>>   */
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CEeOuTjzCGCn5JRSBQWF9uRmgjOAqhcqf--

--XqqPw1zEO6klucqdXHcAJ1fGUO2ue5ZHP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6+NhMACgkQaA3BHVML
eiNJ+QgAv/xOZ+SV+HfdpTslk9deJCJjgqXLP8c/blqihXOWjyHwLDM3G0OsRkZw
o+YoSwL/5yXnDM2a0oSqKsTJHes0IgGrZnEj0IqG0SL7B+ZAzb/ZKd8EqAsxBhqL
pwDLoG1T+lEU8o6OT/sABLh+JgvYqBtLxacXtdXH+50L8dzehCJFPdahdazvUIGr
3NImy7KGs0fP2cEfCC3bxjeCB8fXTpq/RznEANFYRKFgXgadjaTJZzs6A+dbDqzM
BvcVNlzjzQ/4jEspXkmlHGbQRyS+yU07rVm9LIcVVce7Q1QYx0jnBarI8p+MkX2A
HBPS1WW2m2Wil2Glq07T49B76jIRlg==
=LvWg
-----END PGP SIGNATURE-----

--XqqPw1zEO6klucqdXHcAJ1fGUO2ue5ZHP--

--===============1621735174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1621735174==--
