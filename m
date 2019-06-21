Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08E4F0E0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 00:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3C6E934;
	Fri, 21 Jun 2019 22:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7A6E934
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 22:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B1D733F6AF;
 Sat, 22 Jun 2019 00:52:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wlhbf2M9tt0N; Sat, 22 Jun 2019 00:52:29 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 87B373F4C2;
 Sat, 22 Jun 2019 00:52:28 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F28E8361688;
 Sat, 22 Jun 2019 00:52:27 +0200 (CEST)
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
 <20190621155737.GH12905@phenom.ffwll.local>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <a34afbbb-e2d0-299b-872f-e322f05c7ac3@shipmail.org>
Date: Sat, 22 Jun 2019 00:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190621155737.GH12905@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1561157548; bh=CrdrRJF+i3DJzVNnrejMMKlepnPS63Mxn5u9fhFWUM4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=e2ShN3MZYUrJ5fbZmWA68gV5OhjOnBD8vsiZe5OgaQN2VfnBc5rsYzhRsLCZeCZsS
 CGYj2wz2zJqkjqPZkgZIst/oZBQomcxLTGCfyoftm0RBtLLc77WWNVHL0+aKBc4+hq
 a50ZnjAtGUeutOsQ8+2lqDxGx2KQ+hDLlf8NMykI=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=e2ShN3MZ; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: ckoenig.leichtzumerken@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbCwKCk9uIDYvMjEvMTkgNTo1NyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBP
biBGcmksIEp1biAyMSwgMjAxOSBhdCAwNToxMjoxOVBNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2
bSAoVk13YXJlKSB3cm90ZToKPj4KPj4gT24gNi8yMS8xOSAxOjU3IFBNLCBHZXJkIEhvZmZtYW5u
IHdyb3RlOgo+Pgo+PiBBYXJnaC4gUGxlYXNlIGRvbid0IGRvIHRoaXMuIE11bHRpcGxlIHJlYXNv
bnM6Cj4+Cj4+IDEpIEkgdGhpbmsgSXQncyBiYWQgdG8gZHVtcCBhbGwgYnVmZmVyIG9iamVjdCBm
dW5jdGlvbmFsaXR5IHdlIGNhbiBwb3NzaWJseQo+PiB0aGluayBvZiBpbiBhIHNpbmdsZSBzdHJ1
Y3QgYW5kIGZvcmNlIHRoYXQgb24gYWxsICh3ZWxsIGF0IGxlYXN0IG1vc3QpCj4+IHVzZXJzLiBJ
dCdzIGJldHRlciB0byBpc29sYXRlIGZ1bmN0aW9uYWxpdHkgaW4gc3RydWN0cywgaGF2ZSB1dGls
aXR5Cj4+IGZ1bmN0aW9ucyBmb3IgdGhvc2UgYW5kIGxldCB0aGUgZHJpdmVycyBkZXJpdmUgdGhl
aXIgYnVmZmVyIG9iamVjdHMgZnJvbQo+PiB3aGF0ZXZlciBmdW5jdGlvbmFsaXR5IHRoZXkgYWN0
dWFsbHkgbmVlZC4KPj4gMikgdm13Z2Z4IGlzIG5vdCB1c2luZyBnZW0gYW5kIHdlIGRvbid0IHdh
bnQgdG8gY2FycnkgdGhhdCBleHRyYSBwYXlsb2FkIGluCj4+IHRoZSBidWZmZXIgb2JqZWN0Lgo+
PiAzKSBUVE0gaGlzdG9yaWNhbGx5IGhhc24ndCBiZWVuIHVzaW5nIHRoZSB2YXJpb3VzIGRybSBs
YXllcnMgZXhjZXB0IGZvcgo+PiBsYXRlciB3aGVuIGNvbW1vbiBoZWxwZXJzIGhhdmUgYmVlbiB1
c2VkLCAobGlrZSB0aGUgdm1hIG1hbmFnZXIgYW5kIHRoZQo+PiBjYWNoZSB1dGlsaXRpZXMpLiBJ
dCdzIGRlc2lyYWJsZSB0byBrZWVwIHRoYXQgbGF5ZXIgZGlzdGluY3Rpb24uICh3aGljaCBpcwo+
PiByZWFsbHkgd2hhdCBJJ20gc2F5aW5nIGluIDEuKQo+Pgo+PiBOb3cgaWYgbW9yZSBhbmQgbW9y
ZSBmdW5jdGlvbmFsaXR5IHRoYXQgb3JpZ2luYXRlZCBpbiBUVE0gaXMgbW92aW5nIGludG8gR0VN
Cj4+IHdlIG5lZWQgdG8gZmluZCBhIGJldHRlciB3YXkgdG8gZG8gdGhhdCB3aXRob3V0IGR1cGxp
Y2F0aW5nIGZ1bmN0aW9uYWxpdHkuIEkKPj4gc3VnZ2VzdCBhZGRpbmcgcG9pbnRlcnMgaW4gdGhl
IFRUTSBzdHJ1Y3RzIGFuZCBkZWZhdWx0aW5nIHRob3NlIHBvaW50ZXJzIHRvCj4+IHRoZSBtZW1i
ZXIgaW4gdGhlIFRUTSBzdHJ1Y3QuIE9wdGlvbmFsbHkgdG8gdG8gdGhlIG1lbWJlciBpbiB0aGUg
R0VNIHN0cnVjdC4KPj4gSWYgd2UgbmVlZCB0byBtaWdyYXRlIHRob3NlIG1lbWJlcnMgb3V0IG9m
IHRoZSBUVE0gc3RydWN0LCB2bXdnZnggd291bGQgaGF2ZQo+PiB0byBwcm92aWRlIHRoZW0gaW4g
aXRzIG93biBidWZmZXIgY2xhc3MuCj4+Cj4+IE5BSyBmcm9tIHRoZSB2bXdnZnggc2lkZS4KPiBJ
dCdzIDU5IERSSVZFUl9HRU0gdnMgMSB3aGljaCBpcyBub3QuIEkgdGhpbmsgdGhlIHZlcmRpY3Qg
aXMgY2xlYXIgd2hhdAo+IHRoZSByZWFzb25hYmxlIHRoaW5nIHRvIGRvIGlzIGhlcmUsIGFuZCB0
aGlzIHdpbGwgYWxsb3cgdXMgdG8KPiBzdWJzdGFudGlhbGx5IGltcHJvdmUgY29kZSBhbmQgY29u
Y2VwdCBzaGFyaW5nIGFjcm9zcyBkcm0gZHJpdmVycy4KPgo+IDEwIHllYXJzIGFnbyBpdCB3YXMg
aW5kZWVkIG5vdCBjbGVhciB3aGV0aGVyIGV2ZXJ5b25lIGRvaW5nIHRoZSBzYW1lIGlzIGEKPiBi
cmlnaHQgaWRlYSwgYnV0IHRoYXQncyBubyBtb3JlLiBJZiB5b3Ugd2FudCBJIGd1ZXNzIHlvdSBj
YW4ga2VlcCBhCj4gcHJpdmF0ZSBjb3B5IG9mIHR0bSBpbiB2bXdnZngsIGJ1dCBub3Qgc3VyZSB0
aGF0J3MgcmVhbGx5IHdvcnRoIGl0Cj4gbG9uZy10ZXJtLgo+IC1EYW5pZWwKCkl0J3Mgbm90IGEg
cXVlc3Rpb24gYWJvdXQgd2hldGhlciBHRU0gb3IgVFRNLCBvciBldmVuIHRoZSBudW1iZXIgb2Yg
CmRyaXZlcnMgdXNpbmcgb25lIG9yIHRoZSBvdGhlci4gKEdFTSB3b3VsZCBhY3R1YWxseSBiZSBh
IGdvb2QgY2hvaWNlIGZvciAKdGhlIGxhdHRlciB2bXdnZnggZGV2aWNlIHZlcnNpb25zKS4gQnV0
IHRoaXMgaXMgZ29pbmcgYWdhaW5zdCBhbGwgcmVjZW50IAplZmZvcnQgdG8gbWFrZSBkaWZmZXJl
bnQgcGFydHMgb2YgZHJtIGZ1bmN0aW9uYWxpdHkgcmVjZW50bHkgc2VsZi1jb250YWluZWQuCgpK
dXN0IHN0b3AgYW5kIHRoaW5rIGZvciBhIHdoaWxlIHdoYXQgd291bGQgaGFwcGVuIGlmIHNvbWVv
bmUgd291bGQgCnN1Z2dlc3QgZG9pbmcgdGhlIG9wcG9zaXRlOiBtYWtpbmcgYSBnZW0gb2JqZWN0
IGEgZGVyaXZlZCBjbGFzcyBvZiBhIFRUTSAKb2JqZWN0LCBhcmd1aW5nIHRoYXQgYSBsb3Qgb2Yg
R0VNIGRyaXZlcnMgYXJlIHVzaW5nIFRUTSBhcyBhIGJhY2tlbmQuIApUaGVyZSB3b3VsZCBwcm9i
YWJseSBiZSBhIGxvdCBvZiBwZW9wbGUgY2xhaW1pbmcgIndlIGRvbid0IHdhbnQgdG8gCnVubmVj
ZXNhcmlseSBjYXJyeSB0aGF0IHN0dWZmIi4gVGhhdCdzIGJlY2F1c2UgdGhhdCB3b3VsZCBhbHNv
IGJlIGEgcG9vciAKZGVzaWduLgoKV2hhdCBJJ20gc3VnZ2VzdGluZyBpcywgYnVpbGQgdGhhdCBp
bXByb3ZlZCBjb2RlIGFuZCBjb25jZXB0IHNoYXJpbmcgYXJvdW5kCgpzdHJ1Y3QgZ2VtX3R0bV9v
YmplY3QgewogwqDCoCBzdHJ1Y3QgZ2VtX29iamVjdDsKIMKgwqAgc3RydWN0IHR0bV9vYmplY3Q7
Cn07CgpBbmQgbGV0cyB3b3JrIHRvZ2hldGhlciB0byBlbGltaW5hdGUgd2hhdCdzIGR1cGxpY2F0
ZWQuCgpUaGUgdm13Z2Z4IGRyaXZlciBpcyBkb2luZyB3aGF0IGl0IGRvZXMgbW9zdGx5IGJlY2F1
c2UgYWxsIGJ1ZmZlciAKb2JqZWN0cyBkbyBub3QgbmVlZCB0byBiZSB1c2VyLXNwYWNlIHZpc2li
bGUsIGFuZCBkbyBub3QgbmVlZCB0byBiZSAKbWFwcGVkIGJ5IHVzZXItc3BhY2UuIEFuZCB0aGVy
ZSBhcmUgb3RoZXIgdHlwZXMgb2Ygb2JqZWN0cyB0aGF0IERPIG5lZWQgCnRvIGJlIHVzZXItc3Bh
Y2UgdmlzaWJsZSwgYW5kIHRoYXQgZG8gbmVlZCB0byBiZSBzaGFyZWQgYnkgcHJvY2Vzc2VzLiAK
SGVuY2UgdXNlci1zcGFjZSB2aXNpYmlsaXR5IGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBh
YnN0cmFjdGVkIGFuZCAKbWFkZSBhdmFpbGFibGUgdG8gdGhvc2Ugb2JqZWN0cy4gTm90IGx1bXBl
ZCB0b2dldGhlciB3aXRoIGFsbCBvdGhlciAKcG90ZW50aWFsIGJ1ZmZlciBvYmplY3QgZnVuY3Rp
b25hbGl0eS4KCi9UaG9tYXMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
