Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C2179F73
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 05:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DCA6E2F2;
	Tue, 30 Jul 2019 03:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1116E2EE;
 Tue, 30 Jul 2019 03:08:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 20:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,325,1559545200"; d="scan'208";a="346861983"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga005.jf.intel.com with ESMTP; 29 Jul 2019 20:08:52 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jul 2019 20:08:52 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jul 2019 20:08:51 -0700
Received: from shsmsx105.ccr.corp.intel.com ([169.254.11.15]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.19]) with mapi id 14.03.0439.000;
 Tue, 30 Jul 2019 11:08:49 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Hariprasad Kelam
 <hariprasad.kelam@gmail.com>
Subject: RE: [PATCH] drm/i915/gvt: remove duplicate entry of trace
Thread-Topic: [PATCH] drm/i915/gvt: remove duplicate entry of trace
Thread-Index: AQHVIM5kvexPfpkDmUCNSg2o5koBYqbixmwQ
Date: Tue, 30 Jul 2019 03:08:49 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4B8CB34E@SHSMSX105.ccr.corp.intel.com>
References: <20190526075633.GA9245@hari-Inspiron-1545>
 <20190612032236.GH9684@zhen-hp.sh.intel.com>
In-Reply-To: <20190612032236.GH9684@zhen-hp.sh.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2Q5NmYwODMtYmQ2NS00NDVjLWJkNGQtNGRjYzFlMWY4ZjZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVVFxRnF6Tjd0TkFUXC9PRk0wMUlRVHkxc0VSUEIyTUxEZzVFMk9OM09QUjlzMDloZERFQmJLak9RREROQmhydVcifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IFttYWlsdG86aW50ZWwtZ3Z0
LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24KPiBCZWhhbGYgT2YgWmhlbnl1
IFdhbmcKPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTIsIDIwMTkgMTE6MjMgQU0KPiBUbzogSGFy
aXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Cj4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IEpvb25hcwo+IExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgSmFuaQo+IE5pa3VsYSA8amFuaS5uaWt1bGFAbGlu
dXguaW50ZWwuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGFuaWVsCj4g
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgaW50ZWwtZ3Z0LQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsIFpo
aSBBIDx6aGkuYS53YW5nQGludGVsLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkx
NS9ndnQ6IHJlbW92ZSBkdXBsaWNhdGUgZW50cnkgb2YgdHJhY2UKPiAKPiBPbiAyMDE5LjA1LjI2
IDEzOjI2OjMzICswNTMwLCBIYXJpcHJhc2FkIEtlbGFtIHdyb3RlOgo+ID4gUmVtb3ZlIGR1cGxp
Y2F0ZSBpbmNsdWRlIG9mIHRyYWNlLmgKPiA+Cj4gPiBJc3N1ZSBpZGVudGlmaWVkIGJ5IGluY2x1
ZGVjaGVjawo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFz
YWQua2VsYW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3RyYWNlX3BvaW50cy5jIHwgMSAtCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50
cy5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZV9wb2ludHMuYwo+ID4gaW5k
ZXggYTNkZWVkNjkuLjU2OWY1ZTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvdHJhY2VfcG9pbnRzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90
cmFjZV9wb2ludHMuYwo+ID4gQEAgLTMyLDUgKzMyLDQgQEAKPiA+Cj4gPiAgI2lmbmRlZiBfX0NI
RUNLRVJfXwo+ID4gICNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUwo+ID4gLSNpbmNsdWRlICJ0
cmFjZS5oIgo+ID4gICNlbmRpZgo+ID4gLS0KPiAKPiBUaGlzIGFjdHVhbGx5IGNhdXNlZCBidWls
ZCBpc3N1ZSBsaWtlCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfZ21hX2luZGV4IiBbZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiAiX190cmFjZXBvaW50X3Jl
bmRlcl9tbWlvIiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IEVS
Uk9SOiAiX190cmFjZXBvaW50X2d2dF9jb21tYW5kIiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NS5rb10KPiB1bmRlZmluZWQhCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRfc3B0X2d1ZXN0X2NoYW5n
ZSIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dCj4gdW5kZWZpbmVkIQo+IEVSUk9SOiAi
X190cmFjZXBvaW50X2dtYV90cmFuc2xhdGUiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1Lmtv
XQo+IHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9zcHRfYWxsb2MiIFtkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1LmtvXSB1bmRlZmluZWQhCj4gRVJST1I6ICJfX3RyYWNlcG9pbnRf
c3B0X2NoYW5nZSIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBF
UlJPUjogIl9fdHJhY2Vwb2ludF9vb3Nfc3luYyIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUu
a29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF93cml0ZV9pciIgW2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9w
cm9wYWdhdGVfZXZlbnQiIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1LmtvXQo+IHVuZGVmaW5l
ZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9pbmplY3RfbXNpIiBbZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiAiX190cmFjZXBvaW50X3NwdF9yZWZjb3Vu
dCIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVmaW5lZCEKPiBFUlJPUjogIl9f
dHJhY2Vwb2ludF9zcHRfZnJlZSIgW2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTUua29dIHVuZGVm
aW5lZCEKPiBFUlJPUjogIl9fdHJhY2Vwb2ludF9vb3NfY2hhbmdlIiBbZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNS5rb10gdW5kZWZpbmVkIQo+IHNjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDo5MTog
cmVjaXBlIGZvciB0YXJnZXQgJ19fbW9kcG9zdCcgZmFpbGVkCj4gCj4gTG9va3Mgd2UgbmVlZCBm
aXggbGlrZSBiZWxvdy4KPiAKPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1L2d2dDogcmVtb3Zl
IGR1cGxpY2F0ZSBpbmNsdWRlIG9mIHRyYWNlLmgKPiAKPiBUaGlzIHJlbW92ZXMgZHVwbGljYXRl
IGluY2x1ZGUgb2YgdHJhY2UuaC4gRm91bmQgYnkgSGFyaXByYXNhZCBLZWxhbSB3aXRoCj4gaW5j
bHVkZWNoZWNrLgo+IAo+IFJlcG9ydGVkLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJhc2Fk
LmtlbGFtQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZV9w
b2ludHMuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZV9wb2ludHMuYwo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50cy5jCj4gaW5kZXggYTNkZWVkNjkyYjlj
Li5mZTU1MmU4NzdlMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Ry
YWNlX3BvaW50cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50
cy5jCj4gQEAgLTI4LDggKzI4LDYgQEAKPiAgICoKPiAgICovCj4gCj4gLSNpbmNsdWRlICJ0cmFj
ZS5oIgo+IC0KPiAgI2lmbmRlZiBfX0NIRUNLRVJfXwo+ICAjZGVmaW5lIENSRUFURV9UUkFDRV9Q
T0lOVFMKPiAgI2luY2x1ZGUgInRyYWNlLmgiCj4gLS0KPiAyLjIwLjEKPiAKPiAtLQo+IE9wZW4g
U291cmNlIFRlY2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZl
ciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
