Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836EEFF6A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 15:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B716EA8D;
	Tue,  5 Nov 2019 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658A46EA8D;
 Tue,  5 Nov 2019 14:06:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 06:06:45 -0800
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="195829104"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 06:06:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/5] drm/dsi: add missing DSI DCS commands
In-Reply-To: <20191105091801.GA1607358@ulmo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-3-jani.nikula@intel.com>
 <20191105091801.GA1607358@ulmo>
Date: Tue, 05 Nov 2019 16:06:40 +0200
Message-ID: <878sou76z3.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNSBOb3YgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDU6MDA6NDVQTSArMDIwMCwg
SmFuaSBOaWt1bGEgd3JvdGU6Cj4+IFVwZGF0ZSBmcm9tIHRoZSBEQ1Mgc3BlY2lmaWNhdGlvbi4K
Pj4gCj4+IENjOiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPj4g
LS0tCj4+ICBpbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oIHwgMTAgKysrKysrKysrKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oIGIvaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaAo+
PiBpbmRleCA2YjYzOTBkZmEyMDMuLjkyOGY4YzRiNjY1OCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS92aWRlby9taXBpX2Rpc3BsYXkuaAo+PiArKysgYi9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxh
eS5oCj4+IEBAIC03OSw3ICs3OSw5IEBAIGVudW0gewo+PiAgZW51bSB7Cj4+ICAJTUlQSV9EQ1Nf
Tk9QCQkJPSAweDAwLAo+PiAgCU1JUElfRENTX1NPRlRfUkVTRVQJCT0gMHgwMSwKPj4gKwlNSVBJ
X0RDU19HRVRfQ09NUFJFU1NJT05fTU9ERQk9IDB4MDMsCj4+ICAJTUlQSV9EQ1NfR0VUX0RJU1BM
QVlfSUQJCT0gMHgwNCwKPj4gKwlNSVBJX0RDU19HRVRfRVJST1JfQ09VTlRfT05fRFNJCT0gMHgw
NSwKPj4gIAlNSVBJX0RDU19HRVRfUkVEX0NIQU5ORUwJPSAweDA2LAo+PiAgCU1JUElfRENTX0dF
VF9HUkVFTl9DSEFOTkVMCT0gMHgwNywKPj4gIAlNSVBJX0RDU19HRVRfQkxVRV9DSEFOTkVMCT0g
MHgwOCwKPj4gQEAgLTk0LDYgKzk2LDggQEAgZW51bSB7Cj4+ICAJTUlQSV9EQ1NfRVhJVF9TTEVF
UF9NT0RFCT0gMHgxMSwKPj4gIAlNSVBJX0RDU19FTlRFUl9QQVJUSUFMX01PREUJPSAweDEyLAo+
PiAgCU1JUElfRENTX0VOVEVSX05PUk1BTF9NT0RFCT0gMHgxMywKPj4gKwlNSVBJX0RDU19HRVRf
SU1BR0VfQ0hFQ0tTVU1fUkdCCT0gMHgxNCwKPj4gKwlNSVBJX0RDU19HRVRfSU1BR0VfQ0hFQ0tT
VU1fQ1QJPSAweDE1LAo+PiAgCU1JUElfRENTX0VYSVRfSU5WRVJUX01PREUJPSAweDIwLAo+PiAg
CU1JUElfRENTX0VOVEVSX0lOVkVSVF9NT0RFCT0gMHgyMSwKPj4gIAlNSVBJX0RDU19TRVRfR0FN
TUFfQ1VSVkUJPSAweDI2LAo+PiBAQCAtMTA1LDYgKzEwOSw3IEBAIGVudW0gewo+PiAgCU1JUElf
RENTX1dSSVRFX0xVVAkJPSAweDJELAo+PiAgCU1JUElfRENTX1JFQURfTUVNT1JZX1NUQVJUCT0g
MHgyRSwKPj4gIAlNSVBJX0RDU19TRVRfUEFSVElBTF9BUkVBCT0gMHgzMCwKPj4gKwlNSVBJX0RD
U19TRVRfUEFSVElBTF9DT0xVTU5TCT0gMHgzMSwKPj4gIAlNSVBJX0RDU19TRVRfU0NST0xMX0FS
RUEJPSAweDMzLAo+PiAgCU1JUElfRENTX1NFVF9URUFSX09GRgkJPSAweDM0LAo+PiAgCU1JUElf
RENTX1NFVF9URUFSX09OCQk9IDB4MzUsCj4+IEBAIC0xMTQsNyArMTE5LDEwIEBAIGVudW0gewo+
PiAgCU1JUElfRENTX0VOVEVSX0lETEVfTU9ERQk9IDB4MzksCj4+ICAJTUlQSV9EQ1NfU0VUX1BJ
WEVMX0ZPUk1BVAk9IDB4M0EsCj4+ICAJTUlQSV9EQ1NfV1JJVEVfTUVNT1JZX0NPTlRJTlVFCT0g
MHgzQywKPj4gKwlNSVBJX0RDU19TRVRfM0RfQ09OVFJPTAkJPSAweDNELAo+PiAgCU1JUElfRENT
X1JFQURfTUVNT1JZX0NPTlRJTlVFCT0gMHgzRSwKPj4gKwlNSVBJX0RDU19HRVRfM0RfQ09OVFJP
TAkJPSAweDNGLAo+PiArCU1JUElfRENTX1NFVF9WU1lOQ19USU1JTkcJPSAweDQwLAo+PiAgCU1J
UElfRENTX1NFVF9URUFSX1NDQU5MSU5FCT0gMHg0NCwKPj4gIAlNSVBJX0RDU19HRVRfU0NBTkxJ
TkUJCT0gMHg0NSwKPj4gIAlNSVBJX0RDU19TRVRfRElTUExBWV9CUklHSFRORVNTID0gMHg1MSwJ
CS8qIE1JUEkgRENTIDEuMyAqLwo+PiBAQCAtMTI2LDcgKzEzNCw5IEBAIGVudW0gewo+PiAgCU1J
UElfRENTX1NFVF9DQUJDX01JTl9CUklHSFRORVNTID0gMHg1RSwJLyogTUlQSSBEQ1MgMS4zICov
Cj4+ICAJTUlQSV9EQ1NfR0VUX0NBQkNfTUlOX0JSSUdIVE5FU1MgPSAweDVGLAkvKiBNSVBJIERD
UyAxLjMgKi8KPj4gIAlNSVBJX0RDU19SRUFEX0REQl9TVEFSVAkJPSAweEExLAo+PiArCU1JUElf
RENTX1JFQURfUFBTX1NUQVJUCQk9IDB4QTIsCj4+ICAJTUlQSV9EQ1NfUkVBRF9EREJfQ09OVElO
VUUJPSAweEE4LAo+PiArCU1JUElfRENTX1JFQURfUFBTX0NPTlRJTlVFCT0gMHhBOSwKPj4gIH07
Cj4+ICAKPj4gIC8qIE1JUEkgRENTIHBpeGVsIGZvcm1hdHMgKi8KPgo+IE9rYXksIGZvdW5kIGEg
Y29weSBvZiBEQ1MgdjEuNCBhbmQgdGhlIGFib3ZlIG1hdGNoZXMgdGhlIHNwZWNpZmljYXRpb24s
Cj4gc286Cj4KPiBSZXZpZXdlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KPgo+IERvZXMgaXQgcGVyaGFwcyBtYWtlIHNlbnNlIHRvIGFkZCBjb21tZW50cyBhYm91dCB0
aGUgdmVyc2lvbiBudW1iZXIgdGhhdAo+IHRoZXNlIHdlcmUgaW50cm9kdWNlZCB3aXRoPwoKVGhl
IHRyb3VibGUgaXMsIEkgZG9uJ3QgaGF2ZSB0aGUgY29tcGxldGUgY2hyb25vbG9neSBvZiB0aGUK
c3BlY2lmaWNhdGlvbnMsIHNvIEkgY2FuJ3QgYmUgc3VyZSBhdCB3aGljaCBwb2ludCBlYWNoIG9u
ZSB3YXMgYWRkZWQuCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291
cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
