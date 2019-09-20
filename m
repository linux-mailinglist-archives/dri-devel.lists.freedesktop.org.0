Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA3B9701
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 20:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3920E6FD84;
	Fri, 20 Sep 2019 18:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64376FD84;
 Fri, 20 Sep 2019 18:13:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 11:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="202548713"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 20 Sep 2019 11:13:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2019 21:13:18 +0300
Date: Fri, 20 Sep 2019 21:13:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-next-queued 6/7]
 drivers/gpu/drm/i915/display/intel_color.c:1576 ilk_read_lut_10() error:
 potential null dereference 'blob'. (drm_property_create_blob returns null)
Message-ID: <20190920181318.GF1208@intel.com>
References: <201909210114.iKWrswyk%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201909210114.iKWrswyk%lkp@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kbuild-all@01.org,
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgMjEsIDIwMTkgYXQgMDE6NTU6MjVBTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4gdHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50
ZWwgZHJtLWludGVsLW5leHQtcXVldWVkCj4gaGVhZDogICA0YmI2YTlkNWQ5YTgyODk2NzNjNGNi
MDc4NmQ0NGJlOGE2M2MyMWRiCj4gY29tbWl0OiA2Yjk3YjExOGQ0ZDU0MmM3YmMyNWI3MjVjNmRl
Mzk0N2ZmZmI5MjFiIFs2LzddIGRybS9pOTE1L2Rpc3BsYXk6IEV4dHJhY3QgaWxrX3JlYWRfbHV0
cygpCj4gCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+
IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiAKPiBOZXcg
c21hdGNoIHdhcm5pbmdzOgo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29s
b3IuYzoxNTc2IGlsa19yZWFkX2x1dF8xMCgpIGVycm9yOiBwb3RlbnRpYWwgbnVsbCBkZXJlZmVy
ZW5jZSAnYmxvYicuICAoZHJtX3Byb3BlcnR5X2NyZWF0ZV9ibG9iIHJldHVybnMgbnVsbCkKCkl0
IG5ldmVyIHJldHVybnMgbnVsbC4gTm90IHN1cmUgd2h5IHRoaXMgdGhpbmcgdGhpbmtzIG90aGVy
d2lzZS4KCj4gCj4gT2xkIHNtYXRjaCB3YXJuaW5nczoKPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2NvbG9yLmM6MTUzNSBpOXh4X3JlYWRfbHV0XzgoKSBlcnJvcjogcG90ZW50
aWFsIG51bGwgZGVyZWZlcmVuY2UgJ2Jsb2InLiAgKGRybV9wcm9wZXJ0eV9jcmVhdGVfYmxvYiBy
ZXR1cm5zIG51bGwpCj4gCj4gdmltICsvYmxvYiArMTU3NiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2NvbG9yLmMKPiAKPiAgIDE1NTgJCj4gICAxNTU5CXN0YXRpYyBzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5X2Jsb2IgKgo+ICAgMTU2MAlpbGtfcmVhZF9sdXRfMTAoY29uc3Qgc3RydWN0
IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCj4gICAxNTYxCXsKPiAgIDE1NjIJCXN0cnVj
dCBpbnRlbF9jcnRjICpjcnRjID0gdG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT5iYXNlLmNydGMp
Owo+ICAgMTU2MwkJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShj
cnRjLT5iYXNlLmRldik7Cj4gICAxNTY0CQl1MzIgbHV0X3NpemUgPSBJTlRFTF9JTkZPKGRldl9w
cml2KS0+Y29sb3IuZ2FtbWFfbHV0X3NpemU7Cj4gICAxNTY1CQllbnVtIHBpcGUgcGlwZSA9IGNy
dGMtPnBpcGU7Cj4gICAxNTY2CQlzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJsb2I7Cj4gICAx
NTY3CQlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqYmxvYl9kYXRhOwo+ICAgMTU2OAkJdTMyIGksIHZh
bDsKPiAgIDE1NjkJCj4gICAxNTcwCQlibG9iID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9ibG9iKCZk
ZXZfcHJpdi0+ZHJtLAo+ICAgMTU3MQkJCQkJCXNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dCkg
KiBsdXRfc2l6ZSwKPiAgIDE1NzIJCQkJCQlOVUxMKTsKPiAgIDE1NzMJCWlmIChJU19FUlIoYmxv
YikpCj4gICAxNTc0CQkJcmV0dXJuIE5VTEw7Cj4gICAxNTc1CQo+ID4gMTU3NgkJYmxvYl9kYXRh
ID0gYmxvYi0+ZGF0YTsKPiAgIDE1NzcJCj4gICAxNTc4CQlmb3IgKGkgPSAwOyBpIDwgbHV0X3Np
emU7IGkrKykgewo+ICAgMTU3OQkJCXZhbCA9IEk5MTVfUkVBRChQUkVDX1BBTEVUVEUocGlwZSwg
aSkpOwo+ICAgMTU4MAkKPiAgIDE1ODEJCQlibG9iX2RhdGFbaV0ucmVkID0gaW50ZWxfY29sb3Jf
bHV0X3BhY2soUkVHX0ZJRUxEX0dFVCgKPiAgIDE1ODIJCQkJCQkJCVBSRUNfUEFMRVRURV9SRURf
TUFTSywgdmFsKSwgMTApOwo+ICAgMTU4MwkJCWJsb2JfZGF0YVtpXS5ncmVlbiA9IGludGVsX2Nv
bG9yX2x1dF9wYWNrKFJFR19GSUVMRF9HRVQoCj4gICAxNTg0CQkJCQkJCQkgIFBSRUNfUEFMRVRU
RV9HUkVFTl9NQVNLLCB2YWwpLCAxMCk7Cj4gICAxNTg1CQkJYmxvYl9kYXRhW2ldLmJsdWUgPSBp
bnRlbF9jb2xvcl9sdXRfcGFjayhSRUdfRklFTERfR0VUKAo+ICAgMTU4NgkJCQkJCQkJIFBSRUNf
UEFMRVRURV9CTFVFX01BU0ssIHZhbCksIDEwKTsKPiAgIDE1ODcJCX0KPiAgIDE1ODgJCj4gICAx
NTg5CQlyZXR1cm4gYmxvYjsKPiAgIDE1OTAJfQo+ICAgMTU5MQkKPiAKPiAtLS0KPiAwLURBWSBr
ZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNo
bm9sb2d5IENlbnRlcgo+IGh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxs
ICAgICAgICAgICAgICAgICAgIEludGVsIENvcnBvcmF0aW9uCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4g
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgotLSAKVmlsbGUgU3lyasOkbMOkCklu
dGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
