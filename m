Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B9A003C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 12:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F95C89A60;
	Wed, 28 Aug 2019 10:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2F889A60
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 10:51:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B415AD82;
 Wed, 28 Aug 2019 10:51:49 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
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
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
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
Message-ID: <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
Date: Wed, 28 Aug 2019 12:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0327042049=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0327042049==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f7GTQRMh8Qu7OM6GRIAPC33sdxRH4uqP5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f7GTQRMh8Qu7OM6GRIAPC33sdxRH4uqP5
Content-Type: multipart/mixed; boundary="0zjm3brWZtDu1Tdf2bw7Kgs45JJ4SgylA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
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
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
In-Reply-To: <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>

--0zjm3brWZtDu1Tdf2bw7Kgs45JJ4SgylA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.08.19 um 11:37 schrieb Rong Chen:
> Hi Thomas,
>=20
> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>>> Both patches have little impact on the performance from our side.
>> Thanks for testing. Too bad they doesn't solve the issue.
>>
>> There's another patch attached. Could you please tests this as well?
>> Thanks a lot!
>>
>> The patch comes from Daniel Vetter after discussing the problem on IRC=
=2E
>> The idea of the patch is that the old mgag200 code might display much
>> less frames that the generic code, because mgag200 only prints from
>> non-atomic context. If we simulate this with the generic code, we shou=
ld
>> see roughly the original performance.
>>
>>
>=20
> It's cool, the patch "usecansleep.patch" can fix the issue.

Thank you for testing. But don't get too excited, because the patch
simulates a bug that was present in the original mgag200 code. A
significant number of frames are simply skipped. That is apparently the
reason why it's faster.

Best regards
Thomas

> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer c=
onsole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> =C2=A0 b976b04c2bc only schedule worker from non-atomic context
>=20
> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde b976b04c2bcf33148d6c7=
bc1a2=C2=A0
> testcase/testparams/testbox
> ----------------=C2=A0 -------------------------- ---------------------=
-----=C2=A0
> ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s=
tddev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 4=
4093
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 4=
4093=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
> vm-scalability.median
>=20
> Best Regards,
> Rong Chen
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--0zjm3brWZtDu1Tdf2bw7Kgs45JJ4SgylA--

--f7GTQRMh8Qu7OM6GRIAPC33sdxRH4uqP5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1mXLwACgkQaA3BHVML
eiPQyggAgwZ7VZ09sKEhZaJlvsbS+a/+CWNSTA9exigWKZCi6SNxCYvRDrkzEAFB
HMUr9UbzfVog8nBg+Mgagv3En0m2t6GefyquCAbt01d6WcdZbsN6L9NTRKIFioOR
QaY6ErcbDe5ftOQN+BNm/MmNLZSlDeK+UptPXwl9JmKu1SzZSY/XEQIzusl6iqVQ
Pkle/nPTq3fcFA6RCx6E7zbmcA8vd7u1FdOAGNvflYMIA0D7U4kvt/ISP/1apvI8
zrTcaYXzhZLuPL9r9DrUO/qI9sdZMVg7zvNV0dcD0hr8sKhQ84g32ZkjW1CxAMZd
g/oxGIv/fZni63R3AXIEnYIXOUb/Nw==
=Iprd
-----END PGP SIGNATURE-----

--f7GTQRMh8Qu7OM6GRIAPC33sdxRH4uqP5--

--===============0327042049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0327042049==--
