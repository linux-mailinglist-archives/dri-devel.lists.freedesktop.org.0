Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1D1E6207
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180606E52C;
	Thu, 28 May 2020 13:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 294136E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:22:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B1DD6E;
 Thu, 28 May 2020 06:22:39 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617B63F52E;
 Thu, 28 May 2020 06:22:38 -0700 (PDT)
Subject: Re: [PATCH 02/15] drm/panfrost: clean headers in devfreq
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-3-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <480f0bd6-0b21-224e-2cde-09bf71870ee7@arm.com>
Date: Thu, 28 May 2020 14:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-3-peron.clem@gmail.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IERvbid0IGluY2x1
ZGUgbm90IHJlcXVpcmVkIGhlYWRlcnMgYW5kIHNvcnQgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0
ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDggKystLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggMWI1NjBiOTAzZWE2Li5k
ZjdiNzFkYTlhODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmMKPiBAQCAtMSwxOCArMSwxNCBAQAo+ICAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKPiAgIC8qIENvcHlyaWdodCAyMDE5IENvbGxhYm9yYSBsdGQuICovCj4gKwo+
ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZGV2ZnJlcS5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L2RldmZyZXFfY29vbGluZy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX29wcC5oPgo+IC0jaW5j
bHVkZSA8bGludXgvY2xrLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KPiAgIAo+ICAgI2luY2x1ZGUgInBhbmZyb3N0X2RldmljZS5oIgo+ICAgI2luY2x1ZGUgInBh
bmZyb3N0X2RldmZyZXEuaCIKPiAtI2luY2x1ZGUgInBhbmZyb3N0X2ZlYXR1cmVzLmgiCj4gLSNp
bmNsdWRlICJwYW5mcm9zdF9pc3N1ZXMuaCIKPiAtI2luY2x1ZGUgInBhbmZyb3N0X2dwdS5oIgo+
IC0jaW5jbHVkZSAicGFuZnJvc3RfcmVncy5oIgo+ICAgCj4gICBzdGF0aWMgdm9pZCBwYW5mcm9z
dF9kZXZmcmVxX3VwZGF0ZV91dGlsaXphdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
dikKPiAgIHsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
