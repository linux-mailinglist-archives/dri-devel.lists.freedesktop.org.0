Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51675103D20
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3166E5F6;
	Wed, 20 Nov 2019 14:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D356E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 14:18:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:18:42 -0800
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="196867261"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:18:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/rect: remove useless call to clamp_t
In-Reply-To: <20191119133435.22525-1-benjamin.gaignard@st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191119133435.22525-1-benjamin.gaignard@st.com>
Date: Wed, 20 Nov 2019 16:18:35 +0200
Message-ID: <871ru2y6kk.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJk
QHN0LmNvbT4gd3JvdGU6Cj4gQ2xhbXBpbmcgYSB2YWx1ZSBiZXR3ZWVuIElOVF9NSU4gYW5kIElO
VF9NQVggYWx3YXlzIHJldHVybiB0aGUgdmFsdWUgaXRzZWxmCj4gYW5kIGdlbmVyYXRlIHdhcm5p
bmdzIHdoZW4gY29tcGlsaW5nIHdpdGggVz0xLgoKRG9lcyB0aGF0IGhvbGQgZm9yIDMyLWJpdCB0
b28/CgpCUiwKSmFuaS4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3Qu
YyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCj4gaW5kZXggYjgzNjNhYWE5MDMyLi42ODFmMWZkMDkz
NTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+IEBAIC04OSw3ICs4OSw3IEBAIGJvb2wgZHJtX3JlY3Rf
Y2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+
ICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+ICAJ
CQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKPiAgCj4gLQkJc3JjLT54MSA9IGNs
YW1wX3QoaW50NjRfdCwgc3JjLT54MiAtIG5ld19zcmNfdywgSU5UX01JTiwgSU5UX01BWCk7Cj4g
KwkJc3JjLT54MSA9IHNyYy0+eDIgLSBuZXdfc3JjX3c7Cj4gIAkJZHN0LT54MSA9IGNsaXAtPngx
Owo+ICAJfQo+ICAJZGlmZiA9IGNsaXAtPnkxIC0gZHN0LT55MTsKPiBAQCAtOTcsNyArOTcsNyBA
QCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3Qg
ZHJtX3JlY3QgKmRzdCwKPiAgCQl1MzIgbmV3X3NyY19oID0gY2xpcF9zY2FsZWQoZHJtX3JlY3Rf
aGVpZ2h0KHNyYyksCj4gIAkJCQkJICAgIGRybV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKPiAg
Cj4gLQkJc3JjLT55MSA9IGNsYW1wX3QoaW50NjRfdCwgc3JjLT55MiAtIG5ld19zcmNfaCwgSU5U
X01JTiwgSU5UX01BWCk7Cj4gKwkJc3JjLT55MSA9IHNyYy0+eTIgLSBuZXdfc3JjX2g7Cj4gIAkJ
ZHN0LT55MSA9IGNsaXAtPnkxOwo+ICAJfQo+ICAJZGlmZiA9IGRzdC0+eDIgLSBjbGlwLT54MjsK
PiBAQCAtMTA1LDcgKzEwNSw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRy
bV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ICAJCXUzMiBuZXdfc3JjX3cgPSBj
bGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+ICAJCQkJCSAgICBkcm1fcmVjdF93aWR0
aChkc3QpLCBkaWZmKTsKPiAgCj4gLQkJc3JjLT54MiA9IGNsYW1wX3QoaW50NjRfdCwgc3JjLT54
MSArIG5ld19zcmNfdywgSU5UX01JTiwgSU5UX01BWCk7Cj4gKwkJc3JjLT54MiA9IHNyYy0+eDEg
KyBuZXdfc3JjX3c7Cj4gIAkJZHN0LT54MiA9IGNsaXAtPngyOwo+ICAJfQo+ICAJZGlmZiA9IGRz
dC0+eTIgLSBjbGlwLT55MjsKPiBAQCAtMTEzLDcgKzExMyw3IEBAIGJvb2wgZHJtX3JlY3RfY2xp
cF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ICAJ
CXUzMiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKPiAgCQkJ
CQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksIGRpZmYpOwo+ICAKPiAtCQlzcmMtPnkyID0gY2xh
bXBfdChpbnQ2NF90LCBzcmMtPnkxICsgbmV3X3NyY19oLCBJTlRfTUlOLCBJTlRfTUFYKTsKPiAr
CQlzcmMtPnkyID0gc3JjLT55MSArIG5ld19zcmNfaDsKPiAgCQlkc3QtPnkyID0gY2xpcC0+eTI7
Cj4gIAl9CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
