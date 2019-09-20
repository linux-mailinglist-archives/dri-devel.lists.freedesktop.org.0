Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F7B975A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 20:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924846FD91;
	Fri, 20 Sep 2019 18:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49976FD90;
 Fri, 20 Sep 2019 18:48:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 11:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="199814260"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 20 Sep 2019 11:48:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2019 21:48:38 +0300
Date: Fri, 20 Sep 2019 21:48:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/i915: YCbCr output fixes and prep work for
 YCbCr 4:4:4 output
Message-ID: <20190920184838.GG1208@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDU6NTA6NDFQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IEkgd2FzIHBsYXlpbmcgYXJvdW5kIHdpdGggWUNiQ3IgNDo0OjQgb3V0cHV0IGFu
ZCBub3RpY2VkIHNldmVyYWwKPiB0aGluZ3Mgd3JvbmcgaW4gb3VyIGNvZGUuIFNvIEkgZml4ZWQg
aXQgYWxsIGFuZCB0b3NzZWQgaW4gdGhlIAo+IHByZXAgd29yayBmb3IgWUNiQ3IgNDo0OjQgb3V0
cHV0IG9uIGlsaysuCj4gCj4gVmlsbGUgU3lyasOkbMOkICgxMik6Cj4gICBkcm0vZHA6IEFkZCBk
ZWZpbml0b25zIGZvciBNU0EgTUlTQyBiaXRzCgpeIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Cgo+
ICAgZHJtL2k5MTU6IFN3aXRjaCB0byB1c2luZyBEUF9NU0FfTUlTQ18qIGRlZmluZXMKCl4gb24g
aG9sZCB1bnRpbCB0aGUgZmlyc3QgcGF0Y2ggcHJvcGFnYXRlcyB0byBkaW5xLgoKPiAgIGRybS9p
OTE1OiBGaXggSFNXKyBEUCBNU0EgWUNiQ3IgY29sb3JzcGFjZSBpbmRpY2F0aW9uCj4gICBkcm0v
aTkxNTogRml4IEFWSSBpbmZvZnJhbWUgcXVhbnRpemF0aW9uIHJhbmdlIGZvciBZQ2JDciBvdXRw
dXQKPiAgIGRybS9pOTE1OiBFeHRyYWN0IGludGVsX2hkbWlfbGltaXRlZF9jb2xvcl9yYW5nZSgp
Cj4gICBkcm0vaTkxNTogTmV2ZXIgc2V0IGxpbWl0ZWRfY29sb3JfcmFuZ2U9dHJ1ZSBmb3IgWUNi
Q3Igb3V0cHV0Cj4gICBkcm0vaTkxNTogRG9uJ3QgbG9vayBhdCB1bnJlbGF0ZWQgUElQRUNPTkYg
Yml0cyBmb3IgaW50ZXJsYWNlZCByZWFkb3V0Cj4gICBkcm0vaTkxNTogU2ltcGxpZnkgaW50ZWxf
Z2V0X2NydGNfeWNiY3JfY29uZmlnKCkKPiAgIGRybS9pOTE1OiBBZGQgUElQRUNPTkYgWUNiQ3Ig
NDo0OjQgcHJvZ3JhbW1pbmcgZm9yIEhTVwo+ICAgZHJtL2k5MTU6IERvY3VtZW50IElMSysgcGlw
ZSBjc2MgbWF0cml4IGJldHRlcgo+ICAgZHJtL2k5MTU6IFNldCB1cCBJTEsvU05CIGNzYyB1bml0
IHByb3Blcmx5IGZvciBZQ2JDciBvdXRwdXQKPiAgIGRybS9pOTE1OiBBZGQgUElQRUNPTkYgWUNi
Q3IgNDo0OjQgcHJvZ3JhbW1pbmcgZm9yIElMSy1JVkIKClRoZSByZXN0IHB1c2hlZCB0byBkaW5x
LCB3aXRoIHR5cG9zIGZpeGVkLiBUaGFua3MgZm9yIHRoZSByZXZpZXcuCgo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgICB8ICA1MSArKysrKystLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jICAgICB8ICAyOCArKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDEyMCArKysr
KysrKysrKystLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YyAgICAgIHwgIDEwICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRt
aS5jICAgIHwgIDYxICsrKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcu
aCAgICAgICAgICAgICAgfCAgMzEgKystLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
ICAgICAgICAgICAgICAgICAgfCAgNDIgKysrKysrKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDI0NyBp
bnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjIxLjAKCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
