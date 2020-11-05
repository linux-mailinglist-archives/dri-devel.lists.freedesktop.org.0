Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F032A7FC1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902B96E243;
	Thu,  5 Nov 2020 13:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8726E243
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:39:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74A731F4646B;
 Thu,  5 Nov 2020 13:39:56 +0000 (GMT)
Date: Thu, 5 Nov 2020 14:39:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201105143953.516e75b2@collabora.com>
In-Reply-To: <d59e4750-ad1a-5573-16db-ad9b57b6eec5@arm.com>
References: <20201104170729.1828212-1-boris.brezillon@collabora.com>
 <d59e4750-ad1a-5573-16db-ad9b57b6eec5@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, stable@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA1IE5vdiAyMDIwIDEzOjI3OjA0ICswMDAwClN0ZXZlbiBQcmljZSA8c3RldmVuLnBy
aWNlQGFybS5jb20+IHdyb3RlOgoKPiA+ICsJb2xkX3N0YXR1cyA9IGF0b21pY194Y2hnKCZxdWV1
ZS0+c3RhdHVzLAo+ID4gKwkJCQkgUEFORlJPU1RfUVVFVUVfU1RBVFVTX1NUT1BQRUQpOwo+ID4g
KwlXQVJOX09OKG9sZF9zdGF0dXMgIT0gUEFORlJPU1RfUVVFVUVfU1RBVFVTX0FDVElWRSAmJgo+
ID4gKwkJb2xkX3N0YXR1cyAhPSBQQU5GUk9TVF9RVUVVRV9TVEFUVVNfU1RPUFBFRCk7Cj4gPiAr
CWlmIChvbGRfc3RhdHVzID09IFBBTkZST1NUX1FVRVVFX1NUQVRVU19TVE9QUEVEKQo+ID4gKwkJ
Z290byBvdXQ7ICAKPiAKPiBOSVQ6IEl0J3Mgc2xpZ2h0bHkgY2xlYW5lciBpZiB5b3Ugc3dhcCB0
aGUgYWJvdmUgbGluZXMsIGkuZS46Cj4gCj4gCWlmIChvbGRfc3RhdHVzID09IFBBTkZST1NUX1FV
RVVFX1NUQVRVU19TVE9QUEVEKQo+IAkJZ290byBvdXQ7Cj4gCVdBUk5fT04ob2xkX3N0YXR1cyAh
PSBQQU5GUk9TVF9RVUVVRV9TVEFUVVNfQUNUSVZFKTsKCkkgYWdyZWUuCgo+IAo+ID4gKwo+ID4g
Kwlkcm1fc2NoZWRfc3RvcCgmcXVldWUtPnNjaGVkLCBiYWQpOwo+ID4gKwlpZiAoYmFkKQo+ID4g
KwkJZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKGJhZCk7Cj4gPiArCj4gPiArCXN0b3BwZWQgPSB0
cnVlOwo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBTZXQgdGhlIHRpbWVvdXQgdG8gbWF4IHNvIHRo
ZSB0aW1lciBkb2Vzbid0IGdldCBzdGFydGVkCj4gPiArCSAqIHdoZW4gd2UgcmV0dXJuIGZyb20g
dGhlIHRpbWVvdXQgaGFuZGxlciAocmVzdG9yZWQgaW4KPiA+ICsJICogcGFuZnJvc3Rfc2NoZWR1
bGVyX3N0YXJ0KCkpLgo+ID4gKwkgKi8KPiA+ICsJcXVldWUtPnNjaGVkLnRpbWVvdXQgPSBNQVhf
U0NIRURVTEVfVElNRU9VVDsKPiA+ICsKPiA+ICtvdXQ6Cj4gPiAgIAltdXRleF91bmxvY2soJnF1
ZXVlLT5sb2NrKTsKPiA+ICAgCj4gPiAgIAlyZXR1cm4gc3RvcHBlZDsKPiA+ICAgfQo+ID4gICAK
PiA+ICtzdGF0aWMgdm9pZCBwYW5mcm9zdF9zY2hlZHVsZXJfc3RhcnQoc3RydWN0IHBhbmZyb3N0
X3F1ZXVlX3N0YXRlICpxdWV1ZSkKPiA+ICt7Cj4gPiArCWVudW0gcGFuZnJvc3RfcXVldWVfc3Rh
dHVzIG9sZF9zdGF0dXM7Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJnF1ZXVlLT5sb2NrKTsKPiA+
ICsJb2xkX3N0YXR1cyA9IGF0b21pY194Y2hnKCZxdWV1ZS0+c3RhdHVzLAo+ID4gKwkJCQkgUEFO
RlJPU1RfUVVFVUVfU1RBVFVTX1NUQVJUSU5HKTsKPiA+ICsJaWYgKFdBUk5fT04ob2xkX3N0YXR1
cyAhPSBQQU5GUk9TVF9RVUVVRV9TVEFUVVNfU1RPUFBFRCkpCj4gPiArCQlnb3RvIG91dDsgIAo+
IAo+IFRoZSBlcnJvciBoYW5kbGluZyBpc24ndCBncmVhdCBoZXJlIC0gaW4gdGhpcyBjYXNlIHRo
ZSBxdWV1ZSBzdGF0dXMgaXMgCj4gbGVmdCBpbiBfU1RBVFVTX1NUQVJUSU5HLCB3aGljaCBhdCBi
ZXN0IHdvdWxkIGxlYWQgdG8gYW5vdGhlciBXQVJOX09OIAo+IGJlaW5nIGhpdCwgYnV0IGFsc28g
aGFzIHRoZSBlZmZlY3Qgb2YgaWdub3Jpbmcgam9iIGZhdWx0cy4gUHJvYmFibHkgdGhlIAo+IHRp
bWVvdXQgd291bGQgZXZlbnR1YWxseSBnZXQgdGhpbmdzIGJhY2sgdG8gbm9ybWFsLgo+IAo+IE9i
dmlvdXNseSB0aGlzIHNpdHVhdGlvbiB3aWxsIG5ldmVyIG9jY3Vy4oSiLCBidXQgd2UgY2FuIGRv
IGJldHRlciBlaXRoZXIgCj4gYnkgY29udGludWluZyB3aXRoIHRoZSBub3JtYWwgbG9naWMgYmVs
b3csIG9yIGV2ZW4gYmV0dGVyIHJlcGxhY2luZyAKPiBhdG9taWNfeGNoZygpIHdpdGggYW4gYXRv
bWljX2NtcHhjaGcoKSAoc28gbGVhdmUgdGhlIHN0YXR1cyBhbG9uZSBpZiBub3QgCj4gX1NUT1BQ
RUQpLiBCb3RoIHNlZW0gbGlrZSBiZXR0ZXIgZXJyb3IgcmVjb3Zlcnkgb3B0aW9ucyB0byBtZS4g
QnV0IGtlZXAgCj4gdGhlIFdBUk5fT04gYmVjYXVzZSBzb21ldGhpbmcgaGFzIGNsZWFybHkgZ29u
ZSB3cm9uZyBpZiB0aGlzIGhhcHBlbnMuCgpUaGUgc2Vjb25kIGFwcHJvYWNoIGRvZXNuJ3QgdW5i
bG9jayB0aGluZ3MgaWYgd2UgZW5kIHVwIHdpdGgKb2xkX3N0YXR1cyAhPSBTVE9QUEVEIGFuZCB0
aGUgcXVldWUgaXMgcmVhbGx5IHN0b3BwZWQgKHdoaWNoIHNob3VsZG4ndApoYXBwZW4sIHVubGVz
cyB3ZSBoYXZlIGEgcHJvYmxlbSBpbiBvdXIgc3RhdGUgbWFjaGluZSkuIEkgdGhpbmsgSSdsbApn
byBmb3IgdGhlIGZpcnN0IG9wdGlvbiBhbmQgcmVzdGFydCB0aGUgcXVldWUgdW5jb25kaXRpb25h
bGx5IChJJ20Ka2VlcGluZyB0aGUgV0FSTl9PTigpLCBvZiBjb3Vyc2UpLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
