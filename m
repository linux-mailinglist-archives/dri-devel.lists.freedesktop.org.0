Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571656E5D6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 14:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FE06E7F3;
	Fri, 19 Jul 2019 12:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A56E7F3;
 Fri, 19 Jul 2019 12:39:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 05:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; d="scan'208";a="170126713"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 19 Jul 2019 05:39:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jul 2019 15:39:52 +0300
Date: Fri, 19 Jul 2019 15:39:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/i915/icl: Remove set but not used variable
 'src_y'
Message-ID: <20190719123952.GK5942@intel.com>
References: <20190719024100.64738-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719024100.64738-1-yuehaibing@huawei.com>
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
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDI6NDE6MDBBTSArMDAwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYzogSW4gZnVuY3Rpb24g
J2c0eF9zcHJpdGVfY2hlY2tfc2NhbGluZyc6Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9zcHJpdGUuYzoxNDk0OjEzOiB3YXJuaW5nOgo+ICB2YXJpYWJsZSAnc3JjX3knIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gUmVwb3J0ZWQt
Ynk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KClRoYW5rcy4gQXBwbGllZCB0byBkcm0taW50
ZWwtbmV4dC1xdWV1ZWQuCgpQUy4gSSByZW1vdmVkIHRoZSAiL2ljbCIgZnJvbSB0aGUgc3ViamVj
dCBsaW5lIGJlY2F1c2UgdGhpcyBoYXMgbm90aGluZwp0byBkbyB3aXRoIGljZWxha2UgaGFyZHdh
cmUuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5j
IHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nw
cml0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwo+IGlu
ZGV4IDM0NTg2ZjI5YmU2MC4uOWMzMzY3NDkxZjA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCj4gQEAgLTE0OTEsNyArMTQ5MSw3IEBAIGc0eF9z
cHJpdGVfY2hlY2tfc2NhbGluZyhzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwK
PiAgCWNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmJhc2Uu
ZmI7Cj4gIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKnNyYyA9ICZwbGFuZV9zdGF0ZS0+YmFzZS5z
cmM7Cj4gIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCA9ICZwbGFuZV9zdGF0ZS0+YmFzZS5k
c3Q7Cj4gLQlpbnQgc3JjX3gsIHNyY195LCBzcmNfdywgc3JjX2gsIGNydGNfdywgY3J0Y19oOwo+
ICsJaW50IHNyY194LCBzcmNfdywgc3JjX2gsIGNydGNfdywgY3J0Y19oOwo+ICAJY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUgPQo+ICAJCSZjcnRjX3N0YXRlLT5i
YXNlLmFkanVzdGVkX21vZGU7Cj4gIAl1bnNpZ25lZCBpbnQgY3BwID0gZmItPmZvcm1hdC0+Y3Bw
WzBdOwo+IEBAIC0xNTAyLDcgKzE1MDIsNiBAQCBnNHhfc3ByaXRlX2NoZWNrX3NjYWxpbmcoc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCj4gIAljcnRjX2ggPSBkcm1fcmVjdF9o
ZWlnaHQoZHN0KTsKPiAgCj4gIAlzcmNfeCA9IHNyYy0+eDEgPj4gMTY7Cj4gLQlzcmNfeSA9IHNy
Yy0+eTEgPj4gMTY7Cj4gIAlzcmNfdyA9IGRybV9yZWN0X3dpZHRoKHNyYykgPj4gMTY7Cj4gIAlz
cmNfaCA9IGRybV9yZWN0X2hlaWdodChzcmMpID4+IDE2Owo+IAo+IAoKLS0gClZpbGxlIFN5cmrD
pGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
