Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48104195CF
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 01:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12389CBE;
	Thu,  9 May 2019 23:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id A749C892B8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 16:22:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819E3374;
 Thu,  9 May 2019 09:22:57 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7424C3F6C4;
 Thu,  9 May 2019 09:22:56 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Only put sync_out if non-NULL
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20190507080405.GA9436@mwanda>
 <20190509082151.8823-1-tomeu.vizoso@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <963a53ae-5a70-3ba3-c910-889e70304032@arm.com>
Date: Thu, 9 May 2019 17:22:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509082151.8823-1-tomeu.vizoso@collabora.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 09 May 2019 23:52:27 +0000
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
Cc: David Airlie <airlied@linux.ie>, Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDUvMjAxOSAwOToyMSwgVG9tZXUgVml6b3NvIHdyb3RlOgo+IERhbiBDYXJwZW50ZXIn
cyBzdGF0aWMgYW5hbHlzaXMgdG9vbCByZXBvcnRlZDoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmM6MjIyIHBhbmZyb3N0X2lvY3RsX3N1Ym1pdCgpCj4gZXJyb3I6
IHdlIHByZXZpb3VzbHkgYXNzdW1lZCAnc3luY19vdXQnIGNvdWxkIGJlIG51bGwgKHNlZSBsaW5l
IDIxNikKPiAKPiBJbmRlZWQsIHN5bmNfb3V0IGNvdWxkIGJlIE5VTEwgaWYgdXNlcnNwYWNlIGRv
ZXNuJ3Qgc2VuZCBhIHN5bmMgb2JqZWN0Cj4gSUQgZm9yIHRoZSBvdXQgZmVuY2UuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiBS
ZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IExp
bms6IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5
LU1heS8yMTcwMTQuaHRtbAoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+IGluZGV4IDk0
YjA4MTlhZDUwYi4uZDExZTIyODFkZGU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kcnYuYwo+IEBAIC0yMTksNyArMjE5LDggQEAgc3RhdGljIGludCBwYW5mcm9zdF9p
b2N0bF9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgZmFpbF9q
b2I6Cj4gIAlwYW5mcm9zdF9qb2JfcHV0KGpvYik7Cj4gIGZhaWxfb3V0X3N5bmM6Cj4gLQlkcm1f
c3luY29ial9wdXQoc3luY19vdXQpOwo+ICsJaWYgKHN5bmNfb3V0KQo+ICsJCWRybV9zeW5jb2Jq
X3B1dChzeW5jX291dCk7Cj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
