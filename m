Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5552ADB4D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 17:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E7C89B67;
	Tue, 10 Nov 2020 16:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAEC89B67
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:09:06 +0000 (UTC)
Date: Tue, 10 Nov 2020 16:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605024544;
 bh=UKrevD9v/jENMjHzppHFhIUO9YMRL//iQ2BuGrdI9vE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=XQyNl20nTLfrjJnuXyX76573bLEhWjOAKunPf616MZVcQw+BH+QXnycuTTJyViI3n
 JNq3GV0nuqd3WtHgtTTAF0FU/FOfx31AIYSwsRQfCJfab0dq9/2pvYy+3tAcDAZg2W
 ZGvTWETXhrZZdF4vDW5+H0sUkKVT2XfuqLGC4TMv/ElJoiEGddIe7i2qoTPLjKHjRU
 Rgb9ErIq5J8P6rqMmVa34CxmAubjk6PfRrlHVawvrtvt+Y8xj5kESJIKjJtHUbGSXQ
 1TdNuKU9tr8Fw4xmlRNzWzAqxBA8ky3ijZsHmUtRjWCbiJySnGO2dYegx6dePm3nud
 lUREnYX3g8Zuw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add debug logs for drm_mode_atomic_ioctl errors
Message-ID: <6uG7u2llV4e0nQCgi51sQMSJUcGgFdBsgCOVvJ2LnFW1NuNOaVN9bgSa50m9lR_3QPtZiuc0Uu2z4Z5Pb1CB7VpJcm0JzjwmenKCBVZEX68=@emersion.fr>
In-Reply-To: <20201110160405.GS6112@intel.com>
References: <2sJwtJZS8GpTVmDedCE6b5WNkmnmUARXGt0mugjU2BA@cp3-web-033.plabs.ch>
 <20201110160405.GS6112@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgTm92ZW1iZXIgMTAsIDIwMjAgNTowNCBQTSwgVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBOb3YgMTAsIDIw
MjAgYXQgMDM6NTg6MDFQTSArMDAwMCwgU2ltb24gU2VyIHdyb3RlOgo+ID4gQmUgbmljZSB0byB1
c2VyLXNwYWNlIGFuZCBsb2cgd2hhdCBoYXBwZW5lZCB3aGVuIHJldHVybmluZyBFSU5WQUwgaW4K
PiA+IGRybV9tb2RlX2F0b21pY19pb2N0bC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBT
ZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+
ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jIHwgMTYgKysrKysrKysrKysrLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMKPiA+IGluZGV4IDI1YzI2OWJjNDY4MS4u
NjhkNzY3NDIwMDgyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
dWFwaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMKPiA+IEBA
IC0xMzAzLDIyICsxMzAzLDMwIEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKPiA+ICAJICogdGhvdWdoIHRoaXMgbWF5IGJlIGEgYml0IG92ZXJraWxs
LCBzaW5jZSBsZWdhY3kgdXNlcnNwYWNlCj4gPiAgCSAqIHdvdWxkbid0IGtub3cgaG93IHRvIGNh
bGwgdGhpcyBpb2N0bCkKPiA+ICAJICovCj4gPiAtCWlmICghZmlsZV9wcml2LT5hdG9taWMpCj4g
PiArCWlmICghZmlsZV9wcml2LT5hdG9taWMpIHsKPiA+ICsJCURSTV9ERUJVR19BVE9NSUMoImF0
b21pYyBjb21taXQgZmFpbGVkOiBhdG9taWMgY2FwIG5vdCBlbmFibGVkXG4iKTsKPgo+IFRoZSAi
YXRvbWljIGNvbW1pdCBmYWlsZWQ6IiBiaXQgc2VlbXMgYSBiaXQgcmVkdW5kYW50LgoKSSBndWVz
cyB0aGUgImF0b21pYyIgcGFydCBjYW4gYmUgZHJvcHBlZCBpbmRlZWQuIEhvd2V2ZXIgSSdkIHJl
YWxseSBsaWtlIHRvCmtlZXAgdGhlIHdvcmQgImZhaWxlZCIgaGVyZSwgYmVjYXVzZSBpdCBtYWtl
cyBncmVwcGluZyBsYXJnZSBEUk0gbG9ncyBtdWNoCmVhc2llciAoYW5kIGlzIGFscmVhZHkgdXNl
ZCBmb3Igb3RoZXIgZmFpbHVyZXMsIGUuZy4gZHJpdmVyIGZhaWx1cmVzKS4KCj4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsKPiA+ICsJfQo+ID4KPiA+IC0JaWYgKGFyZy0+ZmxhZ3MgJiB+RFJNX01PREVf
QVRPTUlDX0ZMQUdTKQo+ID4gKwlpZiAoYXJnLT5mbGFncyAmIH5EUk1fTU9ERV9BVE9NSUNfRkxB
R1MpIHsKPiA+ICsJCURSTV9ERUJVR19BVE9NSUMoImF0b21pYyBjb21taXQgZmFpbGVkOiBpbnZh
bGlkIGZsYWdcbiIpOwo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCX0KPiA+Cj4gPiAgCWlm
IChhcmctPnJlc2VydmVkKQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4KPiBZb3UgZG9uJ3Qgd2Fu
dCBvbmUgZm9yIHRoaXM/IEkgd29uZGVyIHdoeSB0aGlzICJyZXNlcnZlZCIgZmllbGQKPiBldmVu
IGV4aXN0cy4uLgoKWWVhaCwgSSB3YXNuJ3Qgc3VyZSBlaXRoZXIgc28gcHJlZmVycmVkIG5vdCB0
byB0b3VjaCBpdC4gSSBndWVzcyBpdCdzCnNjcmF0Y2ggc3BhY2Ugd2hpY2ggY2FuIGJlIHVzZWQg
dG8gZXh0ZW5kIHRoZSBpb2N0bCBpbiB0aGUgZnV0dXJlPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
