Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A060616
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04C6E49B;
	Fri,  5 Jul 2019 12:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4F96E49A;
 Fri,  5 Jul 2019 12:42:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2019 05:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,455,1557212400"; d="scan'208";a="169667533"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 05 Jul 2019 05:42:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Jul 2019 15:42:04 +0300
Date: Fri, 5 Jul 2019 15:42:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/i915: Remove set but not used variable
 'intel_dig_port'
Message-ID: <20190705124204.GO5942@intel.com>
References: <20190705113138.65880-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705113138.65880-1-yuehaibing@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie,
 kernel-janitors@vger.kernel.org, lucas.demarchi@intel.com,
 linux-kernel@vger.kernel.org, jose.souza@intel.com, rodrigo.vivi@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTE6MzE6MzhBTSArMDAwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYzogSW4gZnVuY3Rpb24gJ2lu
dGVsX2RkaV9nZXRfY29uZmlnJzoKPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RkaS5jOjM3NzQ6Mjk6IHdhcm5pbmc6Cj4gIHZhcmlhYmxlICdpbnRlbF9kaWdfcG9ydCcgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgIHN0cnVjdCBpbnRl
bF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0Owo+IAo+IEl0IGlzIG5ldmVyIHVzZWQsIHNv
IGNhbiBiZSByZW1vdmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJp
bmdAaHVhd2VpLmNvbT4KCkFwcGxpZWQgdG8gZHJtLWludGVsLW5leHQtcXVldWVkLiBUaGFua3Mg
Zm9yIHRoZSBwYXRjaC4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+IGluZGV4IGE0MTcyNTk1Yzhk
OC4uMzBlNDg2MDlkYjFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGRpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RkaS5jCj4gQEAgLTM3NzEsNyArMzc3MSw2IEBAIHZvaWQgaW50ZWxfZGRpX2dldF9jb25maWco
c3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGVuY29kZXItPmJhc2UuZGV2KTsKPiAgCXN0cnVjdCBpbnRl
bF9jcnRjICppbnRlbF9jcnRjID0gdG9faW50ZWxfY3J0YyhwaXBlX2NvbmZpZy0+YmFzZS5jcnRj
KTsKPiAgCWVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IHBpcGVfY29uZmlnLT5jcHVf
dHJhbnNjb2RlcjsKPiAtCXN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0
Owo+ICAJdTMyIHRlbXAsIGZsYWdzID0gMDsKPiAgCj4gIAkvKiBYWFg6IERTSSB0cmFuc2NvZGVy
IHBhcmFub2lhICovCj4gQEAgLTM4MTAsNyArMzgwOSw2IEBAIHZvaWQgaW50ZWxfZGRpX2dldF9j
b25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4gIAlzd2l0Y2ggKHRlbXAgJiBU
UkFOU19ERElfTU9ERV9TRUxFQ1RfTUFTSykgewo+ICAJY2FzZSBUUkFOU19ERElfTU9ERV9TRUxF
Q1RfSERNSToKPiAgCQlwaXBlX2NvbmZpZy0+aGFzX2hkbWlfc2luayA9IHRydWU7Cj4gLQkJaW50
ZWxfZGlnX3BvcnQgPSBlbmNfdG9fZGlnX3BvcnQoJmVuY29kZXItPmJhc2UpOwo+ICAKPiAgCQlw
aXBlX2NvbmZpZy0+aW5mb2ZyYW1lcy5lbmFibGUgfD0KPiAgCQkJaW50ZWxfaGRtaV9pbmZvZnJh
bWVzX2VuYWJsZWQoZW5jb2RlciwgcGlwZV9jb25maWcpOwo+IAo+IAoKLS0gClZpbGxlIFN5cmrD
pGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
