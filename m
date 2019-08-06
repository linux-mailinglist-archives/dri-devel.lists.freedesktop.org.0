Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9E839F6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 22:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B736E544;
	Tue,  6 Aug 2019 20:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9436E544
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:01:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEF912070C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:01:39 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id k10so16750191qtq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 13:01:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXSHKu5ZUoqRM6ePnT4RYcbIvGMttGu1FR8p6RDLyfAKhHswefI
 Y1g9O35FUYvtBc7wYpDcpxPW24FARwJOITqejg==
X-Google-Smtp-Source: APXvYqzaQXhSIx3esKzrlWKB2KQofhpuMoIkjvMYb1FZq7lp5QnVM4TdoCMYG+JyMbA8bhDqJ0ZBxdexnUenLfRhLNQ=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr4829867qtf.110.1565121699106; 
 Tue, 06 Aug 2019 13:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 Aug 2019 14:01:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
Message-ID: <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add "compute shader only" hint
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565121700;
 bh=xgZAseWPum2HkjhzvPGVhOQlpna9gnsL/0m6SEu81pY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tpAnreXunSGcdKowVExYLMnlN21tgNlHI2IH9iVWf5jTSmUG9n+ypSyZbCoKpPgqW
 QUihRkSncN+qfR+zfOPh2NO8dMCAZFHWJ4f7w18ISPtTDDp8OJk291e+7UzuUk+UGr
 p5ppxXb26JSzzrufLfB+chbpYmuEtOEWfvPCPkZk=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjUzIFBNIEFseXNzYSBSb3Nlbnp3ZWlnCjxhbHlzc2Eu
cm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE1pZGdhcmQgY29udGFpbnMgdHdv
IGpvYiBzbG90cyBjYXBhYmxlIG9mIGNvbXB1dGUgam9icywgSlMxIGFuZCBKUzIuIEFzCj4gYW4g
b3B0aW1pemF0aW9uLCBpdCBpcyBwcmVmZXJhYmxlIHRvIHNjaGVkdWxlIGNvbXB1dGUtb25seSB3
b3JrbG9hZHMgdG8KPiBKUzIsIGFsdGhvdWdoIGNvbXB1dGUgam9icyBhcmUgZnVuY3Rpb25hbGx5
IGFibGUgdG8gYmUgc2NoZWR1bGVkIHRvIEpTMQo+IChiYXJyaW5nIGFuIG9ic2N1cmUgZXJyYXRh
KS4KPgo+IEFjY29yZGluZ2x5LCB3ZSByZXNlcnZlIGEgY29tcHV0ZS1vbmx5IGhpbnQgaW4gdGhl
IFVBQkkgdG8gYWxsb3cgZnV0dXJlCj4gY29tcHV0ZS1lcXVpcHBlZCB1c2Vyc3BhY2UgYW5kIGZ1
dHVyZSBjb21wdXRlLW9wdGltaXplZCBrZXJuZWxzcGFjZSB0bwo+IGhpbnQgdG93YXJkcyBKUzIu
IEF0IHRoZSBtb21lbnQsIHRoZSBoaW50IGlzIGlnbm9yZWQsIGJ1dCB0aGlzIGlzCj4gaGFybWxl
c3MuCgpXaHkgZG9uJ3Qgd2UganVzdCBnbyBhaGVhZCBhbmQgZW5hYmxlIEpTMj8KCj4gSSBoYXZl
IHZlcmlmaWVkIGNvbXB1dGUgam9icyBjYW4gYmUgc3VjY2Vzc2Z1bGx5IHN1Ym1pdHRlZCBhbmQg
ZXhlY3V0ZWQKPiB3aXRoIGFuIGFwcHJvcHJpYXRlIHVzZXJzcGFjZSBhZ2FpbnN0IGEgNS4xIGtl
cm5lbCB3aXRob3V0IHRoaXMgaGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFseXNzYSBSb3Nlbnp3
ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvVE9ETyAgICAgICAgICAgfCAzIC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCA0ICsrKy0KPiAgaW5jbHVkZS91YXBpL2RybS9wYW5m
cm9zdF9kcm0uaCAgICAgICAgIHwgOCArKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L1RPRE8gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETwo+IGluZGV4
IGMyZTQ0YWRkMy4uOGMzNjdhNWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9UT0RPCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiBAQCAtMjAs
OCArMjAsNSBAQAo+Cj4gIC0gU3VwcG9ydCBmb3IgbWFkdmlzZSBhbmQgYSBzaHJpbmtlci4KPgo+
IC0tIENvbXB1dGUgam9iIHN1cHBvcnQuIFNvIGNhbGxlZCAnY29tcHV0ZSBvbmx5JyBqb2JzIG5l
ZWQgdG8gYmUgcGx1bWJlZCB1cCB0bwo+IC0gIHVzZXJzcGFjZS4KPiAtCj4gIC0gUGVyZm9ybWFu
Y2UgY291bnRlciBzdXBwb3J0LiAoQm9yaXMpCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2pvYi5jCj4gaW5kZXggOWJiOTI2MGQ5Li4zZTEzODVhM2IgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4gQEAgLTEwOCw3ICsxMDgsOSBAQCBzdGF0
aWMgaW50IHBhbmZyb3N0X2pvYl9nZXRfc2xvdChzdHJ1Y3QgcGFuZnJvc3Rfam9iICpqb2IpCj4g
ICAgICAgICBpZiAoam9iLT5yZXF1aXJlbWVudHMgJiBQQU5GUk9TVF9KRF9SRVFfRlMpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gLS8qIE5vdCBleHBvc2VkIHRvIHVzZXJzcGFjZSB5
ZXQgKi8KPiArICAgICAgICAvKiBDb21wdXRlIGpvYnMgY2FuIHJ1biBvbiBKUzEsIHNvIGNvbXB1
dGUtb25seSBqb2JzIGNhbiBydW4gd2l0aCB0aGlzCj4gKyAgICAgICAgICogc2ltcGxlIGltcGxl
bWVudGF0aW9ucyAodXNlZnVsIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSkuIEFzIGFuCj4g
KyAgICAgICAgICogb3B0aW1pemF0aW9uLCB3ZSB3aWxsIGV2ZW50dWFsbHkgd2FudCB0byBzY2hl
ZHVsZSB0byBKUzIuICovCj4gICNpZiAwCj4gICAgICAgICBpZiAoam9iLT5yZXF1aXJlbWVudHMg
JiBQQU5GUk9TVF9KRF9SRVFfT05MWV9DT01QVVRFKSB7Cj4gICAgICAgICAgICAgICAgIGlmICgo
am9iLT5yZXF1aXJlbWVudHMgJiBQQU5GUk9TVF9KRF9SRVFfQ09SRV9HUlBfTUFTSykgJiYKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9wYW5mcm9zdF9kcm0uaCBiL2luY2x1ZGUvdWFw
aS9kcm0vcGFuZnJvc3RfZHJtLmgKPiBpbmRleCBiNWQzNzA2MzguLjI1YWNkZTM0YiAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oCj4gKysrIGIvaW5jbHVkZS91
YXBpL2RybS9wYW5mcm9zdF9kcm0uaAo+IEBAIC0zOCw2ICszOCwxNCBAQCBleHRlcm4gIkMiIHsK
PiAgI2RlZmluZSBEUk1fSU9DVExfUEFORlJPU1RfUEVSRkNOVF9EVU1QICAgICAgICAgICAgICAg
IERSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9QQU5GUk9TVF9QRVJGQ05UX0RVTVAsIHN0
cnVjdCBkcm1fcGFuZnJvc3RfcGVyZmNudF9kdW1wKQo+Cj4gICNkZWZpbmUgUEFORlJPU1RfSkRf
UkVRX0ZTICgxIDw8IDApCj4gKwo+ICsvKiBPcHRpb25hbCAobWFuZGF0b3J5IGZvciBUNjAwIHIw
cDAgMTVkZXYwIGR1ZSB0byBlcnJhdGEgIzg5ODcpIGhpbnQgdG8gdGhlCj4gKyAqIGtlcm5lbCB0
aGF0IHRoZSBjb21tYW5kcyBvbmx5IGNvbnRhaW4gSk9CX1RZUEVfQ09NUFVURSBqb2JzLCB3aXRo
b3V0Cj4gKyAqIHZlcnRleC90aWxlci9mcmFnbWVudCBqb2JzLiBJZiBwcmVzZW50LCB0aGUga2Vy
bmVsIG1heSB1c2UgdGhpcyBhcyBhbgo+ICsgKiBvcHRpbWl6YXRpb24sIGJ1dCBpdCBpcyBub3Qg
c3RyaWN0bHkgbmVjZXNzYXJ5LiAqLwo+ICsKPiArI2RlZmluZSBQQU5GUk9TVF9KRF9SRVFfT05M
WV9DT01QVVRFICgxIDw8IDEpCj4gKwo+ICAvKioKPiAgICogc3RydWN0IGRybV9wYW5mcm9zdF9z
dWJtaXQgLSBpb2N0bCBhcmd1bWVudCBmb3Igc3VibWl0dGluZyBjb21tYW5kcyB0byB0aGUgM0QK
PiAgICogZW5naW5lLgo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
