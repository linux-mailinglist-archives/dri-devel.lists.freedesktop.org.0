Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ABF1F7EA
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 17:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A28920A;
	Wed, 15 May 2019 15:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48DCD8920A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 15:45:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6B62374;
 Wed, 15 May 2019 08:45:32 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74493F703;
 Wed, 15 May 2019 08:45:32 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 0FDFD68240D; Wed, 15 May 2019 16:45:31 +0100 (BST)
Date: Wed, 15 May 2019 16:45:31 +0100
From: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v1] drm/arm/mali-dp: Disable checking for required pixel clock
 rate
Message-ID: <20190515154530.GX15144@e110455-lin.cambridge.arm.com>
References: <20190515024348.43642-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515024348.43642-1-wen.he_1@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV2VuLAoKT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDI6NDI6MDhBTSArMDAwMCwgV2VuIEhl
IHdyb3RlOgo+IERpc2FibGUgY2hlY2tpbmcgZm9yIHJlcXVpcmVkIHBpeGVsIGNsb2NrIHJhdGUg
aWYgQVJDSF9MQVlFUlNDUEFFCj4gaXMgZW5hYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsaXNv
biBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2Vu
LmhlXzFAbnhwLmNvbT4KPiAtLS0KPiBjaGFuZ2UgaW4gZGVzY3JpcHRpb246Cj4gCS0gVGhpcyBj
aGVjayB0aGF0IG9ubHkgc3VwcG9ydGVkIG9uZSBwaXhlbCBjbG9jayByZXF1aXJlZCBjbG9jayBy
YXRlCj4gCWNvbXBhcmUgd2l0aCBkdHMgbm9kZSB2YWx1ZS4gYnV0IHdlIGhhdmUgc3VwcG9ydHMg
NCBwaXhlbCBjbG9jawo+IAlmb3IgbHMxMDI4YSBib2FyZC4KClNvLCB5b3VyIERUIHNheXMgeW91
ciBwaXhlbCBjbG9jayBwcm92aWRlciBpcyBhIGZpeGVkIGNsb2NrPyBJZiB5b3Ugc3VwcG9ydApt
b3JlIHRoYW4gb25lIHJhdGUsIHlvdSBzaG91bGQgaW5zdGVhZCB1c2UgYSByZWFsIHByb3ZpZGVy
IGZvciBpdC4gSG93IGRvIHlvdQpzdXBwb3J0IHRoZSA0IHBpeGVsIGNsb2Nrcz8KCkFsc28sIG5v
dCBzdXJlIHdoYXQgdGhlIHBhcmFncmFwaCBhYm92ZSBpcyBtZWFudCB0byBiZS4gU2hvdWxkIGl0
IGJlIHBhcnQgb2YKdGhlIGNvbW1pdCBtZXNzYWdlPwoKQmVzdCByZWdhcmRzLApMaXZpdQoKCj4g
IGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2NydGMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9jcnRjLmMKPiBpbmRl
eCA1NmFhZDI4ODY2NmUuLmJiNzkyMjNkOTk4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9j
cnRjLmMKPiBAQCAtMzYsMTEgKzM2LDEzIEBAIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBt
YWxpZHBfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgCj4gIAlpZiAo
cmVxX3JhdGUpIHsKPiAgCQlyYXRlID0gY2xrX3JvdW5kX3JhdGUoaHdkZXYtPnB4bGNsaywgcmVx
X3JhdGUpOwo+ICsjaWZuZGVmIENPTkZJR19BUkNIX0xBWUVSU0NBUEUKPiAgCQlpZiAocmF0ZSAh
PSByZXFfcmF0ZSkgewo+ICAJCQlEUk1fREVCVUdfRFJJVkVSKCJweGxjbGsgZG9lc24ndCBzdXBw
b3J0ICVsZCBIelxuIiwKPiAgCQkJCQkgcmVxX3JhdGUpOwo+ICAJCQlyZXR1cm4gTU9ERV9OT0NM
T0NLOwo+ICAJCX0KPiArI2VuZGlmCj4gIAl9Cj4gIAo+ICAJcmV0dXJuIE1PREVfT0s7Cj4gLS0g
Cj4gMi4xNy4xCj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8g
fAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhl
ICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8v
wq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
