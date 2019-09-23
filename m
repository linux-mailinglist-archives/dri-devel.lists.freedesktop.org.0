Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C997BB59C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474146E90E;
	Mon, 23 Sep 2019 13:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1C196E90E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:41:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553861000;
 Mon, 23 Sep 2019 06:41:21 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C98B3F694;
 Mon, 23 Sep 2019 06:41:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/panfrost: Allow passing extra information about
 BOs used by a job
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
 <CAL_JsqLSStbn35SY9nE+SNZMnNyBZ2vP1KMH5aFjFxi6mBw2wQ@mail.gmail.com>
 <20190917091505.267b93d6@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <fc7649d9-b8dd-682d-bf07-06ff2518af6a@arm.com>
Date: Mon, 23 Sep 2019 14:41:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917091505.267b93d6@collabora.com>
Content-Language: en-GB
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDkvMjAxOSAwODoxNSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIE1vbiwgMTYg
U2VwIDIwMTkgMTc6MjA6MjggLTA1MDAKPiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPiAKPj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNjoxNyBBTSBCb3JpcyBCcmV6aWxs
b24KPj4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4+Cj4+PiBUaGUg
UkVBRC9XUklURSBmbGFncyBhcmUgcGFydGljdWxhcmx5IHVzZWZ1bCBpZiB3ZSB3YW50IHRvIGF2
b2lkCj4+PiBzZXJpYWxpemF0aW9uIG9mIGpvYnMgdGhhdCByZWFkIGZyb20gdGhlIHNhbWUgQk8g
YnV0IG5ldmVyIHdyaXRlIHRvIGl0LiAgCj4+Cj4+IEFueSBkYXRhIG9uIHBlcmZvcm1hbmNlIGRp
ZmZlcmVuY2VzPwo+IAo+IFVuZm9ydHVuYXRlbHkgbm8uIFdoZW4gSSBpbml0aWFsbHkgYWRkZWQg
c3VwcG9ydCBmb3IgQk8gZmxhZ3MgSSB0aG91Z2h0Cj4gaXQgd291bGQgZml4IGEgcmVncmVzc2lv
biBJIGhhZCBvbiBvbmUgZ2xtYXJrMiB0ZXN0IChpZGVhcyksIGJ1dCB0aGUKPiBwcm9ibGVtIGVu
ZGVkIHVwIGJlaW5nIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudCAob3ZlcmhlYWQgb2YK
PiBjYWxsaW5nIGlvY3RsKFdBSVRfQk8pIG9uIGFscmVhZHkgaWRsZSBCT3MpLgo+IAo+IEkganVz
dCByYW4gZ2xtYXJrMiBhZ2FpbiwgYW5kIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhIG5vdGlj
ZWFibGUKPiBpbXByb3ZlbWVudCB3aXRoIHRob3NlIDIgcGF0Y2hlcyBhcHBsaWVkIChhbmQgbWVz
YSBwYXRjaGVkIHRvIHVzZSB0aGUKPiBuZXcgZmxhZ3MpLiBUaGlzIGJlaW5nIHNhaWQsIHRoZSBp
bXByb3ZlbWVudCBpcyBsaWtlbHkgdG8gYmUgd29ya2xvYWQKPiBkZXBlbmRlbnQsIHNvIEkgd291
bGRuJ3QgY29uc2lkZXIgdGhlc2UgcGF0Y2hlcyBhcyB1c2VsZXNzLCBidXQgSSdtCj4gZmluZSBw
dXR0aW5nIHRoZW0gb24gaG9sZCB1bnRpbCB3ZSBzZWUgYSByZWFsIG5lZWQuCj4gCj4gTWF5YmUg
U3RldmVuIGhhcyBzb21lIHJlYWwgdXNlIGNhc2VzIHRoYXQgY291bGQgaGVscCBvdXRsaW5lIHRo
ZQo+IGJlbmVmaXQgb2YgdGhlc2UgcGF0Y2hlcy4KClRvIGJlIGhvbmVzdCBJIGRvbid0IHJlYWxs
eSBrbm93LiBUaGUgRERLIGludGVybmFsbHkgZG9lcyB0cmFjayB0aGlzCnJlYWQvd3JpdGUgaW5m
b3JtYXRpb24gLSBidXQgdGhlbiBpdCBkb2Vzbid0IGludm9sdmUgdGhlIGtlcm5lbCBpbgp0cmFj
a2luZyBpdC4gSSB3YXMgcHJlc3VtaW5nIHRoYXQgTWVzYSAoYmVjYXVzZSBpdCBleHBvcnRzIHRo
ZSBidWZmZXIKdXNhZ2UgdG8gdGhlIGtlcm5lbCkgd291bGQgYmVuZWZpdCBmcm9tIGJlaW5nIGFi
bGUgdG8gaGF2ZSBtdWx0aXBsZQpyZWFkZXJzIC0gZm9yIGV4YW1wbGUgb2YgYSBidWZmZXIgYmVp
bmcgdXNlZCBhcyBhIHRleHR1cmUgZm9yIG11bHRpcGxlCnJlbmRlciBwYXNzZXMuIEl0J3MgcG9z
c2libGUgd2UgZG9uJ3Qgc2VlIHRoaXMgYmVuZWZpdCBiZWNhdXNlIHdlCmhhdmVuJ3QgZ290IHRo
ZSBxdWV1aW5nIG9mIGpvYnMgbWVyZ2VkIHlldD8KClRoZXJlIG1pZ2h0IGFsc28gYmUgc29tZSBi
ZW5lZml0cyB3aGVuIGl0IGNvbWVzIHRvIGludGVyYWN0aW9uIHdpdGgKb3RoZXIgZHJpdmVycywg
YnV0IEkgZG9uJ3QgaGF2ZSBhbnkgY29uY3JldGUgZXhhbXBsZXMuCgo+Pgo+Pj4gVGhlIE5PX0lN
UExJQ0lUX0ZFTkNFIG1pZ2h0IGJlIHVzZWZ1bCB3aGVuIHRoZSB1c2VyIGtub3dzIHRoZSBCTyBp
cwo+Pj4gc2hhcmVkIGJ1dCBqb2JzIGFyZSB1c2luZyBkaWZmZXJlbnQgcG9ydGlvbnMgb2YgdGhl
IGJ1ZmZlci4gIAo+Pgo+PiBXaHkgZG9uJ3Qgd2UgYWRkIHRoaXMgd2hlbiBpdCBpcyB1c2VmdWwg
cmF0aGVyIHRoYW4gbWlnaHQgYmU/Cj4gCj4gSSBkb24ndCBoYXZlIGEgbmVlZCBmb3IgdGhhdCBv
bmUgeWV0LCBidXQgZXRhbnZpdiBoYXMgaXQgaW4gcGxhY2Ugc28gSQo+IHRob3VnaHQgSSdkIGFk
ZCBib3RoIGF0IHRoZSBzYW1lIHRpbWUuCj4gTm90ZSB0aGF0IGl0IGNvdWxkIGhlbHAgdXMgcmVk
dWNlIHRoZSBudW1iZXIgb2YgZmVuY2UgcmV0dXJuZWQgYnkKPiBwYW5mcm9zdF9qb2JfZGVwZW5k
ZW5jeSgpLCBidXQgSSdtIG5vdCBzdXJlIGl0IG1ha2VzIGEgZGlmZmVyZW5jZSBpbgo+IHRlcm1z
IG9mIHBlcmZzLgoKSSdtIG5vdCBhd2FyZSBvZiBhbnkgcmVhc29uIGZvciBOT19JTVBMSUNJVF9G
RU5DRS4gSSBmb3VuZCBpdCBzb21ld2hhdApvZGQgdGhhdCBpdCBpcyBlZmZlY3RpdmVseSBvbmUg
d2F5IChpdCBkb2Vzbid0IHdhaXQgZm9yIGZlbmNlcywgYnV0Cm90aGVycyBjb3VsZCBiZSB3YWl0
aW5nIG9uIHRoZSBmZW5jZSBhZGRlZCBieSB0aGlzIHVzYWdlKS4gSWYgd2UgZG9uJ3QKaGF2ZSBh
IHVzZSB5ZXQgaW4gTWVzYSB0aGVuIGl0J3MgcHJvYmFibHkgYmVzdCB0byB3YWl0IHVudGlsIHdl
IGtub3cgaG93CnRoaXMgaXMgYWN0dWFsbHkgZ29pbmcgdG8gYmUgdXNlZC4KClRoZXJlIGlzIG9m
IGNvdXJzZSBhbHJlYWR5IHRoZSBvcHRpb24gb2Ygc2ltcGx5IG9taXR0aW5nIHRoZSBCTyBpbiB0
aGUKam9iIHRvIHByZXZlbnQgYW55IGRlcGVuZGVuY2llcyBiZWluZyBjcmVhdGVkIDopCgpTdGV2
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
