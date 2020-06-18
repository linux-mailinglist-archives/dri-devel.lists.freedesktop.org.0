Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36C1FF16B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 14:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9750C6E3EB;
	Thu, 18 Jun 2020 12:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDD676E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 12:14:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 516561045;
 Thu, 18 Jun 2020 05:14:07 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30A003F71F;
 Thu, 18 Jun 2020 05:14:07 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id E2260682412; Thu, 18 Jun 2020 13:14:05 +0100 (BST)
Date: Thu, 18 Jun 2020 13:14:05 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
Message-ID: <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
References: <20200618100400.11464-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618100400.11464-1-colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMTE6MDQ6MDBBTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgoKSGkg
Q29saW4sCgo+IAo+IFNoaWZ0aW5nIHRoZSBpbnRlZ2VyIHZhbHVlIDEgaXMgZXZhbHVhdGVkIHVz
aW5nIDMyLWJpdCBhcml0aG1ldGljCj4gYW5kIHRoZW4gdXNlZCBpbiBhbiBleHByZXNzaW9uIHRo
YXQgZXhwZWN0cyBhIGxvbmcgdmFsdWUgbGVhZHMgdG8KPiBhIHBvdGVudGlhbCBpbnRlZ2VyIG92
ZXJmbG93LgoKSSdtIGFmcmFpZCB0aGlzIGV4cGxhbmF0aW9uIG1ha2VzIG5vIHNlbnNlIHRvIG1l
LiBEbyB5b3UgY2FyZSB0byBleHBsYWluIGJldHRlciB3aGF0CnlvdSB0aGluayB0aGUgaXNzdWUg
aXM/IElmIHRoZSBzaGlmdCBpcyBkb25lIGFzIDMyLWJpdCBhcml0aG1ldGljIGFuZCB0aGVuIHBy
b21vdGVkCnRvIGxvbmcgaG93IGRvZXMgdGhlIG92ZXJmbG93IGhhcHBlbj8KCkJlc3QgcmVnYXJk
cywKTGl2aXUKCj4gRml4IHRoaXMgYnkgdXNpbmcgdGhlIEJJVCBtYWNybyB0bwo+IHBlcmZvcm0g
dGhlIHNoaWZ0IHRvIGF2b2lkIHRoZSBvdmVyZmxvdy4KPiAKPiBBZGRyZXNzZXMtQ292ZXJpdHk6
ICgiVW5pbnRlbnRpb25hbCBpbnRlZ2VyIG92ZXJmbG93IikKPiBGaXhlczogYWQ0OWY4NjAyZmU4
ICgiZHJtL2FybTogQWRkIHN1cHBvcnQgZm9yIE1hbGkgRGlzcGxheSBQcm9jZXNzb3JzIikKPiBT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9tYWxpZHBfcGxhbmVzLmMKPiBpbmRleCAzNzcxNWNjNjA2NGUuLmFiNDVhYzQ0NTA0NSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jCj4gQEAgLTkyOCw3ICs5MjgsNyBA
QCBpbnQgbWFsaWRwX2RlX3BsYW5lc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4gIAlj
b25zdCBzdHJ1Y3QgbWFsaWRwX2h3X3JlZ21hcCAqbWFwID0gJm1hbGlkcC0+ZGV2LT5ody0+bWFw
Owo+ICAJc3RydWN0IG1hbGlkcF9wbGFuZSAqcGxhbmUgPSBOVUxMOwo+ICAJZW51bSBkcm1fcGxh
bmVfdHlwZSBwbGFuZV90eXBlOwo+IC0JdW5zaWduZWQgbG9uZyBjcnRjcyA9IDEgPDwgZHJtLT5t
b2RlX2NvbmZpZy5udW1fY3J0YzsKPiArCXVuc2lnbmVkIGxvbmcgY3J0Y3MgPSBCSVQoZHJtLT5t
b2RlX2NvbmZpZy5udW1fY3J0Yyk7Cj4gIAl1bnNpZ25lZCBsb25nIGZsYWdzID0gRFJNX01PREVf
Uk9UQVRFXzAgfCBEUk1fTU9ERV9ST1RBVEVfOTAgfCBEUk1fTU9ERV9ST1RBVEVfMTgwIHwKPiAg
CQkJICAgICAgRFJNX01PREVfUk9UQVRFXzI3MCB8IERSTV9NT0RFX1JFRkxFQ1RfWCB8IERSTV9N
T0RFX1JFRkxFQ1RfWTsKPiAgCXVuc2lnbmVkIGludCBibGVuZF9jYXBzID0gQklUKERSTV9NT0RF
X0JMRU5EX1BJWEVMX05PTkUpIHwKPiAtLSAKPiAyLjI3LjAucmMwCj4gCgotLSAKPT09PT09PT09
PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0
IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAt
LS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
