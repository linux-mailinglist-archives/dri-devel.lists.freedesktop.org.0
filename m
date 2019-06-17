Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFD47E10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 11:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC638919B;
	Mon, 17 Jun 2019 09:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801408919B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:14:38 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 02:14:37 -0700
X-ExtLoop1: 1
Received: from ffonarex-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.252.2.222])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2019 02:14:36 -0700
Date: Mon, 17 Jun 2019 10:14:35 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
Message-ID: <20190617091435.35ftj5twdxpspxnr@intel.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-4-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616132343.26370-4-emil.l.velikov@gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: Niclas Zeising <zeising@daemonic.se>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuZGF5LCAyMDE5LTA2LTE2IDE0OjIzOjQzICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6
Cj4gRnJvbTogTmljbGFzIFplaXNpbmcgPHplaXNpbmdAZGFlbW9uaWMuc2U+Cj4gCj4gRnJlZUJT
RCByZXF1aXJlcyBzeXMvdHlwZXMuaCBmb3Igc3lzL3N5c2N0bC5oLCBhZGQgaXQgYXMgcGFydCBv
ZiB0aGUKPiBpbmNsdWRlcyB3aGVuIGNoZWNraW5nIGZvciBoZWFkZXJzLgo+IEluc3RlYWQgb2Yg
c3BsaXR0aW5nIG91dCB0aGUgY2hlY2sgZm9yIHN5cy9zeXNjdGwuaCBmcm9tIHRoZSBvdGhlcgo+
IGhlYWRlciBjaGVja3MsIGp1c3QgYWRkIHN5cy90eXBlcy5oIHRvIGFsbCBoZWFkZXIgY2hlY2tz
Lgo+IAo+IHYyIFtFbWlsXQo+ICAtIGFkZCBpbmxpbmUgY29tbWVudAo+ICAtIGRyb3AgYmFzaC9z
aCBodW5rCj4gCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBn
bWFpbC5jb20+CgpTZXJpZXMgaXM6ClJldmlld2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5l
bmdlc3Ryb21AaW50ZWwuY29tPgoKQnV0IEkgYWdyZWUgd2l0aCBFbWlsLCBpdCdzIGEgRnJlZUJT
RCBidWcgZm9yIGl0IHRvIG5vdCBpbmNsdWRlCmEgcmVxdWlyZWQgaGVhZGVyLCB0aGlzIHNob3Vs
ZCBhbHNvIGJlIGZpeGVkIHVwc3RyZWFtLgoKPiAtLS0KPiAgbWVzb24uYnVpbGQgfCA1ICsrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAo+IGluZGV4IGVkNDA3MDA5Li4x
NGY4MmIxZiAxMDA2NDQKPiAtLS0gYS9tZXNvbi5idWlsZAo+ICsrKyBiL21lc29uLmJ1aWxkCj4g
QEAgLTE3OSw5ICsxNzksMTIgQEAgZWxzZQo+ICAgIGRlcF9ydCA9IFtdCj4gIGVuZGlmCj4gIGRl
cF9tID0gY2MuZmluZF9saWJyYXJ5KCdtJywgcmVxdWlyZWQgOiBmYWxzZSkKPiArIyBGcm9tIE5p
Y2xhcyBaZWlzaW5nOgo+ICsjIEZyZWVCU0QgcmVxdWlyZXMgc3lzL3R5cGVzLmggZm9yIHN5cy9z
eXNjdGwuaCwgYWRkIGl0IGFzIHBhcnQgb2YgdGhlCj4gKyMgaW5jbHVkZXMgd2hlbiBjaGVja2lu
ZyBmb3IgaGVhZGVycy4KPiAgZm9yZWFjaCBoZWFkZXIgOiBbJ3N5cy9zeXNjdGwuaCcsICdzeXMv
c2VsZWN0LmgnLCAnYWxsb2NhLmgnXQo+ICAgIGNvbmZpZy5zZXQoJ0hBVkVfJyArIGhlYWRlci51
bmRlcnNjb3JpZnkoKS50b191cHBlcigpLAo+IC0gICAgY2MuY29tcGlsZXMoJyNpbmNsdWRlIDxA
MEA+Jy5mb3JtYXQoaGVhZGVyKSwgbmFtZSA6ICdAMEAgd29ya3MnLmZvcm1hdChoZWFkZXIpKSkK
PiArICAgIGNjLmNvbXBpbGVzKCcjaW5jbHVkZSA8c3lzL3R5cGVzLmg+XG4jaW5jbHVkZSA8QDBA
PicuZm9ybWF0KGhlYWRlciksIG5hbWUgOiAnQDBAIHdvcmtzJy5mb3JtYXQoaGVhZGVyKSkpCj4g
IGVuZGZvcmVhY2gKPiAgaWYgY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcs
ICdtYWpvcicpCj4gICAgY29uZmlnLnNldDEwKCdNQUpPUl9JTl9TWVNNQUNST1MnLCB0cnVlKQo+
IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
