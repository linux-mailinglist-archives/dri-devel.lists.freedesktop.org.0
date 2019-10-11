Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEAD44FE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1826EC59;
	Fri, 11 Oct 2019 16:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE6D6EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 16:07:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 09:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="224378417"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 11 Oct 2019 09:07:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2019 19:07:34 +0300
Date: Fri, 11 Oct 2019 19:07:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 3/3] drm/atmel-hlcdc: Use swap() where appropriate
Message-ID: <20191011160734.GS1208@intel.com>
References: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
 <20191010131159.17346-3-ville.syrjala@linux.intel.com>
 <20191010152428.40458dd0@dhcp-172-31-174-146.wireless.concordia.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010152428.40458dd0@dhcp-172-31-174-146.wireless.concordia.ca>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MjQ6MjhQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIFRodSwgMTAgT2N0IDIwMTkgMTY6MTE6NTkgKzAzMDAKPiBWaWxsZSBTeXJq
YWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gCj4gPiBA
c3dhcEAKPiA+IGlkZW50aWZpZXIgVEVNUDsKPiA+IGV4cHJlc3Npb24gQSxCOwo+ID4gQEAKPiA+
IC0gVEVNUCA9IEE7Cj4gPiAtIEEgPSBCOwo+ID4gLSBCID0gVEVNUDsKPiA+ICsgc3dhcChBLCBC
KTsKPiA+IAo+ID4gQEAKPiA+IHR5cGUgVDsKPiA+IGlkZW50aWZpZXIgc3dhcC5URU1QOwo+ID4g
QEAKPiA+ICgKPiA+IC0gVCBURU1QOwo+ID4gfAo+ID4gLSBUIFRFTVAgPSB7Li4ufTsKPiA+ICkK
PiA+IC4uLiB3aGVuICE9IFRFTVAKPiA+IAo+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPiA+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4K
PiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+CgpUYS4gUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgo+IAo+ID4g
LS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMg
fCA1ICstLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0
bWVsX2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfcGxhbmUuYwo+ID4gaW5kZXggODlmNWE3NTZmYTM3Li4wMzRmMjAyZGZlOGYgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMK
PiA+IEBAIC02MDEsNyArNjAxLDYgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19wbGFuZV9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcCwKPiA+ICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIgPSBzdGF0ZS0+YmFzZS5mYjsKPiA+ICAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKm1vZGU7Cj4gPiAgCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsKPiA+IC0J
dW5zaWduZWQgaW50IHRtcDsKPiA+ICAJaW50IHJldDsKPiA+ICAJaW50IGk7Cj4gPiAgCj4gPiBA
QCAtNjk0LDkgKzY5Myw3IEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfcGxhbmVfYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnAsCj4gPiAgCSAqIFN3YXAgd2lkdGggYW5kIHNpemUgaW4g
Y2FzZSBvZiA5MCBvciAyNzAgZGVncmVlcyByb3RhdGlvbgo+ID4gIAkgKi8KPiA+ICAJaWYgKGRy
bV9yb3RhdGlvbl85MF9vcl8yNzAoc3RhdGUtPmJhc2Uucm90YXRpb24pKSB7Cj4gPiAtCQl0bXAg
PSBzdGF0ZS0+c3JjX3c7Cj4gPiAtCQlzdGF0ZS0+c3JjX3cgPSBzdGF0ZS0+c3JjX2g7Cj4gPiAt
CQlzdGF0ZS0+c3JjX2ggPSB0bXA7Cj4gPiArCQlzd2FwKHN0YXRlLT5zcmNfdywgc3RhdGUtPnNy
Y19oKTsKPiA+ICAJfQo+ID4gIAo+ID4gIAlpZiAoIWRlc2MtPmxheW91dC5zaXplICYmCgotLSAK
VmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
