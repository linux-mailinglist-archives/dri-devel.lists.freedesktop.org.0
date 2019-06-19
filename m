Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7244B626
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE36E366;
	Wed, 19 Jun 2019 10:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 388426E366
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:25:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0012360;
 Wed, 19 Jun 2019 03:25:21 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5B913F738;
 Wed, 19 Jun 2019 03:27:07 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 3719D680120; Wed, 19 Jun 2019 11:25:20 +0100 (BST)
Date: Wed, 19 Jun 2019 11:25:20 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Correct printk format specifier for "size_t"
Message-ID: <20190619102520.GC17204@e110455-lin.cambridge.arm.com>
References: <20190619074225.13521-1-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619074225.13521-1-james.qian.wang@arm.com>
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDg6NDI6NDVBTSArMDEwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gV2FybmluZ3MgcG9wdXAgd2hlbiAibWFr
ZSBBUkNIPWkzODYiCj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvZHJtL2RybV9t
bS5oOjQ5LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2RybS9kcm1fdm1hX21hbmFn
ZXIuaDoyNiwKPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9kcm0vZHJtX2dlbS5oOjQw
LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jOjk6Cj4gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzogSW4gZnVuY3Rpb24gJ2tvbWVkYV9mYl9hZmJj
X3NpemVfY2hlY2snOgo+IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ZyYW1lYnVmZmVyLmM6OTY6MTc6IGVycm9yOiBmb3JtYXQgJyVseCcgZXhwZWN0cyBhcmd1bWVu
dCBvZiB0eXBlICdsb25nIHVuc2lnbmVkIGludCcsIGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlICdz
aXplX3QnIHtha2EgJ3Vuc2lnbmVkIGludCd9IFstV2Vycm9yPWZvcm1hdD1dCj4gICAgRFJNX0RF
QlVHX0tNUygiYWZiYyBzaXplIGNoZWNrIGZhaWxlZCwgb2JqX3NpemU6IDB4JWx4LiBtaW5fc2l6
ZSAweCV4LlxuIiwKPiAKPiBUaGF0IGxlYWRzIGJ5IG1pc3VzZSAiJWx4IiBhcyBmb3JtYXQgc3Bl
aWNpZmllciBmb3Igc2l6ZV90LCBjb3JyZWN0IGl0Cj4gdG8gIiV6eCIKPiAKPiBSZXBvcnRlZC1i
eToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgoKUmV2aWV3ZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVz
dCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jICAgfCAxMSArKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+IGlu
ZGV4IGFiYzhjMGNjYzA1My4uM2IwYTcwZWQ2YWEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gQEAg
LTQzLDggKzQzLDggQEAga29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRhX2Zi
ICprZmIsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIg
KmZiID0gJmtmYi0+YmFzZTsKPiAgCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8g
PSBmYi0+Zm9ybWF0Owo+ICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7Cj4gLQl1MzIgYWxp
Z25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFsaWdubWVudF9oZWFkZXI7Cj4gLQl1MzIg
bl9ibG9ja3MgPSAwLCBtaW5fc2l6ZSA9IDA7Cj4gKwl1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGln
bm1lbnRfaCA9IDAsIGFsaWdubWVudF9oZWFkZXIsIG5fYmxvY2tzOwo+ICsJdTY0IG1pbl9zaXpl
Owo+ICAKPiAgCW9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBtb2RlX2NtZC0+aGFu
ZGxlc1swXSk7Cj4gIAlpZiAoIW9iaikgewo+IEBAIC05Myw3ICs5Myw3IEBAIGtvbWVkYV9mYl9h
ZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUsCj4gIAkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gIAltaW5fc2l6ZSA9
IGtmYi0+YWZiY19zaXplICsgZmItPm9mZnNldHNbMF07Cj4gIAlpZiAobWluX3NpemUgPiBvYmot
PnNpemUpIHsKPiAtCQlEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpf
c2l6ZTogMHglbHguIG1pbl9zaXplIDB4JXguXG4iLAo+ICsJCURSTV9ERUJVR19LTVMoImFmYmMg
c2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCV6eC4gbWluX3NpemUgMHglbGx4LlxuIiwK
PiAgCQkJICAgICAgb2JqLT5zaXplLCBtaW5fc2l6ZSk7Cj4gIAkJZ290byBjaGVja19mYWlsZWQ7
Cj4gIAl9Cj4gQEAgLTExNCw3ICsxMTQsOCBAQCBrb21lZGFfZmJfbm9uZV9hZmJjX3NpemVfY2hl
Y2soc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBrb21lZGFfZmIgKmtmYiwKPiAgCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gJmtmYi0+YmFzZTsKPiAgCWNvbnN0IHN0cnVjdCBk
cm1fZm9ybWF0X2luZm8gKmluZm8gPSBmYi0+Zm9ybWF0Owo+ICAJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmo7Cj4gLQl1MzIgaSwgbWluX3NpemUsIGJsb2NrX2g7Cj4gKwl1MzIgaSwgYmxvY2tf
aDsKPiArCXU2NCBtaW5fc2l6ZTsKPiAgCj4gIAlpZiAoa29tZWRhX2ZiX2NoZWNrX3NyY19jb29y
ZHMoa2ZiLCAwLCAwLCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQpKQo+ICAJCXJldHVybiAtRUlOVkFM
Owo+IEBAIC0xMzcsNyArMTM4LDcgQEAga29tZWRhX2ZiX25vbmVfYWZiY19zaXplX2NoZWNrKHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3Qga29tZWRhX2ZiICprZmIsCj4gIAkJbWluX3Np
emUgPSBrb21lZGFfZmJfZ2V0X3BpeGVsX2FkZHIoa2ZiLCAwLCBmYi0+aGVpZ2h0LCBpKQo+ICAJ
CQkgLSB0b19kcm1fZ2VtX2NtYV9vYmoob2JqKS0+cGFkZHI7Cj4gIAkJaWYgKG9iai0+c2l6ZSA8
IG1pbl9zaXplKSB7Cj4gLQkJCURSTV9ERUJVR19LTVMoIlRoZSBmYi0+b2JqWyVkXSBzaXplOiAl
bGQgbG93ZXIgdGhhbiB0aGUgbWluaW11bSByZXF1aXJlbWVudDogJWQuXG4iLAo+ICsJCQlEUk1f
REVCVUdfS01TKCJUaGUgZmItPm9ialslZF0gc2l6ZTogMHglenggbG93ZXIgdGhhbiB0aGUgbWlu
aW11bSByZXF1aXJlbWVudDogMHglbGx4LlxuIiwKPiAgCQkJCSAgICAgIGksIG9iai0+c2l6ZSwg
bWluX3NpemUpOwo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gLS0gCj4gMi4xNy4xCj4g
CgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUg
d29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3Vy
Y2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
