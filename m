Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C406389C2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B54189B61;
	Fri,  7 Jun 2019 12:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444389B61
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:06:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1429B91;
 Fri,  7 Jun 2019 14:06:47 +0200 (CEST)
Date: Fri, 7 Jun 2019 15:06:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20190607120633.GI7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-21-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-21-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559909207;
 bh=7KMF50FCXnE1VfqOhGM4a6Brkr5UqWdiDJUCbvlknhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3FzoHhX4EmsWLZI9iJGKgDVJ5Q2trwoHYfFlvS+GYL3GBY/JhNHHoe86hBS0m+oD
 iXNNThz9sBmtZMLunQuhWkz0BOtKYwCy5tVtJWCrGtTOwk5n0lLupVANLLyOJ/Kems
 mh4Vq4jOYWxo/+F8eDKIu+JGHMwgPB1MFE7dbrSo=
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
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjoyMFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gVXBkYXRlIENNTSBz
ZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBtZXRob2QuCj4gCj4g
VGhlIENNTSBpcyB1cGRhdGVkIHdpdGggbmV3IGdhbW1hIHZhbHVlcyBwcm92aWRlZCB0byB0aGUg
ZHJpdmVyCj4gaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDM2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+IGluZGV4IDVhOTEwYTA0ZTFkOS4uMjlhMjAy
MGE0NmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21z
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gQEAgLTIx
LDYgKzIxLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC93YWl0Lmg+Cj4gIAo+ICsjaW5jbHVkZSAicmNhcl9jbW0uaCIKPiAgI2luY2x1ZGUg
InJjYXJfZHVfY3J0Yy5oIgo+ICAjaW5jbHVkZSAicmNhcl9kdV9kcnYuaCIKPiAgI2luY2x1ZGUg
InJjYXJfZHVfZW5jb2Rlci5oIgo+IEBAIC0zNjcsNiArMzY4LDM4IEBAIHJjYXJfZHVfZmJfY3Jl
YXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAo+
ICAgKiBBdG9taWMgQ2hlY2sgYW5kIFVwZGF0ZQo+ICAgKi8KPiAgCj4gK3N0YXRpYyB2b2lkIHJj
YXJfZHVfYXRvbWljX2NvbW1pdF91cGRhdGVfY21tKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAr
CQkJCQkgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQo+ICt7Cj4gKwlzdHJ1
Y3QgcmNhcl9kdV9jcnRjICpyY3J0YyA9IHRvX3JjYXJfY3J0YyhjcnRjKTsKPiArCXN0cnVjdCBy
Y2FyX2NtbV9jb25maWcgY21tX2NvbmZpZyA9IHt9Owo+ICsKPiArCWlmICghcmNydGMtPmNtbSB8
fCAhY3J0Yy0+c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJ
aWYgKCFjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0KSB7Cj4gKwkJY21tX2NvbmZpZy5sdXQuZW5hYmxl
ID0gZmFsc2U7Cj4gKwkJcmNhcl9jbW1fc2V0dXAocmNydGMtPmNtbSwgJmNtbV9jb25maWcpOwo+
ICsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICsJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0gdHJ1
ZTsKPiArCWNtbV9jb25maWcubHV0LnRhYmxlID0gKHN0cnVjdCBkcm1fY29sb3JfbHV0ICopCj4g
KwkJCSAgICAgICBjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0LT5kYXRhOwo+ICsKPiArCS8qIFNldCBM
VVQgdGFibGUgc2l6ZSB0byAwIGlmIGVudHJpZXMgc2hvdWxkIG5vdCBiZSB1cGRhdGVkLiAqLwo+
ICsJaWYgKCFvbGRfc3RhdGUtPmdhbW1hX2x1dCB8fAo+ICsJICAgIChvbGRfc3RhdGUtPmdhbW1h
X2x1dC0+YmFzZS5pZCAhPQo+ICsJICAgIGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmJhc2UuaWQp
KQo+ICsJCWNtbV9jb25maWcubHV0LnNpemUgPSBjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0LT5sZW5n
dGgKPiArCQkJCSAgICAvIHNpemVvZihjbW1fY29uZmlnLmx1dC50YWJsZVswXSk7CgpEbyB5b3Ug
bmVlZCB0byBjYWxsIHJjYXJfY21tX3NldHVwKCkgYXQgYWxsIGluIHRoaXMgY2FzZSA/Cgo+ICsJ
ZWxzZQo+ICsJCWNtbV9jb25maWcubHV0LnNpemUgPSAwOwo+ICsKPiArCXJjYXJfY21tX3NldHVw
KHJjcnRjLT5jbW0sICZjbW1fY29uZmlnKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCByY2FyX2R1
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCQkJc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlKQo+ICB7Cj4gQEAgLTQwOSw2ICs0NDIsOSBAQCBzdGF0aWMgdm9p
ZCByY2FyX2R1X2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xk
X3N0YXRlKQo+ICAJCQlyY2R1LT5kcGFkMV9zb3VyY2UgPSByY3J0Yy0+aW5kZXg7Cj4gIAl9Cj4g
IAo+ICsJZm9yX2VhY2hfb2xkX2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBjcnRjX3N0
YXRlLCBpKQo+ICsJCXJjYXJfZHVfYXRvbWljX2NvbW1pdF91cGRhdGVfY21tKGNydGMsIGNydGNf
c3RhdGUpOwo+ICsKPiAgCS8qIEFwcGx5IHRoZSBhdG9taWMgdXBkYXRlLiAqLwo+ICAJZHJtX2F0
b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3RhdGUpOwo+ICAJ
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSwKCi0tIApSZWdh
cmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
