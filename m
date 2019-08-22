Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930CA9A084
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 21:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E916EA9B;
	Thu, 22 Aug 2019 19:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB236EA9B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:54:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CC8C2B2;
 Thu, 22 Aug 2019 21:54:14 +0200 (CEST)
Date: Thu, 22 Aug 2019 22:54:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190822195407.GL5027@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
 <20190820184215.GM10820@pendragon.ideasonboard.com>
 <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566503654;
 bh=GHCA3gkwB4RNKsfkuiYa//90I1sQp0GbRnug/PQKMuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FdbAKJGU0PAGTJJ+3FUf2mZfUKKsADKgnVPfWCsjSgjgW8GbyBxNCS46RRYy2FRbm
 asG6pEl8oQNjGBRvEv73m3+dT/Zn4Y0xQxQ7TR5aig7k5ocPn+gNtEAf1HJrfFAG0G
 sg0AQ5sWUKh5Il1ccVxw6hQC/7g8swIGeA5PmaXs=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDk6MTk6MjVQTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA5OjQyOjE1UE0gKzAz
MDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBTYXQsIEp1bCAwNiwgMjAxOSBhdCAw
NDowNzo0NlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gPiA+IFVwZGF0ZSBDTU0gc2V0
dGluZ3MgYXQgaW4gdGhlIGF0b21pYyBjb21taXQgdGFpbCBoZWxwZXIgbWV0aG9kLgo+ID4gPgo+
ID4gPiBUaGUgQ01NIGlzIHVwZGF0ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVkIHRv
IHRoZSBkcml2ZXIKPiA+ID4gaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5Lgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMu
YyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDM1IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2ttcy5jCj4gPiA+IGluZGV4IGI3OWNkYTJmNTUzMS4uZjlhZWNlNzhjYTVmIDEwMDY0NAo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiA+ID4gQEAgLTIxLDYgKzIx
LDcgQEAKPiA+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L3dhaXQuaD4KPiA+ID4KPiA+ID4gKyNpbmNsdWRlICJyY2FyX2NtbS5oIgo+ID4g
PiAgI2luY2x1ZGUgInJjYXJfZHVfY3J0Yy5oIgo+ID4gPiAgI2luY2x1ZGUgInJjYXJfZHVfZHJ2
LmgiCj4gPiA+ICAjaW5jbHVkZSAicmNhcl9kdV9lbmNvZGVyLmgiCj4gPiA+IEBAIC0yODcsNiAr
Mjg4LDM3IEBAIHJjYXJfZHVfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2LAo+ID4gPiAgICogQXRvbWljIENoZWNrIGFuZCBVcGRhdGUK
PiA+ID4gICAqLwo+ID4gPgo+ID4gPiArc3RhdGljIHZvaWQgcmNhcl9kdV9hdG9taWNfY29tbWl0
X3VwZGF0ZV9jbW0oc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gPiArCQkJCQkgICAgIHN0cnVj
dCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCByY2Fy
X2R1X2NydGMgKnJjcnRjID0gdG9fcmNhcl9jcnRjKGNydGMpOwo+ID4gPiArCXN0cnVjdCByY2Fy
X2NtbV9jb25maWcgY21tX2NvbmZpZyA9IHt9Owo+ID4gPiArCj4gPiA+ICsJaWYgKCFyY3J0Yy0+
Y21tIHx8ICFjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkKQo+ID4gPiArCQlyZXR1cm47
Cj4gPiA+ICsKPiA+ID4gKwlpZiAoIWNydGMtPnN0YXRlLT5nYW1tYV9sdXQpIHsKPiA+ID4gKwkJ
Y21tX2NvbmZpZy5sdXQuZW5hYmxlID0gZmFsc2U7Cj4gPiA+ICsJCXJjYXJfY21tX3NldHVwKHJj
cnRjLT5jbW0sICZjbW1fY29uZmlnKTsKPiA+ID4gKwo+ID4gPiArCQlyZXR1cm47Cj4gPiA+ICsJ
fQo+ID4gPiArCj4gPiA+ICsJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0gdHJ1ZTsKPiA+ID4gKwlj
bW1fY29uZmlnLmx1dC50YWJsZSA9IChzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqKQo+ID4gPiArCQkJ
ICAgICAgIGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmRhdGE7Cj4gPiA+ICsKPiA+ID4gKwkvKiBT
ZXQgTFVUIHRhYmxlIHNpemUgdG8gMCBpZiBlbnRyaWVzIHNob3VsZCBub3QgYmUgdXBkYXRlZC4g
Ki8KPiA+ID4gKwlpZiAoIW9sZF9zdGF0ZS0+Z2FtbWFfbHV0IHx8Cj4gPiA+ICsJICAgIG9sZF9z
dGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9IGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmJhc2Uu
aWQpCj4gPiA+ICsJCWNtbV9jb25maWcubHV0LnNpemUgPSBjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0
LT5sZW5ndGgKPiA+ID4gKwkJCQkgICAgLyBzaXplb2YoY21tX2NvbmZpZy5sdXQudGFibGVbMF0p
Owo+ID4gPiArCWVsc2UKPiA+ID4gKwkJY21tX2NvbmZpZy5sdXQuc2l6ZSA9IDA7Cj4gPiA+ICsK
PiA+ID4gKwlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7Cj4gPiA+ICt9
Cj4gPiA+ICsKPiA+ID4gIHN0YXRpYyBpbnQgcmNhcl9kdV9hdG9taWNfY2hlY2soc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKPiA+ID4gIAkJCQlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUp
Cj4gPiA+ICB7Cj4gPiA+IEBAIC0zMjksNiArMzYxLDkgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9h
dG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKPiA+
ID4gIAkJCXJjZHUtPmRwYWQxX3NvdXJjZSA9IHJjcnRjLT5pbmRleDsKPiA+ID4gIAl9Cj4gPiA+
Cj4gPiA+ICsJZm9yX2VhY2hfb2xkX2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBjcnRj
X3N0YXRlLCBpKQo+ID4gPiArCQlyY2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbShjcnRj
LCBjcnRjX3N0YXRlKTsKPiA+ID4gKwo+ID4KPiA+IEkgdGhpbmsgdGhpcyBsb29rcyBnb29kIG92
ZXJhbGwsIGJ1dCBJIHdvbmRlciBpZiB3ZSBjb3VsZG4ndCBzaW1wbGlmeQo+ID4gdGhlIENNTSBk
cml2ZXIgc3VzcGVuZC9yZXN1bWUgYW5kIExVVCBjYWNoaW5nIGR1ZSB0byBjb25maWcgd2hpbGUg
bm90Cj4gPiBlbmFibGVkIGJ5IGhhbmRsaW5nIGl0IG9uIHRoZSBEVSBzaWRlLiBJIGhhdmUgYSBy
ZXdvcmsgb24gdGhlIGNvbW1pdAo+ID4gdGFpbCBoYW5kbGVyIGluIHByb2dyZXNzLCBJJ2xsIHRo
aW5rIGhvdyB0aGlzIGNvdWxkIGJlIGRvbmUuIEZvciBub3cgSQo+ID4gdGhpbmsgeW91IGNhbiBs
ZWF2ZSBpdCBhcyBpcy4KPiAKPiBEb2VzIHRoaXMgbWVhbiBJIGhhdmUgeW91ciBSLWIgdGFnID8g
OikKCkknZCBsaWtlIHRvIHJldmlldyB0aGlzIGluIHRoZSBjb250ZXh0IG9mIHYzIDotKQoKPiA+
ID4gIAkvKiBBcHBseSB0aGUgYXRvbWljIHVwZGF0ZS4gKi8KPiA+ID4gIAlkcm1fYXRvbWljX2hl
bHBlcl9jb21taXRfbW9kZXNldF9kaXNhYmxlcyhkZXYsIG9sZF9zdGF0ZSk7Cj4gPiA+ICAJZHJt
X2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSwKCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
