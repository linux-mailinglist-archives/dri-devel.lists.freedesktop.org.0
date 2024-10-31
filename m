Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F649B742F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 06:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBAF10E27A;
	Thu, 31 Oct 2024 05:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="dMXZ6rgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0210E27A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 05:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1730353366;
 bh=mcqsrDZ8peORHX3Xd7M/Zgimsf0y1/A7Sgg3b3kJ27A=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=dMXZ6rgBg+1C9l2WWAOrIuQhYCa8SME4be+VMAt/N09nPfEku8nS5OeXARkqgNqGT
 g1DDa46GESWiKRpvMaCvR6WUX/h34qA3FOBFfXDYkzTA1KLhyVPP0/AW0HXoeP03au
 22CiABAt/zu4IebrjRRyYv+1gzswzCfmGGL0UV90=
X-QQ-mid: bizesmtp77t1730353339t1mbvpur
X-QQ-Originating-IP: S5ZddYZOz/ztwbb4iyzHMSTzRWqF/ZxhDNpimYp9+kI=
Received: from [10.20.53.22] ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 31 Oct 2024 13:42:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15136986030244860245
Message-ID: <0B8912A07B48A352+c9e7af3e-ebe3-4e6c-bf11-dc25f7864e06@uniontech.com>
Date: Thu, 31 Oct 2024 13:42:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND. PATCH 1/5] drm/ci: Upgrade requirements because of
 bothering by GitHub Dependabot
To: Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, simona <simona@ffwll.ch>,
 "david.heidelberg" <david.heidelberg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 guanwentao <guanwentao@uniontech.com>, zhanjun <zhanjun@uniontech.com>
References: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
 <192d7da2f2a.1069aaa001047791.5583301334791429946@collabora.com>
 <7acf985b-044e-41ff-9d5b-621d165b689f@collabora.com>
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
In-Reply-To: <7acf985b-044e-41ff-9d5b-621d165b689f@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VnPFR0T8lE6nrkUaXkJBpVQf"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Njf/zTiR//7AoUYOCUXY0ISJvgix9Zv5qNK0KTkbs4EsVVJdIG1MQtpu
 TZ5t55KqDH6UJ27vzrzQhvhaw52Ar02fbvXjezFPikETIcAzYzqg4CwDYMdXHkW2eE/xGPs
 9HdHjcy8x52w8/4hAFccjZ2ntBVSgVkgMKcYDbnQ1teRsg/56DsSPFXvIywSSGVDEn1SPCP
 ySwDIBQIrxODNeAicnaIHKfuEBxRHnsPAeCQ25Vq5k7IGalcsgD39CyjN9bkh+mI91pp4Vl
 guMcLDCGbn/wVZa1dcd0PaM6WOUmQvB4T9r18FN2nmkbzBnZgKyI89uILmte5+C7IFfWctG
 k779hR7Tlds0YdP4D0hCgiGbKQ3vvynJOWPFPtTi/qwOnpnbzKtlHQTTBDLdHK1UNiZXf2S
 SUeNv/iVCHH2hW7S5OIf5dT75saM4J02QdZ879Z3jHUd5AcR4akLx9kJNldwAUkTr+AifAS
 UT452DbfvS675MZMXsk4xp01LGvenb52lhmrlf8d4yYUKsakezPPovIKNyaZGsYNK2w+hZr
 tYhNUVsTUjGALd/0iO2QNUVXZ9HUnfg/ZrymNzyA7OPXK8fKbyzPMp77uzfbf1BlmdWZfSg
 mE9ydx17G98geV2rzFfmDKWWVioYieZkIr47FOIrJSZXS+9qecsIyH6TUMg2xA5bVjFT7v8
 rQEfUG74eSrfDRGyXi+4Tb+62Mrs49IDpW1iu7O0ISwzs3WTugygNHd5NIsCQcYO5dEXU4V
 ZZ3zzupvHOfBWp4gkDKjjFhI3aCLYYLNtdm8dTcgZzAc0rBAs6vr8vcWWLNOwNJSyqXtnD/
 8AC56qDJVbDSj6Kpiw7ooylsYUq0rvNukjgIIZmsa/Azg0XD25Sx/iwqi1WcsphxS8ZRxwo
 xckG+dLCEvw3Kn+OwmZBMDaXa9/SoOsD9yMvzm76T8NzyHFtUeNKgI37BGJoAOPr2qajz7z
 9NLLVtfuw2pQCrBqdRhmnjZ8BlhnoF1U4MMaX+7FQjJ3CGeqbiSKADQM+aaMYv2ZMrUa/gw
 x70zG5pS/z2qIA5fmPpysFEJxX1AgpKWM496w5yTnNm0/S2SbXTbwKi35rTFcMieKrOXyFc
 Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
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
--------------VnPFR0T8lE6nrkUaXkJBpVQf
Content-Type: multipart/mixed; boundary="------------50IW2JGwF20RkvoVsH47isYt";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, simona <simona@ffwll.ch>,
 "david.heidelberg" <david.heidelberg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 guanwentao <guanwentao@uniontech.com>, zhanjun <zhanjun@uniontech.com>
Message-ID: <c9e7af3e-ebe3-4e6c-bf11-dc25f7864e06@uniontech.com>
Subject: Re: [RESEND. PATCH 1/5] drm/ci: Upgrade requirements because of
 bothering by GitHub Dependabot
References: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
 <192d7da2f2a.1069aaa001047791.5583301334791429946@collabora.com>
 <7acf985b-044e-41ff-9d5b-621d165b689f@collabora.com>
In-Reply-To: <7acf985b-044e-41ff-9d5b-621d165b689f@collabora.com>

--------------50IW2JGwF20RkvoVsH47isYt
Content-Type: multipart/mixed; boundary="------------Sf064of3U0xfzR5W9IYletji"

--------------Sf064of3U0xfzR5W9IYletji
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzEwLzI5IDE4OjQ3LCBWaWduZXNoIFJhbWFuIHdyb3RlOg0KPiBIaSBIZWxl
biwNCj4NCj4gT24gMjkvMTAvMjQgMTY6MDcsIEhlbGVuIE1hZSBLb2lrZSBGb3JuYXppZXIg
d3JvdGU6DQo+Pg0KPj4NCj4+DQo+Pg0KPj4gLS0tLSBPbiBUaHUsIDE3IE9jdCAyMDI0IDAw
OjM5OjQ4IC0wMzAwIFdhbmdZdWxpwqAgd3JvdGUgLS0tDQo+Pg0KPj4gwqAgPiBHaXRIdWIg
RGVwZW5kYWJvdCBrZWVwcyBidWdnaW5nIHVzIGFib3V0IG9sZCwgdnVsbmVyYWJsZSBQeXRo
b24gDQo+PiBwYWNrYWdlcy4NCj4+IMKgID4NCj4+IMKgID4gVW50aWwgd2UgZmlndXJlIG91
dCBhIHdheSB0byBtYWtlIGl0IGNhbG0sIHdlJ3JlIHN0dWNrIHVwZGF0aW5nIG91cg0KPj4g
wqAgPiBkZXBlbmRlbmNpZXMgd2hlbmV2ZXIgaXQgY29tcGxhaW5zLg0KPj4gwqAgPg0KPj4g
wqAgPiBJIGd1ZXNzIGl0J3MgYSBnb29kIHRoaW5nIGluIHRoZSBsb25nIHJ1biwgdGhvdWdo
LCByaWdodD8NCj4+IMKgID4gTWFrZXMgb3VyIENJIGEgYml0ICJtb3JlIHNlY3VyZSIuLi4N
Cj4+IMKgID4NCj4+IMKgID4gU2lnbmVkLW9mZi1ieTogV2FuZ1l1bGkgd2FuZ3l1bGlAdW5p
b250ZWNoLmNvbT4NCj4+IMKgID4gLS0NCj4+IMKgID4gMi40NS4yDQo+PiDCoCA+DQo+PiDC
oCA+DQo+Pg0KPj4NCj4+IEhpIFdhbmdZdWxpLA0KPj4NCj4+IFRoYW5rcyBmb3IgdGhpcy4N
Cj4+DQo+PiB0YmgsIEknbSB0ZW1wdGVkIGluIHJlbW92aW5nIHRoZSBweXRob24gc2NyaXB0
IHRoYXQgaXMgaW4gdGhlIHJlcG8sIA0KPj4gYW5kIGtlZXAgaXQgb3V0LW9mLXRyZWUgc29t
ZXdoZXJlLCBzaW5jZSBpdCBpcyBhIHRvb2wgdGhhdCBpcyBvbmx5IA0KPj4gdHJpZ2dlcmVk
IG1hbnVhbGx5IGluIGxvY2FsIGVudmlyb25tZW50Lg0KPj4NCj4+IEkgYWxzbyB3YW50IHRv
IGhlYXIgVmlnbmVzaCdzIHRob3VnaHRzIGFib3V0IGl0Lg0KPg0KPiBXZSBjYW4gcmVtb3Zl
IHhmYWlscy91cGRhdGUteGZhaWxzLnB5IHNjcmlwdCBzaW5jZSB3ZSBkbyBub3QgdXNlIHRo
aXMgDQo+IGluIENJIGpvYnMuIE9uY2UgY2ktY29sbGF0ZSBbMV0gaXMgcmVhZHkgYW5kIHRl
c3RlZCBmb3IgZHJtLWNpLCB3ZSANCj4gY291bGQgdXNlIHRoaXMgdG9vbCBkaXJlY3RseS4N
Cj4NCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvY2ktY29s
bGF0ZS8NCj4NCj4gUmVnYXJkcywNCj4gVmlnbmVzaA0KPg0KDQpDb29sIQ0KDQpDaGVlcnMs
DQotLSANCldhbmdZdWxpDQo=
--------------Sf064of3U0xfzR5W9IYletji
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

--------------Sf064of3U0xfzR5W9IYletji--

--------------50IW2JGwF20RkvoVsH47isYt--

--------------VnPFR0T8lE6nrkUaXkJBpVQf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZyMYuAUDAAAAAAAKCRDF2h8wRvQL7i3S
AQCSWrMduueJxcSsASsAKgKcH+VggTH7Evt1nA9j6DtIqwEA3bGNRgVSIdWBW2kqlDpyEvhcA68m
UOjXyg5oYGMjnAw=
=tcY3
-----END PGP SIGNATURE-----

--------------VnPFR0T8lE6nrkUaXkJBpVQf--
