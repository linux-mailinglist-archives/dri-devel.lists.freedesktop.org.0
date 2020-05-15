Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7F1D4EA9
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E0C6EC9D;
	Fri, 15 May 2020 13:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CEE6EC9D;
 Fri, 15 May 2020 13:13:25 +0000 (UTC)
IronPort-SDR: w1cNG6wYROF9m6qqwEAluHgUawqKK74LXJK2h5rXxuOGZHecgYAiyp8NvmU2w7LIyHIqxQ7WNA
 u31zsaf9D1yA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:13:25 -0700
IronPort-SDR: I3noqEnV+YIYkB3QjawC3C2JIr7n6n3r5abObJ4L3GPegRwzGg9hQiaMjTy0LQhZUvwb6KE8Yk
 4z/X1t8p1T3g==
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="438310585"
Received: from haberkro-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.110])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:13:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs,
 refactors the handling of DP SDPs
In-Reply-To: <20200515130612.GI6112@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <87eerm4vd0.fsf@intel.com> <20200515130612.GI6112@intel.com>
Date: Fri, 15 May 2020 16:13:18 +0300
Message-ID: <87zha92vf5.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNSBNYXkgMjAyMCwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBNYXkgMTQsIDIwMjAgYXQgMDI6MTk6MjNQTSAr
MDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFRodSwgMTQgTWF5IDIwMjAsIEd3YW4tZ3ll
b25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4gd3JvdGU6Cj4+ID4gSW4gb3JkZXIg
dG8gcmVhZG91dCBEUCBTRFBzIChTZWNvbmRhcnkgRGF0YSBQYWNrZXQ6IERQIEhEUiBNZXRhZGF0
YQo+PiA+IEluZm9mcmFtZSBTRFAsIERQIFZTQyBTRFApLCBpdCByZWZhY3RvcnMgaGFuZGxpbmcg
RFAgU0RQcyBjb2Rlcy4KPj4gPiBJdCBhZGRzIG5ldyBjb21wdXRlIHJvdXRpbmVzIGZvciBEUCBI
RFIgTWV0YWRhdGEgSW5mb2ZyYW1lIFNEUAo+PiA+IGFuZCBEUCBWU0MgU0RQLiAKPj4gPiBBbmQg
bmV3IHdyaXRpbmcgcm91dGluZXMgb2YgRFAgU0RQcyAoU2Vjb25kYXJ5IERhdGEgUGFja2V0KSB0
aGF0IHVzZXMKPj4gPiBjb21wdXRlZCBjb25maWdzLgo+PiA+IE5ldyByZWFkaW5nIHJvdXRpbmVz
IG9mIERQIFNEUHMgYXJlIGFkZGVkIGZvciByZWFkb3V0Lgo+PiA+IEl0IGFkZHMgYSBsb2dnaW5n
IGZ1bmN0aW9uIGZvciBEUCBWU0MgU0RQLgo+PiA+IFdoZW4gcmVjZWl2aW5nIHZpZGVvIGl0IGlz
IHZlcnkgdXNlZnVsIHRvIGJlIGFibGUgdG8gbG9nIERQIFZTQyBTRFAuCj4+ID4gVGhpcyBncmVh
dGx5IHNpbXBsaWZpZXMgZGVidWdnaW5nLgo+PiA+IEluIG9yZGVyIHRvIHVzZSBhIGNvbW1vbiBW
U0MgU0RQIENvbG9yaW1ldHJ5IGNhbGN1bGF0aW5nIGNvZGUgb24gUFNSLAo+PiA+IGl0IHVzZXMg
YSBuZXcgcHNyIHZzYyBzZHAgY29tcHV0ZSByb3V0aW5lLgo+PiAKPj4gUHVzaGVkIHRoZSBzZXJp
ZXMgdG8gZHJtLWludGVsLW5leHQtcXVldWVkIHdpdGggRGFuaWVsJ3MgaXJjIGFjayBmb3IKPj4g
bWVyZ2luZyB0aGUgdHdvIG5vbi1pOTE1IHBhdGNoZXMgdGhhdCByb3V0ZSB0b28uCj4KPiBmaS1o
c3ctNDc3MCBub3cgb29wc2VzIGF0IGJvb3Q6Cgovb1wKCldoYXQgZGlkIEkgbWlzcz8gV2hhdCBw
YXJ0IGFib3V0IHRoZSBDSSByZXBvcnQgZGlkIEkgb3Zlcmxvb2s/CgpCUiwKSmFuaS4KCgo+Cj4g
PDE+WyAgICAzLjczNjkwM10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBh
ZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwCj4gPDE+WyAgICAzLjczNjkxNl0gI1BGOiBzdXBlcnZp
c29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlCj4gPDE+WyAgICAzLjczNjkxNl0gI1BGOiBl
cnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlCj4gPDY+WyAgICAzLjczNjkxN10g
UEdEIDAgUDREIDAgCj4gPDQ+WyAgICAzLjczNjkxOV0gT29wczogMDAwMCBbIzFdIFBSRUVNUFQg
U01QIFBUSQo+IDw0PlsgICAgMy43MzY5MjFdIENQVTogMCBQSUQ6IDM2MyBDb21tOiBzeXN0ZW1k
LXVkZXZkIE5vdCB0YWludGVkIDUuNy4wLXJjNS1DSS1DSV9EUk1fODQ4NSsgIzEKPiA8ND5bICAg
IDMuNzM2OTIyXSBIYXJkd2FyZSBuYW1lOiBMRU5PVk8gMTBBR1MwMDYwMS9TSEFSS0JBWSwgQklP
UyBGQktUMzRBVVMgMDQvMjQvMjAxMwo+IDw0PlsgICAgMy43MzY5ODZdIFJJUDogMDAxMDppbnRl
bF9wc3JfZW5hYmxlZCsweDgvMHg3MCBbaTkxNV0KPiA8ND5bICAgIDMuNzM2OTg4XSBDb2RlOiAx
OCA0OCBjNyBjNiA0MCAwOSA3OSBhMCBlOCBlMyBlMiAwNCBlMSAwZiBiNiA0NCAyNCAwMyBlOSBm
NCBmZCBmZiBmZiA5MCA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA0MSA1NCA1NSA1MyA0
OCA4MyBlYyAwOCA8NDg+IDhiIDlmIGQ4IGZlIGZmIGZmIGY2IDgzIDVlIDBkIDAwIDAwIDIwIDc0
IDA5IDgwIGJiIDZjIGI2IDAwIDAwCj4gPDQ+WyAgICAzLjczNzAzNl0gUlNQOiAwMDE4OmZmZmZj
OTAwMDA0N2Y4YTAgRUZMQUdTOiAwMDAxMDI4Ngo+IDw0PlsgICAgMy43MzcwNDJdIFJBWDogMDAw
MDAwMDAwMDAwMDAwMiBSQlg6IGZmZmY4ODgzZmZkMDQwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAx
Cj4gPDQ+WyAgICAzLjczNzA0OF0gUkRYOiAwMDAwMDAwMDAwMDAwMDA3IFJTSTogZmZmZjg4ODNm
ZmQwNDAwMCBSREk6IDAwMDAwMDAwMDAwMDAxMjgKPiA8ND5bICAgIDMuNzM3MDU1XSBSQlA6IGZm
ZmY4ODg0MDZhZmUyMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDBmIFIwOTogMDAwMDAwMDAwMDAwMDAw
MQo+IDw0PlsgICAgMy43MzcwNjFdIFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAw
MDAwMDAwMDAgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4gPDQ+WyAgICAzLjczNzA2OF0gUjEzOiBm
ZmZmODg4M2Y3NWQwMDAwIFIxNDogZmZmZjg4ODQwNmFmZTIwMCBSMTU6IGZmZmY4ODgzZjc1ZDA4
NzAKPiA8ND5bICAgIDMuNzM3MDc1XSBGUzogIDAwMDA3ZjcxNjE4Zjk2ODAoMDAwMCkgR1M6ZmZm
Zjg4ODQwZWMwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gPDQ+WyAgICAzLjcz
NzA4Ml0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+
IDw0PlsgICAgMy43MzcwODhdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDA0MDI1
MTAwMDIgQ1I0OiAwMDAwMDAwMDAwMTYwNmYwCj4gPDQ+WyAgICAzLjczNzA5NF0gRFIwOiAwMDAw
MDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAK
PiA8ND5bICAgIDMuNzM3MTAxXSBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZm
ZmUwZmYwIERSNzogMDAwMDAwMDAwMDAwMDQwMAo+IDw0PlsgICAgMy43MzcxMDddIENhbGwgVHJh
Y2U6Cj4gPDQ+WyAgICAzLjczNzE3NV0gIGludGVsX3JlYWRfZHBfc2RwKzB4MWE0LzB4MzgwIFtp
OTE1XQo+IDw0PlsgICAgMy43MzcyNDZdICBoc3dfY3J0X2dldF9jb25maWcrMHgxMi8weDQwIFtp
OTE1XQo+IDw0PlsgICAgMy43MzczMTddICBpbnRlbF9tb2Rlc2V0X3NldHVwX2h3X3N0YXRlKzB4
M2IzLzB4MTZhMCBbaTkxNV0KPiAuLi4KCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
