Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3D736EB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3C6E61D;
	Wed, 24 Jul 2019 18:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8DC6E61D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:49:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AA94E80622;
 Wed, 24 Jul 2019 20:49:44 +0200 (CEST)
Date: Wed, 24 Jul 2019 20:49:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/pl111: Deprecate the pads from the DT binding
Message-ID: <20190724184943.GA22640@ravnborg.org>
References: <20190724134959.2365-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724134959.2365-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ynT33n6li-2ytY4JJ7wA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMuCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMzo0OTo1OFBNICswMjAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IFRoZSBwYWRzIHdlcmUgYW4gZWFybGllciB3b3JrYXJvdW5kIGZv
ciB0aGUgaW50ZXJuYWwgaW1hZ2UKPiBwaXBlbGluZSBpbiB0aGUgTGludXggZmJkZXYgc3Vic3lz
dGVtLiBBcyB3ZSBtb3ZlIHRvIGdlbmVyaWMKPiBkZWZpbml0aW9uIG9mIGRpc3BsYXkgcHJvcGVy
dGllcyBhbmQgZHJpdmVycyB0aGF0IG5vIGxvbmdlcgo+IG5lZWQgdGhpcyB0byB3b3JrLCBkZXBy
ZWNhdGUgdGhpcyBwcm9wZXJ0eS4KPiAKPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IENjOiBQYXdlbCBNb2xsIDxwYXdlbC5tb2xsQGFybS5jb20+Cj4gQ2M6IExpdml1IER1
ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KCkFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxwbDExeC50eHQgfCA5
ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9hcm0scGwxMXgudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYXJtLHBsMTF4LnR4dAo+IGluZGV4IDU3MmZhMjc3M2VjNC4uM2Y5NzdlNzJhMjAw
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FybSxwbDExeC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9hcm0scGwxMXgudHh0Cj4gQEAgLTM5LDkgKzM5LDExIEBAIFJlcXVpcmVkIHN1Yi1u
b2RlczoKPiAgCj4gIC0gcG9ydDogZGVzY3JpYmVzIExDRCBwYW5lbCBzaWduYWxzLCBmb2xsb3dp
bmcgdGhlIGNvbW1vbiBiaW5kaW5nCj4gIAlmb3IgdmlkZW8gdHJhbnNtaXR0ZXIgaW50ZXJmYWNl
czsgc2VlCj4gLQlEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy50eHQ7Cj4gLQl3aGVuIGl0IGlzIGEgVEZUIHBhbmVsLCB0aGUgcG9ydCdzIGVu
ZHBvaW50IG11c3QgZGVmaW5lIHRoZQo+IC0JZm9sbG93aW5nIHByb3BlcnR5Ogo+ICsJRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Cj4g
Kwo+ICtEZXByZWNhdGVkIHByb3BlcnRpZXM6Cj4gKwlUaGUgcG9ydCdzIGVuZGJwb2ludCBzdWJu
b2RlIGhhZCB0aGlzLCBub3cgZGVwcmVjYXRlZCBwcm9wZXJ0eQo+ICsJaW4gdGhlIHBhc3QuIERy
aXZlcnMgc2hvdWxkIGJlIGFibGUgdG8gc3Vydml2ZSB3aXRob3V0IGl0Ogo+ICAKPiAgCS0gYXJt
LHBsMTF4LHRmdC1yMGcwYjAtcGFkczogYW4gYXJyYXkgb2YgdGhyZWUgMzItYml0IHZhbHVlcywK
PiAgCQlkZWZpbmluZyB0aGUgd2F5IENMRCBwYWRzIGFyZSB3aXJlZCB1cDsgZmlyc3QgdmFsdWUK
PiBAQCAtODAsNyArODIsNiBAQCBFeGFtcGxlOgo+ICAJCXBvcnQgewo+ICAJCQljbGNkX3BhZHM6
IGVuZHBvaW50IHsKPiAgCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmY2xjZF9wYW5lbD47Cj4gLQkJ
CQlhcm0scGwxMXgsdGZ0LXIwZzBiMC1wYWRzID0gPDAgOCAxNj47Cj4gIAkJCX07Cj4gIAkJfTsK
PiAgCj4gLS0gCj4gMi4yMS4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
