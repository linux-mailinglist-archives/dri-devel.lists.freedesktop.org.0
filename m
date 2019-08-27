Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F19DA3C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 02:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162989E69;
	Tue, 27 Aug 2019 00:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74889E69
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 00:00:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0AB331B;
 Tue, 27 Aug 2019 02:00:23 +0200 (CEST)
Date: Tue, 27 Aug 2019 03:00:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 13/14] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190827000017.GB5274@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-14-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-14-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566864023;
 bh=axRmPB+ri4lYGSD+6809gJobxHmxblq+utwkj7h225s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PV8EId/PKc+Z9yzRYVpcWKQ70kOhKNJnKt7RWKXt6oTuNa9GfjNTBQuqk9bWwdv9x
 5DAQRZf6ABMGbU27nfg8aKoF7g3liBZC1abscP5eIdV2nOnmjRzdsyqdsw0NPhCwUk
 RbX/pFfTnQBZiKwNlf5dhKvVkZ/VV3xOGtFqyXRc=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEF1ZyAyNSwgMjAx
OSBhdCAwMzo1MTo1M1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gVXBkYXRlIENNTSBz
ZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBtZXRob2QuCj4gCj4g
VGhlIENNTSBpcyB1cGRhdGVkIHdpdGggbmV3IGdhbW1hIHZhbHVlcyBwcm92aWRlZCB0byB0aGUg
ZHJpdmVyCj4gaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5Lgo+IAo+IFJldmlld2VkLWJ5
OiBVbHJpY2ggSGVjaHQgPHVsaStyZW5lc2FzQGZwb25kLmV1Pgo+IFJldmlld2VkLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gaW5kZXggNjFjYTFkM2MzNzlhLi4w
NDdmZGI5ODJhMTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiBA
QCAtMjIsNiArMjIsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3dhaXQuaD4KPiAgCj4gKyNpbmNsdWRlICJyY2FyX2NtbS5oIgo+ICAjaW5j
bHVkZSAicmNhcl9kdV9jcnRjLmgiCj4gICNpbmNsdWRlICJyY2FyX2R1X2Rydi5oIgo+ICAjaW5j
bHVkZSAicmNhcl9kdV9lbmNvZGVyLmgiCj4gQEAgLTM2OCw2ICszNjksMzcgQEAgcmNhcl9kdV9m
Yl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXYsCj4gICAqIEF0b21pYyBDaGVjayBhbmQgVXBkYXRlCj4gICAqLwo+ICAKPiArc3RhdGljIHZv
aWQgcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oc3RydWN0IGRybV9jcnRjICpjcnRj
LAo+ICsJCQkJCSAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUpCj4gK3sKPiAr
CXN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjID0gdG9fcmNhcl9jcnRjKGNydGMpOwo+ICsJc3Ry
dWN0IHJjYXJfY21tX2NvbmZpZyBjbW1fY29uZmlnID0ge307Cj4gKwo+ICsJaWYgKCFyY3J0Yy0+
Y21tIHx8ICFjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkKQo+ICsJCXJldHVybjsKPiAr
Cj4gKwlpZiAoIWNydGMtPnN0YXRlLT5nYW1tYV9sdXQpIHsKPiArCQljbW1fY29uZmlnLmx1dC5l
bmFibGUgPSBmYWxzZTsKPiArCQlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZp
Zyk7Cj4gKwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4gKwljbW1fY29uZmlnLmx1dC5lbmFibGUg
PSB0cnVlOwo+ICsJY21tX2NvbmZpZy5sdXQudGFibGUgPSAoc3RydWN0IGRybV9jb2xvcl9sdXQg
KikKPiArCQkJICAgICAgIGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmRhdGE7Cj4gKwo+ICsJLyog
U2V0IExVVCB0YWJsZSBzaXplIHRvIDAgaWYgZW50cmllcyBzaG91bGQgbm90IGJlIHVwZGF0ZWQu
ICovCj4gKwlpZiAoIW9sZF9zdGF0ZS0+Z2FtbWFfbHV0IHx8Cj4gKwkgICAgb2xkX3N0YXRlLT5n
YW1tYV9sdXQtPmJhc2UuaWQgIT0gY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCkKPiAr
CQljbW1fY29uZmlnLmx1dC5zaXplID0gY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+bGVuZ3RoCj4g
KwkJCQkgICAgLyBzaXplb2YoY21tX2NvbmZpZy5sdXQudGFibGVbMF0pOwoKSXQgaGFzIGp1c3Qg
b2NjdXJyZWQgdG8gbWUgdGhhdCB0aGUgaGFyZHdhcmUgb25seSBzdXBwb3J0IExVVHMgb2YKZXhh
Y3RseSAyNTYgZW50cmllcy4gU2hvdWxkIHdlIHJlbW92ZSBjbW1fY29uZmlnLmx1dC5zaXplIChz
aW1wbGlmeWluZwp0aGUgY29kZSBpbiB0aGUgQ01NIGRyaXZlciksIGFuZCBhZGQgYSBjaGVjayB0
byB0aGUgQ1JUQyAuYXRvbWljX2NoZWNrKCkKaGFuZGxlciB0byByZWplY3QgaW52YWxpZCBMVVRz
ID8gU29ycnkgZm9yIG5vdCBoYXZpbmcgY2F1Z2h0IHRoaXMKZWFybGllci4KCj4gKwllbHNlCj4g
KwkJY21tX2NvbmZpZy5sdXQuc2l6ZSA9IDA7Cj4gKwo+ICsJcmNhcl9jbW1fc2V0dXAocmNydGMt
PmNtbSwgJmNtbV9jb25maWcpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHJjYXJfZHVfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCQlzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpCj4gIHsKPiBAQCAtNDEwLDYgKzQ0Miw5IEBAIHN0YXRpYyB2b2lkIHJjYXJf
ZHVfYXRvbWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUp
Cj4gIAkJCXJjZHUtPmRwYWQxX3NvdXJjZSA9IHJjcnRjLT5pbmRleDsKPiAgCX0KPiAgCj4gKwlm
b3JfZWFjaF9vbGRfY3J0Y19pbl9zdGF0ZShvbGRfc3RhdGUsIGNydGMsIGNydGNfc3RhdGUsIGkp
Cj4gKwkJcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oY3J0YywgY3J0Y19zdGF0ZSk7
Cj4gKwo+ICAJLyogQXBwbHkgdGhlIGF0b21pYyB1cGRhdGUuICovCj4gIAlkcm1fYXRvbWljX2hl
bHBlcl9jb21taXRfbW9kZXNldF9kaXNhYmxlcyhkZXYsIG9sZF9zdGF0ZSk7Cj4gIAlkcm1fYXRv
bWljX2hlbHBlcl9jb21taXRfcGxhbmVzKGRldiwgb2xkX3N0YXRlLAoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
