Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2245BF8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C320896E7;
	Fri, 14 Jun 2019 12:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEEA896A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:00:08 +0000 (UTC)
Received: from we0305.dip.tu-dresden.de ([141.76.177.49] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hbksE-0004tR-OY; Fri, 14 Jun 2019 14:00:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: sandor.yu@nxp.com
Subject: Re: [PATCH] DRM: Rockchip: correct rate in the struct drm_dp_link
 assignment
Date: Fri, 14 Jun 2019 14:00:02 +0200
Message-ID: <2220301.J5gVQTtD0X@phil>
In-Reply-To: <20190605080424.28731-1-sandor.yu@nxp.com>
References: <20190605080424.28731-1-sandor.yu@nxp.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, Sandor Yu <Sandor.yu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBbSBNaXR0d29jaCwgNS4gSnVuaSAyMDE5LCAxMDowNDoyNCBDRVNUIHNjaHJpZWIgc2Fu
ZG9yLnl1QG54cC5jb206Cj4gRnJvbTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4KPiAK
PiB2YXJpYWJsZSBvZiByYXRlIGluIHRoZSBzdHJ1Y3QgZHJtX2RwX2xpbmsgc2hvdWxkIGFzc2ln
biB0bwo+IDE2MjAwMC8yNzAwMDAvNTQwMDAwLzgxMDAwMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
YW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29tPgoKYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0IGFm
dGVyIGZpeGluZyBwYXRjaCBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbgp0byBiZSBpbiBsaW5lIHdp
dGggc3Vic3lzdGVtIGNvbnZlbnRpb25zOgpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0tbWlzYy9jb21taXQvP2lkPWRlODVlYzI3MWE4NjRjMDVlOTlhZDVmZmJlZDllOTVkMWI2
NWM3NTcKClRoYW5rcwpIZWlrbwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nk
bi1kcC1yZWcuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
Y2RuLWRwLXJlZy5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1yZWcuYwo+IGlu
ZGV4IDZjOGIxNGYuLjBhMmFlYmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2Nkbi1kcC1yZWcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAt
cmVnLmMKPiBAQCAtNTQzLDcgKzU0Myw3IEBAIHN0YXRpYyBpbnQgY2RuX2RwX2dldF90cmFpbmlu
Z19zdGF0dXMoc3RydWN0IGNkbl9kcF9kZXZpY2UgKmRwKQo+ICAJaWYgKHJldCkKPiAgCQlnb3Rv
IGVycl9nZXRfdHJhaW5pbmdfc3RhdHVzOwo+ICAKPiAtCWRwLT5saW5rLnJhdGUgPSBzdGF0dXNb
MF07Cj4gKwlkcC0+bGluay5yYXRlID0gZHJtX2RwX2J3X2NvZGVfdG9fbGlua19yYXRlKHN0YXR1
c1swXSk7Cj4gIAlkcC0+bGluay5udW1fbGFuZXMgPSBzdGF0dXNbMV07Cj4gIAo+ICBlcnJfZ2V0
X3RyYWluaW5nX3N0YXR1czoKPiBAQCAtNjQ3LDcgKzY0Nyw3IEBAIGludCBjZG5fZHBfY29uZmln
X3ZpZGVvKHN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCkKPiAgCWJpdF9wZXJfcGl4ID0gKHZpZGVv
LT5jb2xvcl9mbXQgPT0gWUNCQ1JfNF8yXzIpID8KPiAgCQkgICAgICAodmlkZW8tPmNvbG9yX2Rl
cHRoICogMikgOiAodmlkZW8tPmNvbG9yX2RlcHRoICogMyk7Cj4gIAo+IC0JbGlua19yYXRlID0g
ZHJtX2RwX2J3X2NvZGVfdG9fbGlua19yYXRlKGRwLT5saW5rLnJhdGUpIC8gMTAwMDsKPiArCWxp
bmtfcmF0ZSA9IGRwLT5saW5rLnJhdGUgLyAxMDAwOwo+ICAKPiAgCXJldCA9IGNkbl9kcF9yZWdf
d3JpdGUoZHAsIEJORF9IU1lOQzJWU1lOQywgVklGX0JZUEFTU19JTlRFUkxBQ0UpOwo+ICAJaWYg
KHJldCkKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
