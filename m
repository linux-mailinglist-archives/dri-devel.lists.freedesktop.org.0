Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E736B5E8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 17:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CAD89D66;
	Mon, 26 Apr 2021 15:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBA889D66;
 Mon, 26 Apr 2021 15:37:34 +0000 (UTC)
IronPort-SDR: tgRvpPZLU9f72P+MbwCXGFdl/mKt8dPVe/RtLAC8UI0eafJ+Fel5e/G0ZisT0kMHMl85R9mJPV
 8CeAqYRZrLDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="176470731"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="176470731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 08:37:32 -0700
IronPort-SDR: xbpSw5gqLmsvik3kUAvICs6QTJ8iOjAx+3jhnjyKWKR1Zq0EvL4hrJJfNsMCyiavtIARNI+cLT
 b/GHLOZwtzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422699105"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 26 Apr 2021 08:37:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Apr 2021 18:37:25 +0300
Date: Mon, 26 Apr 2021 18:37:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] drm/i915: Invoke BXT _DSM to enable MUX on HP
 Workstation laptops
Message-ID: <YIbeNYRbNsVcmyZi@intel.com>
References: <20210423044700.247359-1-kai.heng.feng@canonical.com>
 <YILAc6EhoWWhENq8@intel.com>
 <CAAd53p72Y8Rda0Hk3WReLKPGJe8rwc5X-Pi5cyCpRPAm8sVEzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAd53p72Y8Rda0Hk3WReLKPGJe8rwc5X-Pi5cyCpRPAm8sVEzg@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgMDc6MTA6MDZQTSArMDgwMCwgS2FpLUhlbmcgRmVuZyB3
cm90ZToKPiBPbiBGcmksIEFwciAyMywgMjAyMSBhdCA4OjQxIFBNIFZpbGxlIFN5cmrDpGzDpAo+
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBB
cHIgMjMsIDIwMjEgYXQgMTI6NDY6NTRQTSArMDgwMCwgS2FpLUhlbmcgRmVuZyB3cm90ZToKPiA+
ID4gT24gSFAgRnVyeSBHNyBXb3Jrc3RhdGlvbnMsIGdyYXBoaWNzIG91dHB1dCBpcyByZS1yb3V0
ZWQgZnJvbSBJbnRlbCBHRlgKPiA+ID4gdG8gZGlzY3JldGUgR0ZYIGFmdGVyIFMzLiBUaGlzIGlz
IG5vdCBkZXNpcmFibGUsIGJlY2F1c2UgdXNlcnNwYWNlIHdpbGwKPiA+ID4gdHJlYXQgY29ubmVj
dGVkIGRpc3BsYXkgYXMgYSBuZXcgb25lLCBsb3NpbmcgZGlzcGxheSBzZXR0aW5ncy4KPiA+ID4K
PiA+ID4gVGhlIGV4cGVjdGVkIGJlaGF2aW9yIGlzIHRvIGxldCBkaXNjcmV0ZSBHRlggZHJpdmVz
IGFsbCBleHRlcm5hbAo+ID4gPiBkaXNwbGF5cy4KPiA+ID4KPiA+ID4gVGhlIHBsYXRmb3JtIGlu
IHF1ZXN0aW9uIHVzZXMgQUNQSSBtZXRob2QgXF9TQi5QQ0kwLkhHTUUgdG8gZW5hYmxlIE1VWC4K
PiA+ID4gVGhlIG1ldGhvZCBpcyBpbnNpZGUgdGhlIEJYVCBfRFNNLCBzbyBhZGQgdGhlIF9EU00g
YW5kIGNhbGwgaXQKPiA+ID4gYWNjb3JkaW5nbHkuCj4gPiA+Cj4gPiA+IEkgYWxzbyB0ZXN0ZWQg
c29tZSBNVVgtbGVzcyBhbmQgaUdQVSBvbmx5IGxhcHRvcHMgd2l0aCB0aGUgQlhUIF9EU00sIG5v
Cj4gPiA+IHJlZ3Jlc3Npb24gd2FzIGZvdW5kLgo+ID4gPgo+ID4gPiB2MjoKPiA+ID4gIC0gRm9y
d2FyZCBkZWNsYXJlIHN0cnVjdCBwY2lfZGV2Lgo+ID4gPgo+ID4gPiBDbG9zZXM6IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50ZWwvLS9pc3N1ZXMvMzExMwo+ID4gPiBSZWZl
cmVuY2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9pbnRlbC1nZngvMTQ2MDA0MDczMi0zMTQx
Ny00LWdpdC1zZW5kLWVtYWlsLWFuaW1lc2gubWFubmFAaW50ZWwuY29tLwo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMgfCAx
NyArKysrKysrKysrKysrKysrKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hY3BpLmggfCAgMyArKysKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2
LmMgICAgICAgICAgIHwgIDUgKysrKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hY3BpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Fj
cGkuYwo+ID4gPiBpbmRleCA4MzNkMGMxYmU0ZjEuLmM3YjU3YzIyZGNlMyAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMKPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMKPiA+ID4gQEAgLTE0
LDExICsxNCwxNiBAQAo+ID4gPgo+ID4gPiAgI2RlZmluZSBJTlRFTF9EU01fUkVWSVNJT05fSUQg
MSAvKiBGb3IgQ2FscGVsbGEgYW55d2F5Li4uICovCj4gPiA+ICAjZGVmaW5lIElOVEVMX0RTTV9G
Tl9QTEFURk9STV9NVVhfSU5GTyAxIC8qIE5vIGFyZ3MgKi8KPiA+ID4gKyNkZWZpbmUgSU5URUxf
RFNNX0ZOX1BMQVRGT1JNX0JYVF9NVVhfSU5GTyAwIC8qIE5vIGFyZ3MgKi8KPiA+ID4KPiA+ID4g
IHN0YXRpYyBjb25zdCBndWlkX3QgaW50ZWxfZHNtX2d1aWQgPQo+ID4gPiAgICAgICBHVUlEX0lO
SVQoMHg3ZWQ4NzNkMywgMHhjMmQwLCAweDRlNGYsCj4gPiA+ICAgICAgICAgICAgICAgICAweGE4
LCAweDU0LCAweDBmLCAweDEzLCAweDE3LCAweGIwLCAweDFjLCAweDJjKTsKPiA+ID4KPiA+ID4g
K3N0YXRpYyBjb25zdCBndWlkX3QgaW50ZWxfYnh0X2RzbV9ndWlkID0KPiA+ID4gKyAgICAgR1VJ
RF9JTklUKDB4M2U1YjQxYzYsIDB4ZWIxZCwgMHg0MjYwLAo+ID4gPiArICAgICAgICAgICAgICAg
MHg5ZCwgMHgxNSwgMHhjNywgMHgxZiwgMHhiYSwgMHhkYSwgMHhlNCwgMHgxNCk7Cj4gPiA+ICsK
PiA+Cj4gPiBJIHRoaW5rIHRoaXMgZHNtIGlzIGp1c3Qgc3VwcG9zZWQgdG8gYmUgbW9yZSBvciBs
ZXNzIGFuCj4gPiBhbHRlcm5hdGl2ZSB0byB0aGUgb3ByZWdpb24gU0NJIHN0dWZmLiBXaHkgdGhl
cmUgYXJlIHR3bwo+ID4gd2F5cyB0byBkbyB0aGUgc2FtZSB0aGluZ3MgSSBoYXZlIG5vIGlkZWEu
IFRoZSBvcHJlZ2lvbgo+ID4gc3BlYyBkb2VzIG5vdCB0ZWxsIHVzIHN1Y2ggbXVuZGFuZSBkZXRh
aWxzLgo+IAo+IFJpZ2h0IG5vdyBJIHRoaW5rIGl0J3MgSFAgc3BlY2lmaWMgYW5kIGZyb20gd2hh
dCBJIGNhbiBzZWUgaXQgZG9lc24ndAo+IHRvdWNoIG9wcmVnaW9uLgoKSXQncyBwYXJ0IG9mIHRo
ZSBvcHJlZ2lvbiBzcGVjLgoKPiAKPiA+Cj4gPiBJdCdzIGFsc28gbm90IGRvY3VtZW50ZWQgdG8g
ZG8gYW55dGhpbmcgZXhjZXB0IGxpc3QgdGhlCj4gPiBzdXBwb3J0ZWQgZnVuY3Rpb25zOgo+ID4g
IkdldCBCSU9TIERhdGEgRnVuY3Rpb25zIFN1cHBvcnRlZCDigJxGdW5jdGlvbiAjMCIKPiA+ICBU
aGlzIGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgdG8gZGlzY292ZXIgd2hpY2gg4oCcX0RTTeKAnSBG
dW5jdGlvbnMgYXJlCj4gPiAgc3VwcG9ydGVkLiBJdCBtYXkgb25seSByZXR1cm4gc3VjY2VzcyBp
ZiB0aGUgcmV0dXJuIHZhbHVlIGFjY3VyYXRlbHkKPiA+ICBsaXN0cyBzdXBwb3J0ZWQgRnVuY3Rp
b25zLiIKPiA+Cj4gPiBCdXQgd2hhdCB5b3UncmUgYXBwYXJlbnRseSBzYXlpbmcgaXMgdGhhdCBj
YWxsaW5nIHRoaXMgY2hhbmdlcwo+ID4gdGhlIGJlaGF2aW91ciBvZiB0aGUgc3lzdGVtIHNvbWVo
b3c/IFRoYXQgaXMgdHJvdWJsaW5nLgo+IAo+IEl0IGZsaXBzIGEgYml0IGluIEJJT1MtcmVzZXJ2
ZWQgSW50ZWwgR1BJTywgYW5kIEVDL2hhcmR3YXJlIHdpbGwKPiBjaGFuZ2UgdGhlIE1VWCBiYXNl
ZCBvbiB0aGUgR1BJTyBiaXQuCj4gCj4gV2UgY2FuIGFkZCBhIERNSSBjaGVjayB0byBtYXRjaCAi
SFAiIHRvIG1pbmltaXplIHRoZSBwb3RlbnRpYWwKPiByZWdyZXNzaW9uIGZhY3Rvci4KCkknbSBy
YXRoZXIgdGhpbmtpbmcgdGhhdCBjYWxsaW5nIGl0IGFsd2F5cyBtYXkgYmUgdGhlIHJpZ2h0IHRo
aW5nIHRvIGRvLAphc3N1bWluZyBXaW5kb3dzIGRvZXMgaXQgYXMgd2VsbC4gTWF5YmUgbW9yZSB2
ZW5kb3JzIHVzZSBpdCB0byBiYWNrZG9vciBpbgpyYW5kb20ganVuayBsaWtlIHRoaXMgOigKCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
