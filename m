Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED78E68B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAFC6E8E1;
	Thu, 15 Aug 2019 08:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C034F6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:34:06 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531]
 ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
 by smtp-cloud9.xs4all.net with ESMTPA
 id xTBphemD6AffAxTBshTAnJ; Tue, 13 Aug 2019 11:34:05 +0200
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Message-ID: <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
Date: Tue, 13 Aug 2019 11:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP9UUBEpNndwbGqoOzm7xPgHX1ay5qujSVAa6hJxC9j1a+kInaD52ub25WTlWnSW8L56oTREZezHowjHPtGNgthjQvsCzq9v6ZMxg+rnSf3rRrGlGHwW
 tKtr7RMItAJ2VnA5IqC8+OQwAD5OuI5F6Ne0q4VoxW9dpXipzSZ1o1dcLJ4QX4x5RJsXm0V/Fdfhj1Yap8OKkRN8FPVJW92mWweELwtguZICdweZ5cUEhAWd
 Ll2MwtZgDj5Duy6ktmvhLU2YrWX7GM/Nu3SkGVJCNAeqaqJA1pJky2FEwEdu7VIpQFXwM9goY6aFdclFnG7L8PCt3CCJYZZQ+Bq8DV7/ypQqohXoRT+8u9M8
 WtOi7AkLeagmTfIih6lDoY3OyX7yOz0dqSrnvXHooaQEOPkKfG9dP6bCKfRIiUX4iEOdUxkz351B3CrGLdJVeHNuKl2zYtvXT0fOH2mCkQxFC6O3FnnQZB5y
 ESFceP8mGd6h81r8fplzBw6MpezcMPRpKgSQE5drkZryYsyFccn+OWQpwZA=
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q0MgRGFyaXVzeiBhcyB3ZWxsLCBzaW5jZSB0aGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIHdoZW4g
dGVzdGluZyBoaXMKQ0VDIHBhdGNoZXMuCgpSZWdhcmRzLAoKCUhhbnMKCk9uIDgvMTMvMTkgMTE6
MzIgQU0sIEhhbnMgVmVya3VpbCB3cm90ZToKPiBXaGVuIHRlc3RpbmcgQ0VDIG9uIHRoZSBBTUwt
UzkwNVgtQ0MgYm9hcmQgSSBub3RpY2VkIHRoYXQgdGhlIENFQyBwaHlzaWNhbAo+IGFkZHJlc3Mg
d2FzIG5vdCBpbnZhbGlkYXRlZCB3aGVuIHRoZSBIRE1JIGNhYmxlIHdhcyB1bnBsdWdnZWQuIFNv
bWUgbW9yZQo+IGRpZ2dpbmcgc2hvd2VkIHRoYXQgbWVzb24gdXNlcyBtZXNvbl9kd19oZG1pLmMg
dG8gaGFuZGxlIHRoZSBIUEQuCj4gCj4gQm90aCBkd19oZG1pX2lycSgpIGFuZCBkd19oZG1pX3Rv
cF90aHJlYWRfaXJxKCkgKGluIG1lc29uX2R3X2hkbWkuYykgY2FsbAo+IHRoZSBkd19oZG1pX3Nl
dHVwX3J4X3NlbnNlKCkgZnVuY3Rpb24uIFNvIG1vdmUgdGhlIGNvZGUgdG8gaW52YWxpZGF0ZSB0
aGUKPiBDRUMgcGh5c2ljYWwgYWRkcmVzcyB0byB0aGF0IGZ1bmN0aW9uLCBzbyB0aGF0IGl0IGlz
IGluZGVwZW5kZW50IG9mIHdoZXJlCj4gdGhlIEhQRCBpbnRlcnJ1cHQgaGFwcGVucy4KPiAKPiBU
ZXN0ZWQgd2l0aCBib3RoIGEgQU1MLVM5MDVYLUNDIGFuZCBhIEtoYWRhcyBWSU0yIGJvYXJkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5s
Pgo+IC0tLQo+IE5vdGU6IGFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIG1ha2UgYSBuZXcgZHct
aGRtaSBmdW5jdGlvbiBzdWNoIGFzCj4gZHdfaGRtaV9jZWNfcGh5c19hZGRyX2ludmFsaWRhdGUo
KSB0aGF0IGlzIGNhbGxlZCBmcm9tIG1lc29uX2R3X2hkbWkuYy4KPiBJIGRlY2lkZWQgbm90IHRv
IGRvIHRoYXQgc2luY2UgdGhpcyBwYXRjaCBpcyBtaW5pbWFsbHkgaW52YXNpdmUsIGJ1dAo+IHRo
YXQgY2FuIG9idmlvdXNseSBiZSBjaGFuZ2VkIGlmIHRoYXQgYXBwcm9hY2ggaXMgcHJlZmVycmVk
Lgo+IC0tLQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gaW5k
ZXggYzVhODU0YWY1NGY4Li5lODk5YjMxZTE0MzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yMzI5LDYgKzIzMjksMTMgQEAgdm9pZCBkd19o
ZG1pX3NldHVwX3J4X3NlbnNlKHN0cnVjdCBkd19oZG1pICpoZG1pLCBib29sIGhwZCwgYm9vbCBy
eF9zZW5zZSkKPiAgCQlkd19oZG1pX3VwZGF0ZV9wb3dlcihoZG1pKTsKPiAgCQlkd19oZG1pX3Vw
ZGF0ZV9waHlfbWFzayhoZG1pKTsKPiAgCX0KPiArCWlmICghaHBkICYmICFyeF9zZW5zZSkgewo+
ICsJCXN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmaWVyID0gUkVBRF9PTkNFKGhkbWktPmNlY19u
b3RpZmllcik7Cj4gKwo+ICsJCWlmIChub3RpZmllcikKPiArCQkJY2VjX25vdGlmaWVyX3BoeXNf
YWRkcl9pbnZhbGlkYXRlKG5vdGlmaWVyKTsKPiArCX0KPiArCj4gIAltdXRleF91bmxvY2soJmhk
bWktPm11dGV4KTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3NldHVwX3J4X3Nl
bnNlKTsKPiBAQCAtMjM2OSwxNCArMjM3Niw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd19oZG1p
X2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAkJZHdfaGRtaV9zZXR1cF9yeF9zZW5zZSho
ZG1pLAo+ICAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlfSFBELAo+ICAJCQkJICAgICAg
IHBoeV9zdGF0ICYgSERNSV9QSFlfUlhfU0VOU0UpOwo+IC0KPiAtCQlpZiAoKHBoeV9zdGF0ICYg
KEhETUlfUEhZX1JYX1NFTlNFIHwgSERNSV9QSFlfSFBEKSkgPT0gMCkgewo+IC0JCQlzdHJ1Y3Qg
Y2VjX25vdGlmaWVyICpub3RpZmllcjsKPiAtCj4gLQkJCW5vdGlmaWVyID0gUkVBRF9PTkNFKGhk
bWktPmNlY19ub3RpZmllcik7Cj4gLQkJCWlmIChub3RpZmllcikKPiAtCQkJCWNlY19ub3RpZmll
cl9waHlzX2FkZHJfaW52YWxpZGF0ZShub3RpZmllcik7Cj4gLQkJfQo+ICAJfQo+IAo+ICAJaWYg
KGludHJfc3RhdCAmIEhETUlfSUhfUEhZX1NUQVQwX0hQRCkgewo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
