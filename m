Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391497CFEB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 04:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5F10E0DB;
	Fri, 20 Sep 2024 02:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="ByLxjC3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 134665 seconds by postgrey-1.36 at gabe;
 Fri, 20 Sep 2024 02:32:54 UTC
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCFA10E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726799526;
 bh=2kyAqX0UmcnVQ2r2WsVJruwXGGrYUL0M/kI4rXDSr9A=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=ByLxjC3ePF2ai5PTehXd9G27bmvjmlti/Ys2WQUp55c30ABCBJZyPQSzQaHImmUud
 X5DS7b+6QIe7U/GgCcS+VjMri7UzF3KG5Nj5v7puw66BalSyllhn6A6NQWQCWRCL9e
 nadxOc1uyNdARfv3f+g0A1RNewWlb0ReUlpgiElc=
X-QQ-mid: bizesmtp91t1726799522tmx5q8zr
X-QQ-Originating-IP: ffXfo76nqqY9lfia2Nzg/UbJJ73MBdFP5f3xCSUe0Dw=
Received: from [10.20.53.22] ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 20 Sep 2024 10:31:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13317544603402082152
Message-ID: <2573492DD1A88727+468e98e3-ead1-4232-9bc4-6eeef19d143d@uniontech.com>
Date: Fri, 20 Sep 2024 10:31:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lf4Jms0gKlolG25Z0id6kYg1"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lf4Jms0gKlolG25Z0id6kYg1
Content-Type: multipart/mixed; boundary="------------L1QVVc1ADqeZ4LsnZ9tF0ciV";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Message-ID: <468e98e3-ead1-4232-9bc4-6eeef19d143d@uniontech.com>
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>
In-Reply-To: <f75fbe30-528e-404f-97e4-854d27d7a401@amd.com>

--------------L1QVVc1ADqeZ4LsnZ9tF0ciV
Content-Type: multipart/mixed; boundary="------------yEsJV508YGyTPoNrV5tBjLo2"

--------------yEsJV508YGyTPoNrV5tBjLo2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

5ZyoIDIwMjQvOS8yMCAwMzowMSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCg0KPg0KPg0K
PiBBbSAxOS4wOS4yNCB1bSAyMDoyOCBzY2hyaWViIFdhbmdZdWxpOg0KPj4gVGhlcmUgYXJl
IHNvbWUgc3BlbGxpbmcgbWlzdGFrZXMgb2YgJ2FjY2Nlc3MnIGluIGNvbW1lbnRzIHdoaWNo
DQo+PiBzaG91bGQgYmUgaW5zdGVhZCBvZiAnYWNjZXNzJy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBXYW5nWXVsaSA8d2FuZ3l1bGlAdW5pb250ZWNoLmNvbT4NCj4+IC0tLQ0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmPCoMKgIHwgMiArLQ0KPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jwqAgfCAyICstDQo+
PiDCoCBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtZ3JvdXAtbXVsdGljb2xvci5jIHwgMiArLQ0K
Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTFfMC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0K
Pj4gaW5kZXggZDNlOGJlODJhMTcyLi5mODQ3YTlmYzYxZTEgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmMNCj4+IEBAIC0xODk0LDcgKzE4OTQs
NyBAQCBzdGF0aWMgdm9pZCBnZnhfdjExXzBfaW5pdF9jb21wdXRlX3ZtaWQoc3RydWN0IA0K
Pj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4+IMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZh
ZGV2LT5zcmJtX211dGV4KTsNCj4+IMKgIMKgwqDCoMKgwqAgLyogSW5pdGlhbGl6ZSBhbGwg
Y29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBPQQ0KPj4gLcKgwqDCoMKg
wqDCoCBhY2NjZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0
IFZNSURzLiAqLw0KPj4gK8KgwqDCoMKgwqDCoCBhY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBl
bmFibGVkIGJ5IEZXIGZvciB0YXJnZXQgVk1JRHMuICovDQo+DQo+IFdoaWxlIGF0IGl0IGNv
dWxkIHlvdSBmaXggdGhlIGNvbW1lbnQgc3R5bGUgaGVyZT8gRS5nLiB1c2UNCj4NCj4gLyoN
Cj4gwqAqIFRleHQNCj4gwqAqIFRleHQNCj4gwqAqLw0KPg0KT0suDQoNCkxpbms6IA0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0YyNUExMzk3ODlFODdDM0UrMjAyNDA5MjAwMjI3
NTUuMTE2MjQ5NS0xLXdhbmd5dWxpQHVuaW9udGVjaC5jb20vDQoNCldpdGggVGhvbWFzIFpp
bW1lcm1hbm4ncyBBY2tlZC1ieS4NCg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCj4NCj4N
ClRoYW5rcywNCi0tIA0KV2FuZ1l1bGkNCg==
--------------yEsJV508YGyTPoNrV5tBjLo2
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------yEsJV508YGyTPoNrV5tBjLo2--

--------------L1QVVc1ADqeZ4LsnZ9tF0ciV--

--------------lf4Jms0gKlolG25Z0id6kYg1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuzenwUDAAAAAAAKCRDF2h8wRvQL7pDd
AP98YmH2GuZSl7gSJJZM5828IoxW3uwXszr1jM3hyLEJeQEAjvQBiWBW1zciyNuTaRetGXNvZNCZ
tkYIZHG6DDS/cAc=
=PnZn
-----END PGP SIGNATURE-----

--------------lf4Jms0gKlolG25Z0id6kYg1--
