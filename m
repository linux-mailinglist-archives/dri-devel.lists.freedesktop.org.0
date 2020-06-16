Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D131FB430
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 16:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013776E8CC;
	Tue, 16 Jun 2020 14:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA696E8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:24:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BFD1CAC6E;
 Tue, 16 Jun 2020 14:24:38 +0000 (UTC)
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
To: Emil Velikov <emil.l.velikov@gmail.com>,
 kernel test robot <rong.a.chen@intel.com>
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
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
Message-ID: <8345c20c-4794-87d5-4464-c284b8e9cf73@suse.de>
Date: Tue, 16 Jun 2020 16:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0763514302=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0763514302==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sPdQuGznd2UcBmn1EpRAsvVkJ2TWqbnhb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sPdQuGznd2UcBmn1EpRAsvVkJ2TWqbnhb
Content-Type: multipart/mixed; boundary="oH3VVD8DpCvycnlm4fhRD7pKNpPDKimI4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>,
 kernel test robot <rong.a.chen@intel.com>
Cc: john.p.donnelly@oracle.com, ML dri-devel
 <dri-devel@lists.freedesktop.org>, lkp@lists.01.org,
 OTC LSE PnP <otc.lse.pnp@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <8345c20c-4794-87d5-4464-c284b8e9cf73@suse.de>
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
In-Reply-To: <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>

--oH3VVD8DpCvycnlm4fhRD7pKNpPDKimI4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.06.20 um 22:58 schrieb Emil Velikov:
> Hi all,
>=20
> On Thu, 4 Jun 2020 at 08:11, kernel test robot <rong.a.chen@intel.com> =
wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -64.9% regression of phoronix-test-suite.glmark2.800=
x600.score due to commit:
>>
> On one hand, I'm really happy to see performance testing happening
> although this report is missing various crucial pieces of information.
>=20
>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15] dr=
m/mgag200: Split MISC register update into PLL selection, SYNC and I/O")
>> url: https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mg=
ag200-Convert-to-atomic-modesetting/20200515-163744
>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>
>> in testcase: phoronix-test-suite
>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with =
48G memory
>> with following parameters:
>>
>>         need_x: true
> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
>=20
>>         test: glmark2-1.1.0
>>         cpufreq_governor: performance
>>         ucode: 0x1d
>>
>> test-description: The Phoronix Test Suite is the most comprehensive te=
sting and benchmarking platform available that provides an extensible fra=
mework for which new tests can be easily added.
>> test-url: http://www.phoronix-test-suite.com/
>>
> Please remove the test description and url. They don't add any value.
>=20
> Mention which Mesa version is used as well as on what GPU. The output
> of lspci and glxinfo will help here.
>=20
> For this particular test - there is no Mesa/upstream driver for this
> GPU, so I imagine one of the swrast drivers was used. Which one -
> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
> The output of `LD_DEBUG=3Dlibs glxinfo  |& grep _dri.so` will help here=
=2E
>=20
>> commit:
>>   bef2303526 ("drm/mgag200: Move mode-setting code into separate helpe=
r function")
>>   e44e907dd8 ("drm/mgag200: Split MISC register update into PLL select=
ion, SYNC and I/O")
>>
>=20
> Actually the offending commit has a subtle change of behaviour - it
> adds an extra MGAREG_MISC_RAMMAPEN.
> That is not documented and I've failed to spot it during review.
>=20
> Thomas - shall we revert that line in itself or at least add an inline
> comment why it is needed?

Oh, well spotted. I'll send out a patch to not set the bit. Hopefully
this will resolve the problem.

>=20
>>
>>   100 +---------------------------------------------------------------=
------+
>>    90 |-+    +      +   +.+      +    +     +    +      +   :         =
      |
>>       | :    :      :   : :      :    :     :    :      :   :         =
      |
>>    80 |-:    :      :   : :      :    :     :    :      :   :         =
      |
>>    70 |-::   :     ::   :  :     :   ::     ::   :     ::  :          =
      |
>>       |: :  : :    : : :   :    : :  : :   : :  : :    : : :          =
      |
>>    60 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :          =
      |
>>    50 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :          =
      |
>>    40 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :          =
      |
>>       |:  : : :   :  : :    :   : : :  :   :  : : :   :  : :O      O O=
 O  O |
>>    30 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :          =
      |
>>    20 |-+ ::   :  :   :     :  :   ::   : :   ::   :  : O :           =
      |
>>       |    :   : :    :      : :   :    : :    :   : :    :           =
      |
>>    10 |-+  :   : :    :      : :   :    : :    :   : :    :           =
      |
>>     0 +---------------------------------------------------------------=
------+
>>
>>
>>                    phoronix-test-suite.glmark2.1024x768.score
>>
>>   70 +----------------------------------------------------------------=
------+
>>      | +    +      +   +..+     +    +      +    +     +    +.+       =
      |
>>   60 |-:    :      :   :  :     :    :      :    :     :    :         =
      |
>>      | :    :      :   :  :     :    :      :    :     :    :         =
      |
>>   50 |-::   :     ::   :  :     ::   :      :   ::     ::   :         =
      |
>>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :          =
      |
>>   40 |:+:  : :    : : :    :   : :  : :    : :  : :   : :  :          =
      |
>>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :         O=
      |
>>   30 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :O      O  =
 O  O |
>>      |:  : : :   :  : :    :   :  : : :    : : :  :   :  : :          =
      |
>>   20 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :          =
      |
>>      |   ::   :  :   :      : :   ::   :  :   ::   : : O ::           =
      |
>>   10 |-+  :   : :    :      : :    :   :  :   :    : :    :           =
      |
>>      |    :   : :  O :    O : : O  :   :  : O :    : :    :           =
      |
>>    0 +----------------------------------------------------------------=
------+
>>
>>
>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
> Hmm I must be going blind - there isn't even a single * in either of th=
e graphs.
> Or perhaps my eyesight is fine and the legend or the graphs need fixing=
=2E

I cannot make sense of these graphs. The axis' should have descriptive
labels.

Best regards
Thomas

>=20
> HTH
> -Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oH3VVD8DpCvycnlm4fhRD7pKNpPDKimI4--

--sPdQuGznd2UcBmn1EpRAsvVkJ2TWqbnhb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7o1h4ACgkQaA3BHVML
eiPx8gf9GCM+08+XryayNBa/uNh1PTQiMASBDYbynBjPEFsO46qWr4FhSprpzwPE
745JsiclZ2JeJf8IWZ3WwlHckSVYRc2iby0N+X14PtKxgHcBUxJHrWq/M0Fm1R3M
8bmC0EdLuR9TKMLvJtO7IViPZq7fqGO4Z84H0YnJbfdlx0g0NGaIRw/19UDmHyQI
Q0Kl3MFvxhUCrFpXDN07PDw/7EZ77mS2DMdV1yebWdA284k+ZhcrwDk+kaVf8qRZ
k4cW7QeboTlVVwT+P7Z0WIMHfI89hIOvdR+Rl23J6aueffKXTbsI6slFXMdfECgv
a8VzSw5XXywZkX6KUgzP1DBzADh8+Q==
=Bmlk
-----END PGP SIGNATURE-----

--sPdQuGznd2UcBmn1EpRAsvVkJ2TWqbnhb--

--===============0763514302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0763514302==--
