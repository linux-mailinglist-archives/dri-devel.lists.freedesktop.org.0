Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783CB2352C8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 16:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2A06EB93;
	Sat,  1 Aug 2020 14:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F34E6EB93
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 14:39:53 +0000 (UTC)
IronPort-SDR: NZ4cYkdF9hEgX56JrC6OvXU1NGe2kdbI9WKyDusNmS439rCdSWNu7mzy5lBp4JYOYmaKxmEDwW
 ym7I1G7fy2Hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9699"; a="151904608"
X-IronPort-AV: E=Sophos;i="5.75,422,1589266800"; d="scan'208";a="151904608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2020 07:39:52 -0700
IronPort-SDR: j0mA/GrPplc6ikl6m4Q1ZnyCzix3sqw908zoWEgySPgifpklNUXIQm4FmRcE4Fof6YtnWIZWhr
 eImEn045QEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,422,1589266800"; d="scan'208";a="435728702"
Received: from semmelma-mobl1.ger.corp.intel.com (HELO [10.249.41.46])
 ([10.249.41.46])
 by orsmga004.jf.intel.com with ESMTP; 01 Aug 2020 07:39:50 -0700
Subject: Re: [PATCH] drm/syncobj: Tune down unordered timeline DRM_ERROR
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200801092625.1107609-1-daniel.vetter@ffwll.ch>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <6c320fd4-81d4-1a96-e83e-ecbdedfbd7f8@intel.com>
Date: Sat, 1 Aug 2020 17:39:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801092625.1107609-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDgvMjAyMCAxMjoyNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBVc2Vyc3BhY2UgY2Fu
IHByb3Zva2UgdGhpcywgd2UgZ2VuZXJhbGx5IGRvbid0IGFsbG93IHVzZXJzcGFjZSB0byBzcGFt
Cj4gZG1lc2cuIFR1bmUgaXQgZG93biB0byBkZWJ1Zy4gVW5mb3J0dW5hdGVseSB3ZSBkb24ndCBo
YXZlIGVhc3kgYWNjZXNzCj4gdG8gdGhlIGRybV9kZXZpY2UgaGVyZSAobm90IGF0IGFsbCB3aXRo
b3V0IGNoYW5naW5nIGEgZmV3IHRoaW5ncyksIHNvCj4gbGVhdmUgaXQgYXMgb2xkIHN0eWxlIGRt
ZXNnIG91dHB1dCBmb3Igbm93Lgo+Cj4gUmVmZXJlbmNlczogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy84MDE0Ni8KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2Vy
bGluQGludGVsLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9zeW5jb2JqLmMKPiBpbmRleCAzYmY3Mzk3MWRhZjMuLjZlNzRlNjc0NWVjYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jCj4gQEAgLTI5Nyw3ICsyOTcsNyBAQCB2b2lkIGRybV9zeW5jb2Jq
X2FkZF9wb2ludChzdHJ1Y3QgZHJtX3N5bmNvYmogKnN5bmNvYmosCj4gICAJcHJldiA9IGRybV9z
eW5jb2JqX2ZlbmNlX2dldChzeW5jb2JqKTsKPiAgIAkvKiBZb3UgYXJlIGFkZGluZyBhbiB1bm9y
ZGVyIHBvaW50IHRvIHRpbWVsaW5lLCB3aGljaCBjb3VsZCBjYXVzZSBwYXlsb2FkIHJldHVybmVk
IGZyb20gcXVlcnlfaW9jdGwgaXMgMCEgKi8KPiAgIAlpZiAocHJldiAmJiBwcmV2LT5zZXFubyA+
PSBwb2ludCkKPiAtCQlEUk1fRVJST1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQg
dG8gdGltZWxpbmUhXG4iKTsKPiArCQlEUk1fREVCVUcoIllvdSBhcmUgYWRkaW5nIGFuIHVub3Jk
ZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKPiAgIAlkbWFfZmVuY2VfY2hhaW5faW5pdChjaGFp
biwgcHJldiwgZmVuY2UsIHBvaW50KTsKPiAgIAlyY3VfYXNzaWduX3BvaW50ZXIoc3luY29iai0+
ZmVuY2UsICZjaGFpbi0+YmFzZSk7Cj4gICAKClRoYW5rcywKCkFja2VkLWJ5OiBMaW9uZWwgTGFu
ZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
