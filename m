Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007036EA0E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 19:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADF76E858;
	Fri, 19 Jul 2019 17:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68256E841;
 Fri, 19 Jul 2019 17:23:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="196010773"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 19 Jul 2019 10:23:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jul 2019 20:23:35 +0300
Date: Fri, 19 Jul 2019 20:23:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/i915/dsi: remove set but not used variable
 'hfront_porch'
Message-ID: <20190719172335.GT5942@intel.com>
References: <20190719015136.103988-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719015136.103988-1-yuehaibing@huawei.com>
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
Cc: vandita.kulkarni@intel.com, airlied@linux.ie,
 Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, madhav.chauhan@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDE6NTE6MzZBTSArMDAwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXhlcyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4g
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pY2xfZHNpLmM6IEluIGZ1bmN0aW9uICdnZW4x
MV9kc2lfc2V0X3RyYW5zY29kZXJfdGltaW5ncyc6Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pY2xfZHNpLmM6NzY4OjY6IHdhcm5pbmc6Cj4gIHZhcmlhYmxlICdoZnJvbnRfcG9yY2gn
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gSXQgaXMg
bmV2ZXIgdXNlZCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9i
b3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4KClRoYW5rcy4gQXBwbGllZCB0byBkcm0taW50ZWwtbmV4dC1xdWV1
ZWQuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ljbF9kc2kuYyB8IDQg
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaWNsX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pY2xfZHNpLmMKPiBpbmRleCA0ZDk1MmFjY2Zh
YWEuLmE0MjM0OGJlMDQzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ljbF9kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaWNsX2Rz
aS5jCj4gQEAgLTc2Myw3ICs3NjMsNyBAQCBnZW4xMV9kc2lfc2V0X3RyYW5zY29kZXJfdGltaW5n
cyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAgCWVudW0gdHJhbnNjb2RlciBkc2lf
dHJhbnM7Cj4gIAkvKiBob3Jpem9udGFsIHRpbWluZ3MgKi8KPiAgCXUxNiBodG90YWwsIGhhY3Rp
dmUsIGhzeW5jX3N0YXJ0LCBoc3luY19lbmQsIGhzeW5jX3NpemU7Cj4gLQl1MTYgaGZyb250X3Bv
cmNoLCBoYmFja19wb3JjaDsKPiArCXUxNiBoYmFja19wb3JjaDsKPiAgCS8qIHZlcnRpY2FsIHRp
bWluZ3MgKi8KPiAgCXUxNiB2dG90YWwsIHZhY3RpdmUsIHZzeW5jX3N0YXJ0LCB2c3luY19lbmQs
IHZzeW5jX3NoaWZ0Owo+ICAKPiBAQCAtNzcyLDggKzc3Miw2IEBAIGdlbjExX2RzaV9zZXRfdHJh
bnNjb2Rlcl90aW1pbmdzKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAo+ICAJaHN5bmNf
c3RhcnQgPSBhZGp1c3RlZF9tb2RlLT5jcnRjX2hzeW5jX3N0YXJ0Owo+ICAJaHN5bmNfZW5kID0g
YWRqdXN0ZWRfbW9kZS0+Y3J0Y19oc3luY19lbmQ7Cj4gIAloc3luY19zaXplICA9IGhzeW5jX2Vu
ZCAtIGhzeW5jX3N0YXJ0Owo+IC0JaGZyb250X3BvcmNoID0gKGFkanVzdGVkX21vZGUtPmNydGNf
aHN5bmNfc3RhcnQgLQo+IC0JCQlhZGp1c3RlZF9tb2RlLT5jcnRjX2hkaXNwbGF5KTsKPiAgCWhi
YWNrX3BvcmNoID0gKGFkanVzdGVkX21vZGUtPmNydGNfaHRvdGFsIC0KPiAgCQkgICAgICAgYWRq
dXN0ZWRfbW9kZS0+Y3J0Y19oc3luY19lbmQpOwo+ICAJdmFjdGl2ZSA9IGFkanVzdGVkX21vZGUt
PmNydGNfdmRpc3BsYXk7Cj4gCj4gCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
