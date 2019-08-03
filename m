Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE147806CD
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 16:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF946E513;
	Sat,  3 Aug 2019 14:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA36E513
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 14:46:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C05F320024;
 Sat,  3 Aug 2019 16:46:57 +0200 (CEST)
Date: Sat, 3 Aug 2019 16:46:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v1 22/33] drm/tilcdc: drop use of drmP.h
Message-ID: <20190803144656.GA23231@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-23-sam@ravnborg.org>
 <f75e0391-d77b-e3f8-f348-07b0d69cda21@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f75e0391-d77b-e3f8-f348-07b0d69cda21@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=sozttTNsAAAA:8 a=rOBnNCOmiPgZh8KOiZIA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=aeg5Gbbo78KNqacMgKqU:22
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaQoKT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDE6MDM6NTFQTSArMDMwMCwgSnlyaSBT
YXJoYSB3cm90ZToKPiBPbiAzMC8wNi8yMDE5IDA5OjE5LCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4g
PiBEcm9wcGVkIGRybVAuaCBhbmQgYWxsIG90aGVyIGhlYWRlciBmaWxlcyBub3QgdXNlZCBieSB0
aWxjZGNfZHJ2LmguCj4gPiBBZGRlZCB0aGUgbWluaW1hbCBpbmNsdWRlcyBhbmQgZm9yd2FyZHMg
dG8gbWFrZSB0aGUgaGVhZGVyIGZpbGUKPiA+IHNlbGYtY29udGFpbmVkLgo+ID4gCj4gPiBUaGVu
IGRyb3BwZWQgdGhlIHJlbWFpbmluZyB1c2VzIG9mIGRybVAuaCBhbmQgZml4ZWQgYWxsIGZhbGwt
b3V0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gPiBDYzogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiA+IENjOiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gCj4g
QWNrZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gCj4gSSBhc3N1bWUgdGhlIHNl
cmllcyBpcyBnb2luZyB0byBiZSBtZXJnZWQgYXMgYSB3aG9sZSwgYW5kIEkgZG8gbm90IG5lZWQK
PiB0byBwaWNrIGl0LgpDb3JyZWN0LCBpbiBmYWN0IGl0IGlzIGFscmVhZHkgYXBwbGllZC4KU28g
dGlsY2RjIG5vIGxvbmdlciBoYXMgYW55IGRybVAgZGVwZW5kZW5jaWVzIGxlZnQuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
