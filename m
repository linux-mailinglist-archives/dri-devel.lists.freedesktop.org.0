Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA3968B4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 20:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582B86E846;
	Tue, 20 Aug 2019 18:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E086E846
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 18:42:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A723733D;
 Tue, 20 Aug 2019 20:42:29 +0200 (CEST)
Date: Tue, 20 Aug 2019 21:42:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190820184215.GM10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-20-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566326549;
 bh=qnHKygeaJ9A0XAoozrBOjxGmEytvfP0jm/X5BCRjLp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MAWfdcwcAgjoBUaXHzVBE0A6Ec6DftcMis8aesD/XPHUGtwrBTzGS+OKryBBrowca
 GiIgDGzRLaypz7zrvQCMumgM4n0mJDbH425Mi065YaItcMmjDa/A2bAMsZPFUVXqEj
 hCyS8qTzvQljT9nj3/Z9O5anfLHkBHkQKGHakawg=
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

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTYXQsIEp1bCAwNiwgMjAx
OSBhdCAwNDowNzo0NlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gVXBkYXRlIENNTSBz
ZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBtZXRob2QuCj4gCj4g
VGhlIENNTSBpcyB1cGRhdGVkIHdpdGggbmV3IGdhbW1hIHZhbHVlcyBwcm92aWRlZCB0byB0aGUg
ZHJpdmVyCj4gaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDM1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+IGluZGV4IGI3OWNkYTJmNTUzMS4uZjlhZWNl
NzhjYTVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21z
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gQEAgLTIx
LDYgKzIxLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC93YWl0Lmg+Cj4gIAo+ICsjaW5jbHVkZSAicmNhcl9jbW0uaCIKPiAgI2luY2x1ZGUg
InJjYXJfZHVfY3J0Yy5oIgo+ICAjaW5jbHVkZSAicmNhcl9kdV9kcnYuaCIKPiAgI2luY2x1ZGUg
InJjYXJfZHVfZW5jb2Rlci5oIgo+IEBAIC0yODcsNiArMjg4LDM3IEBAIHJjYXJfZHVfZmJfY3Jl
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
ICsJaWYgKCFvbGRfc3RhdGUtPmdhbW1hX2x1dCB8fAo+ICsJICAgIG9sZF9zdGF0ZS0+Z2FtbWFf
bHV0LT5iYXNlLmlkICE9IGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmJhc2UuaWQpCj4gKwkJY21t
X2NvbmZpZy5sdXQuc2l6ZSA9IGNydGMtPnN0YXRlLT5nYW1tYV9sdXQtPmxlbmd0aAo+ICsJCQkJ
ICAgIC8gc2l6ZW9mKGNtbV9jb25maWcubHV0LnRhYmxlWzBdKTsKPiArCWVsc2UKPiArCQljbW1f
Y29uZmlnLmx1dC5zaXplID0gMDsKPiArCj4gKwlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAm
Y21tX2NvbmZpZyk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgcmNhcl9kdV9hdG9taWNfY2hlY2so
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCQkJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZSkKPiAgewo+IEBAIC0zMjksNiArMzYxLDkgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9hdG9t
aWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKPiAgCQkJ
cmNkdS0+ZHBhZDFfc291cmNlID0gcmNydGMtPmluZGV4Owo+ICAJfQo+ICAKPiArCWZvcl9lYWNo
X29sZF9jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSwgaSkKPiArCQly
Y2FyX2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbShjcnRjLCBjcnRjX3N0YXRlKTsKPiArCgpJ
IHRoaW5rIHRoaXMgbG9va3MgZ29vZCBvdmVyYWxsLCBidXQgSSB3b25kZXIgaWYgd2UgY291bGRu
J3Qgc2ltcGxpZnkKdGhlIENNTSBkcml2ZXIgc3VzcGVuZC9yZXN1bWUgYW5kIExVVCBjYWNoaW5n
IGR1ZSB0byBjb25maWcgd2hpbGUgbm90CmVuYWJsZWQgYnkgaGFuZGxpbmcgaXQgb24gdGhlIERV
IHNpZGUuIEkgaGF2ZSBhIHJld29yayBvbiB0aGUgY29tbWl0CnRhaWwgaGFuZGxlciBpbiBwcm9n
cmVzcywgSSdsbCB0aGluayBob3cgdGhpcyBjb3VsZCBiZSBkb25lLiBGb3Igbm93IEkKdGhpbmsg
eW91IGNhbiBsZWF2ZSBpdCBhcyBpcy4KCj4gIAkvKiBBcHBseSB0aGUgYXRvbWljIHVwZGF0ZS4g
Ki8KPiAgCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVzKGRldiwgb2xk
X3N0YXRlKTsKPiAgCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9wbGFuZXMoZGV2LCBvbGRfc3Rh
dGUsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
