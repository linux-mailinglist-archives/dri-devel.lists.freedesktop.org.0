Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488944BA5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1639898EE;
	Thu, 13 Jun 2019 19:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CF2898EE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:06:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j19so23833037qtr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+ZsPXDH4cK2O3RcTv7nzaCBUIbQhZQqQ2NCqyKLccnQ=;
 b=jIJzIArGaBll4TzbUvWL6X2CGPKlEtmEb5OfZ1NfryttBlqDurIaahEmy4LAONbzJH
 +qzRKkjPqeDqIoJ6WTmNZMl5aJ5/eBMedIbS7B7FGN4tz3BYInpivEy01UbrywXMCtNu
 F9aISUow9Wx9YdmVsfe3ErNm/cXOMwlqfld7zu5eAZ5tIsSg5CsxlhYy90EK372q4/N/
 6ymhQa5gt94vl+iQQl4MR3A5l+DCh6ZoYDBwplpxaXOD38SHw4JT4Utx9eEsIDZA3s7q
 BBPFJjPP4lJC73qB9hUtbwJ1ek39SmXR1zSqB5J1H4Dj3CdV3r2YXIcGNTN2zYtZazQ0
 jeXQ==
X-Gm-Message-State: APjAAAULnFAiQGyPX4616ztJ+BXtQA4pJQPeScqH15zct0OE7NU59lGC
 GylJq/kgPO0JDZ02qEh6kWC8ed7+UyE=
X-Google-Smtp-Source: APXvYqxPsfYj/CwzF8FsAWAdw8k2oh43WKHpyaGmTVkUBny+3ySY9UWLZDN07dSx2euFudU4/JU1pw==
X-Received: by 2002:ac8:29b2:: with SMTP id 47mr52331507qts.313.1560452791916; 
 Thu, 13 Jun 2019 12:06:31 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p40sm252903qte.93.2019.06.13.12.06.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 12:06:31 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:06:31 -0400
From: Sean Paul <sean@poorly.run>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/connector: Fix kerneldoc warning in
 HDR_OUTPUT_METADATA description
Message-ID: <20190613190631.GH179831@art_vandelay>
References: <20190613151727.133696-1-sean@poorly.run>
 <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=+ZsPXDH4cK2O3RcTv7nzaCBUIbQhZQqQ2NCqyKLccnQ=;
 b=WBQgEkYDkQLDDrLdi72I5/aHstJq0wvErREgXQvF9W7+lis14tsbPZm6Jq9ppFlpfH
 bUcNzL0H7Pa4MQRudni4CYhuugsuslpEnyIBfFrLryo/iZkU/kIfjvlOyGBbVZ53ro/6
 k2B9m1jKD+8DrGo9NilmRXB79HWkApxSaynI+6HkVtPPj57oadjjOvAwFonYUwKRpygE
 X7KHa+af1iYGRWV9h5eBULajX4wzPrbLFFiUudFDgAFNgYMmuyJvZxlFtKAlsRMqu+UT
 HKXjLY2HISNj5GICLxWunry08yOjoaTGdqDdA63HKDko0TSn287x12gXmQ7Ve5x2FrsN
 lO2w==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hansverk@cisco.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6NTc6MjlQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjE3IEFNIFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KPiA+Cj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gPiAuLi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jOjk4MTogV0FSTklORzogRGVmaW5pdGlvbiBsaXN0
IGVuZHMgd2l0aG91dCBhIGJsYW5rIGxpbmU7IHVuZXhwZWN0ZWQgdW5pbmRlbnQuCj4gPgo+ID4g
Rml4ZXM6IGEwOWRiODgzZTVkOSAoImRybTogRml4IGRvY2Jvb2sgd2FybmluZ3MgaW4gaGRyIG1l
dGFkYXRhIGhlbHBlciBzdHJ1Y3R1cmVzIikKPiA+IENjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNo
YW5rLnNoYXJtYUBpbnRlbC5jb20+Cj4gPiBDYzogVmlsbGUgU3lyasOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpv
bG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiBDYzogIlZpbGxlIFN5cmrDpCIgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28u
Y29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51
eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gKHYxKQo+ID4gQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Cj4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiAiVmlsbGUg
U3lyasOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBSZXZpZXdlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKVGhhbmtzIEFsZXgsIEkn
dmUgYXBwbGllZCB0aGlzIHRvIC1taXNjLW5leHQKCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9y
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gPiBpbmRleCBhNTk4YTVlYjQ4
ZDIxLi4zY2NkY2YzZGZjZGUyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ID4g
QEAgLTk3OCw2ICs5NzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlz
dCBoZG1pX2NvbG9yc3BhY2VzW10gPSB7Cj4gPiAgICogICAgIFVzZXJzcGFjZSB3aWxsIGJlIHJl
c3BvbnNpYmxlIHRvIGRvIFRvbmUgbWFwcGluZyBvcGVyYXRpb24gaW4gY2FzZToKPiA+ICAgKiAg
ICAgICAgICAgICAtIFNvbWUgbGF5ZXJzIGFyZSBIRFIgYW5kIG90aGVycyBhcmUgU0RSCj4gPiAg
ICogICAgICAgICAgICAgLSBIRFIgbGF5ZXJzIGx1bWluYW5jZSBpcyBub3Qgc2FtZSBhcyBzaW5r
Cj4gPiArICoKPiA+ICAgKiAgICAgSXQgd2lsbCBldmVuIG5lZWQgdG8gZG8gY29sb3JzcGFjZSBj
b252ZXJzaW9uIGFuZCBnZXQgYWxsIGxheWVycwo+ID4gICAqICAgICB0byBvbmUgY29tbW9uIGNv
bG9yc3BhY2UgZm9yIGJsZW5kaW5nLiBJdCBjYW4gdXNlIGVpdGhlciBHTCwgTWVkaWEKPiA+ICAg
KiAgICAgb3IgZGlzcGxheSBlbmdpbmUgdG8gZ2V0IHRoaXMgZG9uZSBiYXNlZCBvbiB0aGUgY2Fw
YWJpbHRpZXMgb2YgdGhlCj4gPiAtLQo+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVu
Z2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
