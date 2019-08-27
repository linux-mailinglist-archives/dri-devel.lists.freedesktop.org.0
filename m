Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F19EACB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0689BFE;
	Tue, 27 Aug 2019 14:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750FE89BFE;
 Tue, 27 Aug 2019 14:20:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="185303573"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga006.jf.intel.com with ESMTP; 27 Aug 2019 07:20:41 -0700
Date: Tue, 27 Aug 2019 19:50:07 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v10 3/6] drm: Extend I915 mei interface for transcoder info
Message-ID: <20190827142007.GB5040@intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
 <20190827105014.14181-4-ramalingam.c@intel.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9DCA4F64@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9DCA4F64@hasmsx108.ger.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNyBhdCAxOTozMDoyMyArMDUzMCwgV2lua2xlciwgVG9tYXMgd3JvdGU6Cj4g
PiAKPiA+IEk5MTUgbmVlZHMgdG8gc2VuZCB0aGUgaW5kZXggb2YgdGhlIHRyYW5zY29kZXIgYXMg
cGVyIE1FIEZXLgo+ID4gCj4gPiBUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190
YyBhbmQgYWRkIGFzIGEgbWVtYmVyIGludG8gdGhlIHN0cnVjdAo+ID4gaGRjcF9wb3J0X2RhdGEu
Cj4gPiAKPiA+IHYyOgo+ID4gICBUeXBvIGluIGNvbW1pdCBtc2cgaXMgZml4ZWQgW1NoYXNoYW5r
XQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRl
bC5jb20+Cj4gPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
PiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggfCAxMyAr
KysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiA+
IGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+ID4gaW5kZXggYTk3YWNm
MWM5NzEwLi4wZGU2MjliZjJmNjIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9pOTE1X21l
aV9oZGNwX2ludGVyZmFjZS5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2lu
dGVyZmFjZS5oCj4gPiBAQCAtNTQsOSArNTQsMjEgQEAgZW51bSBtZWlfZndfZGRpIHsKPiA+ICAJ
TUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0EsCj4gPiAgfTsKPiA+IAo+ID4gK2VudW0gbWVp
X2Z3X3RjIHsKPiA+ICsJTUVJX0lOVkFMSURfVFJBTlNDT0RFUiA9IDB4MDAsCS8qIEludmFsaWQg
dHJhbnNjb2RlciB0eXBlICovCj4gPiArCU1FSV9UQ19FRFAsCQkJLyogVHJhbnNjb2RlciBmb3Ig
ZURQICovCj4gPiArCU1FSV9UQ19EU0kwLAkJCS8qIFRyYW5zY29kZXIgZm9yIERTSTAgKi8KPiA+
ICsJTUVJX1RDX0RTSTEsCQkJLyogVHJhbnNjb2RlciBmb3IgRFNJMSAqLwo+ID4gKwlNRUlfVENf
QSA9IDB4MTAsCQkvKiBUcmFuc2NvZGVyIFRDQSAqLwo+ID4gKwlNRUlfVENfQiwJCQkvKiBUcmFu
c2NvZGVyIFRDQiAqLwo+ID4gKwlNRUlfVENfQywJCQkvKiBUcmFuc2NvZGVyIFRDQyAqLwo+ID4g
KwlNRUlfVENfRAkJCS8qIFRyYW5zY29kZXIgVENEICovCj4gPiArfTsKPiAKPiBZb3Ugc2hvdWxk
IHVzZSBrZG9jIGZvcm1hdCBoZXJlLCBwbGVhc2UuIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvdjUuMi9kb2MtZ3VpZGUva2VybmVsLWRvYy5odG1sIAo+IEFsc28gVENBIGp1c3QgbWVh
bnMgVHJhbnNjb2RlciBBICBvciBUQyBoYXMgb3RoZXIgbWVhbmluZz8gClRDQSBzdGFuZHMgZm9y
IFRSQU5TQ09ERVIgQSBvbmx5LiBTdXJlIEkgd2lsbCB1c2Uga2RvYyBmb3JtYXQuCgotUmFtCj4g
Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogc3RydWN0IGhkY3BfcG9ydF9kYXRhIC0gaW50ZWwgc3Bl
Y2lmaWMgSERDUCBwb3J0IGRhdGEKPiA+ICAgKiBAZndfZGRpOiBkZGkgaW5kZXggYXMgcGVyIE1F
IEZXCj4gPiArICogQGZ3X3RjOiB0cmFuc2NvZGVyIGluZGV4IGFzIHBlciBNRSBGVwo+ID4gICAq
IEBwb3J0X3R5cGU6IEhEQ1AgcG9ydCB0eXBlIGFzIHBlciBNRSBGVyBjbGFzc2lmaWNhdGlvbgo+
ID4gICAqIEBwcm90b2NvbDogSERDUCBhZGFwdGF0aW9uIGFzIHBlciBNRSBGVwo+ID4gICAqIEBr
OiBObyBvZiBzdHJlYW1zIHRyYW5zbWl0dGVkIG9uIGEgcG9ydC4gT25seSBvbiBEUCBNU1QgdGhp
cyBpcyAhPSAxIEBAIC0KPiA+IDY5LDYgKzgxLDcgQEAgZW51bSBtZWlfZndfZGRpIHsKPiA+ICAg
Ki8KPiA+ICBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEgewo+ID4gIAllbnVtIG1laV9md19kZGkgZndf
ZGRpOwo+ID4gKwllbnVtIG1laV9md190YyBmd190YzsKPiA+ICAJdTggcG9ydF90eXBlOwo+ID4g
IAl1OCBwcm90b2NvbDsKPiA+ICAJdTE2IGs7Cj4gPiAtLQo+ID4gMi4yMC4xCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
