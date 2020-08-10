Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC42416C2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333DF6E4C7;
	Tue, 11 Aug 2020 06:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEFF89E7B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:41:24 +0000 (UTC)
Received: from [192.168.42.210] ([93.22.133.151]) by mwinf5d63 with ME
 id DuhF2300D3G8tn903uhF7e; Mon, 10 Aug 2020 20:41:22 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 Aug 2020 20:41:22 +0200
X-ME-IP: 93.22.133.151
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
 <20200810154213.GM1793@kadam>
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
Date: Mon, 10 Aug 2020 20:41:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200810154213.GM1793@kadam>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: Ori.Messinger@amd.com, airlied@linux.ie, bernard@vivo.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, colton.w.lewis@protonmail.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkxlIDEwLzA4LzIwMjAgw6AgMTc6NDIsIERhbiBDYXJwZW50ZXIgYSDDqWNyaXTCoDoKPiBPbiBT
dW4sIEF1ZyAwOSwgMjAyMCBhdCAxMDozNDowNlBNICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQg
d3JvdGU6Cj4+IFdoZW4gJypzZ3QnIGlzIGFsbG9jYXRlZCwgd2UgbXVzdCBhbGxvY2F0ZWQgJ3Np
emVvZigqKnNndCknIGJ5dGVzIGluc3RlYWQKPj4gb2YgJ3NpemVvZigqc2cpJy4gJ3NnJyAoaS5l
LiBzdHJ1Y3Qgc2NhdHRlcmxpc3QpIGlzIHNtYWxsZXIgdGhhbgo+PiAnc2d0JyAoaS5lIHN0cnVj
dCBzZ190YWJsZSksIHNvIHRoaXMgY291bGQgbGVhZCB0byBtZW1vcnkgY29ycnVwdGlvbi4KPiBU
aGUgc2l6ZW9mKCpzZykgaXMgYmlnZ2VyIHRoYW4gc2l6ZW9mKCoqc2d0KSBzbyB0aGlzIHdhc3Rl
cyBtZW1vcnkgYnV0Cj4gaXQgd29uJ3QgbGVhZCB0byBjb3JydXB0aW9uLgo+Cj4gICAgICAxMSAg
c3RydWN0IHNjYXR0ZXJsaXN0IHsKPiAgICAgIDEyICAgICAgICAgIHVuc2lnbmVkIGxvbmcgICBw
YWdlX2xpbms7Cj4gICAgICAxMyAgICAgICAgICB1bnNpZ25lZCBpbnQgICAgb2Zmc2V0Owo+ICAg
ICAgMTQgICAgICAgICAgdW5zaWduZWQgaW50ICAgIGxlbmd0aDsKPiAgICAgIDE1ICAgICAgICAg
IGRtYV9hZGRyX3QgICAgICBkbWFfYWRkcmVzczsKPiAgICAgIDE2ICAjaWZkZWYgQ09ORklHX05F
RURfU0dfRE1BX0xFTkdUSAo+ICAgICAgMTcgICAgICAgICAgdW5zaWduZWQgaW50ICAgIGRtYV9s
ZW5ndGg7Cj4gICAgICAxOCAgI2VuZGlmCj4gICAgICAxOSAgfTsKPgo+ICAgICAgNDIgIHN0cnVj
dCBzZ190YWJsZSB7Cj4gICAgICA0MyAgICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbDsg
ICAgICAgIC8qIHRoZSBsaXN0ICovCj4gICAgICA0NCAgICAgICAgICB1bnNpZ25lZCBpbnQgbmVu
dHM7ICAgICAgICAgICAgIC8qIG51bWJlciBvZiBtYXBwZWQgZW50cmllcyAqLwo+ICAgICAgNDUg
ICAgICAgICAgdW5zaWduZWQgaW50IG9yaWdfbmVudHM7ICAgICAgICAvKiBvcmlnaW5hbCBzaXpl
IG9mIGxpc3QgKi8KPiAgICAgIDQ2ICB9Owo+Cj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCgoK
TXkgYmFkLiBJIHJlYWQgJ3N0cnVjdCBzY2F0dGVybGlzdCBzZ2wnICh3aXRob3V0IHRoZSAqKQpU
aGFua3MgZm9yIHRoZSBmb2xsb3ctdXAsIERhbi4KCkRvZXNuJ3Qgc21hdGNoIGNhdGNoIHN1Y2gg
bWlzbWF0Y2g/CihJJ3ZlIG5vdCBydW4gc21hdGNoIGZvciBhIHdoaWxlLCBzbyBpdCBpcyBtYXli
ZSByZXBvcnRlZCkKCldlbGwsIHRoZSBwcm9wb3NhbCBpcyBzdGlsbCB2YWxpZCwgZXZlbiBpZiBp
dCBoYXMgbGVzcyBpbXBhY3QgYXMgCmluaXRpYWxseSB0aG91Z2h0LgoKVGh4IGZvciB0aGUgcmV2
aWV3LgoKQ0oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
