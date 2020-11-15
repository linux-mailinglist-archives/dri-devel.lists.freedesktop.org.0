Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595462B382D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 19:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7026E9B4;
	Sun, 15 Nov 2020 18:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690526E9B4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 18:58:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02B4DABD6;
 Sun, 15 Nov 2020 18:58:01 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Deepak Rawat <drawat.floss@gmail.com>,
 "Tang, Shaofeng" <shaofeng.tang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
 <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
 <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
 <2a46700700085e7e2588bb8120595968aae7f8a6.camel@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e70a2528-ae5a-f855-ae77-b0bb0a7239af@suse.de>
Date: Sun, 15 Nov 2020 19:58:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2a46700700085e7e2588bb8120595968aae7f8a6.camel@gmail.com>
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
Cc: "Huang, Yuanjun" <yuanjun.huang@intel.com>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE1LjExLjIwIHVtIDE4OjU1IHNjaHJpZWIgRGVlcGFrIFJhd2F0Ogo+IE9uIFN1biwg
MjAyMC0xMS0xNSBhdCAxMDoxNCArMDEwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+IEhp
IERlZXBhawo+Pgo+PiBBbSAxMS4wOS4yMCB1bSAwMjozOCBzY2hyaWViIERlZXBhayBSYXdhdDoK
Pj4+IE9uIFRodSwgMjAyMC0wOS0xMCBhdCAwODoxOSArMDAwMCwgVGFuZywgU2hhb2Zlbmcgd3Jv
dGU6Cj4+Pj4gSGkgRGVlcGFrLAo+Pj4+IMKgCj4+Pj4gRG8geW91IGhhdmUgYSBuZXcgdmVyc2lv
biBvZiB0aGlzIHBhdGNoIG5vdz8KPj4+PiBJIHRha2UgYSB0cnkgd2l0aCBpdC4gYW5kIG1lZXQg
c29tZSB0eXBvIGFuZCDigJxpbmNvbXBhdGlibGUKPj4+PiBwb2ludGVy4oCdCj4+Pj4gZXJyb3Iu
Cj4+Pj4gSWYgeW91IGhhdmUgYSBuZXcgdmVyc2lvbiwgY291bGQgeW91IHNoYXJlIGl0IHdpdGgg
dXM/Cj4+Pj4KPj4+Cj4+PiBIaSBTaGFvZmVuZywKPj4+Cj4+PiBJdCBzZWVtcyB5b3UgYXJlIHJ1
bm5pbmcgdGhpcyB3aXRoIGdlbiAyIFZNLCBJIGhhdmUgYSBwYXRjaCB0bwo+Pj4gc3VwcG9ydAo+
Pj4gZ2VuIDIgVk0ncyBhdCBodHRwczovL2dpdGh1Yi5jb20vZGVlcGFrLXJhd2F0L2xpbnV4Lmdp
dMKgYnJhbmNoCj4+PiBoeXBlcnZfdAo+Pj4gaW55Lgo+Pgo+PiBJJ20gaW50ZXJlc3RlZCBpbiBt
ZXJnaW5nIHRoaXMgZHJpdmVyIGludG8gdGhlIERSTSB1cHN0cmVhbS4gV2hhdCdzCj4+IHRoZQo+
PiBzdGF0dXM/IEFyZSB5b3Ugc3RpbGwgd29ya2luZyBvbiBpdD8KPiAKPiBIaSBUaG9tYXMsCj4g
Cj4gSSBhbSB3b3JraW5nIG9uIGFkZGluZyBnZW4yIFZNIHN1cHBvcnQgYW5kIGN1cnNvciBzdXBw
b3J0LiBBbHNvIGZvciBteQo+IG5leHQgaW50ZXJhdGlvbiBtb3ZpbmcgdGhlIGRyaXZlciBvdXQg
b2YgdGlueS4gUHJvZ3Jlc3MgaXMgc2xvdyBsYXRlbHkKPiBhcyBidXN5IHdpdGggb3RoZXIgc3R1
ZmYgYXQgd29yay4gSG9wZWZ1bGx5IEkgd2lsbCBiZSBhYmxlIHRvIGZpbmlzaAo+IGR1cmluZyBj
b21pbmcgaG9saWRheXMuCgpJIHNlZS4gVGhhbmtzIGZvciB0aGUgdXBkYXRlLiBJJ2Qgc3VnZ2Vz
dCB0byBjbGVhbiB1cCB3aGF0IHlvdSBoYXZlIGFuZApzZW5kIGl0IGZvciByZXZpZXcuIEhhdmlu
ZyBldmVuIGEgc2ltcGxlIGRyaXZlciBpbiB1cHN0cmVhbSBtYWtlcyBpdCBzbwptdWNoIGVhc2ll
ciBmb3Igb3RoZXJzIHRvIGNvbnRyaWJ1dGUgYW5kIHlvdSdsbCBnZXQgbWFueSBvZiB0aGUgdXBz
dHJlYW0KaW1wcm92ZW1lbnRzIGF1dG9tYXRpY2FsbHkuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+
IAo+IERlZXBhawo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4+Cj4+Pgo+Pj4gSWYg
eW91IHN0aWxsIHJ1biBpbnRvIGVycm9yIGFmdGVyIGFwcGx5aW5nIGdlbjIgcGF0Y2gsIGZlZWwg
ZnJlZSB0bwo+Pj4gcmVhY2ggb3V0IHdpdGggZGV0YWlscy4KPj4+Cj4+PiBEZWVwYWsKPj4+Cj4+
Pj4gwqAKPj4+PiBCUiwgU2hhb2ZlbmcKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPj4+Cj4+Cj4gCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKVGhvbWFz
IFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5k
w7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
