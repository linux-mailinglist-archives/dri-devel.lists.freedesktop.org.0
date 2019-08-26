Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD849CD9C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 12:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070089DB9;
	Mon, 26 Aug 2019 10:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5BE89DB9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 10:50:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CE34AC7F;
 Mon, 26 Aug 2019 10:50:55 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>
References: <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
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
Message-ID: <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
Date: Mon, 26 Aug 2019 12:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824051605.GA63850@shbuild999.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1537108449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1537108449==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qTekZWfhbXgZzuvDBfkVnQubw66wI8VI3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qTekZWfhbXgZzuvDBfkVnQubw66wI8VI3
Content-Type: multipart/mixed; boundary="hM3CWJKXDvOYTFn4hLGk5fJR18JQg9wIh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen
 <rong.a.chen@intel.com>, michel@daenzer.net, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Message-ID: <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
In-Reply-To: <20190824051605.GA63850@shbuild999.sh.intel.com>

--hM3CWJKXDvOYTFn4hLGk5fJR18JQg9wIh
Content-Type: multipart/mixed;
 boundary="------------35AD30D1AF209D4BF1163BA1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------35AD30D1AF209D4BF1163BA1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Feng

Am 24.08.19 um 07:16 schrieb Feng Tang:
> Hi Thomas,
>=20
> On Thu, Aug 22, 2019 at 07:25:11PM +0200, Thomas Zimmermann wrote:
>> Hi
>>=20
>> I was traveling and could reply earlier. Sorry for taking so long.
>=20
> No problem! I guessed so :)
>=20
>>=20
>> Am 13.08.19 um 11:36 schrieb Feng Tang:
>>> Hi Thomas,
>>>=20
>>> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>>>> Hi Thomas,
>>>>=20
>>>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>>>> Hi,
>>>>>=20
>>>>>>> Actually we run the benchmark as a background process, do
>>>>>>> we need to disable the cursor and test again?
>>>>>> There's a worker thread that updates the display from the=20
>>>>>> shadow buffer. The blinking cursor periodically triggers=20
>>>>>> the worker thread, but the actual update is just the size=20
>>>>>> of one character.
>>>>>>=20
>>>>>> The point of the test without output is to see if the=20
>>>>>> regression comes from the buffer update (i.e., the memcpy=20
>>>>>> from shadow buffer to VRAM), or from the worker thread. If
>>>>>>  the regression goes away after disabling the blinking=20
>>>>>> cursor, then the worker thread is the problem. If it=20
>>>>>> already goes away if there's simply no output from the=20
>>>>>> test, the screen update is the problem. On my machine I=20
>>>>>> have to disable the blinking cursor, so I think the worker
>>>>>>  causes the performance drop.
>>>>>=20
>>>>> We disabled redirecting stdout/stderr to /dev/kmsg,  and the
>>>>>  regression is gone.
>>>>>=20
>>>>> commit: f1f8555dfb9 drm/bochs: Use shadow buffer for bochs=20
>>>>> framebuffer console 90f479ae51a drm/mgag200: Replace struct=20
>>>>> mga_fbdev with generic framebuffer emulation
>>>>>=20
>>>>> f1f8555dfb9a70a2  90f479ae51afa45efab97afdde=20
>>>>> testcase/testparams/testbox ----------------=20
>>>>> -------------------------- ---------------------------=20
>>>>> %stddev      change         %stddev \          | \ 43785=20
>>>>> 44481 vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01=20
>>>>> 43785 44481        GEO-MEAN vm-scalability.median
>>>>=20
>>>> Till now, from Rong's tests: 1. Disabling cursor blinking=20
>>>> doesn't cure the regression. 2. Disabling printint test results
>>>> to console can workaround the regression.
>>>>=20
>>>> Also if we set the perfer_shadown to 0, the regression is also=20
>>>> gone.
>>>=20
>>> We also did some further break down for the time consumed by the=20
>>> new code.
>>>=20
>>> The drm_fb_helper_dirty_work() calls sequentially 1.=20
>>> drm_client_buffer_vmap	  (290 us) 2.=20
>>> drm_fb_helper_dirty_blit_real  (19240 us) 3.=20
>>> helper->fb->funcs->dirty()    ---> NULL for mgag200 driver 4.=20
>>> drm_client_buffer_vunmap       (215 us)
>>>=20
>>=20
>> It's somewhat different to what I observed, but maybe I just=20
>> couldn't reproduce the problem correctly.
>>=20
>>> The average run time is listed after the function names.
>>>=20
>>> From it, we can see drm_fb_helper_dirty_blit_real() takes too=20
>>> long time (about 20ms for each run). I guess this is the root=20
>>> cause of this regression, as the original code doesn't use this=20
>>> dirty worker.
>>=20
>> True, the original code uses a temporary buffer, but updates the=20
>> display immediately.
>>=20
>> My guess is that this could be a caching problem. The worker runs=20
>> on a different CPU, which doesn't have the shadow buffer in cache.
>=20
> Yes, that's my thought too. I profiled the working set size, for most
> of the drm_fb_helper_dirty_blit_real(), it will update a buffer=20
> 4096x768(3 MB), and as it is called 30~40 times per second, it surely
> will affect the cache.
>=20
>=20
>>> As said in last email, setting the prefer_shadow to 0 can avoid=20
>>> the regrssion. Could it be an option?
>>=20
>> Unfortunately not. Without the shadow buffer, the console's
>> display buffer permanently resides in video memory. It consumes
>> significant amount of that memory (say 8 MiB out of 16 MiB). That
>> doesn't leave enough room for anything else.
>>=20
>> The best option is to not print to the console.
>=20
> Do we have other options here?

I attached two patches. Both show an improvement in my setup at least.
Could you please test them independently from each other and report back?=


prefetch.patch prefetches the shadow buffer two scanlines ahead during
the blit function. The idea is to have the scanlines in cache when they
are supposed to go to hardware.

schedule.patch schedules the dirty worker on the current CPU core (i.e.,
the one that did the drawing to the shadow buffer). Hopefully the shadow
buffer remains in cache meanwhile.

Best regards
Thomas

> My thought is this is clearly a regression, that the old driver
> works fine, while the new version in linux-next doesn't. Also for a
> frame buffer console, writting dozens line of message to it is not a
> rare user case. We have many test platforms
> (servers/desktops/laptops) with different kinds of GFX hardwares, and
> this model works fine for many years :)
>=20
> Thanks, Feng
>=20
>=20
>=20
>> Best regards Thomas
>>=20
>>> Thanks, Feng
>>>=20
>>>>=20
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c +++=20
>>>> b/drivers/gpu/drm/mgag200/mgag200_main.c @@ -167,7 +167,7 @@=20
>>>> int mgag200_driver_load(struct drm_device *dev, unsigned long=20
>>>> flags) dev->mode_config.preferred_depth =3D 16; else=20
>>>> dev->mode_config.preferred_depth =3D 32; -=20
>>>> dev->mode_config.prefer_shadow =3D 1; +=20
>>>> dev->mode_config.prefer_shadow =3D 0;
>>>>=20
>>>> And from the perf data, one obvious difference is good case=20
>>>> don't call drm_fb_helper_dirty_work(), while bad case calls.
>>>>=20
>>>> Thanks, Feng
>>>>=20
>>>>> Best Regards, Rong Chen
>>> _______________________________________________ dri-devel mailing
>>> list dri-devel@lists.freedesktop.org=20
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>=20
>>=20
>> -- Thomas Zimmermann Graphics Driver Developer SUSE Linux GmbH,=20
>> Maxfeldstrasse 5, 90409 Nuernberg, Germany GF: Felix Imend=C3=B6rffer,=
=20
>> Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCrnberg)
>>=20
>=20
>=20
>=20
> _______________________________________________ dri-devel mailing=20
> list dri-devel@lists.freedesktop.org=20
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)

--------------35AD30D1AF209D4BF1163BA1
Content-Type: text/x-patch;
 name="prefetch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="prefetch.patch"

=46rom 7258064b16ab4f44db708670f63c88db8b3f2eea Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 26 Aug 2019 09:53:38 +0200
Subject: prefetch shadow buffer two lines ahead of blit offset

---
 drivers/gpu/drm/drm_fb_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
index a7ba5b4902d6..61cf436840c7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -33,6 +33,7 @@
 #include <linux/dma-buf.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/prefetch.h>
 #include <linux/slab.h>
 #include <linux/sysrq.h>
 #include <linux/vmalloc.h>
@@ -390,6 +391,8 @@ static void drm_fb_helper_dirty_blit_real(struct drm_=
fb_helper *fb_helper,
 	unsigned int y;
=20
 	for (y =3D clip->y1; y < clip->y2; y++) {
+		if (y < clip->y2 - 2)
+			prefetch_range(src + 2 * fb->pitches[0], len);
 		memcpy(dst, src, len);
 		src +=3D fb->pitches[0];
 		dst +=3D fb->pitches[0];
--=20
2.22.0


--------------35AD30D1AF209D4BF1163BA1
Content-Type: text/x-patch;
 name="schedule.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="schedule.patch"

=46rom 60d5322ae3ab2a4c82c1579b37c34abb3b8222f0 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 26 Aug 2019 12:17:38 +0200
Subject: schedule dirty worker on local core

---
 drivers/gpu/drm/drm_fb_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
index a7ba5b4902d6..9abc950cfae2 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -34,6 +34,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
 #include <linux/sysrq.h>
 #include <linux/vmalloc.h>
=20
@@ -642,7 +643,7 @@ static void drm_fb_helper_dirty(struct fb_info *info,=
 u32 x, u32 y,
 	clip->y2 =3D max_t(u32, clip->y2, y + height);
 	spin_unlock_irqrestore(&helper->dirty_lock, flags);
=20
-	schedule_work(&helper->dirty_work);
+	schedule_work_on(smp_processor_id(), &helper->dirty_work);
 }
=20
 /**
--=20
2.22.0


--------------35AD30D1AF209D4BF1163BA1--

--hM3CWJKXDvOYTFn4hLGk5fJR18JQg9wIh--

--qTekZWfhbXgZzuvDBfkVnQubw66wI8VI3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1juYoACgkQaA3BHVML
eiNoFAf9Eg5dRtZuBeO+RPsJn/DnZlcprBlVtzRntwQrN1UcL2ozD0aaP/I4y9Kz
0fLbhJNXnRUsSIpNgKXuGIyDQ8PNhV8miafIXc5UPnu08yrGGKRnT5mbHI8kjBXZ
dkZEjFNGXC/9ZIXUJutJMGKDKjIazVhFfEzaAjCykuZAT6yzcaf0aaiF7rnInvYs
h7a5rV2QCt0PYkfOudeIDfZO50SKW+iuXZAcJ6vRhlDYBdGudh2t1JkT3d/yxJ2j
CCUdYuzbSUXr316DjM3OXahE6fss8OYUgq9WLnQ6XM7exURwrnbASrbm6XITDTX7
a7ZxO7gGtRU1AdkHtzO5RVuWcsRR/g==
=+1Id
-----END PGP SIGNATURE-----

--qTekZWfhbXgZzuvDBfkVnQubw66wI8VI3--

--===============1537108449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1537108449==--
