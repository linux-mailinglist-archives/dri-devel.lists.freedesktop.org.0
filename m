Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4047310D840
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 17:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0996289D89;
	Fri, 29 Nov 2019 16:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF589D89
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 16:07:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42FE5292AB2;
 Fri, 29 Nov 2019 16:07:37 +0000 (GMT)
Date: Fri, 29 Nov 2019 17:07:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 8/8] drm/panfrost: Make sure the shrinker does not
 reclaim referenced BOs
Message-ID: <20191129170734.50bb02ad@collabora.com>
In-Reply-To: <64a6a09a-e83a-05be-8576-79a74f971286@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-9-boris.brezillon@collabora.com>
 <64a6a09a-e83a-05be-8576-79a74f971286@arm.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxNTo0ODoxNSArMDAwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gVXNlcnNwYWNlIG1pZ2h0IHRhZyBhIEJPIHB1cmdlYWJsZSB3aGlsZSBp
dCdzIHN0aWxsIHJlZmVyZW5jZWQgYnkgR1BVCj4gPiBqb2JzLiBXZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSB0aGUgc2hyaW5rZXIgZG9lcyBub3QgcHVyZ2Ugc3VjaCBCT3MgdW50aWwKPiA+IGFsbCBqb2Jz
IHJlZmVyZW5jaW5nIGl0IGFyZSBmaW5pc2hlZC4KPiA+IAo+ID4gRml4ZXM6IDAxM2I2NTEwMTMx
NSAoImRybS9wYW5mcm9zdDogQWRkIG1hZHZpc2UgYW5kIHNocmlua2VyIHN1cHBvcnQiKQo+ID4g
Q2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJl
emlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gIAo+IAo+IEknbSBoYXBweSB3
aXRoIHRoaXMsIGJ1dCBJIHdvdWxkIGFsc28gYXJndWUgdGhhdCBpdCB3YXMgcHJldmlvdXNseSB1
c2VyCj4gc3BhY2UncyBqb2Igbm90IHRvIG1hcmsgYSBCTyBwdXJnZWFibGUgd2hpbGUgaXQncyBp
biB1c2UgYnkgdGhlIEdQVS4KCkkgd2FzIG5vdCBhd2FyZSBvZiB0aGlzIGRlc2lnbiBjaG9pY2Uu
Cgo+IFRoaXMgaXMgaW4gc29tZSB3YXlzIGFuIEFCSSBjaGFuZ2Ugc28gd2Ugc2hvdWxkIGJlIHN1
cmUgdGhpcyBpcwo+IHNvbWV0aGluZyB0aGF0IHdlIHdhbnQgdG8gc3VwcG9ydCAiZm9yZXZlciIg
bW9yZS4KCldlbGwsIGluIHRoYXQgY2FzZSwgdGhlIEFCSSBjaGFuZ2UgaXMgYnJpbmdpbmcgZXh0
cmEgcm9idXN0bmVzcywgd2l0aApBRkFJQ1QsIG5vIGRvd25zaWRlIGZvciB0aG9zZSB0aGF0IHdl
cmUgdGFraW5nIGNhcmUgb2YgdGhhdCBpbgp1c2Vyc3BhY2UuCgo+IEJ1dCBpZiBNZXNhIGhhcwo+
ICdhbHdheXMnIGJlZW4gYXNzdW1pbmcgdGhpcyBiZWhhdmlvdXIgd2UgbWlnaHQgYXMgd2VsbCBt
YXRjaC4KCkkgdGhpbmsgc28sIGFuZCBWQzQgc2VlbXMgdG8gaGF2ZSB0aGUgc2FtZSBleHBlY3Rh
dGlvbnMuCgo+IAo+IFJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
