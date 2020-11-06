Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B772A95E5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 12:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACCB6EA85;
	Fri,  6 Nov 2020 11:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E0D6EA6D;
 Fri,  6 Nov 2020 11:59:22 +0000 (UTC)
IronPort-SDR: WTKtVKM6ov/ggVH6sPmgRunwwsGEIiLpvwMMMRdg8TUq0GG0c6MKrGjIsspCoipycn0cga3LLI
 HYPcFcn2f/oA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="231163603"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="231163603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:59:21 -0800
IronPort-SDR: YTqXGmH3rKRZw8Fd4y8xdm4gy7IVdeoPghd6DMBZ4AWFliAARFyJrmexBnH7XfS1WNQ9P2OV8D
 L/IwAU8OV3Xg==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="326393170"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:59:18 -0800
Date: Fri, 6 Nov 2020 17:30:03 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 03/16] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Message-ID: <20201106120003.GD13128@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-4-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-4-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMC0yNyBhdCAyMjoxMTo1NSArMDUzMCwgQW5zaHVtYW4gR3VwdGEgd3JvdGU6Cj4g
SGFuZGxlIENQX0lSUSBpbiBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SX0VTSTAKPiBJdCByZXF1
aXJlcyB0byBjYWxsIGludGVsX2hkY3BfaGFuZGxlX2NwX2lycSgpIGluIGNhc2UKPiBvZiBDUF9J
UlEgaXMgdHJpZ2dlcmVkIGJ5IGEgc2luayBpbiBEUC1NU1QgdG9wb2xvZ3kuCj4gCj4gQ2M6ICJW
aWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogUmFt
YWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBVbWEgU2hh
bmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFtYWxpbmdhbSBDIDxy
YW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEd1cHRhIDxh
bnNodW1hbi5ndXB0YUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYyB8IDE0ICsrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYwo+IGluZGV4IDgxOGRhYWIyNTJmMy4uMjFjNmM5ODI4Y2Q3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IEBAIC01NjU3LDYgKzU2
NTcsMTcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHBfaGFuZGxlX3Rlc3RfcmVxdWVzdChzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwKQo+ICAJCQkgICAgIkNvdWxkIG5vdCB3cml0ZSB0ZXN0IHJlc3Bv
bnNlIHRvIHNpbmtcbiIpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZAo+ICtpbnRlbF9kcF9tc3Rf
aHBkX2lycShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCB1OCAqZXNpLCBib29sICpoYW5kbGVk
KQo+ICt7Cj4gKwkJZHJtX2RwX21zdF9ocGRfaXJxKCZpbnRlbF9kcC0+bXN0X21nciwgZXNpLCBo
YW5kbGVkKTsKPiArCj4gKwkJaWYgKGVzaVsxXSAmIERQX0NQX0lSUSkgewo+ICsJCQlpbnRlbF9o
ZGNwX2hhbmRsZV9jcF9pcnEoaW50ZWxfZHAtPmF0dGFjaGVkX2Nvbm5lY3Rvcik7Cj4gKwkJCSpo
YW5kbGVkID0gdHJ1ZTsKPiArCQl9Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBpbnRlbF9kcF9jaGVj
a19tc3Rfc3RhdHVzIC0gc2VydmljZSBhbnkgcGVuZGluZyBNU1QgaW50ZXJydXB0cywgY2hlY2sg
bGluayBzdGF0dXMKPiAgICogQGludGVsX2RwOiBJbnRlbCBEUCBzdHJ1Y3QKPiBAQCAtNTcwMSw3
ICs1NzEyLDggQEAgaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmlu
dGVsX2RwKQo+ICAKPiAgCQlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiZ290IGVzaSAlM3BoXG4i
LCBlc2kpOwo+ICAKPiAtCQlkcm1fZHBfbXN0X2hwZF9pcnEoJmludGVsX2RwLT5tc3RfbWdyLCBl
c2ksICZoYW5kbGVkKTsKPiArCQlpbnRlbF9kcF9tc3RfaHBkX2lycShpbnRlbF9kcCwgZXNpLCAm
aGFuZGxlZCk7Cj4gKwo+ICAJCWlmICghaGFuZGxlZCkKPiAgCQkJYnJlYWs7Cj4gIAo+IC0tIAo+
IDIuMjYuMgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
