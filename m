Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDD2CA213
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F886E4F1;
	Tue,  1 Dec 2020 12:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109A76E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:05:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D607ACC1;
 Tue,  1 Dec 2020 12:05:42 +0000 (UTC)
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <dcf00499-666b-e45a-a568-d57698e2d576@suse.de>
Date: Tue, 1 Dec 2020 13:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============0099848501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0099848501==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xyIfhSxnvbR5z0c6IglN89AQED2mcp811"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xyIfhSxnvbR5z0c6IglN89AQED2mcp811
Content-Type: multipart/mixed; boundary="SmICulmTawXx3Zh0EE0oZRRjAXv0MUEJa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <dcf00499-666b-e45a-a568-d57698e2d576@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
In-Reply-To: <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>

--SmICulmTawXx3Zh0EE0oZRRjAXv0MUEJa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 11:00 schrieb Daniel Vetter:
>> [...]
>> For my POV, the current interfaces have no clear policy or semantics.
>> Looking through the different GEM implementations, each one seems to
>> have its own interpretation.
>=20
> Yup, that's the problem really. In the past we've had vmap exclusively
> for permanently pinned access, with no locking requirements. Now we're
> trying to make this more dynamic, but in a somewhat ad-hoc fashion
> (generic fbdev emulation charged ahead with making the fbdev
> framebuffer evictable), and now it breaks at every seam. Adding more
> ad-hoc semantics on top doesn't seem like a good idea.
>=20
> That's why I think we should have 2 different interfaces:
> - dma_buf_vmap, the one we currently have. Permanently pins the
> buffer, mapping survives, no locking required.

I just looked at the implementation of dma_buf_vmap() and there's no=20
pinning happening AFAICT. Also, none of the callback's implementations=20
does pinning (except vram helpers). Do you mean dma_buf_attach() instead?=


Best regards
Thomas

> - dma_buf_vmap_local, the new interface, the one that generic fbdev
> should have used (but oh well mistakes happen), requires
> dma_resv_lock, the mapping is only local to the caller
>=20
> Trying to shovel both semantics into one interface, depending upon
> which implementation we have backing the buffer, doesn't work indeed.
>=20
> Also on the pin topic, I think neither interface should require
> callers to explicitly pin anything. For existing users it should
> happen automatically behind the scenes imo, that's what they're
> expecting.
> -Daniel
>=20
>=20
>>> I think we could use what we've done for dynamic dma-buf attachment
>>> (which also change locking rules) and just have new functions for the=

>>> new way (i.e. short term vmap protected by dma_resv lock. Maybe call
>>> these dma_buf_vmap_local, in the spirit of the new kmap_local which
>>> are currently under discussion. I think _local suffix is better, for
>>> otherwise people might do something silly like
>>>
>>>       dma_resv_lock();
>>>       dma_buf_vmap_locked();
>>>       dma_resv_unlock();
>>>
>>>       /* actual access maybe even in some other thread */
>>>
>>>      dma_buf_resv_lock();
>>>      dma_buf_vunmap_unlocked();
>>>      dma_resv_unlock();
>>>
>>> _local suffix is better at telling that the resulting pointer has ver=
y
>>> limited use (essentially just local to the calling context, if you
>>> don't change any locking or anything).
>>
>> _local sounds good.
>>
>> Best regards
>> Thomas
>>
>>>
>>> I think encouraging importers to call dma_buf_pin/unpin isn't a good
>>> idea. Yes dynamic ones need it, but maybe we should check for that
>>> somehow in the exporterd interface (atm only amdgpu is using it).
>>> -Daniel
>>>
>>>
>>>
>>>
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>>>
>>>>> Cheers,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> That's what I meant with that this approach here is very sprawling=
 :-/
>>>>>> -Daniel
>>>>>>
>>>>>>>      */
>>>>>>>     int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_b=
uf_map
>>>>>>> *map)
>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>>>>>>          * Returns a virtual address for the buffer. Used by the
>>>>>>>          * drm_gem_dmabuf_vmap() helper.
>>>>>>>          *
>>>>>>> +     * Notes to implementors:
>>>>>>> +     *
>>>>>>> +     * - Implementations must expect pairs of @vmap and @vunmap =
to be
>>>>>>> +     *   called frequently and should optimize for this case.
>>>>>>> +     *
>>>>>>> +     * - Implemenations may expect the caller to hold the GEM ob=
ject's
>>>>>>> +     *   reservation lock to protect against concurrent calls an=
d
>>>>>>> relocation
>>>>>>> +     *   of the GEM object.
>>>>>>> +     *
>>>>>>> +     * - Implementations may provide additional guarantees (e.g.=
,
>>>>>>> working
>>>>>>> +     *   without holding the reservation lock).
>>>>>>> +     *
>>>>>>>          * This callback is optional.
>>>>>>> +     *
>>>>>>> +     * See also drm_gem_dmabuf_vmap()
>>>>>>>          */
>>>>>>>         int (*vmap)(struct drm_gem_object *obj, struct dma_buf_ma=
p *map);
>>>>>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>>>>>>          * drm_gem_dmabuf_vunmap() helper.
>>>>>>>          *
>>>>>>>          * This callback is optional.
>>>>>>> +     *
>>>>>>> +     * See also @vmap.
>>>>>>>          */
>>>>>>>         void (*vunmap)(struct drm_gem_object *obj, struct dma_buf=
_map
>>>>>>> *map);
>>>>>>> --
>>>>>>> 2.29.2
>>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SmICulmTawXx3Zh0EE0oZRRjAXv0MUEJa--

--xyIfhSxnvbR5z0c6IglN89AQED2mcp811
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GMZUFAwAAAAAACgkQlh/E3EQov+DF
hA//WK28lukf+oEgUA8KYm/eZHMCKx3qjdu/l0cakTUDdJGY15jbN8u44k6la9WpPYutYbx1jVhH
clSggO4I9XPAYaeNTQofjbOVsxqQSSrKhFUXEAqoPoTieX8/Z6TNT8suIojwNy6N2gGH5BMxCHto
rDpJ9n4AD42hbrJzV3m4/jktsHvN3ew9GyRJPvkzPT9aYEiSuQPVPZ+/0ervZ60jbfBovf7r+2Xw
A4fiBmZvLoNdbyzJZvc4rHBXitnURn6pOxuK4i5Rko0DGrBwtT+PL+CCJuNQrblTTABsAlu18XDP
Ok5uT7ltDtfYYItBEXyqxwcc9MhekGotEkbVzwAOb2zS5wT0tfZi2MqLxGqVyHGFjAC44jNBvyqh
Ch9cqp08t/v3gtVXGeLGJq+owYKS+Ay/awlOAARMGsZJucJhr5PD1lXXwbTT5GfZ3chydi1FabXk
/XW4Nw2fmyj3T9ueJarL729DI/5tjime7Fsuzyt/E2NSeO0QpY+9Nrpy9mFGntEn8IPrqPTLp7eL
/OCVOkSKJG1JDX09rsCdEzYUxLOMibMvynIMBFoQGmlYPp1P+WXs2sv/hJyb/UlE3CO+TnMNrFzb
hTRsLTwgj/usWW2GFD6pf4MqEEcU4qj2fKLnsB5VIv40wppX8GxDz7hNiPwIvcd7+Mj9FNY9HDZc
GBE=
=rZHn
-----END PGP SIGNATURE-----

--xyIfhSxnvbR5z0c6IglN89AQED2mcp811--

--===============0099848501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0099848501==--
