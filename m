Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FD3C591
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E101890B1;
	Tue, 11 Jun 2019 08:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FB9890B1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:05:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5B85ggD072022;
 Tue, 11 Jun 2019 03:05:42 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5B85g04042289
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Jun 2019 03:05:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 03:05:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 03:05:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5B85eZt040176;
 Tue, 11 Jun 2019 03:05:40 -0500
To: David Airlie <airlied@linux.ie>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [GIT PULL] omapdrm changes for 5.3
Message-ID: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
Date: Tue, 11 Jun 2019 11:05:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560240342;
 bh=7ylw7xrBJToPLEAnW6EN8zjlh1bPEAkeN2YMvUy7GgE=;
 h=To:CC:From:Subject:Date;
 b=Le5tXJF5RaQUKolZDmdUD15/2rU1BlFMoo8Ws+MVKzSFYPYaM1+yo+VlKp764DRLE
 HsOICcqSfQCHcUOcWYji+eoqXvlGBWxtLTjBhr2eQRZJgCufFLfZzcgU9sAKKOj4t7
 NpJaP6EkvYKkBL6yMVzyUjyr7e08uYtZl9ukClns=
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClBsZWFzZSBwdWxsIG9tYXBkcm0gY2hhbmdlcyBmb3IgNS4zLgoKIFRvbWkKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzk2ZjlhY2FmZmQ4N2U0NGI4YjAyYmM2
MGYwNmRjOTQ5YjgzMmI3ZToKCiAgTWVyZ2UgYnJhbmNoICdkcm0tbmV4dC01LjMnIG9mIGdpdDov
L3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJtLW5leHQgKDIwMTkt
MDYtMDYgMTQ6Mjg6MjYgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
bWJhL2xpbnV4LmdpdCB0YWdzL29tYXBkcm0tNS4zCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMWJiNDE4YmZmZGQ2Zjk1YTQxZThlNTliZTYzOTMzYmM4NGZkZTEzYzoKCiAgZHJtL29t
YXA6IGFkZCBzdXBwb3J0IGZvciBtYW51YWxseSB1cGRhdGVkIGRpc3BsYXlzICgyMDE5LTA2LTEw
IDE3OjA0OjE1ICswMzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpvbWFwZHJtIGNoYW5nZXMgZm9yIDUuMwoKLSBBZGQg
c3VwcG9ydCBmb3IgRFNJIGNvbW1hbmQgbW9kZSBkaXNwbGF5cwoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpFbWlsIFZlbGlr
b3YgKDEpOgogICAgICBkcm0vb21hcDogcmVtb3ZlIG9wZW4tY29kZWQgZHJtX2ludmFsaWRfb3Ao
KQoKS2VmZW5nIFdhbmcgKDEpOgogICAgICBkcm0vb21hcDogVXNlIGRldl9nZXRfZHJ2ZGF0YSgp
CgpTZWJhc3RpYW4gUmVpY2hlbCAoNCk6CiAgICAgIGRybS9vbWFwOiB1c2UgRFJNX0RFQlVHX0RS
SVZFUiBpbnN0ZWFkIG9mIENPUkUKICAgICAgZHJtL29tYXA6IGRvbid0IGNoZWNrIGRpc3BjIHRp
bWluZ3MgZm9yIERTSQogICAgICBkcm0vb21hcDogYWRkIGZyYW1lZG9uZSBpbnRlcnJ1cHQgc3Vw
cG9ydAogICAgICBkcm0vb21hcDogYWRkIHN1cHBvcnQgZm9yIG1hbnVhbGx5IHVwZGF0ZWQgZGlz
cGxheXMKClRob21hcyBNZXllciAoMSk6CiAgICAgIGRybS9vbWFwOiBNYWtlIHN1cmUgZGV2aWNl
X2lkIHRhYmxlcyBhcmUgTlVMTCB0ZXJtaW5hdGVkCgogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMgfCAgMTggKy0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3Mvb21hcGRzcy1ib290LWluaXQuYyB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2NydGMuYyAgICAgICAgICAgICB8IDE4MCArKysrKysrKysrKysrKysrKysrKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5oICAgICAgICAgICAgIHwgICAyICsK
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgICAgICAgICAgICAgIHwgIDE2ICst
LQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuaCAgICAgICAgICAgICAgfCAgIDQg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmIuYyAgICAgICAgICAgICAgIHwgIDE5
ICsrKwogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9pcnEuYyAgICAgICAgICAgICAgfCAg
MjUgKysrKwogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9pcnEuaCAgICAgICAgICAgICAg
fCAgIDEgKwogOSBmaWxlcyBjaGFuZ2VkLCAyMjggaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25z
KC0pCgoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
