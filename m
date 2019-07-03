Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797A5E2EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 13:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933689B22;
	Wed,  3 Jul 2019 11:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA789B22
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 11:39:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 04:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; d="scan'208";a="315549228"
Received: from dkruchix-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.251.93.237])
 by orsmga004.jf.intel.com with ESMTP; 03 Jul 2019 04:39:08 -0700
Date: Wed, 3 Jul 2019 12:39:07 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Jonathan Gray <jsg@jsg.id.au>
Subject: Re: [PATCH libdrm] xf86drm: test for render nodes before primary nodes
Message-ID: <20190703113907.3siktob4qpesbcvp@intel.com>
References: <20190512165049.5780-1-jsg@jsg.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512165049.5780-1-jsg@jsg.id.au>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAyMDE5LTA1LTEzIDAyOjUwOjQ5ICsxMDAwLCBKb25hdGhhbiBHcmF5IHdyb3Rl
Ogo+IFVubGlrZSBMaW51eCB0aGUgT3BlbkJTRCBwcmltYXJ5ICJkcm0iIGRldmljZSBuYW1lIGlz
IHN1YnN0cmluZyBvZiB0aGUKPiAiZHJtUiIgcmVuZGVyIG5vZGUgZGV2aWNlIG5hbWUgYW5kIHN0
cm5jbXAoKSB0ZXN0cyByZXN1bHRlZCBpbiByZW5kZXIKPiBub2RlcyBiZWluZyBmbGFnZ2VkIGFz
IHByaW1hcnkgbm9kZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gR3JheSA8anNnQGpz
Zy5pZC5hdT4KClJldmlld2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5lbmdlc3Ryb21AaW50
ZWwuY29tPgphbmQgcHVzaGVkIQpTb3JyeSBpdCBnb3QgZm9yZ290dGVuIGZvciBzbyBsb25nLgoK
PiAtLS0KPiAgeGY4NmRybS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94
Zjg2ZHJtLmMKPiBpbmRleCAyODU4ZDgyNi4uNDIwMjJjYWMgMTAwNjQ0Cj4gLS0tIGEveGY4NmRy
bS5jCj4gKysrIGIveGY4NmRybS5jCj4gQEAgLTMxNjgsMTAgKzMxNjgsNiBAQCBkcm1fcHVibGlj
IGludCBkcm1EZXZpY2VzRXF1YWwoZHJtRGV2aWNlUHRyIGEsIGRybURldmljZVB0ciBiKQo+ICAK
PiAgc3RhdGljIGludCBkcm1HZXROb2RlVHlwZShjb25zdCBjaGFyICpuYW1lKQo+ICB7Cj4gLSAg
ICBpZiAoc3RybmNtcChuYW1lLCBEUk1fUFJJTUFSWV9NSU5PUl9OQU1FLAo+IC0gICAgICAgIHNp
emVvZihEUk1fUFJJTUFSWV9NSU5PUl9OQU1FKSAtIDEpID09IDApCj4gLSAgICAgICAgcmV0dXJu
IERSTV9OT0RFX1BSSU1BUlk7Cj4gLQo+ICAgICAgaWYgKHN0cm5jbXAobmFtZSwgRFJNX0NPTlRS
T0xfTUlOT1JfTkFNRSwKPiAgICAgICAgICBzaXplb2YoRFJNX0NPTlRST0xfTUlOT1JfTkFNRSAp
IC0gMSkgPT0gMCkKPiAgICAgICAgICByZXR1cm4gRFJNX05PREVfQ09OVFJPTDsKPiBAQCAtMzE4
MCw2ICszMTc2LDEwIEBAIHN0YXRpYyBpbnQgZHJtR2V0Tm9kZVR5cGUoY29uc3QgY2hhciAqbmFt
ZSkKPiAgICAgICAgICBzaXplb2YoRFJNX1JFTkRFUl9NSU5PUl9OQU1FKSAtIDEpID09IDApCj4g
ICAgICAgICAgcmV0dXJuIERSTV9OT0RFX1JFTkRFUjsKPiAgCj4gKyAgICBpZiAoc3RybmNtcChu
YW1lLCBEUk1fUFJJTUFSWV9NSU5PUl9OQU1FLAo+ICsgICAgICAgIHNpemVvZihEUk1fUFJJTUFS
WV9NSU5PUl9OQU1FKSAtIDEpID09IDApCj4gKyAgICAgICAgcmV0dXJuIERSTV9OT0RFX1BSSU1B
Ulk7Cj4gKwo+ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIH0KPiAgCj4gLS0gCj4gMi4yMS4wCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
