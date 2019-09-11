Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68633AF98F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81B6E1F9;
	Wed, 11 Sep 2019 09:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9489DC0;
 Wed, 11 Sep 2019 09:54:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 02:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="384642060"
Received: from cmflorex-mobl2.gar.corp.intel.com (HELO [10.252.38.169])
 ([10.252.38.169])
 by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2019 02:53:55 -0700
Subject: Re: [Intel-gfx] [PATCH 05/19] drm/i915: Allow downscale factor of
 <3.0 on glk+ for all formats
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-6-ville.syrjala@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <f84f813d-02c1-3d60-d320-1f7ed7202395@linux.intel.com>
Date: Wed, 11 Sep 2019 11:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708125325.16576-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
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

T3AgMDgtMDctMjAxOSBvbSAxNDo1MyBzY2hyZWVmIFZpbGxlIFN5cmphbGE6Cj4gRnJvbTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IEJzcGVjIHNh
eXMgdGhhdCBnbGsrIG1heCBkb3duc2NhbGUgZmFjdG9yIGlzIDwzLjAgZm9yIGFsbCBwaXhlbCBm
b3JtYXRzLgo+IE9sZGVyIHBsYXRmb3JtcyBoYWQgYSBtYXggb2YgPDIuMCBmb3IgTlYxMi4gVXBk
YXRlIHRoZSBjb2RlIHRvIGRlYWwgd2l0aAo+IHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDkgKysrKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+IGluZGV4IGVlOTM1
NzdiZGY5NS4uMmI4YTZhODQ2MDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmMKPiBAQCAtMTQ0NzIsNyArMTQ0NzIsNyBAQCBza2xfbWF4X3Nj
YWxlKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+ICB7Cj4gIAlz
dHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YyA9IHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+YmFzZS5j
cnRjKTsKPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY3J0
Yy0+YmFzZS5kZXYpOwo+IC0JaW50IG1heF9zY2FsZSwgbXVsdDsKPiArCWludCBtYXhfc2NhbGU7
Cj4gIAlpbnQgY3J0Y19jbG9jaywgbWF4X2RvdGNsaywgdG1wY2xrMSwgdG1wY2xrMjsKPiAgCj4g
IAlpZiAoIWNydGNfc3RhdGUtPmJhc2UuZW5hYmxlKQo+IEBAIC0xNDQ5Myw4ICsxNDQ5MywxMSBA
QCBza2xfbWF4X3NjYWxlKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRl
LAo+ICAJICogICAgICAgICAgICBvcgo+ICAJICogICAgY2RjbGsvY3J0Y19jbG9jawo+ICAJICov
Cj4gLQltdWx0ID0gZHJtX2Zvcm1hdF9pbmZvX2lzX3l1dl9zZW1pcGxhbmFyKGZvcm1hdCkgPyAy
IDogMzsKPiAtCXRtcGNsazEgPSAoMSA8PCAxNikgKiBtdWx0IC0gMTsKPiArCWlmIChJTlRFTF9H
RU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpIHx8Cj4gKwkgICAg
IWRybV9mb3JtYXRfaW5mb19pc195dXZfc2VtaXBsYW5hcihmb3JtYXQpKQo+ICsJCXRtcGNsazEg
PSAweDMwMDAwIC0gMTsKPiArCWVsc2UKPiArCQl0bXBjbGsxID0gMHgyMDAwMCAtIDE7Cj4gIAl0
bXBjbGsyID0gKDEgPDwgOCkgKiAoKG1heF9kb3RjbGsgPDwgOCkgLyBjcnRjX2Nsb2NrKTsKPiAg
CW1heF9zY2FsZSA9IG1pbih0bXBjbGsxLCB0bXBjbGsyKTsKPiAgCgpGb3IgdGhpcyBwYXRjaCBh
bmQgNCwgNiwgNywgODoKClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKUGF0Y2ggNCBzZWVtcyB0byBiZSBleGFjdGx5IHRo
ZSBzYW1lIGFzIHRoZSBwYXRjaCBJIHdyb3RlIGZvciBpdCwgc28gbGV0cyB1cHN0cmVhbSB0aGlz
IEFTQVAgYmVmb3JlIHNvbWVvbmUgZWxzZSBkb2VzIGFzIHdlbGwuIDspCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
