Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA78C3823
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFA06E81E;
	Tue,  1 Oct 2019 14:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2D6E81E;
 Tue,  1 Oct 2019 14:56:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 07:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="191481339"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 01 Oct 2019 07:56:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Oct 2019 17:56:07 +0300
Date: Tue, 1 Oct 2019 17:56:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/rect: Add drm_rect_translate_to()
Message-ID: <20191001145607.GQ1208@intel.com>
References: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
 <87h84sdder.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h84sdder.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTI6MjY6NTJQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gTW9uLCAzMCBTZXAgMjAxOSwgVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+Cj4gPiBBZGQgYSBoZWxwZXIgdG8gdHJhbnNsYXRl
IGEgcmVjdGFuZ2xlIHRvIGFuIGFic29sdXRlIHBvc2l0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4g
VGhlIHNlcmllcyBpcwo+IAo+IFJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPgo+CgpUaGFua3MuIDEtMiBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCj4gCj4g
Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2RybS9kcm1fcmVjdC5oIHwgMTQgKysrKysrKysrKysrKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fcmVjdC5oIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAo+ID4gaW5k
ZXggNjE5NTgyMGFhNWM1Li5mYzdjMTQ2MjdlZTIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fcmVjdC5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oCj4gPiBAQCAtMTA2
LDYgKzEwNiwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX3JlY3RfdHJhbnNsYXRlKHN0cnVj
dCBkcm1fcmVjdCAqciwgaW50IGR4LCBpbnQgZHkpCj4gPiAgCXItPnkyICs9IGR5Owo+ID4gIH0K
PiA+ICAKPiA+ICsvKioKPiA+ICsgKiBkcm1fcmVjdF90cmFuc2xhdGVfdG8gLSB0cmFuc2xhdGUg
dGhlIHJlY3RhbmdsZSB0byBhbiBhYnNvbHV0ZSBwb3NpdGlvbgo+ID4gKyAqIEByOiByZWN0YW5n
bGUgdG8gYmUgdHJhbmxhdGVkCj4gPiArICogQHg6IGhvcml6b250YWwgcG9zaXRpb24KPiA+ICsg
KiBAeTogdmVydGljYWwgcG9zaXRpb24KPiA+ICsgKgo+ID4gKyAqIE1vdmUgcmVjdGFuZ2xlIEBy
IHRvIEB4IGluIHRoZSBob3Jpem9udGFsIGRpcmVjdGlvbiwKPiA+ICsgKiBhbmQgdG8gQHkgaW4g
dGhlIHZlcnRpY2FsIGRpcmVjdGlvbi4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQg
ZHJtX3JlY3RfdHJhbnNsYXRlX3RvKHN0cnVjdCBkcm1fcmVjdCAqciwgaW50IHgsIGludCB5KQo+
ID4gK3sKPiA+ICsJZHJtX3JlY3RfdHJhbnNsYXRlKHIsIHggLSByLT54MSwgeSAtIHItPnkxKTsK
PiA+ICt9Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogZHJtX3JlY3RfZG93bnNjYWxlIC0gZG93bnNj
YWxlIGEgcmVjdGFuZ2xlCj4gPiAgICogQHI6IHJlY3RhbmdsZSB0byBiZSBkb3duc2NhbGVkCj4g
Cj4gLS0gCj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgoK
LS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
