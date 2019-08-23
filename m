Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCB9B196
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E136E07B;
	Fri, 23 Aug 2019 14:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 441356E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:05:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00F6A28;
 Fri, 23 Aug 2019 07:05:50 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39D453F718;
 Fri, 23 Aug 2019 07:05:46 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Rob Herring <robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
 <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
 <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b45dc9fc-be55-ec91-74c4-dad5e2ed4917@arm.com>
Date: Fri, 23 Aug 2019 15:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAxNDoxOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMs
IDIwMTkgYXQgNzo1NiBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gT24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiB0bGJf
aW52X2NvbnRleHQoKSBob29rIGlzIG9ubHkgY2FsbGVkIHdoZW4gZnJlZWluZyB0aGUgcGFnZSB0
YWJsZXMuIFRoZXJlJ3MKPj4+IG5vIHBvaW50IGluIGZsdXNoaW5nIG9ubHkgdG8gZnJlZSB0aGUg
cGFnZSB0YWJsZXMgaW1tZWRpYXRlbHkgZm9sbG93aW5nLgo+Pgo+PiBGV0lXLCBpbiBnZW5lcmFs
IHRoZSBwb2ludCBvZiBmbHVzaGluZyBpcyAqYmVjYXVzZSogd2UncmUgYWJvdXQgdG8gZnJlZQo+
PiB0aGUgcGFnZXRhYmxlcyAtIGlmIHRoZXJlJ3MgYW55IHBvc3NpYmlsaXR5IHRoYXQgdGhlIGhh
cmR3YXJlIGNvdWxkCj4+IGNvbnRpbnVlIHRvIGlzc3VlIHRyYW5zbGF0aW9uIHRhYmxlIHdhbGtz
IChzcGVjdWxhdGl2ZSBvciBvdGhlcndpc2UpCj4+IGFmdGVyIHRob3NlIHBhZ2VzIGhhdmUgYmVl
biByZXVzZWQgYnkgc29tZW9uZSBlbHNlLCBUTEIgYmFkbmVzcyBtYXkgZW5zdWUuCj4+Cj4+IEZv
ciBwYW5mcm9zdCBpbiBwYXJ0aWN1bGFyIEkgc3VzcGVjdCB3ZSBjYW4gcHJvYmFibHkgZ2V0IGF3
YXkgd2l0aG91dAo+PiBpdCwgYXQgbGVhc3QgZm9yIHRoZSBtb21lbnQsIGJ1dCBpdCBtaWdodCBi
ZSB3b3J0aCBtb3ZpbmcgdGhlIGZsdXNoIHRvCj4+IG1tdV9kaXNhYmxlKCkgZm9yIGNvbXBsZXRl
IHBlYWNlIG9mIG1pbmQgKHdoaWNoIGtpbmQgb2YgcHJlZW1wdHMgdGhlCj4+IHNvcnQgb2YgdGhp
bmcgdGhhdCBwZXItcHJvY2VzcyBBUyBzd2l0Y2hpbmcgd2lsbCB3YW50IGFueXdheSkuCj4gCj4g
VGhlcmUncyBiaWdnZXIgcHJvYmxlbSB0aGF0IG1tdV9kaXNhYmxlKCkgaXMgc3RpbGwgb25seSBj
YWxsZWQgZm9yIEFTMAo+IGFuZCBvbmx5IGZvciBkcml2ZXIgdW5sb2FkLgoKU3VyZSwgYnV0IEFT
MCBpcyB0aGUgb25seSBvbmUgd2UgZXZlciBlbmFibGUsIGFuZCBjb25jZXB0dWFsbHkgd2UgZG8g
CnRoYXQgb25jZSBhdCBwcm9iZSB0aW1lIChBRkFJQ1MgaXQgc3RheXMgbm9taW5hbGx5IGxpdmUg
dGhyb3VnaCByZXNldHMgCmFuZCByZXN1bWVzKSwgc28gd2hpbGUgaXQgbWF5IGJlIHRoZSBsZWFz
dC1jbGV2ZXIgQVMgdXNhZ2UgcG9zc2libGUgaXQncyAKYXQgbGVhc3Qgc2VsZi1jb25zaXN0ZW50
LiBBbmQgYXQgdGhlIG1vbWVudCB0aGUgb25seSB0aW1lIHdlJ2xsIGNhbGwgCi50bGJfaW52X2Nv
bnRleHQgaXMgZnJvbSBwYW5mcm9zdF9tbXVfZmluaSgpIHdoZW4gd2UncmUgdW5jb25kaXRpb25h
bGx5IApwb2tpbmcgcmVnaXN0ZXJzIGFueXdheSwgc28gZWl0aGVyIHdheSBJIGRvbid0IHRoaW5r
IHRoZXJlJ3MgYW55IGFjdHVhbCAKcHJvYmxlbSB0b2RheSAtIEknbSB2aWV3aW5nIHRoaXMgcGF0
Y2ggYXMgZ2V0dGluZyB0aGluZ3Mgc3RyYWlnaHQgaW4gCnByZXBhcmF0aW9uIGZvciB0aGUgZnV0
dXJlLgoKPiBJIGd1ZXNzIHdlIHNob3VsZCBmaXggdGhhdCBhbmQgdGhlbiBmaWd1cmUKPiBvdXQg
d2hlcmUgYSBmbHVzaCBpcyBuZWVkZWQgaWYgYXQgYWxsLiBJIHdvdWxkIHRoaW5rIGNoYW5naW5n
IHRoZSBUVEJSCj4gd291bGQgYmUgZW5vdWdoIHRvIHF1aWVzY2UgdGhlIGgvdyBhbmQgVExCcy4g
VGhhdCBzZWVtcyB0byBiZSB0aGUgY2FzZQo+IGluIG15IHRlc3Rpbmcgb2Ygc3dpdGNoaW5nIGFk
ZHJlc3Mgc3BhY2VzLgoKIEZyb20gYSBxdWljayBzY2FuIHRocm91Z2gga2Jhc2UsIGtiYXNlX21t
dV9kaXNhYmxlKCkgYXBwZWFycyB0byBwZXJmb3JtIAphbiBmdWxsIEZMVVNIX01FTSBiZWZvcmUg
cmV3cml0aW5nIFRSQU5TVEFCLCBhbmQgaXQgbG9va3MgbGlrZSB0aGF0IGRvZXMgCmdldCBjYWxs
ZWQgd2hlbiBzY2hlZHVsaW5nIG91dCBhIGNvbnRleHQuIFRoYXQncyBpbiBsaW5lIHdpdGggd2hh
dCBJIHdhcyAKaW1hZ2luaW5nLCBzbyB1bmxlc3Mgd2Uga25vdyBiZXR0ZXIgZm9yIHN1cmUsIHdl
IG1heSBhcyB3ZWxsIHBsYXkgaXQgCnNhZmUgYW5kIGZvbGxvdyB0aGUgc2FtZSBwYXR0ZXJuLgoK
Um9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
