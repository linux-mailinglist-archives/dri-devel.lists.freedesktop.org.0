Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95BD177992
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA516EA7E;
	Tue,  3 Mar 2020 14:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAB86EA7E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:51:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="287006784"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 03 Mar 2020 06:51:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:51:09 +0200
Date: Tue, 3 Mar 2020 16:51:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 03/33] drm/panel-feixin-k101-im2ba02: Fix dotclock
Message-ID: <20200303145109.GW13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-4-ville.syrjala@linux.intel.com>
 <43A69486-0A19-41CF-B7DD-56489D8E6DB6@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43A69486-0A19-41CF-B7DD-56489D8E6DB6@aosc.io>
X-Patchwork-Hint: comment
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDc6MzY6MzVBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiAKPiAKPiDkuo4gMjAyMOW5tDPmnIgz5pelIEdNVCswODowMCDkuIrljYg0OjM0OjIy
LCBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4g5YaZ5YiwOgo+
ID5Gcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
ID4KPiA+VGhlIGN1cnJlbnRseSBsaXN0ZWQgZG90Y2xvY2sgZGlzYWdyZWVzIHdpdGggdGhlIGN1
cnJlbnRseQo+ID5saXN0ZWQgdnJlZnJlc2ggcmF0ZS4gQ2hhbmdlIHRoZSBkb3RjbG9jayB0byBt
YXRjaCB0aGUgdnJlZnJlc2guCj4gPgo+ID5Tb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhl
cikgb2YgdGhlIGRvdGNsb2NrIG9yIHZyZXJlc2ggaXMKPiA+Y29ycmVjdD8KPiAKPiBkb3RjbG9j
ayBpcyBjb3JyZWN0IGFuZCB2cmVmcmVzaCBpcyBvbmx5IGEgcGxhY2Vob2xkZXIgdmFsdWUuCgpU
aGFua3MuIEknbGwgZHJvcCB0aGlzIG9uZS4KCj4gCj4gPgo+ID5DYzogSWNlbm93eSBaaGVuZyA8
aWNlbm93eUBhb3NjLmlvPgo+ID5DYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
ID5TaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+ID4tLS0KPiA+IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1mZWl4aW4tazEw
MS1pbTJiYTAyLmMgfCAyICstCj4gPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+Cj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtZmVpeGluLWsxMDEtaW0yYmEwMi5jCj4gPmIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWZlaXhpbi1rMTAxLWltMmJhMDIuYwo+ID5pbmRleCBmZGRiZmRkZjY1NjYuLjhkZWJlZTg1ZjRl
YyAxMDA2NDQKPiA+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWZlaXhpbi1rMTAx
LWltMmJhMDIuYwo+ID4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVpeGluLWsx
MDEtaW0yYmEwMi5jCj4gPkBAIC0zOTEsNyArMzkxLDcgQEAgc3RhdGljIGludCBrMTAxX2ltMmJh
MDJfdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwKPiA+KnBhbmVsKQo+ID4gfQo+ID4gCj4gPiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgazEwMV9pbTJiYTAyX2RlZmF1bHRf
bW9kZSA9IHsKPiA+LQkuY2xvY2sgPSA3MDAwMCwKPiA+KwkuY2xvY2sgPSA2NzI4NiwKPiA+IAku
dnJlZnJlc2ggPSA2MCwKPiA+IAo+ID4gCS5oZGlzcGxheSA9IDgwMCwKPiAKPiAtLSAKPiDkvb/n
lKggSy05IE1haWwg5Y+R6YCB6Ieq5oiR55qEQW5kcm9pZOiuvuWkh+OAggoKLS0gClZpbGxlIFN5
cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
