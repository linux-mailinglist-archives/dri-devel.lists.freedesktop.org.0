Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342723CB46
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 15:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1016E7D3;
	Wed,  5 Aug 2020 13:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179866E7D3;
 Wed,  5 Aug 2020 13:53:35 +0000 (UTC)
IronPort-SDR: VVgZvnBJ1CvmY+ICuBldSGQLWTLfgZWUvwrol053lMj5ICK/N1pv3kdlhuf27lLmQry9iTaK2g
 v67kFShhhxTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="237395974"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="237395974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:53:34 -0700
IronPort-SDR: /u9WI21hMGKjJqS1Hlrs94KZQqvCNuWy6QcF4xhKV9pZqZrUW47Zfe26okh0eTcuNss6V0adFw
 3f6aXSGim3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="467472304"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.203.73])
 ([10.215.203.73])
 by orsmga005.jf.intel.com with ESMTP; 05 Aug 2020 06:53:29 -0700
Subject: Re: [PATCH v5 1/5] drm/i915: Add enable/disable flip done and flip
 done handler
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <20200720113117.16131-2-karthik.b.s@intel.com>
 <d67715965a3de220137db377953da700944e89e6.camel@intel.com>
 <f00f637e-639e-5d12-83bd-274ad0a23abe@daenzer.net>
 <CAKMK7uFzvuT81J38Y_4NnZx3xQhJ4Ha4dVyDy+pwCRF8gbuRVw@mail.gmail.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <e124de77-bd32-d14d-fdce-51d8fa4cee1a@intel.com>
Date: Wed, 5 Aug 2020 19:23:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFzvuT81J38Y_4NnZx3xQhJ4Ha4dVyDy+pwCRF8gbuRVw@mail.gmail.com>
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA3LzI4LzIwMjAgMzowNCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEp1
bCAyNywgMjAyMCBhdCAyOjI3IFBNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+
IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLTA3LTI1IDE6MjYgYS5tLiwgUGF1bG8gWmFub25pIHdyb3Rl
Ogo+Pj4gRW0gc2VnLCAyMDIwLTA3LTIwIMOgcyAxNzowMSArMDUzMCwgS2FydGhpayBCIFMgZXNj
cmV2ZXU6Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9p
cnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPj4+PiBpbmRleCAxZmE2Nzcw
MGQ4ZjQuLjk1OTUzYjM5Mzk0MSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYwo+
Pj4+IEBAIC02OTcsMTQgKzY5NywyNCBAQCB1MzIgaTkxNV9nZXRfdmJsYW5rX2NvdW50ZXIoc3Ry
dWN0IGRybV9jcnRjICpjcnRjKQo+Pj4+ICAgICAgIHJldHVybiAoKChoaWdoMSA8PCA4KSB8IGxv
dykgKyAocGl4ZWwgPj0gdmJsX3N0YXJ0KSkgJiAweGZmZmZmZjsKPj4+PiAgIH0KPj4+Pgo+Pj4+
ICtzdGF0aWMgdTMyIGc0eF9nZXRfZmxpcF9jb3VudGVyKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykK
Pj4+PiArewo+Pj4+ICsgICAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9f
aTkxNShjcnRjLT5kZXYpOwo+Pj4+ICsgICAgZW51bSBwaXBlIHBpcGUgPSB0b19pbnRlbF9jcnRj
KGNydGMpLT5waXBlOwo+Pj4+ICsKPj4+PiArICAgIHJldHVybiBJOTE1X1JFQUQoUElQRV9GTElQ
Q09VTlRfRzRYKHBpcGUpKTsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgIHUzMiBnNHhfZ2V0X3ZibGFu
a19jb3VudGVyKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPj4+PiAgIHsKPj4+PiAgICAgICBzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNydGMtPmRldik7Cj4+Pj4g
ICAgICAgZW51bSBwaXBlIHBpcGUgPSB0b19pbnRlbF9jcnRjKGNydGMpLT5waXBlOwo+Pj4+Cj4+
Pj4gKyAgICBpZiAoY3J0Yy0+c3RhdGUtPmFzeW5jX2ZsaXApCj4+Pj4gKyAgICAgICAgICAgIHJl
dHVybiBnNHhfZ2V0X2ZsaXBfY291bnRlcihjcnRjKTsKPj4+PiArCj4+Pj4gICAgICAgcmV0dXJu
IEk5MTVfUkVBRChQSVBFX0ZSTUNPVU5UX0c0WChwaXBlKSk7Cj4+Pgo+Pj4gSSBkb24ndCB1bmRl
cnN0YW5kIHRoZSBpbnRlbnRpb24gYmVoaW5kIHRoaXMsIGNhbiB5b3UgcGxlYXNlIGNsYXJpZnk/
Cj4+PiBUaGlzIGdvZXMgYmFjayB0byBteSByZXBseSBvZiB0aGUgY292ZXIgbGV0dGVyLiBJdCBz
ZWVtcyB0aGF0IGhlcmUKPj4+IHdlJ3JlIGdvaW5nIHRvIGFsdGVybmF0ZSBiZXR3ZWVuIHR3byBk
aWZmZXJlbnQgY291bnRlcnMgaW4gb3VyIHZibGFuawo+Pj4gY291bnQuIFNvIGlmIHVzZXIgc3Bh
Y2UgYWx0ZXJuYXRlcyBiZXR3ZWVuIHNvbWV0aW1lcyB1c2luZyBhc3luYyBmbGlwcwo+Pj4gYW5k
IHNvbWV0aW1lcyB1c2luZyBub3JtYWwgZmxpcCBpdCdzIGdvaW5nIHRvIGdldCBzb21lIHZlcnkg
d2VpcmQKPj4+IGRlbHRhcywgaXNuJ3QgaXQ/IEF0IGxlYXN0IHRoaXMgaXMgd2hhdCBJIHJlbWVt
YmVyIGZyb20gd2hlbiBJIHBsYXllZAo+Pj4gd2l0aCB0aGVzZSByZWdpc3RlcnM6IEZMSVBDT1VO
VCBkcmlmdHMgYXdheSBmcm9tIEZSTUNPVU5UIHdoZW4gd2Ugc3RhcnQKPj4+IHVzaW5nIGFzeW5j
IGZsaXBzLgo+Pgo+PiBUaGlzIGRlZmluaXRlbHkgbG9va3Mgd3JvbmcuIFRoZSBjb3VudGVyIHZh
bHVlIHJldHVybmVkIGJ5IHRoZQo+PiBnZXRfdmJsYW5rX2NvdW50ZXIgaG9vayBpcyBzdXBwb3Nl
ZCB0byBpbmNyZW1lbnQgd2hlbiBhIHZlcnRpY2FsIGJsYW5rCj4+IHBlcmlvZCBvY2N1cnM7IHBh
Z2UgZmxpcHMgYXJlIG5vdCBzdXBwb3NlZCB0byBhZmZlY3QgdGhpcyBpbiBhbnkgd2F5Lgo+IAo+
IEFsc28geW91IGp1c3QgZmxhdCBvdXQgY2FuJ3QgYWNjZXNzIGNydGMtPnN0YXRlIGZyb20gaW50
ZXJydXB0Cj4gY29udGV4dC4gQW55dGhpbmcgeW91IG5lZWQgaW4gdGhlcmUgbmVlZHMgdG8gYmUg
cHJvdGVjdGVkIGJ5IHRoZSByaWdodAo+IGlycS10eXBlIHNwaW5fbG9jaywgdXBkYXRlcyBjb3Jy
ZWN0bHkgc3luY2hyb25pemVkIGFnYWluc3QgYm90aCB0aGUKPiBpbnRlcnJ1cHQgaGFuZGxlciBh
bmQgYXRvbWljIHVwZGF0ZXMsIGFuZCBkYXRhIGNvcGllZCBvdmVyLCBub3QKPiBwb2ludGVycy4g
T3RoZXJ3aXNlIGp1c3QgY3Jhc2gmYnVybi4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KSSB3aWxs
IGJlIHJlbW92aW5nIHRoaXMgY2hhbmdlIGluIHRoZSBuZXh0IHJldmlzaW9uIGJhc2VkIG9uIHRo
ZSAKZmVlZGJhY2sgcmVjZWl2ZWQsIGJ1dCBJIHdpbGwga2VlcCB0aGlzIGluIG1pbmQgd2hlbmV2
ZXIgSSdsbCBoYXZlIHRvIAphY2Nlc3Mgc29tZXRoaW5nIGZyb20gdGhlIGludGVycnVwdCBjb250
ZXh0LgoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+IC1EYW5pZWwKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
