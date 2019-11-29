Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C146F10DAC7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 22:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7236E94E;
	Fri, 29 Nov 2019 21:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ADA6E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 21:09:32 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18C6029299B;
 Fri, 29 Nov 2019 21:09:28 +0000 (GMT)
Date: Fri, 29 Nov 2019 22:09:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 6/8] drm/panfrost: Make sure imported/exported BOs are
 never purged
Message-ID: <20191129220924.7982a350@collabora.com>
In-Reply-To: <20191129201213.GR624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-7-boris.brezillon@collabora.com>
 <20191129201213.GR624164@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAyMToxMjoxMyArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwMjo1OTowNlBNICsw
MTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBXZSBkb24ndCB3YW50IGltcG9ydGVkL2V4
cG9ydGVkIEJPcyB0byBiZSBwdXJnZXMsIGFzIHRob3NlIGFyZSBzaGFyZWQKPiA+IHdpdGggb3Ro
ZXIgcHJvY2Vzc2VzIHRoYXQgbWlnaHQgc3RpbGwgdXNlIHRoZW0uIFdlIHNob3VsZCBhbHNvIHJl
ZnVzZQo+ID4gdG8gZXhwb3J0IGEgQk8gaWYgaXQncyBiZWVuIG1hcmtlZCBwdXJnZWFibGUgb3Ig
aGFzIGFscmVhZHkgYmVlbiBwdXJnZWQuCj4gPiAKPiA+IEZpeGVzOiAwMTNiNjUxMDEzMTUgKCJk
cm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNlIGFuZCBzaHJpbmtlciBzdXBwb3J0IikKPiA+IENjOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAxOSArKysrKysrKysrKysrKysrLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYyB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
Ywo+ID4gaW5kZXggMWM2N2FjNDM0ZTEwLi43NTFkZjk3NTUzNGYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ID4gQEAgLTM0Myw2ICszNDMsNyBAQCBz
dGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21hZHZpc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKPiA+ICAJc3RydWN0IGRybV9wYW5mcm9zdF9tYWR2aXNlICphcmdzID0gZGF0
YTsKPiA+ICAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkZXYtPmRldl9wcml2YXRl
Owo+ID4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7Cj4gPiArCWludCByZXQ7Cj4g
PiAgCj4gPiAgCWdlbV9vYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZV9wcml2LCBhcmdz
LT5oYW5kbGUpOwo+ID4gIAlpZiAoIWdlbV9vYmopIHsKPiA+IEBAIC0zNTAsNiArMzUxLDE5IEBA
IHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfbWFkdmlzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAo+ID4gIAkJcmV0dXJuIC1FTk9FTlQ7Cj4gPiAgCX0KPiA+ICAKPiA+ICsJ
LyoKPiA+ICsJICogV2UgZG9uJ3Qgd2FudCB0byBtYXJrIGV4cG9ydGVkL2ltcG9ydGVkIEJPcyBh
cyBwdXJnZWFibGU6IHdlJ3JlIG5vdAo+ID4gKwkgKiB0aGUgb25seSBvd25lciBpbiB0aGF0IGNh
c2UuCj4gPiArCSAqLwo+ID4gKwltdXRleF9sb2NrKCZkZXYtPm9iamVjdF9uYW1lX2xvY2spOyAg
Cj4gCj4gS2luZGEgbm90IGF3ZXNvbWUgdGhhdCB5b3UgaGF2ZSB0byB0YWtlIHRoaXMgY29yZSBs
b2NrIGhlcmUgYW5kIGVuY3VtYmVyCj4gY29yZSBkcm0gbG9ja2luZyB3aXRoIHJhbmRvbSBkcml2
ZXIgc3R1ZmYuCgpMb29rcyBsaWtlIGRybV9nZW1fc2htZW1faXNfcHVyZ2VhYmxlKCkgYWxyZWFk
eSBkb2VzIHRoZSAhaW1wb3J0ZWQgJiYKIWV4cG9ydGVkIGNoZWNrLiBGb3IgdGhlIGltcG9ydGVk
IGNhc2UsIEkgdGhpbmsgd2UncmUgZ29vZCwgc2luY2UKdXNlcnNwYWNlIGNhbid0IGNoYW5nZSB0
aGUgbWFkdiB2YWx1ZSBiZWZvcmUgLT5pbXBvcnRfYXR0YWNoIGhhcyBiZWVuCnNldC4gRm9yIHRo
ZSBleHBvcnRlciBjYXNlLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIG5vIHJhY2UKYmV0
d2VlbiB0aGUgZXhwb3J0IGFuZCBtYWR2aXNlIG9wZXJhdGlvbnMsIHdoaWNoIEkgY2FuIHByb2Jh
Ymx5IGRvIGZyb20KdGhlIGdlbS0+ZXhwb3J0KCkgaG9vayBieSB0YWtpbmcgdGhlIHNocmlua2Vy
IG9yIGJvLT5tYXBwaW5ncyBsb2NrLgoKPiAKPiBDYW4ndCB0aGlzIGJlIHNvbHZlZCB3aXRoIHlv
dXIgb3duIGxvY2tpbmcgb25seSBhbmQgc29tZSByZWFzb25hYmxlCj4gb3JkZXJpbmcgb2YgY2hl
Y2tzPyBiaWcgbG9ja3MgYmVjYXVzZSBpdCdzIGVhc3kgaXMgZW5kbGVzcyBsb25nLXRlcm0gcGFp
bi4KPiAKPiBBbHNvIGV4cG9ydGluZyBwdXJnZWFibGUgb2JqZWN0cyBpcyBraW5kYSBhIHVzZXJz
cGFjZSBidWcsIGFsbCB5b3UgaGF2ZSB0bwo+IGRvIGlzIG5vdCBvb3BzIGluIGRtYV9idWZfYXR0
YWNobWVudF9tYXAuIE5vIG5lZWQgdG8gcHJldmVudCB0aGUgZGFtYWdlCj4gaGVyZSBpbW8uCgpJ
IGZlZWwgbGlrZSBtYWtpbmcgc3VyZSBhbiBleHBvcnRlZCBCTyBjYW4ndCBiZSBwdXJnZWQgb3Ig
YSBwdXJnZWQgQk8KY2FuJ3QgYmUgZXhwb3J0ZWQgd291bGQgYmUgbXVjaCBzaW1wbGVyIHRoYW4g
bWFraW5nIHN1cmUgYWxsIGltcG9ydGVycwphcmUgcmVhZHkgdG8gaGF2ZSB0aGUgc2d0IGZyZWVk
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
