Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559AA1D0AD0
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 10:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3765D6E9AC;
	Wed, 13 May 2020 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E556E9AC;
 Wed, 13 May 2020 08:28:51 +0000 (UTC)
IronPort-SDR: lwKk7Ogiw3kON2oLa3tEQ9a8PsQZHv1TJF/GcYyc5HveBH/nFJBRP3/T8PPd+apl1g1IoFceiE
 sqxtMPPK2oiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 01:28:51 -0700
IronPort-SDR: j1q9eLmd8jt9KHE8CXPinF+8j3AN7mBQfpK+Y90OlCVPpTX39IpTqhzo3TTtHE25C6LmyS5TMX
 ALIfSDalqaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="409609119"
Received: from swatish2-mobl1.gar.corp.intel.com (HELO [10.213.75.17])
 ([10.213.75.17])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 01:28:49 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/display: Set
 TRANS_DDI_MODE_SELECT to default value when disabling TRANS_DDI
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-4-jose.souza@intel.com>
 <20200130172502.GH13686@intel.com>
 <2c578720445cfb0a036502b7dba94f1ebd2e8ca0.camel@intel.com>
 <20200131112054.GK13686@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Organization: Intel
Message-ID: <3efe08f0-4ba7-8702-d28b-827d118a6b34@intel.com>
Date: Wed, 13 May 2020 13:58:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200131112054.GK13686@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAzMS1KYW4tMjAgNDo1MCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFRodSwg
SmFuIDMwLCAyMDIwIGF0IDA4OjA3OjA3UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdyb3RlOgo+PiBP
biBUaHUsIDIwMjAtMDEtMzAgYXQgMTk6MjUgKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToK
Pj4+IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDA1OjU4OjM3UE0gLTA4MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emEKPj4+IHdyb3RlOgo+Pj4+IFRHTCB0aW1lb3V0cyB3aGVuIGRpc2FibGluZyBN
U1QgdHJhbnNjb2RlciBhbmQgZmlmbyB1bmRlcnJ1bnMgb3Zlcgo+Pj4+IE1TVAo+Pj4+IHRyYW5z
Y29kZXJzIGFyZSBmaXhlZCB3aGVuIHNldHRpbmcgVFJBTlNfRERJX01PREVfU0VMRUNUIHRvIDAo
SERNSQo+Pj4+IG1vZGUpIGR1cmluZyB0aGUgZGlzYWJsZSBzZXF1ZW5jZS4KPj4+Pgo+Pj4+IEFs
dGhvdWdoIEJTcGVjIGRpc2FibGUgc2VxdWVuY2UgZG9uJ3QgcmVxdWlyZSB0aGlzIHN0ZXAgaXQg
aXMgYQo+Pj4+IGhhcm1sZXNzIGNoYW5nZSBhbmQgaXQgaXMgYWxzbyBkb25lIGJ5IFdpbmRvd3Mg
ZHJpdmVyLgo+Pj4+IEFueWhvdyBIVyB0ZWFtIHdhcyBub3RpZmllZCBhYm91dCB0aGF0IGJ1dCBp
dCBjYW4gdGFrZSBzb21lIHRpbWUgdG8KPj4+PiBkb2N1bWVudGF0aW9uIHRvIGJlIHVwZGF0ZWQu
Cj4+Pj4KPj4+PiBBIGNhc2UgdGhhdCBhbHdheXMgbGVhZCB0byB0aG9zZSBpc3N1ZXMgaXM6Cj4+
Pj4gLSBkbyBhIG1vZGVzZXQgZW5hYmxpbmcgcGlwZSBBIGFuZCBwaXBlIEIgaW4gdGhlIHNhbWUg
TVNUIHN0cmVhbQo+Pj4+IGxlYXZpbmcgQSBhcyBtYXN0ZXIKPj4+PiAtIGRpc2FibGUgcGlwZSBB
LCBwcm9tb3RlIEIgYXMgbWFzdGVyIGRvaW5nIGEgZnVsbCBtb2Rlc2V0IGluIEEKPj4+PiAtIGVu
YWJsZSBwaXBlIEEsIGNoYW5naW5nIHRoZSBtYXN0ZXIgdHJhbnNjb2RlciBiYWNrIHRvIEEoZG9p
bmcgYQo+Pj4+IGZ1bGwgbW9kZXNldCBpbiBCKQo+Pj4+IC0gUG93OiB1bmRlcnJ1bnMgYW5kIHRp
bWVvdXRzCj4+Pj4KPj4+PiBUaGUgdHJhbnNjb2RlcnMgaW52b2x2ZWQgd2lsbCBvbmx5IHdvcmsg
YWdhaW4gd2hlbiBjb21wbGV0ZQo+Pj4+IGRpc2FibGVkCj4+Pj4gYW5kIHRoZWlyIHBvd2VyIHdl
bGxzIHR1cm5lZCBvZmYgY2F1c2luZyBhIHJlc2V0IGluIHRoZWlyCj4+Pj4gcmVnaXN0ZXJzLgo+
Pj4+Cj4+Pj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Cj4+Pj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+Cj4+Pj4gLS0tCj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rk
aS5jIHwgMSArCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCj4+Pj4gaW5kZXgg
MzJlYTNjN2U4YjYyLi44MmU5MGYyNzE5NzQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPj4+PiBAQCAtMTk5Nyw2ICsxOTk3LDcgQEAgdm9pZCBp
bnRlbF9kZGlfZGlzYWJsZV90cmFuc2NvZGVyX2Z1bmMoY29uc3QKPj4+PiBzdHJ1Y3QgaW50ZWxf
Y3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZQo+Pj4+ICAgCj4+Pj4gICAJdmFsID0gSTkxNV9SRUFEKFRS
QU5TX0RESV9GVU5DX0NUTChjcHVfdHJhbnNjb2RlcikpOwo+Pj4+ICAgCXZhbCAmPSB+VFJBTlNf
RERJX0ZVTkNfRU5BQkxFOwo+Pj4+ICsJdmFsICY9IH5UUkFOU19ERElfTU9ERV9TRUxFQ1RfTUFT
SzsKPj4+Cj4+PiBGZWVscyBhIGJpdCBlYXJseSBzaW5jZSBJSVJDIHdlIHN0aWxsIGxlYXZlIGEg
YnVuY2ggb2Ygb3RoZXIgc3R1ZmYKPj4+IGVuYWJsZWQvc2VsZWN0ZWQgaGVyZS4gSW4gZmFjdCB3
ZSBkb24ndCBzZWVtIHRvIGJlIGNsZWFyaW5nIHRoZSBEREkKPj4+IHNlbGVjdAo+Pj4gYW55d2hl
cmUgYXQgYWxsPyBUaGF0IG9uZSBJIHdvdWxkIGJlIG1vcmUgc3VzcGljaW91cyBvZiB0aGFuIHRo
ZQo+Pj4gbW9kZS4KPj4+IEJ1dCBtYXliZSB3ZSBzaG91bGQganVzdCBjbGVhciBib3RoIHNvbWV3
aGVyZT8gSSB3b3VsZCBzdWdnZXN0IGl0Cj4+PiBzaG91bGQKPj4+IGJlIHdoZW4gd2UgY2xlYXIg
dGhlIHBvcnQgc2VsZWN0IGZpbmFsbHkuCj4+Cj4+IFdlIGFyZSBjbGVhcmluZyBEREkgc2VsZWN0
LCBpbiBvdXIgY29kZSBpdCBpcyBuYW1lZCBhcwo+PiBUR0xfVFJBTlNfRERJX1BPUlRfTUFTSy9U
UkFOU19ERElfUE9SVF9NQVNLLgo+Pgo+PiBGb3IgVEdMIGluIE1TVCBtb2RlIHdlIGNsZWFyIERE
SSBzZWxlY3QgaW4gdGhlIGJsb2NrIGJlbG93IGZvciBNU1QKPj4gc2xhdmVzIGFuZCB0aGVuIGlu
IGludGVsX2RkaV9wb3N0X2Rpc2FibGVfZHAoKSBmb3IgTVNUIG1hc3RlciBhcwo+PiBpbnN0cnVj
dGVkIGJ5IERpc3BsYXkgcG9ydCBzZXF1ZW5jZXMuCj4gCj4gQWguIEhtbSwgc28gdGhhdCBjYW4n
dCBiZSBpdCB0aGVuLiBCdW1tZXIuIEkgZ3Vlc3MgSSB3b3VsZCBzdGlsbCBmZWVsCj4gYSBiaXQg
c2FmZXIgaWYgd2UgY2xlYXIgdGhlIG1vZGUgc2VsZWN0IGFsb25nc2lkZSB0aGUgdGhlIERESSBz
ZWxlY3QKPiBmb3IgdGhlIG1hc3Rlci4gU2luY2UgdGhlIHNwZWMgc2F5cyB0aGUgRERJIHNlbGVj
dCBtdXN0IHJlbWFpbiBzZXQgZm9yCj4gdGhlIG1hc3RlciB0aGVyZSBtdXN0IGJlIHNvbWV0aGlu
ZyBzdGlsbCBnb2luZyBvbiwgYW5kIHNvIEkgd29ycnkgdGhhdAo+IHNvbWV0aGluZyBtaWdodCBu
b3Qgd29yayBxdWl0ZSByaWdodCBpZiB3ZSBjaGFuZ2UgdGhlIG1vZGUKPiBwcmVtYXR1cmVseS4K
CkhpIFZpbGxlL0pvc2UsCgpXZSBhcmUgc3RpbGwgb2JzZXJ2aW5nCj0+KkVSUk9SKiBUaW1lZCBv
dXQgd2FpdGluZyBmb3IgQUNUIHNlbnQgd2hlbiBkaXNhYmxpbmcKPT5GSUZPIHVuZGVycnVucwpE
byB3ZSBuZWVkIGEgY2hhbmdlIGRpc2FibGUgc2VxdWVuY2U/Cgo+IAo+Pgo+Pj4KPj4+PiAgIAo+
Pj4+ICAgCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEyKSB7Cj4+Pj4gICAJCWlmICghaW50
ZWxfZHBfbXN0X2lzX21hc3Rlcl90cmFucyhjcnRjX3N0YXRlKSkKPj4+PiAtLSAKPj4+PiAyLjI1
LjAKPiAKCi0tIAp+U3dhdGkgU2hhcm1hCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
