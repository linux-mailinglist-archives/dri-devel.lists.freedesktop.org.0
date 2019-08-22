Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88699B5C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 19:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6976E4EC;
	Thu, 22 Aug 2019 17:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B17B6E4EC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 17:25:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C32AFACE1;
 Thu, 22 Aug 2019 17:25:16 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
Date: Thu, 22 Aug 2019 19:25:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813093616.GA65475@shbuild999.sh.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: multipart/mixed; boundary="===============2124959635=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2124959635==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8f13AghQDCoLYCEzlb2VaaF6PsZEH0MFd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8f13AghQDCoLYCEzlb2VaaF6PsZEH0MFd
Content-Type: multipart/mixed; boundary="eOXzQD93HPVrQ7Y7FfRBv610l3RMUyLPc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen
 <rong.a.chen@intel.com>, michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Message-ID: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
In-Reply-To: <20190813093616.GA65475@shbuild999.sh.intel.com>

--eOXzQD93HPVrQ7Y7FfRBv610l3RMUyLPc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I was traveling and could reply earlier. Sorry for taking so long.

Am 13.08.19 um 11:36 schrieb Feng Tang:
> Hi Thomas,=20
>=20
> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>> Hi Thomas,
>>
>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>> Hi,
>>>
>>>>> Actually we run the benchmark as a background process, do we need t=
o
>>>>> disable the cursor and test again?
>>>> There's a worker thread that updates the display from the shadow buf=
fer.
>>>> The blinking cursor periodically triggers the worker thread, but the=

>>>> actual update is just the size of one character.
>>>>
>>>> The point of the test without output is to see if the regression com=
es
>>> >from the buffer update (i.e., the memcpy from shadow buffer to VRAM)=
, or
>>> >from the worker thread. If the regression goes away after disabling =
the
>>>> blinking cursor, then the worker thread is the problem. If it alread=
y
>>>> goes away if there's simply no output from the test, the screen upda=
te
>>>> is the problem. On my machine I have to disable the blinking cursor,=
 so
>>>> I think the worker causes the performance drop.
>>>
>>> We disabled redirecting stdout/stderr to /dev/kmsg,=C2=A0 and the reg=
ression is
>>> gone.
>>>
>>> commit:
>>> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer=
 console
>>> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic=
 framebuffer
>>> emulation
>>>
>>> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams=
/testbox
>>> ----------------=C2=A0 -------------------------- -------------------=
--------
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s=
tddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 44481
>>> vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 44481=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-ME=
AN vm-scalability.median
>>
>> Till now, from Rong's tests:
>> 1. Disabling cursor blinking doesn't cure the regression.
>> 2. Disabling printint test results to console can workaround the
>> regression.
>>
>> Also if we set the perfer_shadown to 0, the regression is also
>> gone.
>=20
> We also did some further break down for the time consumed by the
> new code.
>=20
> The drm_fb_helper_dirty_work() calls sequentially=20
> 1. drm_client_buffer_vmap	  (290 us)
> 2. drm_fb_helper_dirty_blit_real  (19240 us)
> 3. helper->fb->funcs->dirty()    ---> NULL for mgag200 driver
> 4. drm_client_buffer_vunmap       (215 us)
>

It's somewhat different to what I observed, but maybe I just couldn't
reproduce the problem correctly.

> The average run time is listed after the function names.
>=20
> From it, we can see drm_fb_helper_dirty_blit_real() takes too long
> time (about 20ms for each run). I guess this is the root cause
> of this regression, as the original code doesn't use this dirty worker.=


True, the original code uses a temporary buffer, but updates the display
immediately.

My guess is that this could be a caching problem. The worker runs on a
different CPU, which doesn't have the shadow buffer in cache.

> As said in last email, setting the prefer_shadow to 0 can avoid
> the regrssion. Could it be an option?

Unfortunately not. Without the shadow buffer, the console's display
buffer permanently resides in video memory. It consumes significant
amount of that memory (say 8 MiB out of 16 MiB). That doesn't leave
enough room for anything else.

The best option is to not print to the console.

Best regards
Thomas

> Thanks,
> Feng
>=20
>>
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -167,7 +167,7 @@ int mgag200_driver_load(struct drm_device *dev, un=
signed long flags)
>>  		dev->mode_config.preferred_depth =3D 16;
>>  	else
>>  		dev->mode_config.preferred_depth =3D 32;
>> -	dev->mode_config.prefer_shadow =3D 1;
>> +	dev->mode_config.prefer_shadow =3D 0;
>>
>> And from the perf data, one obvious difference is good case don't
>> call drm_fb_helper_dirty_work(), while bad case calls.
>>
>> Thanks,
>> Feng
>>
>>> Best Regards,
>>> Rong Chen
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--eOXzQD93HPVrQ7Y7FfRBv610l3RMUyLPc--

--8f13AghQDCoLYCEzlb2VaaF6PsZEH0MFd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1ez/sACgkQaA3BHVML
eiMfLAf9HruCrICkhGnbLVzxz4KoE5Z5+e5HdCvKrT1nT05TqcDQydqNQ3GDa+Xe
BNa19dA3ykrIEZRPzRI6nd200RcOTkhd3bC+Rfrer52umNa07LwPR2nQXDhLQhpo
BphpriA7ozbgS5YC80ufX+CNOd/wSv0DZGmOMkhqYVS64h9alqAL/udnKBpJPD7O
hv2d8mJSbgpNuohfmBInGM/8Ehl7i4fG+h55ZqYiSWdxHkE5pcgCEkqKVVskA9eU
XcmnlVklANqbCvBCDIIl+3yD7jHRYnxG1IxRVMdg9R8++QmmA6qhCiyow1zWpDe1
t7SKaC2uZeCYHEjDHAUbfkvaLM92nw==
=Mvr4
-----END PGP SIGNATURE-----

--8f13AghQDCoLYCEzlb2VaaF6PsZEH0MFd--

--===============2124959635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2124959635==--
