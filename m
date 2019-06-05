Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA835870
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B3B895D7;
	Wed,  5 Jun 2019 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9F895D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:22:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2BD71804F9;
 Wed,  5 Jun 2019 10:22:23 +0200 (CEST)
Date: Wed, 5 Jun 2019 10:22:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling
 down reset gpio
Message-ID: <20190605082221.GB15169@ravnborg.org>
References: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
 a=e5mUnYsNAAAA:8 a=u_M7I5vmc8m8u026BJQA:9 a=CjuIK1q_8ugA:10
 a=pioyyrs4ZptJ924tMmac:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVml2ZWssCgpPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwMzo1NjoxNlBNICswNTMwLCBWaXZl
ayBHYXV0YW0gd3JvdGU6Cj4gTVRQIFNETTg0NSBwYW5lbCBzZWVtcyB0byBuZWVkIGFkZGl0aW9u
YWwgZGVsYXkgdG8gYnJpbmcgcGFuZWwKPiB0byBhIHdvcmthYmxlIHN0YXRlLiBSdW5uaW5nIG1v
ZGV0ZXN0IHdpdGhvdXQgdGhpcyBjaGFuZ2UgZGlzcGxheXMKPiBibHVycnkgYXJ0aWZhY3RzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFZpdmVrIEdhdXRhbSA8dml2ZWsuZ2F1dGFtQGNvZGVhdXJvcmEu
b3JnPgoKYWRkZWQgdG8gZHJtLW1pc2MtbmV4dAoKCVNhbQoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXRydWx5LW50MzU1OTcuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cnVseS1u
dDM1NTk3LmMKPiBpbmRleCBmYzJhNjZjNTNkYjQuLmFhNzE1M2ZkM2JlNCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYwo+IEBAIC0yODAsNiArMjgw
LDcgQEAgc3RhdGljIGludCB0cnVseV8zNTU5N19wb3dlcl9vbihzdHJ1Y3QgdHJ1bHlfbnQzNTU5
NyAqY3R4KQo+ICAJZ3Bpb2Rfc2V0X3ZhbHVlKGN0eC0+cmVzZXRfZ3BpbywgMSk7Cj4gIAl1c2xl
ZXBfcmFuZ2UoMTAwMDAsIDIwMDAwKTsKPiAgCWdwaW9kX3NldF92YWx1ZShjdHgtPnJlc2V0X2dw
aW8sIDApOwo+ICsJdXNsZWVwX3JhbmdlKDEwMDAwLCAyMDAwMCk7Cj4gIAo+ICAJcmV0dXJuIDA7
Cj4gIH0KPiAtLSAKPiBRVUFMQ09NTSBJTkRJQSwgb24gYmVoYWxmIG9mIFF1YWxjb21tIElubm92
YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyCj4gb2YgQ29kZSBBdXJvcmEgRm9ydW0sIGhv
c3RlZCBieSBUaGUgTGludXggRm91bmRhdGlvbgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
