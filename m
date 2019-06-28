Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D2598EC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 13:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA41F6E8D8;
	Fri, 28 Jun 2019 11:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944226E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:00:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 04:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="361035901"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2019 04:00:55 -0700
Date: Fri, 28 Jun 2019 09:32:15 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: connector: remove bogus NULL check
Message-ID: <20190628040215.GA24852@intel.com>
References: <20190628103925.2686249-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628103925.2686249-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yOCBhdCAxMjozOTowNSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBt
b2RlLT5uYW1lIGlzIGEgY2hhcmFjdGVyIGFycmF5IGluIGEgc3RydWN0dXJlLCBjaGVja2luZyBp
dCdzCj4gYWRkcmVzcyBpcyBwb2ludGxlc3MgYW5kIGNhdXNlcyBhIHdhcm5pbmcgd2l0aCBzb21l
IGNvbXBpbGVyczoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jOjE0NDoxNTog
ZXJyb3I6IGFkZHJlc3Mgb2YgYXJyYXkgJ21vZGUtPm5hbWUnIHdpbGwgYWx3YXlzIGV2YWx1YXRl
IHRvICd0cnVlJwo+ICAgICAgIFstV2Vycm9yLC1XcG9pbnRlci1ib29sLWNvbnZlcnNpb25dCj4g
ICAgICAgICAgICAgICAgICAgICAgIG1vZGUtPm5hbWUgPyBtb2RlLT5uYW1lIDogIiIsCj4gICAg
ICAgICAgICAgICAgICAgICAgIH5+fn5+fl5+fn4gfgo+IGluY2x1ZGUvZHJtL2RybV9wcmludC5o
OjM2NjoyOTogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnRFJNX0RFQlVHX0tNUycKPiAgICAg
ICAgIGRybV9kYmcoRFJNX1VUX0tNUywgZm10LCAjI19fVkFfQVJHU19fKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KPiAKPiBSZW1vdmUgdGhlIGNoZWNr
IGhlcmUuCj4gCj4gRml4ZXM6IDNhZWViMTNkODk5NiAoImRybS9tb2RlczogU3VwcG9ydCBtb2Rl
cyBuYW1lcyBvbiB0aGUgY29tbWFuZCBsaW5lIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBpbmRleCAzYWZlZDU2Nzc5NDYuLmIzZjJj
ZjdlYWU5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+IEBAIC0xNDEsNyArMTQxLDcg
QEAgc3RhdGljIHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAo+ICAJRFJNX0RFQlVHX0tNUygiY21kbGluZSBtb2Rl
IGZvciBjb25uZWN0b3IgJXMgJXMgJWR4JWRAJWRIeiVzJXMlc1xuIiwKPiAgCQkgICAgICBjb25u
ZWN0b3ItPm5hbWUsCj4gLQkJICAgICAgbW9kZS0+bmFtZSA/IG1vZGUtPm5hbWUgOiAiIiwKPiAr
CQkgICAgICBtb2RlLT5uYW1lLApMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IFJhbWFs
aW5nYW0gQyA8cmFtbGFpbmdhbS5jQGludGVsLmNvbT4KPiAgCQkgICAgICBtb2RlLT54cmVzLCBt
b2RlLT55cmVzLAo+ICAJCSAgICAgIG1vZGUtPnJlZnJlc2hfc3BlY2lmaWVkID8gbW9kZS0+cmVm
cmVzaCA6IDYwLAo+ICAJCSAgICAgIG1vZGUtPnJiID8gIiByZWR1Y2VkIGJsYW5raW5nIiA6ICIi
LAo+IC0tIAo+IDIuMjAuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
