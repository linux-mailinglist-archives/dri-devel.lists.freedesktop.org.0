Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D5C1C414
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC50892C1;
	Tue, 14 May 2019 07:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A01C89C08
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 13:12:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFF280D;
 Mon, 13 May 2019 06:12:24 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71B983F720;
 Mon, 13 May 2019 06:12:23 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Add missing _fini() calls in
 panfrost_device_fini()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
References: <20190513081734.911-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f27b2af0-2e03-b1ac-fa6b-ec72475bf3ce@arm.com>
Date: Mon, 13 May 2019 14:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513081734.911-1-boris.brezillon@collabora.com>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
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

T24gMTMvMDUvMjAxOSAwOToxNywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IHBhbmZyb3N0X3tq
b2IsbW11LGdwdSxyZXNldH1fZmluaSgpIHdlcmUgbWlzc2luZy4KPiAKPiBGaXhlczogZjNiYTkx
MjI4ZThlICgiZHJtL3BhbmZyb3N0OiBBZGQgaW5pdGlhbCBwYW5mcm9zdCBkcml2ZXIiKQo+IFNp
Z25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+CgpSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8IDQgKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+IGluZGV4IDk3MGY2NjljNmQyOS4uM2IyYmNl
ZDFiMDE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2Uu
Ywo+IEBAIC0xNjUsNiArMTY1LDEwIEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgCj4gIHZvaWQgcGFuZnJvc3RfZGV2aWNlX2Zpbmko
c3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIHsKPiArCXBhbmZyb3N0X2pvYl9maW5p
KHBmZGV2KTsKPiArCXBhbmZyb3N0X21tdV9maW5pKHBmZGV2KTsKPiArCXBhbmZyb3N0X2dwdV9m
aW5pKHBmZGV2KTsKPiArCXBhbmZyb3N0X3Jlc2V0X2ZpbmkocGZkZXYpOwo+ICAJcGFuZnJvc3Rf
cmVndWxhdG9yX2ZpbmkocGZkZXYpOwo+ICAJcGFuZnJvc3RfY2xrX2ZpbmkocGZkZXYpOwo+ICB9
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
