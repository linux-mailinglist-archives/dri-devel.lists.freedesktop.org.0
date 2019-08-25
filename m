Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5B9C2FA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 13:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AB96E0F8;
	Sun, 25 Aug 2019 11:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BD36E0F8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 11:12:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7PBCCpP081723;
 Sun, 25 Aug 2019 06:12:12 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7PBCCS0042498
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 25 Aug 2019 06:12:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 25
 Aug 2019 06:12:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 25 Aug 2019 06:12:11 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7PBCA1w071060;
 Sun, 25 Aug 2019 06:12:10 -0500
From: Jyri Sarha <jsarha@ti.com>
Subject: Display-Port HPD handling, link status, and bandwidth checks
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 mQINBFbdWt8BEADnCIkQrHIvAmuDcDzp1h2pO9s22nacEffl0ZyzIS//ruiwjMfSnuzhhB33
 fNEWzMjm7eqoUBi1BUAQIReS6won0cXIEXFg9nDYQ3wNTPyh+VRjBvlb/gRJlf4MQnJDTGDP
 S5i63HxYtOfjPMSsUSu8NvhbzayNkN5YKspJDu1cK5toRtyUn1bMzUSKDHfwpdmuCDgXZSj2
 t+z+c6u7yx99/j4m9t0SVlaMt00p1vJJ3HJ2Pkm3IImWvtIfvCmxnOsK8hmwgNQY6PYK1Idk
 puSRjMIGLqjZo071Z6dyDe08zv6DWL1fMoOYbAk/H4elYBaqEsdhUlDCJxZURcheQUnOMYXo
 /kg+7TP6RqjcyXoGgqjfkqlf3hYKmyNMq0FaYmUAfeqCWGOOy3PPxR/IiACezs8mMya1XcIK
 Hk/5JAGuwsqT80bvDFAB2XfnF+fNIie/n5SUHHejJBxngb9lFE90BsSfdcVwzNJ9gVf/TOJc
 qJEHuUx0WPi0taO7hw9+jXV8KTHp6CQPmDSikEIlW7/tJmVDBXQx8n4RMUk4VzjE9Y/m9kHE
 UVJ0bJYzMqECMTAP6KgzgkQCD7n8OzswC18PrK69ByGFpcm664uCAa8YiMuX92MnesKMiYPQ
 z1rvR5riXZdplziIRjFRX+68fvhPverrvjNVmzz0bAFwfVjBsQARAQABtBpKeXJpIFNhcmhh
 IDxqc2FyaGFAdGkuY29tPokCOAQTAQIAIgUCVt1a3wIbAwYLCQgHAwIGFQgCCQoLBBYCAwEC
 HgECF4AACgkQkDazUNfWGUEVVhAAmFL/21tUhZECrDrP9FWuAUuDvg+1CgrrqBj7ZxKtMaiz
 qTcZwZdggp8bKlFaNrmsyrBsuPlAk99f7ToxufqbV5l/lAT3DdIkjb4nwN4rJkxqSU3PaUnh
 mDMKIAp6bo1N9L+h82LE6CjI89W4ydQp5i+cOeD/kbdxbHHvxgNwrv5x4gg1JvEQLVnUSHva
 R2kx7u2rlnq7OOyh9vU0MUq7U5enNNqdBjjBTeaOwa5xb3S2Cc9dR10mpFiy+jSSkuFOjPpc
 fLfr/s03NGqbZ4aXvZCGjCw4jclpTJkuWPKO+Gb+a/3oJ4qpGN9pJ+48n2Tx9MdSrR4aaXHi
 EYMrbYQz9ICJ5V80P5+yCY5PzCvqpkizP6vtKvRSi8itzsglauMZGu6GwGraMJNBgu5u+HIZ
 nfRtJO1AAiwuupOHxe1nH05c0zBJaEP4xJHyeyDsMDh+ThwbGwQmAkrLJZtOd3rTmqlJXnuj
 sfgQlFyC68t1YoMHukz9LHzg02xxBCaLb0KjslfwuDUTPrWtcDL1a5hccksrkHx7k9crVFA1
 o6XWsOPGKRHOGvYyo3TU3CRygXysO41UnGG40Q3B5R8RMwRHV925LOQIwEGF/6Os8MLgFXCb
 Lv3iJtan+PBdqO1Bv3u2fXUMbYgQ3v7jHctB8nHphwSwnHuGN7FAmto+SxzotE25Ag0EVt1a
 3wEQAMHwOgNaIidGN8UqhSJJWDEfF/SPSCrsd3WsJklanbDlUCB3WFP2EB4k03JroIRvs7/V
 VMyITLQvPoKgaECbDS5U20r/Po/tmaAOEgC7m1VaWJUUEXhjYQIw7t/tSdWlo5XxZIcO4LwO
 Kf0S4BPrQux6hDLIFL8RkDH/8lKKc44ZnSLoF1gyjc5PUt6iwgGJRRkOD8gGxCv1RcUsu1xU
 U9lHBxdWdPmMwyXiyui1Vx7VJJyD55mqc7+qGrpDHG9yh3pUm2IWp7jVt/qw9+OE9dVwwhP9
 GV2RmBpDmB3oSFpk7lNvLJ11VPixl+9PpmRlozMBO00wA1W017EpDHgOm8XGkq++3wsFNOmx
 6p631T2WuIthdCSlZ2kY32nGITWn4d8L9plgb4HnDX6smrMTy1VHVYX9vsHXzbqffDszQrHS
 wFo5ygKhbGNXO15Ses1r7Cs/XAZk3PkFsL78eDBHbQd+MveApRB7IyfffIz7pW1R1ZmCrmAg
 Bn36AkDXJTgUwWqGyJMd+5GHEOg1UPjR5Koxa4zFhj1jp1Fybn1t4N11cmEmWh0aGgI/zsty
 g/qtGRnFEywBbzyrDEoV4ZJy2Q5pnZohVhpbhsyETeYKQrRnMk/dIPWg6AJx38Cl4P9PK1JX
 8VK661BG8GXsXJ3uZbPSu6K0+FiJy09N4IW7CPJNABEBAAGJAh8EGAECAAkFAlbdWt8CGwwA
 CgkQkDazUNfWGUFOfRAA5K/z9DXVEl2kkuMuIWkgtuuLQ7ZwqgxGP3dMA5z3Iv/N+VNRGbaw
 oxf+ZkTbJHEE/dWclj1TDtpET/t6BJNLaldLtJ1PborQH+0jTmGbsquemKPgaHeSU8vYLCdc
 GV/Rz+3FN0/fRdmoq2+bIHght4T6KZJ6jsrnBhm7y6gzjMOiftH6M5GXPjU0/FsU09qsk/af
 jbwLETaea0mlWMrLd9FC2KfVITA/f/YG2gqtUUF9WlizidyctWJqSTZn08MdzaoPItIkRUTv
 6Bv6rmFn0daWkHt23BLd0ZP7e7pON1rqNVljWjWQ/b/E/SzeETrehgiyDr8pP+CLlC+vSQxi
 XtjhWjt1ItFLXxb4/HLZbb/L4gYX7zbZ3NwkON6Ifn3VU7UwqxGLmKfUwu/mFV+DXif1cKSS
 v6vWkVQ6Go9jPsSMFxMXPA5317sZZk/v18TAkIiwFqda3/SSjwc3e8Y76/DwPvUQd36lEbva
 uBrUXDDhCoiZnjQaNz/J+o9iYjuMTpY1Wp+igjIretYr9+kLvGsoPo/kTPWyiuh/WiFU2d6J
 PMCGFGhodTS5qmQA6IOuazek1qSZIl475u3E2uG98AEX/kRhSzgpsbvADPEUPaz75uvlmOCX
 tv+Sye9QT4Z1QCh3lV/Zh4GlY5lt4MwYnqFCxroK/1LpkLgdyQ4rRVw=
To: <dri-devel@lists.freedesktop.org>
Message-ID: <7f5204a1-cc3a-d6a3-be07-b2c316761e46@ti.com>
Date: Sun, 25 Aug 2019 14:12:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566731532;
 bh=ZJw+f9BA/hSlpg6bKpQRFnB3TE1JOmdjekFwpYz0yHo=;
 h=From:Subject:To:CC:Date;
 b=XyddEjaWkW2QvwUDJf2J4M15XBhFtefbMMA0byt+hy4dbLy9fvEoYCIo7dWrkrq09
 1i0++suGyNNhACgT4+CGYJXPSH9wd5xUn+gE1OZTql8znsR1XjQuYz1VLeZdkSqGrO
 ck7ostuvNBHCsbM4DMSbrzokOVoUYmIfSMQHr+LA=
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
Cc: "Valkeinen, Tomi" <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJIGFtIHdvcmtpbmcgb24gYSBuZXcgRGlzcGxheVBvcnQgYnJpZGdlLWRyaXZlciBhbmQg
dGhlcmUgaXMgYSBjb3VwbGUgb2YKdGhpbmdzIHRoYXQgSSBkbyBub3Qga25vdyBob3cgdG8gaGFu
ZGxlLgoKMS4gV2hlbiBzaG91bGQgdGhlIGxpbmsgdHJhaW5pbmcgaGFwcGVuPwogICBhKSBJbiBj
b25uZWN0b3IgZGV0ZWN0KCk/CiAgICAgIC0gVGhpcyB3b3VsZCBlbmFibGUgdXMgdG8gZG8gbW9k
ZSBmaWx0ZXJpbmcgKGluIG1vZGVfdmFsaWQoKSkKICAgICAgICBiYXNlZCBvbiB0aGUgZXN0YWJs
aXNoZWQgbGluayBiYW5kLXdpZHRoICh0aGVuIGFnYWluCiAgICAgICAgbW9kZV92YWxpZCgpIGRv
Y3VtZW50YXRpb24gc3VnZ2VzdHMgdGhhdCBtb2RlcyBzaG91bGQgb25seQogICAgICAgIGJlIGZp
bHRlcmVkIGJhc2VkIG9uICJjb25maWd1cmF0aW9uLWludmFyaWFudCBoYXJkd2FyZQogICAgICAg
IGNvbnN0cmFpbnRzIikuCiAgIGIpIEluIGNoZWNrIHBoYXNlICh0aGlzIHdvdWxkIGN1cnJlbnRs
eSBtZWFuIG1vZGVfZml4dXApPwogICAgICAtIFRoaXMgaXMgdGhlIGxhc3QgcG9pbnQgd2hlcmUg
d2UgY2FuIHJlamVjdCBhIG1vZGUgdGhhdCBjYW4gbm90CiAgICAgICAgYmUgc2VudCBvdmVyIHRo
ZSBEUC1saW5rCiAgIGMpIEluIGNvbW1pdCBwaGFzZSAoZS5nLiBicmlkZ2UgZW5hYmxlKCkpCiAg
ICAgIC0gVGhpcyBpcyBiYWQgc2luY2Ugd2Ugc2hvdWxkIG5vdCBmYWlsIGFueSBtb3JlIGluIHRo
ZSBjb21taXQKICAgICAgICBwaGFzZQoKMi4gRFAtbGluayBzb21ldGltZXMgZHJvcHMgYWZ0ZXIg
YSBzdWNjZXNmdWwgbGluayB0cmFpbmluZyBhbmQgRFAtc2luawogICBpcyBzdXBwb3NlZCB0byBz
ZW5kIHNob3J0IEhQRCBwdWxzZSBhYm91dCBpdC4gV2hhdCBhcmUgdGhlCiAgIHJlY29tbWVuZGVk
IHdheXMgdG8gaGFuZGxlIHRoZSBzaXR1YXRpb24/CgogICBhKSBTZW5kIGhvdHBsdWcgZXZlbnQg
YW5kIGxldCB0aGUgRFJNIGNsaWVudCBkZWFsIHdpdGggaXQ/CiAgICAgIC0gVGhpcyBkb2VzIG5v
dCB3b3JrIHRvbyB3ZWxsIGJlY2F1c2UgZXZlbiBpZiB0aGUgY2xpZW50IHRyaWVzCiAgICAgICAg
dG8gcmVzdG9yZSB0aGUgZGlzcGxheSBieSBjb21taXR0aW5nIHRoZSBzYW1lIHN0YXRlIGFnYWlu
IC0KICAgICAgICBsaWtlIGZiZGV2IGRvZXMgLSB0aGUgYnJpZGdlIGRvZXMgbm90IGdvIHRyb3Vn
aCBkaXNhYmxlLWVuYWJsZQogICAgICAgIGN5Y2xlLCBzaW5jZSBkaXNwbGF5IG1vZGUgaGFzIG5v
dCBjaGFuZ2VkLgogICAgICAtIERlc3BpdGUgaXQgbm90IHdvcmtpbmcgc28gd2VsbCwgdGhpcyBp
cyB3aGF0IHRoZSBtb3N0IGRyaXZlcnMKCWFwcGVhciB0byBkby4KCiAgIGIpIERyaXZlciBpbnRl
cm5hbGx5IHJlLXRyYWlucyB0aGUgbGluayBidXQgc2VuZCBhIGhvdHBsdWcgZXZlbnQKICAgICAg
YWx3YXlzIGFmdGVyIGl0PwogICAgICAtIFRoaXMgaXMgd2hhdCBpOTE1IGRvZXMsIGlmIEkgcmVh
ZCB0aGUgY29kZSByaWdodC4KICAgICAgLSBIb3cgdG8gdHJlYXQgYSB0cmFpbmluZyBmYWlsdXJl
PyBTZW5kaW5nIGhvdHBsdWcgZXZlbnQgZG9lcyBub3QKICAgICAgICByZWFsbHkgaGVscCAoc2Vl
IGFib3ZlKS4KCiAgIGMpIFNpbGVudGx5IHJlLXRyYWluIHRoZSBsaW5rIGlmIHdlIHdlcmUgYWJs
ZSB0byByZXN0b3JlIHRoZSBsaW5rCiAgICAgIGFuZCB0aGUgZGlzcGxheSBtb2RlLCBhbmQgc2Vu
ZCBIUEQgb25seSBpZiBzb21ldGhpbmcgd2VudCB3cm9uZz8KCkJlc3QgcmVnYXJkcywKSnlyaQoK
LS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgw
IEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0Rv
bWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
