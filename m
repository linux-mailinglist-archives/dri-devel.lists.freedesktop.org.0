Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268E8679B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 19:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056006E844;
	Thu,  8 Aug 2019 17:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0DA6E844;
 Thu,  8 Aug 2019 17:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 10:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="169048728"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO [10.252.5.86])
 ([10.252.5.86])
 by orsmga008.jf.intel.com with ESMTP; 08 Aug 2019 10:03:02 -0700
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
To: Chris Wilson <chris@chris-wilson.co.uk>, Al Viro
 <viro@zeniv.linux.org.uk>, Hugh Dickins <hughd@google.com>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
 <20190805182834.GI1131@ZenIV.linux.org.uk>
 <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
 <20190807063002.GG6627@lst.de> <20190808012314.GK1131@ZenIV.linux.org.uk>
 <alpine.LSU.2.11.1908080813380.12321@eggly.anvils>
 <156528143789.22627.18099397585070419297@skylake-alporthouse-com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <8a9a9aee-a266-5ab2-85b3-e39e821b2d03@intel.com>
Date: Thu, 8 Aug 2019 18:03:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156528143789.22627.18099397585070419297@skylake-alporthouse-com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMDgvMjAxOSAxNzoyMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgSHVnaCBE
aWNraW5zICgyMDE5LTA4LTA4IDE2OjU0OjE2KQo+PiBPbiBUaHUsIDggQXVnIDIwMTksIEFsIFZp
cm8gd3JvdGU6Cj4+PiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwODozMDowMkFNICswMjAwLCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAxMjo1
MDoxMEFNIC0wNzAwLCBIdWdoIERpY2tpbnMgd3JvdGU6Cj4+Pj4+IFRob3VnaCBwZXJzb25hbGx5
IEknbSBhdmVyc2UgdG8gbWFuYWdpbmcgImYib2JqZWN0cyB0aHJvdWdoCj4+Pj4+ICJtImludGVy
ZmFjZXMsIHdoaWNoIGNhbiBnZXQgcmlkaWN1bG91cyAobm90YWJseSwgTUFEVl9IVUdFUEFHRSB3
b3Jrcwo+Pj4+PiBvbiB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGEgbWFwcGluZywgYnV0IHRoZSBo
dWdlLW9yLW5vdCBhbGlnbm1lbnQgb2YKPj4+Pj4gdGhhdCBtYXBwaW5nIG11c3QgaGF2ZSBiZWVu
IGRlY2lkZWQgcHJldmlvdXNseSkuICBJbiBHb29nbGUgd2UgZG8gdXNlCj4+Pj4+IGZjbnRscyBG
X0hVR0VQQUdFIGFuZCBGX05PSFVHRVBBR0UgdG8gb3ZlcnJpZGUgb24gYSBwZXItZmlsZSBiYXNp
cyAtCj4+Pj4+IG9uZSBkYXkgSSdsbCBnZXQgdG8gdXBzdHJlYW1pbmcgdGhvc2UuCj4+Pj4KPj4+
PiBTdWNoIGFuIGludGVyZmFjZSBzZWVtcyB2ZXJ5IHVzZWZ1bCwgYWx0aG91Z2ggdGhlIHR3byBm
Y250bHMgc2VlbSBhIGJpdAo+Pj4+IG9kZC4KPj4+Pgo+Pj4+IEJ1dCBJIHRoaW5rIHRoZSBwb2lu
dCBoZXJlIGlzIHRoYXQgdGhlIGk5MTUgaGFzIGl0cyBvd24gc29tZXdoYXQgb2RkCj4+Pj4gaW5z
dGFuY2Ugb2YgdG1wZnMuICBJZiB3ZSBjb3VsZCBwYXNzIHRoZSBlcXVpdmFsZW50IG9mIHRoZSBo
dWdlPSoKPj4+PiBvcHRpb25zIHRvIHNobWVtX2ZpbGVfc2V0dXAgYWxsIHRoYXQgZ2FyYmFnZSAo
aW5jbHVkaW5nIHRoZQo+Pj4+IHNobWVtX2ZpbGVfc2V0dXBfd2l0aF9tbnQgZnVuY3Rpb24pIGNv
dWxkIGdvIGF3YXkuCj4+Pgo+Pj4gLi4uIG9yIGZvbGxvdyBzaG1lbV9maWxlX3N1cGVyKCkgd2l0
aCB3aGF0ZXZlciB0aGF0IGZjbnRsIG1hcHMgdG8KPj4+IGludGVybmFsbHkuICBJIHdvdWxkIHJl
YWxseSBsb3ZlIHRvIGdldCByaWQgb2YgdGhhdCBpOTE1IGtsdWRnZS4KPj4KPj4gQXMgdG8gdGhl
IGltbWVkaWF0ZSBwcm9ibGVtIG9mIGk5MTVfZ2VtZnMgdXNpbmcgcmVtb3VudF9mcyBvbiBsaW51
eC1uZXh0LAo+PiBJSVVDLCBhbGwgdGhhdCBpcyBuZWNlc3NhcnkgYXQgdGhlIG1vbWVudCBpcyB0
aGUgZGVsZXRpb25zIHBhdGNoIGJlbG93Cj4+IChidXQgSSdkIHByZWZlciB0aGF0IHRvIGNvbWUg
ZnJvbSB0aGUgaTkxNSBmb2xrcykuICBTaW5jZSBnZW1mcyBoYXMgbm8KPj4gbmVlZCB0byBjaGFu
Z2UgdGhlIGh1Z2Ugb3B0aW9uIGZyb20gaXRzIGRlZmF1bHQgdG8gaXRzIGRlZmF1bHQuCj4+Cj4+
IEFzIHRvIHRoZSBmdXR1cmUgb2Ygd2hlbiB0aGV5IGdldCBiYWNrIHRvIHdhbnRpbmcgaHVnZSBw
YWdlcyBpbiBnZW1mcywKPj4geWVzLCB0aGF0IGNhbiBwcm9iYWJseSBiZXN0IGJlIGFycmFuZ2Vk
IGJ5IHVzaW5nIHRoZSBpbnRlcm5hbHMgb2YgYW4KPj4gZmNudGwgRl9IVUdFUEFHRSBvbiB0aG9z
ZSBvYmplY3RzIHRoYXQgd291bGQgYmVuZWZpdCBmcm9tIGl0Lgo+Pgo+PiBUaG91Z2ggbXkgaW50
ZW50aW9uIHRoZXJlIHdhcyB0aGF0IHRoZSAiaHVnZT1uZXZlciIgZGVmYXVsdCBvdWdodAo+PiB0
byBjb250aW51ZSB0byByZWZ1c2UgdG8gZ2l2ZSBodWdlIHBhZ2VzLCBldmVuIHdoZW4gYXNrZWQg
YnkgZmNudGwuCj4+IFNvIGEgbGl0dGxlIGhhY2tlcnkgbWF5IHN0aWxsIGJlIHJlcXVpcmVkLCB0
byBhbGxvdyB0aGUgaTkxNV9nZW1mcwo+PiBpbnRlcm5hbCBtb3VudCB0byBnZXQgaHVnZSBwYWdl
cyB3aGVuIGEgdXNlciBtb3VudCB3b3VsZCBub3QuCj4+Cj4+IEFzIHRvIHdoZXRoZXIgc2htZW1f
ZmlsZV9zZXR1cF93aXRoX21udCgpIG5lZWRzIHRvIGxpdmU6IEkndmUgZ2l2ZW4KPj4gdGhhdCBu
byB0aG91Z2h0LCBidXQgYWNjZXB0IHRoYXQgc2htX21udCBpcyBzdWNoIGEgcmFnYmFnIG9mIGRp
ZmZlcmVudAo+PiB1c2FnZXMsIHRoYXQgaTkxNSBpcyByaWdodCB0byBwcmVmZXIgdGhlaXIgb3du
IHNlcGFyYXRlIGdlbWZzIG1vdW50Lgo+Pgo+PiBIdWdoCj4+Cj4+IC0tLSBtbW90bS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jIDIwMTktMDctMjEgMTk6NDA6MTYuNTczNzAz
NzgwIC0wNzAwCj4+ICsrKyBsaW51eC9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1m
cy5jIDIwMTktMDgtMDggMDc6MTk6MjMuOTY3Njg5MDU4IC0wNzAwCj4+IEBAIC0yNCwyOCArMjQs
NiBAQCBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2Cj4+ICAgICAgICAg
IGlmIChJU19FUlIoZ2VtZnMpKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGdl
bWZzKTsKPj4gICAKPj4gLSAgICAgICAvKgo+PiAtICAgICAgICAqIEVuYWJsZSBodWdlLXBhZ2Vz
IGZvciBvYmplY3RzIHRoYXQgYXJlIGF0IGxlYXN0IEhQQUdFX1BNRF9TSVpFLCBtb3N0Cj4+IC0g
ICAgICAgICogbGlrZWx5IDJNLiBOb3RlIHRoYXQgd2l0aGluX3NpemUgbWF5IG92ZXJhbGxvY2F0
ZSBodWdlLXBhZ2VzLCBpZiBzYXkKPj4gLSAgICAgICAgKiB3ZSBhbGxvY2F0ZSBhbiBvYmplY3Qg
b2Ygc2l6ZSAyTSArIDRLLCB3ZSBtYXkgZ2V0IDJNICsgMk0sIGJ1dCB1bmRlcgo+PiAtICAgICAg
ICAqIG1lbW9yeSBwcmVzc3VyZSBzaG1lbSBzaG91bGQgc3BsaXQgYW55IGh1Z2UtcGFnZXMgd2hp
Y2ggY2FuIGJlCj4+IC0gICAgICAgICogc2hydW5rLgo+PiAtICAgICAgICAqLwo+PiAtCj4+IC0g
ICAgICAgaWYgKGhhc190cmFuc3BhcmVudF9odWdlcGFnZSgpKSB7Cj4+IC0gICAgICAgICAgICAg
ICBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiID0gZ2VtZnMtPm1udF9zYjsKPj4gLSAgICAgICAgICAg
ICAgIC8qIEZJWE1FOiBEaXNhYmxlZCB1bnRpbCB3ZSBnZXQgVy9BIGZvciByZWFkIEJXIGlzc3Vl
LiAqLwo+PiAtICAgICAgICAgICAgICAgY2hhciBvcHRpb25zW10gPSAiaHVnZT1uZXZlciI7Cj4+
IC0gICAgICAgICAgICAgICBpbnQgZmxhZ3MgPSAwOwo+PiAtICAgICAgICAgICAgICAgaW50IGVy
cjsKPj4gLQo+PiAtICAgICAgICAgICAgICAgZXJyID0gc2ItPnNfb3AtPnJlbW91bnRfZnMoc2Is
ICZmbGFncywgb3B0aW9ucyk7Cj4+IC0gICAgICAgICAgICAgICBpZiAoZXJyKSB7Cj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGtlcm5fdW5tb3VudChnZW1mcyk7Cj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBlcnI7Cj4+IC0gICAgICAgICAgICAgICB9Cj4+IC0gICAgICAgfQo+
IAo+IFRoYXQncyBwZXJmZWN0bHkgZmluZTsgd2Ugc2hvdWxkIHByb2JhYmx5IGxlYXZlIGEgaGlu
dCBhcyB0byB3aHkgZ2VtZnMKPiBleGlzdHMgYW5kIGluY2x1ZGUgdGhlIHN1Z2dlc3Rpb24gb2Yg
bG9va2luZyBhdCBwZXItZmlsZSBodWdlcGFnZQo+IGNvbnRyb2xzLgo+IAo+IE1hdHRoZXcsIGhv
dyBkb2VzIHRoaXMgYWZmZWN0IHlvdXIgY3VycmVudCBwbGFucz8gSWYgYXQgYWxsPwpGaW5lIHdp
dGggbWUuCgo+IC1DaHJpcwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
