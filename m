Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55362A2703
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43376E452;
	Mon,  2 Nov 2020 09:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A90CD6E452
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:29:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C476101E;
 Mon,  2 Nov 2020 01:29:12 -0800 (PST)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AC263F718;
 Mon,  2 Nov 2020 01:29:10 -0800 (PST)
Subject: Re: [PATCH -next] drm/panfrost: Fix unused variable warning
To: Zou Wei <zou_wei@huawei.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <1604309599-10078-1-git-send-email-zou_wei@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8729ad8d-31db-c7cd-e962-a0f7db6891b3@arm.com>
Date: Mon, 2 Nov 2020 09:29:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604309599-10078-1-git-send-email-zou_wei@huawei.com>
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

T24gMDIvMTEvMjAyMCAwOTozMywgWm91IFdlaSB3cm90ZToKPiBGaXhlcyB0aGUgZm9sbG93aW5n
IFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZzoKPiAKPiAuL3BhbmZyb3N0X2pvYi5jOjYxNzoyODog
d2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGpz4oCZIFstV3VudXNlZC12YXJpYWJsZV0KPiAg
ICBzdHJ1Y3QgcGFuZnJvc3Rfam9iX3Nsb3QgKmpzID0gcGZkZXYtPmpzOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2Np
QGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWm91IFdlaSA8em91X3dlaUBodWF3ZWkuY29t
PgoKQm9yaXMgcG9zdGVkIGFuIGlkZW50aWNhbCBwYXRjaCBlYXJsaWVyOgoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIwMTEwMTE3MzgxNy44MzE3NjktMS1ib3Jpcy5icmV6aWxsb24lNDBj
b2xsYWJvcmEuY29tCgpTdGV2ZQoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9qb2IuYyB8IDIgLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiBpbmRleCA0OTAyYmM2
Li5lNzViN2QyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9qb2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+
IEBAIC02MTMsOCArNjEzLDYgQEAgaW50IHBhbmZyb3N0X2pvYl9vcGVuKHN0cnVjdCBwYW5mcm9z
dF9maWxlX3ByaXYgKnBhbmZyb3N0X3ByaXYpCj4gICAKPiAgIHZvaWQgcGFuZnJvc3Rfam9iX2Ns
b3NlKHN0cnVjdCBwYW5mcm9zdF9maWxlX3ByaXYgKnBhbmZyb3N0X3ByaXYpCj4gICB7Cj4gLQlz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHBhbmZyb3N0X3ByaXYtPnBmZGV2Owo+IC0J
c3RydWN0IHBhbmZyb3N0X2pvYl9zbG90ICpqcyA9IHBmZGV2LT5qczsKPiAgIAlpbnQgaTsKPiAg
IAo+ICAgCWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
