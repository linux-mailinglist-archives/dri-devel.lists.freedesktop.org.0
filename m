Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB62C422
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C94589FE3;
	Tue, 28 May 2019 10:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4428B89FE3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:19:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAJ5Ak021461;
 Tue, 28 May 2019 05:19:05 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAJ5JQ048867
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 05:19:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:19:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:19:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAJ24o016075;
 Tue, 28 May 2019 05:19:02 -0500
Subject: Re: [PATCHv6 3/4] drm/omap: add framedone interrupt support
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Pavel Machek
 <pavel@ucw.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-4-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
Date: Tue, 28 May 2019 13:19:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523200756.25314-4-sebastian.reichel@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559038745;
 bh=zQamKnGEmQhWoSzRt42BHFoPsQGnR1ArVAvOV1yOmwI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uJg88Y68pZASvJpleiZ4FWK9XAkk599Oue1bBGBOwU6vKG6K6M30HzSptXIHpcEJD
 WfX0Fvhat7IZpYk1ATIpBzYJqihfJWV1cdWsf1qovDLyCyw327yKwnLE7riLJ1sJKM
 X77XxVmYmameXBoWtskWxMg3kCLYGtMTCuAoBHls=
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKT24gMjMvMDUvMjAxOSAyMzowNywgU2ViYXN0aWFuIFJlaWNoZWwgd3Jv
dGU6Cgo+IEBAIC0zMDIsNiArMzI4LDMwIEBAIHZvaWQgb21hcF9jcnRjX3ZibGFua19pcnEoc3Ry
dWN0IGRybV9jcnRjICpjcnRjKQo+ICAgCURCRygiJXM6IGFwcGx5IGRvbmUiLCBvbWFwX2NydGMt
Pm5hbWUpOwo+ICAgfQo+ICAgCj4gK3ZvaWQgb21hcF9jcnRjX2ZyYW1lZG9uZV9pcnEoc3RydWN0
IGRybV9jcnRjICpjcnRjLCB1aW50MzJfdCBpcnFzdGF0dXMpCj4gK3sKPiArCXN0cnVjdCBvbWFw
X2NydGMgKm9tYXBfY3J0YyA9IHRvX29tYXBfY3J0YyhjcnRjKTsKPiArCj4gKwlpZiAoIW9tYXBf
Y3J0Yy0+ZnJhbWVkb25lX2hhbmRsZXIpIHsKPiArCQlkZXZfd2FybihvbWFwX2NydGMtPmJhc2Uu
ZGV2LT5kZXYsICJubyBmcmFtZWRvbmUgaGFuZGxlcj8iKTsKPiArCQlyZXR1cm47Cj4gKwl9CgpU
aGlzIHRyaWdnZXJzIG9uIG5vcm1hbCBkaXNwbGF5cy4KCkZSQU1FRE9ORSBpcyBhbiBpbnRlcnJ1
cHQgd2UgZ2V0IHdoZW4gRElTUEMncyBvdXRwdXQgdmlkZW9wb3J0IGlzIGJlaW5nIAp0dXJuZWQg
b2ZmLiBJdCdzIHJhaXNlZCBhZnRlciB0aGUgbGFzdCBmcmFtZSBoYXMgYmVlbiBmaW5pc2hlZCAo
aS5lLiB0aGUgCkRJU1BDIGlzIHRydWx5IGRvbmUgd2l0aCB0aGF0IHZpZGVvcG9ydCkuCgpXZSBn
ZXQgaXQgZm9yIGJvdGggY29udmVudGlvbmFsIGRpc3BsYXlzICh3aGVuIHRoZSBkaXNwbGF5IGlz
IHR1cm5lZCAKb2ZmKSBhbmQgZm9yIERTSSBjb21tYW5kIG1vZGUgKHdoZW4gYSBzaW5nbGUgZnJh
bWUgaGFzIGJlZW4gc2VudCksIGFzIGluIApib3RoIGNhc2VzIHRoZSB2aWRlb3BvcnQgaXMgZGlz
YWJsZWQgYWZ0ZXIgdGhlIG9wZXJhdGlvbi4gRm9yIApjb252ZW50aW9uYWwgZGlzcGxheXMsIHlv
dSBjYW4gdGhpbmsgRlJBTUVET05FIGFzIHRoZSBsYXN0IHZzeW5jLgoKV2UgYWxzbyBoYXZlIHNw
ZWNpYWwgaGFuZGxpbmcgZm9yIEZSQU1FRE9ORSBpbiBvbWFwX2NydGNfc2V0X2VuYWJsZWQoKSwg
CndoaWNoIGlzIHVzZWQgdG8gZ2V0IHRoZSBkcm0gZHJpdmVyIHRvIHdhaXQgZm9yIEZSQU1FRE9O
RSB3aGVuIGRpc2FibGluZyAKdGhlIGRpc3BsYXkuIEkgd29uZGVyIGlmIHRoaXMgc2VwYXJhdGUg
ZnJhbWVkb25lIGhhbmRsaW5nIG1pZ2h0IHNvbWVob3cgCmNvbmZsaWN0IHdpdGggdGhhdCBjb2Rl
LiBBbmQvb3Igc2hvdWxkIHRoZXNlIGJlIHNvbWVob3cgY29tYmluZWQuCgogIFRvbWkKCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
