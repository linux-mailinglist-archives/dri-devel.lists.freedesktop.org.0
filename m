Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CBFB921E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 16:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A0B6FD10;
	Fri, 20 Sep 2019 14:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4723E6FD10;
 Fri, 20 Sep 2019 14:29:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 07:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="271559200"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 20 Sep 2019 07:29:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2019 17:29:41 +0300
Date: Fri, 20 Sep 2019 17:29:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915: Document ILK+ pipe csc
 matrix better
Message-ID: <20190920142941.GA1208@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-11-ville.syrjala@linux.intel.com>
 <d9b15be4584ac023148cffd199eda733583218bd.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9b15be4584ac023148cffd199eda733583218bd.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDI6MjQ6MzJQTSArMDAwMCwgTXVuLCBHd2FuLWd5ZW9u
ZyB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDctMTggYXQgMTc6NTAgKzAzMDAsIFZpbGxlIFN5cmph
bGEgd3JvdGU6Cj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+ID4gCj4gPiBBZGQgY29tbWVudHMgdG8gZXhwbGFpbiB0aGUgaWxrIHBpcGUg
Y3NjIG9wZXJhdGlvbiBhIGJpdCBiZXR0ZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgfCAyNiArKysrKysrKysr
KysrKysrKy0tLQo+ID4gLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3IuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yLmMKPiA+IGluZGV4IDIzYTg0ZGQ3OTg5Zi4uNzM2YzQyNzIwZGFmIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMKPiA+IEBA
IC00Miw2ICs0MiwyMSBAQAo+ID4gIAo+ID4gICNkZWZpbmUgTEVHQUNZX0xVVF9MRU5HVEgJCTI1
Ngo+ID4gIAo+ID4gKy8qCj4gPiArICogSUxLKyBjc2MgbWF0cml4Ogo+ID4gKyAqCj4gPiArICog
fFIvQ3J8ICAgfCBjMCBjMSBjMiB8ICAgKCB8Ui9DcnwgICB8cHJlb2ZmMHwgKSAgIHxwb3N0b2Zm
MHwKPiA+ICsgKiB8Ry9ZIHwgPSB8IGMzIGM0IGM1IHwgeCAoIHxHL1kgfCArIHxwcmVvZmYxfCAp
ICsgfHBvc3RvZmYxfAo+ID4gKyAqIHxCL0NifCAgIHwgYzYgYzcgYzggfCAgICggfEIvQ2J8ICAg
fHByZW9mZjJ8ICkgICB8cG9zdG9mZjJ8Cj4gPiArICoKPiA+ICsgKiBJTEsvU05CIGRvbid0IGhh
dmUgZXhwbGljaXQgcG9zdCBvZmZzZXRzLCBhbmQgaW5zdGVhZAo+ID4gKyAqIENTQ19NT0RFX1lV
Vl9UT19SR0IgYW5kIENTQ19CTEFDS19TQ1JFRU5fT0ZGU0VUIGFyZSB1c2VkOgo+ID4gKyAqICBD
U0NfTU9ERV9ZVVZfVE9fUkdCPTAgKyBDU0NfQkxBQ0tfU0NSRUVOX09GRlNFVD0wIC0+IDEvMiwg
MCwgMS8yCj4gPiArICogIENTQ19NT0RFX1lVVl9UT19SR0I9MCArIENTQ19CTEFDS19TQ1JFRU5f
T0ZGU0VUPTEgLT4gMS8yLCAxLzE2LAo+ID4gMS8yCj4gSXQgc2VlbXMgdGhhdCB0aGUgY2FsY3Vs
YXRlZCB2YWx1ZXMgYXJlIGFzc3VtZXMgSVRVLVIgQlQuNzA5IHNwZWMsCj4gaWYgeW91IGRvbid0
IG1pbmQsIGNhbiB3ZSBhZGQgc29tZSBjb21tZW50cyB3aGljaCBpcyBiYXNlZCBvbiBJVFUtUgo+
IEJULjcwOT8KPiA+ICsgKiAgQ1NDX01PREVfWVVWX1RPX1JHQj0xICsgQ1NDX0JMQUNLX1NDUkVF
Tl9PRkZTRVQ9MCAtPiAwLCAwLCAwCj4gPiArICogIENTQ19NT0RFX1lVVl9UT19SR0I9MSArIENT
Q19CTEFDS19TQ1JFRU5fT0ZGU0VUPTEgLT4gMS8xNiwgMS8xNiwKPiA+IDEvMTYKPiA+ICsgKi8K
PiA+ICsKPiA+ICAvKgo+ID4gICAqIEV4dHJhY3QgdGhlIENTQyBjb2VmZmljaWVudCBmcm9tIGEg
Q1RNIGNvZWZmaWNpZW50IChpbiBVMzIuMzIKPiA+IGZpeGVkIHBvaW50Cj4gPiAgICogZm9ybWF0
KS4gVGhpcyBtYWNybyB0YWtlcyB0aGUgY29lZmZpY2llbnQgd2Ugd2FudCB0cmFuc2Zvcm1lZCBh
bmQKPiA+IHRoZQo+ID4gQEAgLTU5LDM3ICs3NCwzOCBAQAo+ID4gIAo+ID4gICNkZWZpbmUgSUxL
X0NTQ19QT1NUT0ZGX0xJTUlURURfUkFOR0UgKDE2ICogKDEgPDwgMTIpIC8gMjU1KQo+ID4gIAo+
ID4gKy8qIE5vcCBwcmUvcG9zdCBvZmZzZXRzICovCj4gPiAgc3RhdGljIGNvbnN0IHUxNiBpbGtf
Y3NjX29mZl96ZXJvWzNdID0ge307Cj4gPiAgCj4gPiArLyogSWRlbnRpdHkgbWF0cml4ICovCj4g
PiAgc3RhdGljIGNvbnN0IHUxNiBpbGtfY3NjX2NvZWZmX2lkZW50aXR5WzldID0gewo+ID4gIAlJ
TEtfQ1NDX0NPRUZGXzFfMCwgMCwgMCwKPiA+ICAJMCwgSUxLX0NTQ19DT0VGRl8xXzAsIDAsCj4g
PiAgCTAsIDAsIElMS19DU0NfQ09FRkZfMV8wLAo+ID4gIH07Cj4gPiAgCj4gPiArLyogTGltaXRl
ZCByYW5nZSBSR0IgcG9zdCBvZmZzZXRzICovCj4gPiAgc3RhdGljIGNvbnN0IHUxNiBpbGtfY3Nj
X3Bvc3RvZmZfbGltaXRlZF9yYW5nZVszXSA9IHsKPiA+ICAJSUxLX0NTQ19QT1NUT0ZGX0xJTUlU
RURfUkFOR0UsCj4gPiAgCUlMS19DU0NfUE9TVE9GRl9MSU1JVEVEX1JBTkdFLAo+ID4gIAlJTEtf
Q1NDX1BPU1RPRkZfTElNSVRFRF9SQU5HRSwKPiA+ICB9Owo+ID4gIAo+ID4gKy8qIEZ1bGwgcmFu
Z2UgUkdCIC0+IGxpbWl0ZWQgcmFuZ2UgUkdCIG1hdHJpeCAqLwo+ID4gIHN0YXRpYyBjb25zdCB1
MTYgaWxrX2NzY19jb2VmZl9saW1pdGVkX3JhbmdlWzldID0gewo+ID4gIAlJTEtfQ1NDX0NPRUZG
X0xJTUlURURfUkFOR0UsIDAsIDAsCj4gPiAgCTAsIElMS19DU0NfQ09FRkZfTElNSVRFRF9SQU5H
RSwgMCwKPiA+ICAJMCwgMCwgSUxLX0NTQ19DT0VGRl9MSU1JVEVEX1JBTkdFLAo+ID4gIH07Cj4g
PiAgCj4gPiAtLyoKPiA+IC0gKiBUaGVzZSB2YWx1ZXMgYXJlIGRpcmVjdCByZWdpc3RlciB2YWx1
ZXMgc3BlY2lmaWVkIGluIHRoZSBCc3BlYywKPiA+IC0gKiBmb3IgUkdCLT5ZVVYgY29udmVyc2lv
biBtYXRyaXggKGNvbG9yc3BhY2UgQlQ3MDkpCj4gPiAtICovCj4gPiArLyogQlQuNzA5IGZ1bGwg
cmFuZ2UgUkdCIC0+IGxpbWl0ZWQgcmFuZ2UgWUNiQ3IgbWF0cml4ICovCgpUaGUgY29tbWVudCBp
cyBoZXJlIF4KCj4gPiAgc3RhdGljIGNvbnN0IHUxNiBpbGtfY3NjX2NvZWZmX3JnYl90b195Y2Jj
cls5XSA9IHsKPiA+ICAJMHgxZTA4LCAweDljYzAsIDB4YjUyOCwKPiA+ICAJMHgyYmE4LCAweDA5
ZDgsIDB4MzdlOCwKPiA+ICAJMHhiY2U4LCAweDlhZDgsIDB4MWUwOCwKPiA+ICB9Owo+ID4gIAo+
ID4gLS8qIFBvc3Qgb2Zmc2V0IHZhbHVlcyBmb3IgUkdCLT5ZQ0JDUiBjb252ZXJzaW9uICovCj4g
PiArLyogTGltaXRlZCByYW5nZSBZQ2JDciBwb3N0IG9mZnNldHMgKi8KPiA+ICBzdGF0aWMgY29u
c3QgdTE2IGlsa19jc2NfcG9zdG9mZl9yZ2JfdG9feWNiY3JbM10gPSB7Cj4gPiAgCTB4MDgwMCwg
MHgwMTAwLCAweDA4MDAsCj4gPiAgfTsKPiBUaGUgY2hhbmdlcyBsb29rIGdvb2QgdG8gbWUuCj4g
UmV2aWV3ZWQtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4K
Ci0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
