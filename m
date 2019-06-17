Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E733B499FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A56E0EB;
	Tue, 18 Jun 2019 07:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 13:21:47 UTC
Received: from smtp113.ord1c.emailsrvr.com (smtp113.ord1c.emailsrvr.com
 [108.166.43.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2389226;
 Mon, 17 Jun 2019 13:21:47 +0000 (UTC)
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp7.relay.ord1c.emailsrvr.com (Authenticated sender:
 abbotti-AT-mev.co.uk) with ESMTPSA id D9002A01B2; 
 Mon, 17 Jun 2019 09:15:44 -0400 (EDT)
X-Sender-Id: abbotti@mev.co.uk
Received: from [10.0.0.62] (remote.quintadena.com [81.133.34.160])
 (using TLSv1.2 with cipher AES128-SHA) by 0.0.0.0:465 (trex/5.7.12);
 Mon, 17 Jun 2019 09:15:47 -0400
Subject: Re: [PATCH 12/16] staging/comedi: mark as broken
To: Christoph Hellwig <hch@lst.de>, Greg KH <gregkh@linuxfoundation.org>
References: <20190614134726.3827-1-hch@lst.de>
 <20190614134726.3827-13-hch@lst.de> <20190614140239.GA7234@kroah.com>
 <20190614144857.GA9088@lst.de> <20190614153032.GD18049@kroah.com>
 <20190614153428.GA10008@lst.de>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <60c6af3d-d8e4-5745-8d2b-9791a2f4ff56@mev.co.uk>
Date: Mon, 17 Jun 2019 14:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614153428.GA10008@lst.de>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mev.co.uk; 
 s=20190130-41we5z8j; t=1560777347;
 bh=ZvJvYkjr7iE1RIXRXDlijzKzJL0BitvNBM9T5FqQAmw=;
 h=Subject:To:From:Date:From;
 b=Nl+Gx2+KTHlZUrgrlD4OPdHaDIh8UJfTuRA5MZVnySfiilIiWgnddpiJk4/aln5DA
 OAo8bcON3aHKJNRIUHN2qprmbAq2BRvH2IUzshdVkvRvYeZuB2iOeftPYIjVWn6ziI
 KuJnFj51kem220yEC5D7kahxijPjmtFu66j0THaY=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-media@vger.kernel.org, Intel Linux Wireless <linuxwifi@intel.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 iommu@lists.linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDYvMjAxOSAxNjozNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gRnJpLCBK
dW4gMTQsIDIwMTkgYXQgMDU6MzA6MzJQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToKPj4gT24gRnJp
LCBKdW4gMTQsIDIwMTkgYXQgMDQ6NDg6NTdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4+PiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAwNDowMjozOVBNICswMjAwLCBHcmVnIEtI
IHdyb3RlOgo+Pj4+IFBlcmhhcHMgYSBoaW50IGFzIHRvIGhvdyB3ZSBjYW4gZml4IHRoaXMgdXA/
ICBUaGlzIGlzIHRoZSBmaXJzdCB0aW1lCj4+Pj4gSSd2ZSBoZWFyZCBvZiB0aGUgY29tZWRpIGNv
ZGUgbm90IGhhbmRsaW5nIGRtYSBwcm9wZXJseS4KPj4+Cj4+PiBJdCBjYW4gYmUgZml4ZWQgYnk6
Cj4+Pgo+Pj4gICBhKSBuZXZlciBjYWxsaW5nIHZpcnRfdG9fcGFnZSAob3Igdm1hbGxvY190b19w
YWdlIGZvciB0aGF0IG1hdHRlcikKPj4+ICAgICAgb24gZG1hIGFsbG9jYXRpb24KPj4+ICAgYikg
bmV2ZXIgcmVtYXBwaW5nIGRtYSBhbGxvY2F0aW9uIHdpdGggY29uZmxpY3RpbmcgY2FjaGUgbW9k
ZXMKPj4+ICAgICAgKG5vIHJlbWFwcGluZyBzaG91bGQgYmUgZG9hYmxlIGFmdGVyIGEpIGFueXdh
eSkuCj4+Cj4+IE9rLCBmYWlyIGVub3VnaCwgaGF2ZSBhbnkgcG9pbnRlcnMgb2YgZHJpdmVycy9j
b3JlIGNvZGUgdGhhdCBkb2VzIHRoaXMKPj4gY29ycmVjdGx5PyAgSSBjYW4gcHV0IGl0IG9uIG15
IHRvZG8gbGlzdCwgYnV0IG1pZ2h0IHRha2UgYSB3ZWVrIG9yIHNvLi4uCj4gCj4gSnVzdCBhYm91
dCBldmVyeW9uZSBlbHNlLiAgVGhleSBqdXN0IG5lZWQgdG8gcmVtb3ZlIHRoZSB2bWFwIGFuZAo+
IGVpdGhlciBkbyBvbmUgbGFyZ2UgYWxsb2NhdGlvbiwgb3IgbGl2ZSB3aXRoIHRoZSBmYWN0IHRo
YXQgdGhleSBuZWVkCj4gaGVscGVycyB0byBhY2Nlc3MgbXVsdGlwbGUgYXJyYXkgZWxlbWVudHMg
aW5zdGVhZCBvZiBvbmUgbmV0IHZtYXAsCj4gd2hpY2ggbW9zdCBvZiB0aGUgdXNlcnMgYWxyZWFk
eSBzZWVtIHRvIGRvIGFueXdheSwgd2l0aCBqdXN0IGEgZmV3Cj4gdXNpbmcgdGhlIHZtYXAgKHdo
aWNoIG1pZ2h0IGV4cGxhaW4gd2h5IHdlIGRpZG4ndCBzZWUgYmxvd3VwcyB5ZXQpLgoKQXZvaWRp
bmcgdGhlIHZtYXAgaW4gY29tZWRpIHNob3VsZCBiZSBkby1hYmxlIGFzIGl0IGFscmVhZHkgaGFz
IG90aGVyIAptZWFucyB0byBnZXQgYXQgdGhlIGJ1ZmZlciBwYWdlcy4KCldoZW4gY29tZWRpIG1h
a2VzIHRoZSBidWZmZXIgZnJvbSBETUEgY29oZXJlbnQgbWVtb3J5LCBpdCBjdXJyZW50bHkgCmFs
bG9jYXRlcyBpdCBhcyBhIHNlcmllcyBvZiBwYWdlLXNpemVkIGNodW5rcy4gIFRoYXQgY2Fubm90
IGJlIG1tYXAnZWQgCmluIG9uZSBnbyB3aXRoIGRtYV9tbWFwX2NvaGVyZW50KCksIHNvIEkgc2Vl
IHRoZSBmb2xsb3dpbmcgc29sdXRpb25zLgoKMS4gQ2hhbmdlIHRoZSBidWZmZXIgYWxsb2NhdGlv
biB0byBhbGxvY2F0ZSBhIHNpbmdsZSBjaHVuayBvZiBETUEgCmNvaGVyZW50IG1lbW9yeSBhbmQg
dXNlIGRtYV9tbWFwX2NvaGVyZW50KCkgdG8gbW1hcCBpdC4KCjIuIENhbGwgZG1hX21tYXBfY29o
ZXJlbnQoKSBpbiBhIGxvb3AsIGFkanVzdGluZyB2bWEtPnZtX3N0YXJ0IGFuZCAKdm1hLT52bV9l
bmQgZm9yIGVhY2ggaXRlcmF0aW9uICh2bWEtPnZtX3Bnb2ZmIHdpbGwgYmUgMCksIGFuZCByZXN0
b3JpbmcgCnRoZSB2bWEtPnZtX3N0YXJ0IGFuZCB2bWEtPnZtX2VuZCBhdCB0aGUgZW5kLgoKSSdt
IG5vdCBzdXJlIGlmIDIgaXMgYSBsZWdhbCBvcHRpb24uCgotLSAKLT0oIElhbiBBYmJvdHQgPGFi
Ym90dGlAbWV2LmNvLnVrPiB8fCBXZWI6IHd3dy5tZXYuY28udWsgKT0tCi09KCBNRVYgTHRkLiBp
cyBhIGNvbXBhbnkgcmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMuICk9LQotPSggUmVnaXN0
ZXJlZCBudW1iZXI6IDAyODYyMjY4LiAgUmVnaXN0ZXJlZCBhZGRyZXNzOiAgICApPS0KLT0oIDE1
IFdlc3QgUGFyayBSb2FkLCBCcmFtaGFsbCwgU1RPQ0tQT1JULCBTSzcgM0paLCBVSy4gKT0tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
