Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A11F92F
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 19:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3A8920A;
	Wed, 15 May 2019 17:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 893CA8920A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 17:14:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C56380D;
 Wed, 15 May 2019 10:14:13 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8153F5AF;
 Wed, 15 May 2019 10:14:12 -0700 (PDT)
Subject: Re: [v1] drm/arm/mali-dp: Disable checking for required pixel clock
 rate
To: Wen He <wen.he_1@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>
References: <20190515024348.43642-1-wen.he_1@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3f87b2a7-c7e8-0597-2f62-d421aa6ccaa5@arm.com>
Date: Wed, 15 May 2019 18:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515024348.43642-1-wen.he_1@nxp.com>
Content-Language: en-GB
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
Cc: Leo Li <leoyang.li@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUvMDUvMjAxOSAwMzo0MiwgV2VuIEhlIHdyb3RlOgo+IERpc2FibGUgY2hlY2tpbmcgZm9y
IHJlcXVpcmVkIHBpeGVsIGNsb2NrIHJhdGUgaWYgQVJDSF9MQVlFUlNDUEFFCj4gaXMgZW5hYmxl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNvbT4KPiAtLS0KPiBjaGFuZ2Ug
aW4gZGVzY3JpcHRpb246Cj4gCS0gVGhpcyBjaGVjayB0aGF0IG9ubHkgc3VwcG9ydGVkIG9uZSBw
aXhlbCBjbG9jayByZXF1aXJlZCBjbG9jayByYXRlCj4gCWNvbXBhcmUgd2l0aCBkdHMgbm9kZSB2
YWx1ZS4gYnV0IHdlIGhhdmUgc3VwcG9ydHMgNCBwaXhlbCBjbG9jawo+IAlmb3IgbHMxMDI4YSBi
b2FyZC4KPiAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2NydGMuYyB8IDIgKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfY3J0
Yy5jCj4gaW5kZXggNTZhYWQyODg2NjZlLi5iYjc5MjIzZDk5ODEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfY3J0Yy5jCj4gQEAgLTM2LDExICszNiwxMyBAQCBzdGF0aWMgZW51bSBkcm1fbW9k
ZV9zdGF0dXMgbWFsaWRwX2NydGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4g
ICAKPiAgIAlpZiAocmVxX3JhdGUpIHsKPiAgIAkJcmF0ZSA9IGNsa19yb3VuZF9yYXRlKGh3ZGV2
LT5weGxjbGssIHJlcV9yYXRlKTsKPiArI2lmbmRlZiBDT05GSUdfQVJDSF9MQVlFUlNDQVBFCgpX
aGF0IGFib3V0IG11bHRpcGxhdGZvcm0gYnVpbGRzPyBUaGUga2VybmVsIGNvbmZpZyBkb2Vzbid0
IHRlbGwgeW91IHdoYXQgCmhhcmR3YXJlIHlvdSdyZSBhY3R1YWxseSBydW5uaW5nIG9uLgoKUm9i
aW4uCgo+ICAgCQlpZiAocmF0ZSAhPSByZXFfcmF0ZSkgewo+ICAgCQkJRFJNX0RFQlVHX0RSSVZF
UigicHhsY2xrIGRvZXNuJ3Qgc3VwcG9ydCAlbGQgSHpcbiIsCj4gICAJCQkJCSByZXFfcmF0ZSk7
Cj4gICAJCQlyZXR1cm4gTU9ERV9OT0NMT0NLOwo+ICAgCQl9Cj4gKyNlbmRpZgo+ICAgCX0KPiAg
IAo+ICAgCXJldHVybiBNT0RFX09LOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
