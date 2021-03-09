Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AC331DE0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 05:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8471A6E428;
	Tue,  9 Mar 2021 04:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2357B6E428;
 Tue,  9 Mar 2021 04:28:46 +0000 (UTC)
IronPort-SDR: 6mVKxSfYAAunoBKXNS9WL2fGF7U5bZvg9LRGL1FR1hfIGiQhNpa3OpXXJwz4NWEpP4/9UnxtrE
 PmvJEvhIOO8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="168069851"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="168069851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:28:45 -0800
IronPort-SDR: ExVPP9kmYh92w+EmCqg3hJMZdvTMVqdKNKgXfZG5fPG5YM8m2Z9t/sKT/2l7Y3kUTNK5/gbB6l
 gVhShxn1Cq4g==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="409572613"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.132.107])
 ([10.215.132.107])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:28:42 -0800
Subject: Re: [PATCH 1/3] i915/display/intel_dp: Read PCON DSC ENC caps only
 for DPCD rev >= 1.4
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
 <87blcueroq.fsf@intel.com> <82d5cf44-4618-6d1d-2219-a5ac80d00d7a@intel.com>
Message-ID: <035b7941-9e6e-fbd2-8825-11d3d07bb71a@intel.com>
Date: Tue, 9 Mar 2021 09:58:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <82d5cf44-4618-6d1d-2219-a5ac80d00d7a@intel.com>
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgSSByZWFsaXplZCwgdGhpcyBwYXRjaCBpcyBtaXhpbmcgRFBDRCByZXYgYW5kIERQIHZlcnNp
b24sIG5lZWQgYW4gCmFwcHJvcHJpYXRlIGNoZWNrIGluc3RlYWQuCgpBcyBmb3IgdGhlIGdpdGxh
YiBpc3N1ZSAKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vl
cy8yODY4IHRoaXMgc2VlbXMgdG8gYmUgCm5vdCBkdWUgdG8gYSBEUENEIHJlZ2lzdGVyIG5vdCBk
ZWZpbmVkIGZvciBhbiBvbGRlciBzaW5rLgoKVGhlIERQQ0QgcmVhZCBpbiB0aGF0IGNhc2Ugc2hv
dWxkIGhhdmUgYmVlbiAwLCBpbnN0ZWFkIG9mIHRpbWVvdXQuCgpJIHdpbGwgZHJvcCB0aGlzIHBh
dGNoIGZvciBub3csIGZyb20gdGhlIHNlcmllcyBhbmQgcmV2aXNpdCBpdCBsYXRlci4KClRoYW5r
cyAmIFJlZ2FyZHMsCgpBbmtpdAoKT24gMi84LzIwMjEgNToxNCBQTSwgTmF1dGl5YWwsIEFua2l0
IEsgd3JvdGU6Cj4KPiBPbiAyLzgvMjAyMSA0OjQ1IFBNLCBKYW5pIE5pa3VsYSB3cm90ZToKPj4g
T24gVGh1LCAwNCBGZWIgMjAyMSwgQW5raXQgTmF1dGl5YWwgPGFua2l0LmsubmF1dGl5YWxAaW50
ZWwuY29tPiB3cm90ZToKPj4+IERQLUhETUkyLjEgUENPTiBoYXMgRFNDIGVuY29kZXIgY2FwcyBk
ZWZpbmVkIGluIHJlZ2lzdGVycyAweDkyLTB4OUUuCj4+PiBEbyBub3QgcmVhZCB0aGUgcmVnaXN0
ZXJzIGlmIERQQ0QgcmV2IDwgMS40Lgo+Pj4KPj4+IEZpeGVzOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzI4NjgKPj4gUGxlYXNlIHVzZSBGaXhlczog
dG8gcmVmZXJlbmNlIGNvbW1pdHMgdGhhdCB0aGlzIHBhdGNoIGZpeGVzLgo+Pgo+PiBQbGVhc2Ug
dXNlIENsb3NlczogdG8gcmVmZXJlbmNlIGlzc3VlcyB0aGF0IHRoaXMgcGF0Y2ggZml4ZXMuCj4+
Cj4+IE5vIG5lZWQgdG8gcmVzZW5kIGZvciB0aGlzLCBjYW4gYmUgZml4ZWQgd2hpbGUgYXBwbHlp
bmcsIGJ1dCBwbGVhc2UgdGVsbAo+PiBtZSB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUg
cHJvYmxlbS4KPj4KPj4gQlIsCj4+IEphbmkuCj4+Cj4gQWxyaWdodCB3aWxsIHRha2UgY2FyZS4g
UGxlYXNlIGZpbmQgYmVsb3cgdGhlIGNvbW1pdCB0aGF0IGludHJvZHVjZWQgCj4gdGhpczoKPgo+
IGI5ZDk2ZGFjZGMzZDk4M2VhZTIzNGI1MjQwMWVkYjU2ZGJjZWI3NjQKPgo+IFBhdGNoIDogZHJt
L2k5MTU6IFJlYWQgRFNDIGNhcGFiaWxpdGllcyBvZiB0aGUgSERNSTIuMSBQQ09OIGVuY29kZXIg
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQwODc3OS8KPgo+Cj4g
VGhhbmtzICYgUmVnYXJkcywKPgo+IEFua2l0Cj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFua2l0IE5h
dXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgNCArKystCj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAKPj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4+PiBpbmRleCA4YzEyZDUzNzU2MDcu
LjJiODNmMGY0MzNhMiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jCj4+PiBAQCAtMjQ4OSw5ICsyNDg5LDExIEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX2dl
dF9wY29uX2RzY19jYXAoc3RydWN0IAo+Pj4gaW50ZWxfZHAgKmludGVsX2RwKQo+Pj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGRwX3RvX2k5MTUoaW50ZWxfZHAp
Owo+Pj4gwqAgwqDCoMKgwqDCoCAvKiBDbGVhciB0aGUgY2FjaGVkIHJlZ2lzdGVyIHNldCB0byBh
dm9pZCB1c2luZyBzdGFsZSB2YWx1ZXMgKi8KPj4+IC0KPj4+IMKgwqDCoMKgwqAgbWVtc2V0KGlu
dGVsX2RwLT5wY29uX2RzY19kcGNkLCAwLCAKPj4+IHNpemVvZihpbnRlbF9kcC0+cGNvbl9kc2Nf
ZHBjZCkpOwo+Pj4gwqAgK8KgwqDCoCBpZiAoaW50ZWxfZHAtPmRwY2RbRFBfRFBDRF9SRVZdIDwg
MHgxNCkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+PiArCj4+PiDCoMKgwqDCoMKgIGlm
IChkcm1fZHBfZHBjZF9yZWFkKCZpbnRlbF9kcC0+YXV4LCBEUF9QQ09OX0RTQ19FTkNPREVSLAo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVsX2RwLT5wY29uX2Rz
Y19kcGNkLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZihp
bnRlbF9kcC0+cGNvbl9kc2NfZHBjZCkpIDwgMCkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
