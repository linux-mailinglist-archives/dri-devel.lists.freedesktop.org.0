Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19E1B985A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2626E0B6;
	Mon, 27 Apr 2020 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4F89CF4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 19:35:51 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id nv1so12303287ejb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XKUp+bq/JAe3B4g+hlFVUB2/lkhfPKuQectYgSlJ7c8=;
 b=tFFiSVExgNHfvVdrFHB8obda5SnGF/Qev5okgPo7D8W0aRgdwcMxXTFyE4vJM71SdT
 CBw/4I9cj3cDHne5z7QO6zyUtSs8RIRpaocG7udQsua8+wxwjqUX7YFYOkmbl0pyWoYV
 LrJGGQI+4mmih+1kb+AbH3+Y0DgPPx/tuGcOcy8JJTmEcbTQpvsPjTDGjw0ot/vV5SE3
 AKnuKBfOXaVcmQ8VnCJPdPIsqbYmi9tNVXQzi/nOy/bQguMp+msc400xbpkEhFxdBo5q
 Ah28o6F76mdl5NTwwJig1vwgTa8tQGi9WLsjUaBlQjcIDL7mVMUj2wIGzkdk6qULUmpI
 +adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XKUp+bq/JAe3B4g+hlFVUB2/lkhfPKuQectYgSlJ7c8=;
 b=EH9GWbkGH2fRkk6dbaJvo3w8cIk4bKJ+3qglLN4AmicxTsdXy5dbwW3RDx4r2xDUcG
 6uQKMRtwtp6ruDC0YBVxVZtFqlAhBskXEDTXZX0UIx3O4LpVG6k6ticDVD5G1WaRqvlS
 a5iKxInDU4AeKnJG8qxpAI9nYy47xvwDlFKf11jDFb7RhHbqG2Ehm96QVt6dxCFezEjE
 ARrDL0if0LzaeXxD2g7u/Mvc/RpakkrxlQ+FaqyVlz7ZiwWdONB6MgUuiY3MPgPP9/w6
 MhWy5WlRlteTT/c0qQyeE1WkHMjSaKPteEXjX49fCtlt02SqiFQiI2VnSY5YO3vuRszi
 JduQ==
X-Gm-Message-State: AGi0PuZ+Jt8ci8AkH24WeoYbQqZG0sFd7Mwh4dsMCuCBNFgzf1NMfFJO
 6FLIelAo0Pp9gCmTcofrtXDDloulhrWIfzlR8ls=
X-Google-Smtp-Source: APiQypJhFShIpZLgcOdxbEP82BOrcqWO/ow7/acI1hDExhTsTPr2d/bfmhXl4/YsPQjb3Ma7OQEPeVPlh17ftRTB/bE=
X-Received: by 2002:a17:906:c82b:: with SMTP id
 dd11mr15845166ejb.216.1587929750047; 
 Sun, 26 Apr 2020 12:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190730194911.28453-1-howl.nsp@gmail.com>
 <CAD4j4=AdUtyoiwenzT5moAdHcR_maM91kJfDQM0AuT2bnM=D9Q@mail.gmail.com>
 <87lfngfp8q.fsf@intel.com> <6df6072e-d0dd-c5f3-57b0-1992bba78541@redhat.com>
In-Reply-To: <6df6072e-d0dd-c5f3-57b0-1992bba78541@redhat.com>
From: =?UTF-8?Q?David_Santamar=C3=ADa_Rogado?= <howl.nsp@gmail.com>
Date: Sun, 26 Apr 2020 21:35:38 +0200
Message-ID: <CAD4j4=DOQV3fYxo=jwXtENONy4dPoqr+8N54JqZfQmmbkJw09A@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEphbmkgZG9uJ3QgZm9yZ2V0IGFib3V0IG1lLCBJIGhhdmUgaW4gbWluZCB0byBhZmZvcmQg
dGhlIDggR0IgUkFNCnZlcnNpb24gYW5kIHdpbGwgbmVlZCBtb3JlIG9yaWVudGF0aW9uIGluY2x1
c2lvbnMgOikKCkkgaGF2ZSBldmVuIGxvb2tpbmcgYXQgdGhpcyBpc3N1ZSB3aXRoIFVFRkkgU2hl
bGwsIGNvdWxkIGJlIHBvc3NpYmxlCnRoYXQgdGhlIEludGVsIHZpZGVvIGRyaXZlciBjYW4gZ2V0
IHRoZSBjb3JyZWN0IHBhbmVsIGxvY2F0aW9uIGJhc2VkCmluIGFub3RoZXIgdGhpbmc/IFRoZSBV
RUZJIFNoZWxsIGNhbiBnZXQgYm90aCBvcmllbnRhdGlvbnMgYnkganVzdApjaGFuZ2luZyB0aGUg
bW9kZSwgdGhlcmUgYXJlIG1vZGVzIGZvciBwb3J0cmFpdCBhbmQgbGFuZHNjYXBlLCBidXQgaWYK
dGhlcmUgaXMgbm8gb3RoZXIgd2F5IHRoZXNlIHF1aXJrcyBhcmUgdGhlIG9ubHkgd2F5IHRvIGdl
dCB0aGVzZQptYWNoaW5lIHByb3Blcmx5IGZvciBub3cuCgpFbCBtYXIuLCAzMSBtYXIuIDIwMjAg
YSBsYXMgMTk6MDcsIEhhbnMgZGUgR29lZGUKKDxoZGVnb2VkZUByZWRoYXQuY29tPikgZXNjcmli
acOzOgo+Cj4gSGksCj4KPiBPbiAzLzMxLzIwIDY6NDQgUE0sIEphbmkgTmlrdWxhIHdyb3RlOgo+
ID4gT24gRnJpLCAyNyBNYXIgMjAyMCwgRGF2aWQgU2FudGFtYXLDrWEgUm9nYWRvIDxob3dsLm5z
cEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IFRoaXMgcGF0Y2ggaXMgc3RpbGwgdmFsaWQgYXMgbm8g
Y2hhbmdlcyB0byBwYW5lbCBvcmllbnRhdGlvbiBxdWlya3MKPiA+PiBoYXZlIGJlZW4gZG9uZS4g
U29tZW9uZSBjYW4gcmV2aWV3IHRoaXMgdG8gbWVyZ2U/Cj4gPgo+ID4gQ2M6IEhhbnMuCj4KPiBM
b29rcyBnb29kIHRvIG1lOgo+Cj4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Cj4KPiBSZWdhcmRzLAo+Cj4gSGFucwo+Cj4KPgo+Cj4gPj4gRWwgbWFyLiwg
MzAganVsLiAyMDE5IGEgbGFzIDIxOjQ5LCBEYXZpZCBTYW50YW1hcsOtYSBSb2dhZG8KPiA+PiAo
PGhvd2wubnNwQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPiA+Pj4KPiA+Pj4gVGhpcyBhZGRzIHRo
ZSBIRCB2ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIEQzMzAKPiA+Pj4gYW5kIEZIRCB2ZXJzaW9u
IG9mIExlbm92byBJZGVhcGFkIE1paXggMzIwLgo+ID4+Pgo+ID4+PiBUaGlzIHNob3VsZCB3b3Jr
IGRlc3BpdGUgdGhlIGRtaSBkYXRhIGlzIHRoZSBzYW1lIGJlY2F1c2UKPiA+Pj4gdGhlIHJlc29s
dXRpb24gY2hlY2tzLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBTYW50YW1hcsOt
YSBSb2dhZG8gPGhvd2wubnNwQGdtYWlsLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyB8IDE4ICsrKysrKysrKysrKysr
KystLQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9v
cmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRp
b25fcXVpcmtzLmMKPiA+Pj4gaW5kZXggZmZkOTViZmVhYTk0Li44OTZjNzgzY2UxMzUgMTAwNjQ0
Cj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtz
LmMKPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWly
a3MuYwo+ID4+PiBAQCAtMTkxLDE0ICsxOTEsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlf
c3lzdGVtX2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHsKPiA+Pj4gICAgICAgICAgICAgICAgICAg
IERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTUlJWCAzMTAtMTBJQ1IiKSwK
PiA+Pj4gICAgICAgICAgICAgICAgICB9LAo+ID4+PiAgICAgICAgICAgICAgICAgIC5kcml2ZXJf
ZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKPiA+Pj4gLSAgICAgICB9
LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIE1paXggMzIwICovCj4gPj4+ICsgICAgICAgfSwgeyAg
ICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAoSEQpICovCj4gPj4+ICAgICAgICAgICAgICAg
ICAgLm1hdGNoZXMgPSB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0go
RE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgIERNSV9F
WEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODBYRiIpLAo+ID4+PiAgICAgICAgICAgICAg
ICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sICJMZW5vdm8gTUlJWCAz
MjAtMTBJQ1IiKSwKPiA+Pj4gICAgICAgICAgICAgICAgICB9LAo+ID4+PiAgICAgICAgICAgICAg
ICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKPiA+
Pj4gLSAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAgKi8KPiA+Pj4gKyAgICAg
ICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIE1paXggMzIwIChGSEQpICovCj4gPj4+ICsgICAg
ICAgICAgICAgICAubWF0Y2hlcyA9IHsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNU
X01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4gPj4+ICsgICAgICAgICAgICAgICAg
IERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODBYRiIpLAo+ID4+PiArICAgICAg
ICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBN
SUlYIDMyMC0xMElDUiIpLAo+ID4+PiArICAgICAgICAgICAgICAgfSwKPiA+Pj4gKyAgICAgICAg
ICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDEyMDB4MTkyMF9yaWdodHNpZGVfdXAs
Cj4gPj4+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBEMzMwIChIRCkgKi8KPiA+
Pj4gKyAgICAgICAgICAgICAgIC5tYXRjaGVzID0gewo+ID4+PiArICAgICAgICAgICAgICAgICBE
TUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUsICI4MUgzIiksCj4gPj4+
ICsgICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAi
TGVub3ZvIGlkZWFwYWQgRDMzMC0xMElHTSIpLAo+ID4+PiArICAgICAgICAgICAgICAgfSwKPiA+
Pj4gKyAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3Jp
Z2h0c2lkZV91cCwKPiA+Pj4gKyAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAg
KEZIRCkgKi8KPiA+Pj4gICAgICAgICAgICAgICAgICAubWF0Y2hlcyA9IHsKPiA+Pj4gICAgICAg
ICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIpLAo+
ID4+PiAgICAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX05BTUUs
ICI4MUgzIiksCj4gPj4+IC0tCj4gPj4+IDIuMjEuMAo+ID4+Pgo+ID4KPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
