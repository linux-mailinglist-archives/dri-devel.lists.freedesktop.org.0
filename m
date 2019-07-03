Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25AE5E5D5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 15:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C676E144;
	Wed,  3 Jul 2019 13:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFEC6E144;
 Wed,  3 Jul 2019 13:56:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C32AB28A9C9;
 Wed,  3 Jul 2019 14:56:19 +0100 (BST)
Date: Wed, 3 Jul 2019 15:56:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH] mesa: Export BOs in RW mode
Message-ID: <20190703155616.1ed02d49@collabora.com>
In-Reply-To: <CAL_JsqLb3qjzp8+9mj3SA=E_avsF7VnC=vji9YvePHvoiqgNgg@mail.gmail.com>
References: <20190703133357.10217-1-boris.brezillon@collabora.com>
 <CAL_JsqLb3qjzp8+9mj3SA=E_avsF7VnC=vji9YvePHvoiqgNgg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IDA3OjQ1OjMyIC0wNjAwClJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBXZWQsIEp1bCAzLCAyMDE5IGF0IDc6MzQgQU0gQm9yaXMg
QnJlemlsbG9uCj4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+Cj4g
PiBFeHBvcnRlZCBCT3MgbWlnaHQgYmUgaW1wb3J0ZWQgYmFjaywgdGhlbiBtbWFwKCktZWQgdG8g
YmUgd3JpdHRlbgo+ID4gdG9vLiBNb3N0IGRyaXZlcnMgaGFuZGxlIHRoYXQgYnkgbW1hcCgpLWlu
ZyB0aGUgR0VNIGhhbmRsZSBhZnRlciBpdCdzCj4gPiBiZWVuIGltcG9ydGVkLCBidXQsIGFjY29y
ZGluZyB0byBbMV0sIHRoaXMgaXMgaWxsZWdhbC4gIAo+IAo+IEl0J3Mgbm90IGlsbGVnYWwsIGJ1
dCBpcyBzdXBwb3NlZCB0byBnbyB0aHJ1IHRoZSBkbWFidWYgbW1hcAo+IGZ1bmN0aW9ucy4KClRo
YXQncyBiYXNpY2FsbHkgd2hhdCBJJ20gcHJvcG9zaW5nIGhlcmUsIGp1c3QgZGlkbid0IHBvc3Qg
dGhlIHBhdGNoCnNraXBwaW5nIHRoZSBHRVRfT0ZGU0VUIHN0ZXAgYW5kIGRvaW5nIHRoZSBtbWFw
KCkgb24gdGhlIGRtYWJ1ZiBGRAppbnN0ZWFkIG9mIHRoZSBEUk0tbm9kZSBvbmUsIGJ1dCBJIGhh
dmUgaXQgd29ya2luZyBmb3IgcGFuZnJvc3QuCgo+IEhvd2V2ZXIsIG5vbmUgb2YgdGhlIGRyaXZl
ciBJJ3ZlIGxvb2tlZCBhdCAoZXRuYXZpdiwgbXNtLAo+IHYzZCwgdmdlbSkgZG8gdGhhdC4gSXQg
cHJvYmFibHkgd29ya3MgYmVjYXVzZSBpdCdzIHRoZSBzYW1lIGRyaXZlcgo+IGRvaW5nIHRoZSBp
bXBvcnQgYW5kIGV4cG9ydCBvciBib3RoIGRyaXZlcnMgaGF2ZSBlc3NlbnRpYWxseSB0aGUgc2Ft
ZQo+IGltcGxlbWVudGF0aW9ucy4KClllcywgYnV0IG1heWJlIHRoYXQncyBzb21ldGhpbmcgd2Ug
c2hvdWxkIHN0YXJ0IGZpeGluZyBpZiBtbWFwKCktaW5nCnRoZSBkbWFidWYgaXMgdGhlIHJlY29t
bWVuZGVkIHNvbHV0aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
