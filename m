Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895C372A34
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 14:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2CE6EAD1;
	Tue,  4 May 2021 12:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AC26EACF;
 Tue,  4 May 2021 12:35:42 +0000 (UTC)
IronPort-SDR: 1cHvsZMwiTI/zp2Wt4DatYVYcIYagAMvVw9UGxR1jnjexdlSMOMT6AtxPSJ9IFDJ8pIUmKnPvn
 pdxh9EHKKeQw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="195915481"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="195915481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 05:35:42 -0700
IronPort-SDR: 1FfkBRm6f9K0LlK4JDWmSpcfsxqRrbMA8zMapArW8NbdututzeTklJl8nQcAhDL7fI7ffwu/Ng
 oeF9fSCF3y0A==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="433262916"
Received: from radwanib-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 05:35:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Use drm_mode_is_420_only() instead of open coding it
In-Reply-To: <20210504102742.7005-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210504102742.7005-1-ville.syrjala@linux.intel.com>
Date: Tue, 04 May 2021 15:35:37 +0300
Message-ID: <87wnsey8va.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNCBNYXkgMjAyMSwgVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4KPiBSZXBsYWNlIHRoZSBvcGVuIGNvZGVkIGRybV9tb2RlX2lzXzQy
MF9vbmx5KCkgd2l0aCB0aGUgcmVhbCB0aGluZy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4K
Pgo+IENjOiBXZXJuZXIgU2VtYmFjaCA8d3NlQHR1eGVkb2NvbXB1dGVycy5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
ClJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMTMgKysrKy0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYwo+IGluZGV4IDMzYTkzZmEyNGViMS4uMTJmY2JiN2NlMTc5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYwo+IEBAIC0xMTc2LDE2ICsxMTc2LDExIEBAIGVudW0gZHJtX21vZGVfc3RhdHVzCj4gIGRy
bV9tb2RlX3ZhbGlkYXRlX3ljYmNyNDIwKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlLAo+ICAJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4gLQl1
OCB2aWMgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9kZSk7Cj4gLQllbnVtIGRybV9tb2RlX3N0YXR1
cyBzdGF0dXMgPSBNT0RFX09LOwo+IC0Jc3RydWN0IGRybV9oZG1pX2luZm8gKmhkbWkgPSAmY29u
bmVjdG9yLT5kaXNwbGF5X2luZm8uaGRtaTsKPiAtCj4gLQlpZiAodGVzdF9iaXQodmljLCBoZG1p
LT55NDIwX3ZkYl9tb2RlcykpIHsKPiAtCQlpZiAoIWNvbm5lY3Rvci0+eWNiY3JfNDIwX2FsbG93
ZWQpCj4gLQkJCXN0YXR1cyA9IE1PREVfTk9fNDIwOwo+IC0JfQo+ICsJaWYgKCFjb25uZWN0b3It
PnljYmNyXzQyMF9hbGxvd2VkICYmCj4gKwkgICAgZHJtX21vZGVfaXNfNDIwX29ubHkoJmNvbm5l
Y3Rvci0+ZGlzcGxheV9pbmZvLCBtb2RlKSkKPiArCQlyZXR1cm4gTU9ERV9OT180MjA7Cj4gIAo+
IC0JcmV0dXJuIHN0YXR1czsKPiArCXJldHVybiBNT0RFX09LOwo+ICB9Cj4gIEVYUE9SVF9TWU1C
T0woZHJtX21vZGVfdmFsaWRhdGVfeWNiY3I0MjApOwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBP
cGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
