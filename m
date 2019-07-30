Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1A7A161
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 08:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDAE89F92;
	Tue, 30 Jul 2019 06:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35A689F92
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:40:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8A1C28034E;
 Tue, 30 Jul 2019 08:39:57 +0200 (CEST)
Date: Tue, 30 Jul 2019 08:39:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 14/19] drm/tilcdc: drop use of drmP.h
Message-ID: <20190730063956.GA12880@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-15-sam@ravnborg.org>
 <d6e5b692-7d6f-3657-c9f8-5f0dbd38abca@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6e5b692-7d6f-3657-c9f8-5f0dbd38abca@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=QX4gbG5DAAAA:8 a=sozttTNsAAAA:8 a=mRwM-5ZJ65wZd6XEKI4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=aeg5Gbbo78KNqacMgKqU:22
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaS4KCk9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDA5OjAzOjExQU0gKzAzMDAsIEp5cmkg
U2FyaGEgd3JvdGU6Cj4gT24gMTYvMDcvMjAxOSAwOTo0MiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+
ID4gRHJvcHBlZCBkcm1QLmggYW5kIGFsbCBvdGhlciBoZWFkZXIgZmlsZXMgbm90IHVzZWQgYnkg
dGlsY2RjX2Rydi5oLgo+ID4gQWRkZWQgdGhlIG1pbmltYWwgaW5jbHVkZXMgYW5kIGZvcndhcmRz
IHRvIG1ha2UgdGhlIGhlYWRlciBmaWxlCj4gPiBzZWxmLWNvbnRhaW5lZC4KPiA+IAo+ID4gVGhl
biBkcm9wcGVkIHRoZSByZW1haW5pbmcgdXNlcyBvZiBkcm1QLmggYW5kIGZpeGVkIGFsbCBmYWxs
LW91dC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+ID4gQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5j
b20+Cj4gPiBDYzogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiA+IENjOiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gCj4g
QWNrZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+ClRoYW5rcy4gUGF0Y2ggaXMgYWxy
ZWFkeSBhcHBsaWVkIHNvIHRvbyBsYXRlIHRvIGFkZCB5b3VyIGFjayB0byB0aGUKY2hhbmdlbG9n
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
