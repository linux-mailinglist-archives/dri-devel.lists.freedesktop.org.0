Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C074A594
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A941D6E182;
	Tue, 18 Jun 2019 15:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EB26E182;
 Tue, 18 Jun 2019 15:37:21 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d0905300000>; Tue, 18 Jun 2019 08:37:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 18 Jun 2019 08:37:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 08:37:21 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 15:37:19 +0000
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3271ab62-43dc-a845-45ff-c3dae62ad2d6@nvidia.com>
Date: Tue, 18 Jun 2019 16:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618151938.GA2567@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560872241; bh=Us+gh5E3lAh8UN/jbcqp7+7nE/0ieVr1E9V4QmsHeTo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kYLWnuZyE4f8ymbTgubhltcZ2D7Gyv6l3yTTyNdCef1Q9QIWcihaEURvviIG6k2rI
 fkIZjueYyke5HhEtZ+/wBMM7LQHgxSc/U2gfb9aPWMyj9gn1eJ/Ga79vSKt6e0NaQz
 utc0S3Z2WHPzQ/Jq0Q09wLmxRCX3ou0zltMTnIewdcLs1ntoJaDgFdi6iWxCbgCqkL
 nZVdrwuBgRLfhedPZKpX756dr8YP3zhc1FrucAsBEG9sGGsO7+K/H/pJ8LZ8zp1PXr
 3UvxfNscDHwqXov93d3sG/VMjGojdZ8irAIcycHJWrpk+vWSCLLN3MNGM7X21z7zjf
 jqW8gqsRg4UNw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDE4LzA2LzIwMTkgMTY6MTksIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiBPbiBGcmks
IEp1biAxNCwgMjAxOSBhdCAxMDozNjoxNFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
PiBHcmVnIGlzIGJ1c3kgYWxyZWFkeSwgYnV0IG1heWJlIGhlIHdvbid0IGRvIGV2ZXJ5dGhpbmcg
Li4uCj4+Cj4+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDMgKysrCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4+IGluZGV4
IDk3MTc1NDBlZTI4Zi4uMDI2ZTU1YzUxN2UxIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2dwdS90b2RvLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+PiBAQCAt
Mzc1LDYgKzM3NSw5IEBAIFRoZXJlJ3MgYSBidW5jaCBvZiBpc3N1ZXMgd2l0aCBpdDoKPj4gICAg
dGhpcyAodG9nZXRoZXIgd2l0aCB0aGUgZHJtX21pbm9yLT5kcm1fZGV2aWNlIG1vdmUpIHdvdWxk
IGFsbG93IHVzIHRvIHJlbW92ZQo+PiAgICBkZWJ1Z2ZzX2luaXQuCj4+ICAKPj4gKy0gRHJvcCB0
aGUgcmV0dXJuIGNvZGUgYW5kIGVycm9yIGNoZWNraW5nIGZyb20gYWxsIGRlYnVnZnMgZnVuY3Rp
b25zLiBHcmVnIEtIIGlzCj4+ICsgIHdvcmtpbmcgb24gdGhpcyBhbHJlYWR5Lgo+IAo+IAo+IFBh
cnQgb2YgdGhpcyB3b3JrIHdhcyB0byB0cnkgdG8gZGVsZXRlIGRybV9kZWJ1Z2ZzX3JlbW92ZV9m
aWxlcygpLgo+IAo+IFRoZXJlIGFyZSBvbmx5IDQgZmlsZXMgdGhhdCBjdXJyZW50bHkgc3RpbGwg
Y2FsbCB0aGlzIGZ1bmN0aW9uOgo+IAlkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+IAlkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHNpLmMKPiAJZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYwo+
IAlkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPiAKPiBGb3IgZGMuYywgdGhlIGRyaXZlciB3
YW50cyB0byBhZGQgZGVidWdmcyBmaWxlcyB0byB0aGUgc3RydWN0IGRybV9jcnRjCj4gZGVidWdm
cyBkaXJlY3RvcnkuICBXaGljaCBpcyBmaW5lLCBidXQgaXQgaGFzIHRvIGRvIHNvbWUgc3BlY2lh
bCBtZW1vcnkKPiBhbGxvY2F0aW9uIHRvIGdldCB0aGUgZGVidWdmcyBjYWxsYmFjayB0byBwb2lu
dCBub3QgdG8gdGhlIHN0cnVjdAo+IGRybV9taW5vciBwb2ludGVyLCBidXQgcmF0aGVyIHRoZSBk
cm1fY3J0YyBzdHJ1Y3R1cmUuCj4gCj4gU28sIHRvIHJlbW92ZSB0aGlzIGNhbGwsIEkgbmVlZCB0
byByZW1vdmUgdGhpcyBzcGVjaWFsIG1lbW9yeSBhbGxvY2F0aW9uCj4gYW5kIHRvIGRvIHRoYXQs
IEkgbmVlZCB0byBzb21laG93IGJlIGFibGUgdG8gY2FzdCBmcm9tIGRybV9taW5vciBiYWNrIHRv
Cj4gdGhlIGRybV9jcnRjIHN0cnVjdHVyZSBiZWluZyB1c2VkIGluIHRoaXMgZHJpdmVyLiAgQW5k
IEkgY2FuJ3QgZmlndXJlCj4gaG93IHRoZXkgYXJlIHJlbGF0ZWQgYXQgYWxsLgo+IAo+IEFueSBw
b2ludGVycyBoZXJlIChwdW4gaW50ZW5kZWQpIHdvdWxkIGJlIGFwcHJlY2lhdGVkLgo+IAo+IEZv
ciB0aGUgb3RoZXIgMyBmaWxlcywgdGhlIHNpdHVhdGlvbiBpcyBtdWNoIHRoZSBzYW1lLCBidXQg
SSBuZWVkIHRvIGdldAo+IGZyb20gYSAnc3RydWN0IGRybV9taW5vcicgcG9pbnRlciB0byBhICdz
dHJ1Y3QgZHJtX2Nvbm5lY3RvcicgcG9pbnRlci4KPiAKPiBJIGNvdWxkIGp1c3QgIm9wZW4gY29k
ZSIgYSBidW5jaCBvZiBjYWxscyB0byBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCkgZm9yCj4gdGhlc2Ug
ZHJpdmVycywgd2hpY2ggd291bGQgc29sdmUgdGhpcyBpc3N1ZSwgYnV0IGluIGEgbW9yZSAibm9u
LWRybSIKPiB3YXkuICBJcyBpdCB3b3J0aCB0byBqdXN0IGRvIHRoYXQgaW5zdGVhZCBvZiBvdmVy
dGhpbmtpbmcgdGhlIHdob2xlCj4gdGhpbmcgYW5kIHRyeWluZyB0byBzcXVpc2ggaXQgaW50byB0
aGUgZHJtICJtb2RlbCIgb2YgZHJtIGRlYnVnZnMgY2FsbHM/Cj4gCj4gRWl0aGVyIHdheSwgd2hv
IGNhbiB0ZXN0IHRoZXNlIGNoYW5nZXM/ICBJIGNhbid0IGV2ZW4gYnVpbGQgdGhlIHRlZ3JhCj4g
ZHJpdmVyIHdpdGhvdXQgZGlnZ2luZyB1cCBhbiBhcm02NCBjcm9zcy1jb21waWxlciwgYW5kIGNh
bid0IHRlc3QgaXQgYXMKPiBJIGhhdmUgbm8gaGFyZHdhcmUgYXQgYWxsLgoKV2UgY2FuIGRlZmlu
aXRlbHkgY29tcGlsZSBhbmQgYm9vdCB0ZXN0IHRoZXNlIG5vIHByb2JsZW0uIEluIGZhY3QKYW55
dGhpbmcgdGhhdCBsYW5kcyBpbiAtbmV4dCB3ZSB3aWxsIGJvb3QgdGVzdC4gSG93ZXZlciwgSSBj
YW4gZG8gc29tZQpxdWljayBzYW5pdHkgaWYgeW91IGhhdmUgc29tZXRoaW5nIHRvIHRlc3QuCgpU
aGllcnJ5IG1heSBoYXZlIG1vcmUgc3BlY2lmaWMgVGVncmEgRFJNIHRlc3RzLgoKQ2hlZXJzCkpv
bgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
