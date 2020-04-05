Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA219F10B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473DF6E2E9;
	Mon,  6 Apr 2020 07:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 812 seconds by postgrey-1.36 at gabe;
 Sun, 05 Apr 2020 09:30:31 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8997A6E0D4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586079021;
 bh=wPquJ+Whli71qk48bH13/+zmxMWVmiS56DJQmU6p9eg=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=cGwimnwtgDIvSW4ZPakBUeBVWNlrCvvZGH2aj6fLGlHhOFmqyMuPbSjqzMpXxOjM/
 ajLy5CUT8vUZRKtYIIGLdMLlp1Zi1R2AgWF2tmVT9zVwHrdx9n5qA0UpMIMFuoSXtt
 Zn9u+M3ZVDRSLfajQlxtQB49RYEOnb3QGEpgfNY8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MN4Oy-1jNFbB0TZg-006iVt; Sun, 05
 Apr 2020 11:30:21 +0200
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Paul Cercueil <paul@crapouillou.net>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
Date: Sun, 5 Apr 2020 11:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:5yOIP5Rvh1kgAtf7eNwS8Y+DOex4AWFztEYVJqkfiK2SyjcEdBI
 OBaVIKeI/S4Xw/9wwr5tjTAH8HqB+3ib/KgIzWmTc9244xZFncc/qd9sRoR3mMzkmfYbww6
 6tPDNtzVdeWYKFO06OKYolOC0o6vN77crSxgkfdgBsktKp2/DU9+OlHcTc8VRVDe2F6H1Jx
 RTLQ0wJhExX86LwiUuNQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5OdgCFZiayg=:erT7PYhr3DlWipG60BVFyG
 wWWAD8baapzFz7rXXxZ5iouKwEUsCqPI2qHCsqS4TP0jbbyOpZQztC615uqosUnGSmMiQCfbe
 r1D12lNssUbccC1CQQg4MhJ70tSJ0XgD4KbuCRzECk0vNDswucX0KdMQ7oDdPVaC/zczms5Z9
 gV+U6sWJp7Rl4LnsP6nB9YN92gr1h338A4ukQ1PrvmJNgve+68hpxVvb0IE9y+5dWhdzS5t0L
 le+XGxag8oAc7ep2UsPYKftSXDY3vAgeTTpwGgb3Egrr6LS9UnpKQpWCNuDABJjTYdGQ7h6Px
 /XsxiCPJ8CKbUY+q4Fk3FUqitlPgYbrHi/ULMm9ncnDE/fl2MYUQcnlyx6ynYQdtR22o49506
 /qdOyMZbQq6coXcYfMSbvf2RftMgITsoUWAG+nEYRZ0S4lvZsT0ovJBsNbZlILN1T337FHHk+
 V3Vun7DhB+icBP+8wRzYRIKtg1deOeIYNO+nISr/Biq8+F8bzc1cEbkWLNo137HFqX33mZ+Il
 pA6XyGzDxd28STJVBEbunXVvvdlWgupaGSLfDIuOAZsilkeV5yTV+eUD/FxnBCtd/YxmoaV91
 txPcNvj2nh6U9HTVxT0iIPDiUNvGv9M19imA2GFcxVinwUrmyg0yCU6CBIdBoLxcFdj5qP+gT
 G4XMgKjLegbzQOhjEwIJUXEzANlry667iO06RuEZ+XWrS3lF4BpaPkv7szTh4Ngjffk1EnMGS
 nC496zF3yKnveGqNs/z9E6rijmaRmW4vvQtIaj7X9POolUwGAqLttcl4RT/N3tftTwiRHsBXj
 z9k38kvv1SWqDgd/+mEluJDTIC3K12Ogf6qnaaPDhL7htw0u8o11+j1AZWlclSE168dbHzS/S
 7z4G2sV/duTG9vYXCkQXVtKQuauF1Z9B8LBnUw3NRv1SNrGpTr0CRxuy0/+UugbngwnL1TwAF
 llpzk3hOrtNy0bPB1TN1dg5Y4aCEmoAlqNkZ2rfpK1P2ohiZmlXOcAaqYfchHuIEVTeOq7Y7d
 4Gh5ZxctPgV8quYwjpn7sZoqHpBoM+lzYoq9Urue5fSo61629CjB0yiQ4r+NAjiFlR26wRl0u
 ZERTo2ED7HEdVA4+aIbCEQcMEXBPttmYsXRD31nO081AYeJTppm6FQL1xeUa3I0unV+qcIA+A
 oBMvtKEIJqr87PGWGJJZjRWe3onmxpOFNTC38Kr+ww/ebQDKzfee91HzdUw5zXXMYgBFvVf9X
 Mg0nmtBiUNsyQTR4g
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTdW4sIDUgQXByIDIwMjAgMTE6MjU6MzAgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
IHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKaW5kZXggOWRmZTdjYjUzMGUxLi4w
NmNhNzUyYjc2ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMt
ZHJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwpAQCAtNjYx
LDEwICs2NjEsOCBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJfQoKIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwot
CWlmIChpcnEgPCAwKSB7Ci0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBwbGF0Zm9ybSBp
cnEiKTsKKwlpZiAoaXJxIDwgMCkKIAkJcmV0dXJuIGlycTsKLQl9CgogCWlmIChzb2NfaW5mby0+
bmVlZHNfZGV2X2NsaykgewogCQlwcml2LT5sY2RfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImxj
ZCIpOwotLQoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
