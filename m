Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBA10D677
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24246E8F8;
	Fri, 29 Nov 2019 13:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF486E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:57:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 83F97292566;
 Fri, 29 Nov 2019 13:57:14 +0000 (GMT)
Date: Fri, 29 Nov 2019 14:57:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Steven Price
 <steven.price@arm.com>
Subject: Re: [PATCH] panfrost: Document base field location constraint in
 panfrost_gem_object
Message-ID: <20191129145712.550565e1@collabora.com>
In-Reply-To: <20191129133920.2435561-1-boris.brezillon@collabora.com>
References: <20191129133920.2435561-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V3JvbmcgcHJlZml4LCBzaG91bGQgYmUgImRybS9wYW5mcm9zdDogIi4gSSdsbCBzZW5kIGEgdjIg
KHNvcnJ5IGZvciB0aGUKbm9pc2UpLgoKT24gRnJpLCAyOSBOb3YgMjAxOSAxNDozOToyMCArMDEw
MApCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToK
Cj4gSSd2ZSBzcGVudCBob3VycyBjaGFzaW5nIGEgbWVtb3J5IGNvcnJ1cHRpb24gdGhhdCB3YXMg
Y2F1c2VkIGJ5Cj4gaW5zZXJ0aW9uIG9mIGFuIGV4dHJhIGZpZWxkIGZpZWxkIGJlZm9yZSAtPmJh
c2UuIExldCdzIGRvY3VtZW50IHRoZQo+IGZhY3QgdGhhdCBiYXNlIGhhcyB0byBiZSB0aGUgZmly
c3QgZmllbGQgaW4gcGFuZnJvc3RfZ2VtX29iamVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmggfCA0ICsrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZ2VtLmgKPiBpbmRleCBlOTJlYTY3ODc4ZWQuLjk3OWRmZjFlN2IwNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmgKPiBAQCAtMTAsNiArMTAsMTAgQEAKPiAg
c3RydWN0IHBhbmZyb3N0X21tdTsKPiAgCj4gIHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0IHsK
PiArCS8qCj4gKwkgKiBNdXN0IGJlIHRoZSBmaXJzdCBlbGVtZW50IGJlY2F1c2Ugd2UncmUgdXNp
bmcgc29tZSBvZiB0aGUKPiArCSAqIGRybV9nZW1fc2htZW0gaGVscGVycy4KPiArCSAqLwo+ICAJ
c3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IGJhc2U7Cj4gIAlzdHJ1Y3Qgc2dfdGFibGUgKnNn
dHM7Cj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
