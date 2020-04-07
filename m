Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D71A0761
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67DD6E514;
	Tue,  7 Apr 2020 06:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92AA6E514
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 06:36:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A333AAB8F;
 Tue,  7 Apr 2020 06:36:50 +0000 (UTC)
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
To: Wambui Karuga <wambui.karugax@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
 <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
 <20200318165846.GC3090655@kroah.com>
 <CAKMK7uGbg5Lax+eXJda4k9LNd7JBb+LRtRw4S+bZ4GbNGT--ZA@mail.gmail.com>
 <20200319075524.GB3445010@kroah.com>
 <20200319101830.GB2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003191522020.89327@wambui>
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
Message-ID: <cfbf0a0c-8fe1-ff41-d8cb-8f96a3912a36@suse.de>
Date: Tue, 7 Apr 2020 08:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.21.99999.375.2003191522020.89327@wambui>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0235032248=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0235032248==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6mY5WCj8o464gsmRMV60mpBknP0sOP0q2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6mY5WCj8o464gsmRMV60mpBknP0sOP0q2
Content-Type: multipart/mixed; boundary="mwE4Ij88AF68pEAL96OgyaZsE0QujrvLw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wambui Karuga <wambui.karugax@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <cfbf0a0c-8fe1-ff41-d8cb-8f96a3912a36@suse.de>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
 <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
 <20200318165846.GC3090655@kroah.com>
 <CAKMK7uGbg5Lax+eXJda4k9LNd7JBb+LRtRw4S+bZ4GbNGT--ZA@mail.gmail.com>
 <20200319075524.GB3445010@kroah.com>
 <20200319101830.GB2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003191522020.89327@wambui>
In-Reply-To: <alpine.LNX.2.21.99999.375.2003191522020.89327@wambui>

--mwE4Ij88AF68pEAL96OgyaZsE0QujrvLw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.03.20 um 13:27 schrieb Wambui Karuga:
>=20
>=20
> On Thu, 19 Mar 2020, Daniel Vetter wrote:
>=20
>> On Thu, Mar 19, 2020 at 08:55:24AM +0100, Greg KH wrote:
>>> On Wed, Mar 18, 2020 at 08:10:43PM +0100, Daniel Vetter wrote:
>>>> On Wed, Mar 18, 2020 at 5:58 PM Greg KH <gregkh@linuxfoundation.org>=

>>>> wrote:
>>>>>
>>>>> On Wed, Mar 18, 2020 at 05:31:47PM +0100, Daniel Vetter wrote:
>>>>>> On Wed, Mar 18, 2020 at 5:03 PM Wambui Karuga
>>>>>> <wambui.karugax@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Wed, 18 Mar 2020, Daniel Vetter wrote:
>>>>>>>
>>>>>>>> On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
>>>>>>>>> Since 987d65d01356 (drm: debugfs: make
>>>>>>>>> drm_debugfs_create_files() never fail),
>>>>>>>>> drm_debugfs_create_files() never
>>>>>>>>> fails and should return void. Therefore, remove its use as the
>>>>>>>>> return value of drm_vram_mm_debugfs_init(), and have the functi=
on
>>>>>>>>> return 0 directly.
>>>>>>>>>
>>>>>>>>> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to=

>>>>>>>>> avoid
>>>>>>>>> introducing build issues and build breakage.
>>>>>>>>>
>>>>>>>>> References:
>>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2020-February/=
257183.html
>>>>>>>>>
>>>>>>>>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>>>>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>> ---
>>>>>>>>> =C2=A0drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
>>>>>>>>> =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>> index 92a11bb42365..c8bcc8609650 100644
>>>>>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>> @@ -1048,14 +1048,12 @@ static const struct drm_info_list
>>>>>>>>> drm_vram_mm_debugfs_list[] =3D {
>>>>>>>>> =C2=A0 */
>>>>>>>>> =C2=A0int drm_vram_mm_debugfs_init(struct drm_minor *minor)
>>>>>>>>> =C2=A0{
>>>>>>>>> -=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>>>>>>> -
>>>>>>>>> =C2=A0#if defined(CONFIG_DEBUG_FS)
>>>>>>>>
>>>>>>>> Just noticed that this #if here is not needed, we already have a=

>>>>>>>> dummy
>>>>>>>> function for that case. Care to write a quick patch to remove
>>>>>>>> it? On top
>>>>>>>> of this patch series here ofc, I'm in the processing of merging
>>>>>>>> the entire
>>>>>>>> pile.
>>>>>>>>
>>>>>>>> Thanks, Daniel
>>>>>>> Hi Daniel,
>>>>>>> Without this check here, and compiling without CONFIG_DEBUG_FS, t=
his
>>>>>>> function is run and the drm_debugfs_create_files() does not have
>>>>>>> access to
>>>>>>> the parameters also protected by an #if above this function. So
>>>>>>> the change
>>>>>>> throws an error for me. Is that correct?
>>>>>>
>>>>>> Hm right. Other drivers don't #ifdef out their debugfs file functi=
ons
>>>>>> ... kinda a bit disappointing that we can't do this in the neatest=

>>>>>> way
>>>>>> possible.
>>>>>>
>>>>>> Greg, has anyone ever suggested to convert the debugfs_create_file=

>>>>>> function (and similar things) to macros that don't use any of the
>>>>>> arguments, and then also annotating all the static
>>>>>> functions/tables as
>>>>>> __maybe_unused and let the compiler garbage collect everything?
>>>>>> Instead of explicit #ifdef in all the drivers ...
>>>>>
>>>>> No, no one has suggested that, having the functions be static inlin=
e
>>>>> should make it all "just work" properly if debugfs is not enabled.=C2=
=A0
>>>>> The
>>>>> variables will not be used, so the compiler should just optimize th=
em
>>>>> away properly.
>>>>>
>>>>> No checks for CONFIG_DEBUG_FS should be needed anywhere in .c code.=

>>>>
>>>> So the trouble with this one is that the static inline functions for=

>>>> the debugfs file are wrapped in a #if too, and hence if we drop the
>>>> #if around the function call stuff won't compile. Should we drop all=

>>>> the #if in the .c file and assume the compiler will remove all the
>>>> dead code and dead functions?
>>>
>>> Yes you should :)
>>>
>>> there should not be any need for #if in a .c file for debugfs stuff.
>>
>> Wambui, can you pls try that out? I.e. removing all the #if for
>> CONFIG_DEBUG_FS from that file.
>=20
> Removing them works with CONFIG_DEBUG_FS enabled or disabled.
> I can send a patch for that.

Please do. Removing explicit checks for CONFIG_ is usually a good thing.

Best regards
Thomas

>=20
> wambui karuga
>> -Daniel
>> --=C2=A0
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>>
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


--mwE4Ij88AF68pEAL96OgyaZsE0QujrvLw--

--6mY5WCj8o464gsmRMV60mpBknP0sOP0q2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6MH38ACgkQaA3BHVML
eiPRpAf/XgFMgUJ3EjT30XEr8vTATgBrz7VDp5Kg8yOi8yTEQZ+W+IOsfQG43xcl
3O8ZP3m9kvse6ILrojpr51f4mWj64zW7D4I5zuzGh7MS0nfDUCKYL2/kp/Dgiy8K
04pIJVmuTEIIjdd2IZXJOwRfPtcu9GVNIgRbL+aqv854dOTfcFEjx7MQejaCKiXg
Al8t5V0Ewce8nBMFLbipCutq6FjanV5G0kHWAszO6ftD1RFD3KTGSPkJ+1vJZrib
5I7EtoxXJ5lX3FMksJML4RYI5LDZifbAQT7lH7uqQgxY4hfaswwPXKjQ5EHxBh39
V/bNZ8yh/4fKv9QQx1IkzuqbJtV03w==
=b7HE
-----END PGP SIGNATURE-----

--6mY5WCj8o464gsmRMV60mpBknP0sOP0q2--

--===============0235032248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0235032248==--
