Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A58148A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B116E315;
	Mon,  5 Aug 2019 08:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284BC6E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:00 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1huYpW-0000Iu-3u; Mon, 05 Aug 2019 10:58:58 +0200
Message-ID: <1564995537.3056.6.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] drm/etnaviv: implement softpin
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Mon, 05 Aug 2019 10:58:57 +0200
In-Reply-To: <20190802172953.4586-4-l.stach@pengutronix.de>
References: <20190802172953.4586-1-l.stach@pengutronix.de>
 <20190802172953.4586-4-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDE5OjI5ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBX
aXRoIHNvZnRwaW4gd2UgYWxsb3cgdGhlIHVzZXJzcGFjZSB0byB0YWtlIGNvbnRyb2wgb3ZlciB0
aGUgR1BVIHZpcnR1YWwKPiBhZGRyZXNzIHNwYWNlLiBUaGUgbmV3IGNhcGFiaWxpdHkgaXMgcmVs
ZWN0ZWQgYnkgYSBidW1wIG9mIHRoZSBtaW5vciBEUk0KPiB2ZXJzaW9uLiBUaGVyZSBhcmUgYSBm
ZXcgcmVzdHJpY3Rpb25zIGZvciB1c2Vyc3BhY2UgdG8gdGFrZSBpbnRvCj4gYWNjb3VudDoKPiAK
PiAxLiBUaGUga2VybmVsIHJlc2VydmVzIGEgYml0IG9mIHRoZSBhZGRyZXNzIHNwYWNlIHRvIGlt
cGxlbWVudCB6ZXJvIHBhZ2UKPiBmYXVsdGluZyBhbmQgbWFwcGluZyBvZiB0aGUga2VybmVsIGlu
dGVybmFsIHJpbmcgYnVmZmVyLiBVc2Vyc3BhY2UgY2FuCj4gcXVlcnkgdGhlIGtlcm5lbCBmb3Ig
dGhlIGZpcnN0IHVzYWJsZSBHUFUgVk0gYWRkcmVzcyB2aWEKPiBFVE5BVklWX1BBUkFNX1NPRlRQ
SU5fU1RBUlRfQUREUi4KPiAKPiAyLiBXZSBvbmx5IGFsbG93IHNvZnRwaW4gb24gR1BVcywgd2hp
Y2ggaW1wbGVtZW50IHByb3BlciBwcm9jZXNzCj4gc2VwYXJhdGlvbiB2aWEgUFBBUy4gSWYgc29m
dHBpbiBpcyBub3QgYXZhaWxhYmxlIHRoZSBzb2Z0cGluIHN0YXJ0Cj4gYWRkcmVzcyB3aWxsIGJl
IHNldCB0byB+MC4KPiAKPiAzLiBTb2Z0cGluIGlzIGFsbCBvciBub3RoaW5nLiBBIHN1Ym1pdCB1
c2luZyBzb2Z0cGluIG11c3Qgbm90IHVzZSBhbnkKPiBhZGRyZXNzIGZpeHVwcyB2aWEgcmVsb2Nz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmggICAgICAgIHwg
IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyAgICAgICAgfCAg
NCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmggICAgICAgIHwg
IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyB8IDI1
ICsrKysrKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z3B1LmMgICAgICAgIHwgIDkgKysrKysrKwo+ICBpbmNsdWRlL3VhcGkvZHJtL2V0bmF2aXZfZHJt
LmggICAgICAgICAgICAgICB8ICA1ICsrKy0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+IApbLi4uXQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvZHJtL2V0bmF2aXZfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2V0bmF2aXZfZHJtLmgKPiBp
bmRleCAwZDVjNDlkYzQ3OGMuLmM1NzEwNDg1NjUwYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL2V0bmF2aXZfZHJtLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2V0bmF2aXZfZHJt
LmgKPiBAQCAtNzMsNiArNzMsNyBAQCBzdHJ1Y3QgZHJtX2V0bmF2aXZfdGltZXNwZWMgewo+ICAj
ZGVmaW5lIEVUTkFWSVZfUEFSQU1fR1BVX0lOU1RSVUNUSU9OX0NPVU5UICAgICAgICAgMHgxOAo+
ICAjZGVmaW5lIEVUTkFWSVZfUEFSQU1fR1BVX05VTV9DT05TVEFOVFMgICAgICAgICAgICAgMHgx
OQo+ICAjZGVmaW5lIEVUTkFWSVZfUEFSQU1fR1BVX05VTV9WQVJZSU5HUyAgICAgICAgICAgICAg
MHgxYQo+ICsjZGVmaW5lIEVUTkFWSVZfUEFSQU1fU09GVFBJTl9TVEFSVF9BRERSICAgICAgICAg
ICAgMHgxYgo+ICAKPiAgI2RlZmluZSBFVE5BX01BWF9QSVBFUyA0Cj4gIAo+IEBAIC0xNzcsOSAr
MTc4LDExIEBAIHN0cnVjdCBkcm1fZXRuYXZpdl9nZW1fc3VibWl0X3BtciB7Cj4gICNkZWZpbmUg
RVROQV9TVUJNSVRfTk9fSU1QTElDSVQgICAgICAgICAweDAwMDEKPiAgI2RlZmluZSBFVE5BX1NV
Qk1JVF9GRU5DRV9GRF9JTiAgICAgICAgIDB4MDAwMgo+ICAjZGVmaW5lIEVUTkFfU1VCTUlUX0ZF
TkNFX0ZEX09VVCAgICAgICAgMHgwMDA0Cj4gKyNkZWZpbmUgRVROQV9TVUJNSVRfU09GVFBJTiAg
ICAgICAgICAgICAweDAwMDgKPiAgI2RlZmluZSBFVE5BX1NVQk1JVF9GTEFHUwkJKEVUTkFfU1VC
TUlUX05PX0lNUExJQ0lUIHwgXAo+ICAJCQkJCSBFVE5BX1NVQk1JVF9GRU5DRV9GRF9JTiB8IFwK
PiAtCQkJCQkgRVROQV9TVUJNSVRfRkVOQ0VfRkRfT1VUKQo+ICsJCQkJCSBFVE5BX1NVQk1JVF9G
RU5DRV9GRF9PVVR8IFwKPiArCQkJCQkgRVROQV9TVUJNSVRfU09GVFBJTikKPiAgI2RlZmluZSBF
VE5BX1BJUEVfM0QgICAgICAweDAwCj4gICNkZWZpbmUgRVROQV9QSVBFXzJEICAgICAgMHgwMQo+
ICAjZGVmaW5lIEVUTkFfUElQRV9WRyAgICAgIDB4MDIKClRoZSBwcmVzdW1lZCBmaWVsZCBvZiBk
cm1fZXRuYXZpdl9nZW1fc3VibWl0X2JvIGhhcyBhbiBlbGFib3JhdGUgY29tbWVudApvbiBpdHMg
c3VwcG9zZWQgcHJlLXNvZnRwaW4gdXNlIGluIGV0bmF2aXZfZHJtLmgsIG1heWJlIHRoYXQgc2hv
dWxkIGJlCnVwZGF0ZWQuCgpPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
