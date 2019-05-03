Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6A12CE3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E454B89CE3;
	Fri,  3 May 2019 11:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7089CE3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 11:49:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 04:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,425,1549958400"; d="scan'208";a="228952066"
Received: from eengestr-dev.ld.intel.com (HELO intel.com) ([10.103.239.200])
 by orsmga001.jf.intel.com with ESMTP; 03 May 2019 04:49:21 -0700
Date: Fri, 3 May 2019 12:49:30 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH libdrm] xf86drm: Fix possible memory leak with
 drmModeGetPropertyPtr()
Message-ID: <20190503114930.6btsgzohm5zq6ac6@intel.com>
References: <CGME20190429090952epcas1p4877cf8476a69f756a1a6bfe9d6d52abd@epcas1p4.samsung.com>
 <1556529052-6413-1-git-send-email-sw0312.kim@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556529052-6413-1-git-send-email-sw0312.kim@samsung.com>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAyMDE5LTA0LTI5IDE4OjEwOjUyICswOTAwLCBTZXVuZy1Xb28gS2ltIHdyb3Rl
Ogo+IEluIGRybU1vZGVHZXRQcm9wZXJ0eVB0cigpLCBmcm9tIHVwcGVyIGVycm9yIHBhdGgsIGl0
IGNhbGxzIGZyZWUKPiBidXQgd2l0aCBqdXN0IG5leHQgZXJyb3IgcGF0aCwgaXQgZG9lcyBub3Qg
Y2FsbC4gRml4IHRoZSBwb3NzaWJsZQo+IG1lbW9yeSBsZWFrLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+CgpSZXZpZXdlZC1ieTogRXJp
YyBFbmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9tQGludGVsLmNvbT4KYW5kIHB1c2hlZCwgdGhhbmtz
IQoKPiAtLS0KPiAgeGY4NmRybU1vZGUuYyB8ICAgIDIgKy0KPiAgMSBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hmODZkcm1N
b2RlLmMgYi94Zjg2ZHJtTW9kZS5jCj4gaW5kZXggYzg3OGQ5ZS4uMjA3ZDdiZSAxMDA2NDQKPiAt
LS0gYS94Zjg2ZHJtTW9kZS5jCj4gKysrIGIveGY4NmRybU1vZGUuYwo+IEBAIC02NTAsNyArNjUw
LDcgQEAgZHJtX3B1YmxpYyBkcm1Nb2RlUHJvcGVydHlQdHIgZHJtTW9kZUdldFByb3BlcnR5KGlu
dCBmZCwgdWludDMyX3QgcHJvcGVydHlfaWQpCj4gIAl9Cj4gIAo+ICAJaWYgKCEociA9IGRybU1h
bGxvYyhzaXplb2YoKnIpKSkpCj4gLQkJcmV0dXJuIE5VTEw7Cj4gKwkJZ290byBlcnJfYWxsb2Nz
Owo+ICAKPiAgCXItPnByb3BfaWQgPSBwcm9wLnByb3BfaWQ7Cj4gIAlyLT5jb3VudF92YWx1ZXMg
PSBwcm9wLmNvdW50X3ZhbHVlczsKPiAtLSAKPiAxLjcuNC4xCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
