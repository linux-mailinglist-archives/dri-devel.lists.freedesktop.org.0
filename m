Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D2D1316
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619866E9F4;
	Wed,  9 Oct 2019 15:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F39B6E9F3;
 Wed,  9 Oct 2019 15:39:27 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DC5D21848;
 Wed,  9 Oct 2019 15:39:27 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191009060520.GA14506@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
 <20191009022131.604B52070B@mail.kernel.org>
 <20191009060520.GA14506@onstation.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
User-Agent: alot/0.8.1
Date: Wed, 09 Oct 2019 08:39:26 -0700
Message-Id: <20191009153927.3DC5D21848@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570635567;
 bh=wEjkXEpo6a+ocQcIoxonVZQvVfCaphW+qJXwz5ZtMwc=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=LIxH5q7g63SDPlNc7o1USkQ3yX/1C539AVpTxoDWueAXD2hFiYleI+iKtZ+1+DdB6
 mllVpxnFN4LMCLsGYUvmUD4T9fAb9/oBCmILsu0KLEpK8H1C+Iv3ATiQW9k3yZ+15+
 LL21Fvyqw1ZUgC9stZitovG1640810+YZgGK8hSU=
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Laurent.pinchart@ideasonboard.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDggMjM6MDU6MjApCj4gT24gVHVlLCBPY3Qg
MDgsIDIwMTkgYXQgMDc6MjE6MzBQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4gUXVv
dGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDYgMTg6NDU6MDgpCj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3Fjb20tbXNtODk3NC5kdHNpCj4gPiA+IGluZGV4IDdmYzIzZTQyMmNjNS4uYWYwMmVhY2UxNGUy
IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+
ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+ID4gPiBAQCAt
MTMzNSw2ICsxMzQyLDc3IEBACj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y2xvY2tzID0gPCZtbWNjIE1EU1NfQUhCX0NMSz47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiaWZhY2UiOwo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhkbWk6IGhk
bWktdHhAZmQ5MjIxMDAgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInFjb20saGRtaS10eC04OTc0IjsKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHhmZDkyMjEwMCAweDM1Yz4sCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4ZmM0YjgwMDAgMHg2MGYwPjsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAiY29yZV9w
aHlzaWNhbCIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgInFmcHJvbV9waHlzaWNhbCI7Cj4gPiAKPiA+IElzIHRoaXMgdGhlIHFmcHJvbSAidW5jb3Jy
ZWN0ZWQiIHBoeXNpY2FsIGFkZHJlc3M/IElmIHNvLCB3aHkgY2FuJ3QgdGhpcwo+ID4gbm9kZSB1
c2UgYW4gbnZtZW0gdG8gcmVhZCB3aGF0ZXZlciBpdCBuZWVkcyBvdXQgb2YgdGhlIHFmcHJvbT8K
PiAKPiBUaGUgTVNNIEhETUkgY29kZSBpcyBjb25maWd1cmVkIHRvIGxvb2sgZm9yIHRoaXMgcmVn
LW5hbWUgaGVyZToKPiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qv
c291cmNlL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMjTDU4Mgo+IAo+IFRoZXJlIGlz
IGEgcWNvbSxxZnByb20gY29uZmlndXJlZCBmb3IgdGhpcyBib2FyZCBpbiBEVFMsIGhvd2V2ZXIg
aXRzIGF0Cj4gYSBkaWZmZXJlbnQgYWRkcmVzcyByYW5nZSwgc28gbWF5YmUgdGhlcmUgYXJlIG11
bHRpcGxlIHFmcHJvbXM/Cj4gCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSNMNDI0Cj4gCj4g
bXNtODk5Ni5kdHNpIGhhcyB0aGUgc2FtZSBzdHlsZSBvZiBjb25maWd1cmF0aW9uOgo+IAo+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9hcm02NC9i
b290L2R0cy9xY29tL21zbTg5OTYuZHRzaSNMOTU2Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vbXNtODk5Ni5k
dHNpI0wxNzM2Cj4gCgpUaGVyZSdzIG9ubHkgb25lIHFmcHJvbSBhbmQgdGhlcmUncyB0aGUgYWRk
cmVzcyBzcGFjZSB0aGF0J3MKInVuY29ycmVjdGVkIiB3aGljaCBpcyBub3Qgc3VwcG9zZWQgdG8g
YmUgdXNlZCBhbmQgdGhlcmUncyB0aGUgc3BhY2UKdGhhdCBpcyAiY29ycmVjdGVkIiBhbmQgaXMg
c3VwcG9zZWQgdG8gYmUgdXNlZC4gSXQgbG9va3MgbGlrZSB0aGlzIGlzCnBva2luZyB0aGUgdW5j
b3JyZWN0ZWQgc3BhY2UgYW5kIGl0IHNob3VsZCBwcm9iYWJseSBzdG9wIGRvaW5nIHRoYXQgYW5k
CnVzZSB0aGUgbnZtZW0gcHJvdmlkZXIgaW5zdGVhZC4gTWF5YmUgc29tZW9uZSB3aXRoIGRvY3Mg
Zm9yIHRoaXMgY2hpcAphbmQgODk5NiBjYW4gaGVscCBjb25maXJtIHRoaXMuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
