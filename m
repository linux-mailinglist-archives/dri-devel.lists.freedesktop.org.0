Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265514DA3E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 12:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C916F96E;
	Thu, 30 Jan 2020 11:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544746F96E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 11:57:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id D9CB5293192
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
 <20200130114437.GS24863@e110455-lin.cambridge.arm.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <65292b5c-333d-bfc3-3307-37f18c65a9b2@collabora.com>
Date: Thu, 30 Jan 2020 12:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130114437.GS24863@e110455-lin.cambridge.arm.com>
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
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpXIGRuaXUgMzAuMDEuMjAyMCBvwqAxMjo0NCwgTGl2aXUgRHVkYXUgcGlzemU6
Cj4gSGkgQW5kcnplaiwKPiAKPiBTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHJldmlld2luZyB0aGUg
cGF0Y2hlcy4gSSBhbSBob3BpbmcgdG8gZ2V0IHRocm91Z2ggdGhlIHJldmlldwo+IGVhcmx5IG5l
eHQgd2VlayBpZiB0aGF0IGlzIE9LIHdpdGggeW91LgoKVGhhbmtzLCB0aGF0IHdvdWxkIGJlIGdy
ZWF0LgoKQW5kcnplagoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTGl2aXUKPiAKPiBPbiBUaHUsIEph
biAzMCwgMjAyMCBhdCAxMDowODoxNUFNICswMTAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3Jv
dGU6Cj4+IEhpIEFsbCwKPj4KPj4gQSBnZW50bGUgcmVtaW5kZXIuCj4+Cj4+IFBsZWFzZSBhbHNv
IHNlZSBpbmxpbmU6Cj4+Cj4+IFcgZG5pdSAxNy4xMi4yMDE5IG/CoDE1OjQ5LCBBbmRyemVqIFBp
ZXRyYXNpZXdpY3ogcGlzemU6Cj4+PiBUaGlzIHNlcmllcyBhZGRzIEFGQkMgc3VwcG9ydCBmb3Ig
Um9ja2NoaXAuIEl0IGlzIGluc3BpcmVkIGJ5Ogo+Pj4KPj4+IGh0dHBzOi8vY2hyb21pdW0uZ29v
Z2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5lbC8rL3JlZnMvaGVhZHMv
ZmFjdG9yeS1ncnUtOTAxNy5CLWNocm9tZW9zLTQuNC9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcC5jCj4+Pgo+Pj4gVGhpcyBpcyB0aGUgZmlmdGggaXRlcmF0aW9uIG9m
IHRoZSBhZmJjIHNlcmllcy4gQmV0d2VlbiB2MyBhbmQgdjQgYSBsb3Qgb2YKPj4+IHJld29yayBo
YXMgYmVlbiBkb25lLCB0aGUgbWFpbiBnb2FsIG9mIHdoaWNoIHdhcyB0byBtb3ZlIGFsbCBhZmJj
LXJlbGF0ZWQKPj4+IGNoZWNrcyB0byBoZWxwZXJzLCBzbyB0aGF0IGNvcmUgZG9lcyBub3QgZGVh
bCB3aXRoIGl0Lgo+Pj4KPj4+IEEgbmV3IHN0cnVjdCBkcm1fYWZiY19mcmFtZWJ1ZmZlciBpcyBh
ZGRlZCwgd2hpY2ggc3RvcmVzIGFmYmMtcmVsYXRlZAo+Pj4gZHJpdmVyLXNwZWNpZmljIGRhdGEu
IEJlY2F1c2Ugb2YgdGhhdCwgaW4gZHJpdmVycyB0aGF0IHdpc2ggdG8KPj4+IHVzZSB0aGlzIGZl
YXR1cmUsIHRoZSBzdHJ1Y3QgbXVzdCBiZSBhbGxvY2F0ZWQgZGlyZWN0bHkgaW4gdGhlIGRyaXZl
cgo+Pj4gY29kZSByYXRoZXIgdGhhbiBpbnNpZGUgaGVscGVycywgc28gdGhlIGZpcnN0IHBvcnRp
b24gb2YgdGhlIHBhdGNoc2V0Cj4+PiBkb2VzIHRoZSBuZWNlc3NhcnkgcmVmYWN0b3JpbmcuCj4+
Pgo+Pj4gVGhlbiwgdGhlcmUgYXJlIDMgdXNlcnMgb2YgYWZiYzoga29tZWRhLCBtYWxpZHAgYW5k
LCBmaW5hbGx5LCByb2NrY2hpcCwKPj4+IHRoZSBsYXR0ZXIgYmVpbmcgdGhlIHVsdGltYXRlIHB1
cnBvc2Ugb2YgdGhpcyB3b3JrIGFuZCB0aGUgMyBzdWJzZXF1ZW50Cj4+PiBwb3J0aW9ucyBvZiB0
aGUgcGF0Y2hzZXQgbW92ZSBrb21lZGEgYW5kIG1hbGlkcCB0byBnZW5lcmljIGhlbHBlcnMgYW5k
IGFkZAo+Pj4gYWZiYyBzdXBwb3J0IHRvIHJvY2tjaGlwLgo+Pgo+PiBJZiBjaGFuZ2VzIGluIGtv
bWVkYSBhbmQgbWFsaWRwIGlzIHRvbyBtdWNoIHRvIGRpZ2VzdCBhdCBhIHRpbWUgSSBjYW4KPj4g
Zm9jdXMgb24gcm9ja2NoaXAgb25seS4gVGhpcyB3b3VsZCBhbW91bnQgdG8gcGF0Y2hlcyAxLTQg
YW5kIDMzLTM0Lgo+PiBBZnRlciBhbGwgdGhlIHVsdGltYXRlIHB1cnBvc2Ugb2YgdGhpcyB3b3Jr
IGFuZCB0aW1lIHNwZW50IG9uIGl0Cj4+IGlzIGxhbmRpbmcgYWZiYyBzdXBwb3J0IGZvciByb2Nr
Y2hpcC4KPj4KPj4gUmVnYXJkcywKPj4KPj4gQW5kcnplago+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
