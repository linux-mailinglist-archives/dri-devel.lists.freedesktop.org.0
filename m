Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0FBB441
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718D6E8B4;
	Mon, 23 Sep 2019 12:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9206E8B4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:51:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 05:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="189048713"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 23 Sep 2019 05:50:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2019 15:50:59 +0300
Date: Mon, 23 Sep 2019 15:50:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Message-ID: <20190923125059.GI1208@intel.com>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>, nd <nd@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTI6MTY6MTJQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBMb3dyeSwKPiAKPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwOTo0Mzo0N0FN
ICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gRnJvbTog
Ikxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29tPgo+ID4g
Cj4gPiBTZXRzIGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJwYy4KPiA+IEFk
ZHMgYSBuZXcgb3B0aW9uYWwgRFQgYXR0cmlidXRlICJjb2xvci1mb3JtYXQiIHRvIHJlcHJlc2Vu
dCBhCj4gPiBwcmVmZXJyZWQgY29sb3IgZm9ybWF0cyBmb3IgYSBzcGVjaWZpYyBwaXBlbGluZSwg
YW5kIHRoZSBzZWxlY3Qgb3JkZXIKPiA+IGlzOgo+ID4gCVlDUkNCNDIwID4gWUNSQ0I0MjIgPiBZ
Q1JDQjQ0NCA+IFJHQjQ0NAo+ID4gVGhlIGNvbG9yLWZvcm1hdCBjYW4gYmUgYW55b25lIG9mIHRo
ZXNlIDQgZm9ybWF0LCBvbmUgY29sb3ItZm9ybWF0IG5vdAo+ID4gb25seSByZXByZXNlbnQgb25l
IGZvcm1hdCwgYnV0IGFsc28gaW5jbHVkZSB0aGUgbG93ZXIgZm9ybWF0cywgbGlrZQo+ID4gCj4g
PiBjb2xvci1mb3JtYXQgICAgICAgICBwcmVmZXJyZWRfY29sb3JfZm9ybWF0cwo+ID4gWUNSQ0I0
MjAgICAgICAgIFlDUkNCNDIwID4gWUNSQ0I0MjIgPiBZQ1JDQjQ0NCA+IFJHQjQ0NAo+ID4gWUNS
Q0I0MjIgICAgICAgIFlDUkNCNDIyID4gWUNSQ0I0NDQgPiBSR0I0NDQKPiA+IFlDUkNCNDQ0ICAg
ICAgICBZQ1JDQjQ0NCA+IFJHQjQ0NAo+ID4gUkdCNDQ0ICAgICAgICAgIFJHQjQ0NAo+ID4gCj4g
PiBUaGVuIHRoZSBmaW5hbCBjb2xvcl9mb3JtYXQgaXMgY2FsY3VsYXRlZCBieSAzIHN0ZXBzOgo+
ID4gMS4gY2FsY3VsYXRlIEhXIGF2YWlsYWJsZSBmb3JtYXRzLgo+ID4gICBhdmFpbF9mb3JtYXRz
ID0gY29ubmVjdG9yX2NvbG9yX2Zvcm1hdHMgJiBpbXByb2MtPmNvbG9yX2Zvcm1hdHM7Cj4gPiAy
LiBmaWx0ZXIgb3V0IHVuLXByZWZlcnJlZCBmb3JtYXQuCj4gPiAgIGF2YWlsX2Zvcm1hdHMgJj0g
cHJlZmVycmVkX2NvbG9yX2Zvcm1hdHM7Cj4gPiAzLiBzZWxlY3QgdGhlIGZpbmFsIGZvcm1hdCBh
Y2NvcmRpbmcgdG8gdGhlIHByZWZlcnJlZCBvcmRlci4KPiA+ICAgY29sb3JfZm9ybWF0ID0gQklU
KF9fZmxzKGF2YWxfZm9ybWF0cykpOwo+IAo+IElzIHRoZXJlIGEgc3BlY2lmaWMgdXNlLWNhc2Ug
Zm9yIHRoZSBEVCBwcm9wZXJ0eSBmb3Igc2VsZWN0aW5nIGNvbG9yCj4gZm9ybWF0Pwo+IAo+IEkg
dGhpbmsgaW4gZ2VuZXJhbCB0aGUgY29sb3IgZm9ybWF0IHNob3VsZCBiZSBkZXRlcm1pbmVkIGFj
Y29yZGluZyB0bwo+IHRoZSBydWxlcyBpbiB0aGUgQ0VBIHNwZWMuIFRoZXJlJ3MgYWxzbyB0aGUg
ZHJtX21vZGVfaXNfNDIwX29ubHkoKQo+IGhlbHBlciB3ZSBjYW4gdXNlIHRvIGRldGVybWluZSBp
ZiBZQ0JDUjQyMCBtdXN0IGJlIHVzZWQuIEZvciB0aGUgY2FzZXMKPiB3aGVyZSBpdCdzIG9wdGlv
bmFsLCBJIHRoaW5rIHdlIGNhbiBkZWZhdWx0IHRvIFJHQjQ0NC4KClRoYXQgaXMgdGhlIHBvbGlj
eSB3ZSBoYXZlIGluIGk5MTUuIFdlIGhhdmUgYSB2YWd1ZSBwbGFuIHRvIGFkZAphIG5ldyBwcm9w
ZXJ0eSBmb3IgdGhlIHVzZXIgdG8gc2VsZWN0IHRoZSBlbmNvZGluZyBleHBsaWNpdGx5Cih3aGlj
aCB3b3VsZCBhbHNvIGFsbG93IHRoaW5ncyBsaWtlIFlDYkNyIDQ6NDo0KSwgYnV0IElJUkMgbm8K
b25lIGhhcyBhY3R1YWxseSBzZW50IGEgcGF0Y2ggZm9yIHRoYXQuCgpDVEEtODYxIHNvcnQgb2Yg
c2VlbXMgdG8gc2F5IHRoYXQgb25lIHNob3VsZCBmYXZvciBZQ2JDciBvdmVyClJHQiBpZmYgYm90
aCBzaWRlcyBzdXBwb3J0IGl0LCBidXQgSSB0aGluayBSR0IgaXMgcHJvYmFibHkgdGhlCmJldHRl
ciBkZWZhdWx0IGJlY2F1c2UgaXQgbWVhbnMgc3RyYWlnaHQgcGFzc3Rocm91Z2ggKG1pbnVzIHRo
ZQphbm5veWluZyBmdWxsLT5saW1pdCBxdWFudGl6YXRpb24gcmFuZ2UgdHJpY2tlcnkpLgoKLS0g
ClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
