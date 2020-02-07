Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4715571C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 12:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA716FC51;
	Fri,  7 Feb 2020 11:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D46FC51
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 11:44:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 71B6B294818
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
Message-ID: <de033b8f-756c-a6ea-106e-bfbb480cc354@collabora.com>
Date: Fri, 7 Feb 2020 12:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
Content-Language: en-US
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsIGFnYWluLAoKQG1hbGlkcCBhbmQga29tZWRhIGZvbGtzOiBJIGtpbmRseSBhc2sgeW91
IHRvIGhhdmUgeW91ciBzYXkuIElmIHRoZXJlIGlzCm5vIGludGVyZXN0IGZyb20geW91ICh3aGlj
aCBpcyBvayB3aXRoIG1lKSBJIHdpbGwgcmVzZW5kIHRoZSBzZXJpZXMKZHJvcHBpbmcgdGhlIGtv
bWVkYSBhbmQgbWFsaWRwIHBhcnQuCgpBbmRyemVqCgpXIGRuaXUgMzAuMDEuMjAyMCBvwqAxMDow
OCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHBpc3plOgo+IEhpIEFsbCwKPiAKPiBBIGdlbnRsZSBy
ZW1pbmRlci4KPiAKPiBQbGVhc2UgYWxzbyBzZWUgaW5saW5lOgo+IAo+IFcgZG5pdSAxNy4xMi4y
MDE5IG/CoDE1OjQ5LCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogcGlzemU6Cj4+IFRoaXMgc2VyaWVz
IGFkZHMgQUZCQyBzdXBwb3J0IGZvciBSb2NrY2hpcC4gSXQgaXMgaW5zcGlyZWQgYnk6Cj4+Cj4+
IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5
L2tlcm5lbC8rL3JlZnMvaGVhZHMvZmFjdG9yeS1ncnUtOTAxNy5CLWNocm9tZW9zLTQuNC9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIAo+Pgo+Pgo+PiBUaGlzIGlz
IHRoZSBmaWZ0aCBpdGVyYXRpb24gb2YgdGhlIGFmYmMgc2VyaWVzLiBCZXR3ZWVuIHYzIGFuZCB2
NCBhIGxvdCBvZgo+PiByZXdvcmsgaGFzIGJlZW4gZG9uZSwgdGhlIG1haW4gZ29hbCBvZiB3aGlj
aCB3YXMgdG8gbW92ZSBhbGwgYWZiYy1yZWxhdGVkCj4+IGNoZWNrcyB0byBoZWxwZXJzLCBzbyB0
aGF0IGNvcmUgZG9lcyBub3QgZGVhbCB3aXRoIGl0Lgo+Pgo+PiBBIG5ldyBzdHJ1Y3QgZHJtX2Fm
YmNfZnJhbWVidWZmZXIgaXMgYWRkZWQsIHdoaWNoIHN0b3JlcyBhZmJjLXJlbGF0ZWQKPj4gZHJp
dmVyLXNwZWNpZmljIGRhdGEuIEJlY2F1c2Ugb2YgdGhhdCwgaW4gZHJpdmVycyB0aGF0IHdpc2gg
dG8KPj4gdXNlIHRoaXMgZmVhdHVyZSwgdGhlIHN0cnVjdCBtdXN0IGJlIGFsbG9jYXRlZCBkaXJl
Y3RseSBpbiB0aGUgZHJpdmVyCj4+IGNvZGUgcmF0aGVyIHRoYW4gaW5zaWRlIGhlbHBlcnMsIHNv
IHRoZSBmaXJzdCBwb3J0aW9uIG9mIHRoZSBwYXRjaHNldAo+PiBkb2VzIHRoZSBuZWNlc3Nhcnkg
cmVmYWN0b3JpbmcuCj4+Cj4+IFRoZW4sIHRoZXJlIGFyZSAzIHVzZXJzIG9mIGFmYmM6IGtvbWVk
YSwgbWFsaWRwIGFuZCwgZmluYWxseSwgcm9ja2NoaXAsCj4+IHRoZSBsYXR0ZXIgYmVpbmcgdGhl
IHVsdGltYXRlIHB1cnBvc2Ugb2YgdGhpcyB3b3JrIGFuZCB0aGUgMyBzdWJzZXF1ZW50Cj4+IHBv
cnRpb25zIG9mIHRoZSBwYXRjaHNldCBtb3ZlIGtvbWVkYSBhbmQgbWFsaWRwIHRvIGdlbmVyaWMg
aGVscGVycyBhbmQgYWRkCj4+IGFmYmMgc3VwcG9ydCB0byByb2NrY2hpcC4KPiAKPiBJZiBjaGFu
Z2VzIGluIGtvbWVkYSBhbmQgbWFsaWRwIGlzIHRvbyBtdWNoIHRvIGRpZ2VzdCBhdCBhIHRpbWUg
SSBjYW4KPiBmb2N1cyBvbiByb2NrY2hpcCBvbmx5LiBUaGlzIHdvdWxkIGFtb3VudCB0byBwYXRj
aGVzIDEtNCBhbmQgMzMtMzQuCj4gQWZ0ZXIgYWxsIHRoZSB1bHRpbWF0ZSBwdXJwb3NlIG9mIHRo
aXMgd29yayBhbmQgdGltZSBzcGVudCBvbiBpdAo+IGlzIGxhbmRpbmcgYWZiYyBzdXBwb3J0IGZv
ciByb2NrY2hpcC4KPiAKPiBSZWdhcmRzLAo+IAo+IEFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
