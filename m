Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F9CEB12
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86406E6A5;
	Mon,  7 Oct 2019 17:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29AD6E6A5;
 Mon,  7 Oct 2019 17:54:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4881B2D;
 Mon,  7 Oct 2019 19:54:07 +0200 (CEST)
Date: Mon, 7 Oct 2019 20:54:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RFC v2 1/5] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Message-ID: <20191007175404.GH11781@pendragon.ideasonboard.com>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007014509.25180-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570470849;
 bh=22A5q4Pj5aS9Ff9hTyiY7gnGGMylAQ77eyxkCoEXOro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKPWMRIq8/069H17TkSvP+k3h6vSY3B1ZBLwR7MMMtu2u5dBFQuRdvLVelL9dTWoy
 IhwyXyf/TxovIw7mlzeI7VqqrjQTgTLgvHecItoKfwW5QthxKGHluz4dP8qMPzbf+t
 w67aZXlFwA0PBwRn9DmhpGXGzP6qxxkcQUV4zm7g=
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFN1biwgT2N0IDA2LCAyMDE5
IGF0IDA5OjQ1OjA1UE0gLTA0MDAsIEJyaWFuIE1hc25leSB3cm90ZToKPiBBZGQgc3VwcG9ydCBm
b3IgdGhlIGF2ZGQzMyByZWd1bGF0b3IgdG8gdGhlIGFuYWxvZ2l4LWFueDc4eHggZHJpdmVyLgo+
IE5vdGUgdGhhdCB0aGUgcmVndWxhdG9yIGlzIGN1cnJlbnRseSBlbmFibGVkIGR1cmluZyBkcml2
ZXIgcHJvYmUgYW5kCj4gZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbW92ZWQuIFRoaXMg
aXMgY3VycmVudGx5IGhvdyB0aGUKPiBkb3duc3RyZWFtIE1TTSBrZXJuZWwgc291cmNlcyBkbyB0
aGlzLgo+IAo+IExldCdzIG5vdCBtZXJnZSB0aGlzIHVwc3RyZWFtIGZvciB0aGUgbWVhbiB0aW1l
IHVudGlsIEkgZ2V0IHRoZSBleHRlcm5hbAo+IGRpc3BsYXkgZnVsbHkgd29ya2luZyBvbiB0aGUg
TmV4dXMgNSBhbmQgdGhlbiBJIGNhbiBzdWJtaXQgcHJvcGVyCj4gc3VwcG9ydCB0aGVuIHRoYXQg
cG93ZXJzIGRvd24gdGhpcyByZWd1bGF0b3IgaW4gdGhlIHBvd2VyIG9mZiBmdW5jdGlvbi4KClBs
ZWFzZSB0aGVuIGFsc28gdXBkYXRlIHRoZSBjb3JyZXNwb25kaW5nIERUIGJpbmRpbmdzIHRvIGRl
c2NyaWJlIHRoZQphdmRkMzMgc3VwcGx5LgoKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkg
PG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gTm9u
ZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDMzICsr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4
eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKPiBpbmRleCBk
ZWMzZjdlNjZhYTAuLmUyNWZhZTM2ZGJlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgtYW54Nzh4eC5jCj4gQEAgLTU2LDYgKzU2LDcgQEAgc3RhdGljIGNvbnN0IHU4IGFu
eDc4MXhfaTJjX2FkZHJlc3Nlc1tdID0gewo+ICAKPiAgc3RydWN0IGFueDc4eHhfcGxhdGZvcm1f
ZGF0YSB7Cj4gIAlzdHJ1Y3QgcmVndWxhdG9yICpkdmRkMTA7Cj4gKwlzdHJ1Y3QgcmVndWxhdG9y
ICphdmRkMzM7Cj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZF9ocGQ7Cj4gIAlzdHJ1Y3QgZ3Bp
b19kZXNjICpncGlvZF9wZDsKPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kX3Jlc2V0Owo+IEBA
IC03MTUsMTAgKzcxNiw0MiBAQCBzdGF0aWMgaW50IGFueDc4eHhfc3RhcnQoc3RydWN0IGFueDc4
eHggKmFueDc4eHgpCj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBhbng3
OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbih2b2lkICpfZGF0YSkKPiArewo+ICsJc3RydWN0
IGFueDc4eHhfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBfZGF0YTsKPiArCj4gKwlyZWd1bGF0b3Jf
ZGlzYWJsZShwZGF0YS0+YXZkZDMzKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBhbng3OHh4X2lu
aXRfcGRhdGEoc3RydWN0IGFueDc4eHggKmFueDc4eHgpCj4gIHsKPiAgCXN0cnVjdCBhbng3OHh4
X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gJmFueDc4eHgtPnBkYXRhOwo+ICAJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJmFueDc4eHgtPmNsaWVudC0+ZGV2Owo+ICsJaW50IGVycjsKPiArCj4gKwkvKiAz
LjNWIGRpZ2l0YWwgY29yZSBwb3dlciByZWd1bGF0b3IgICovCj4gKwlwZGF0YS0+YXZkZDMzID0g
ZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImF2ZGQzMyIpOwo+ICsJaWYgKElTX0VSUihwZGF0YS0+
YXZkZDMzKSkgewo+ICsJCWVyciA9IFBUUl9FUlIocGRhdGEtPmF2ZGQzMyk7Cj4gKwkJaWYgKGVy
ciAhPSAtRVBST0JFX0RFRkVSKQo+ICsJCQlEUk1fRVJST1IoImF2ZGQzMyByZWd1bGF0b3Igbm90
IGZvdW5kXG4iKTsKPiArCj4gKwkJcmV0dXJuIGVycjsKPiArCX0KPiArCj4gKwllcnIgPSByZWd1
bGF0b3JfZW5hYmxlKHBkYXRhLT5hdmRkMzMpOwo+ICsJaWYgKGVycikgewo+ICsJCURSTV9FUlJP
UigiRmFpbGVkIHRvIGVuYWJsZSBhdmRkMzMgcmVndWxhdG9yOiAlZFxuIiwgZXJyKTsKPiArCQly
ZXR1cm4gZXJyOwo+ICsJfQo+ICsKPiArCWVyciA9IGRldm1fYWRkX2FjdGlvbihkZXYsIGFueDc4
eHhfZGlzYWJsZV9yZWd1bGF0b3JfYWN0aW9uLAo+ICsJCQkgICAgICBwZGF0YSk7Cj4gKwlpZiAo
ZXJyIDwgMCkgewo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHNldHVwIHJlZ3VsYXRvciBj
bGVhbnVwIGFjdGlvbiAlZFxuIiwKPiArCQkJZXJyKTsKPiArCQlyZXR1cm4gZXJyOwo+ICsJfQo+
ICAKPiAgCS8qIDEuMFYgZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KPiAgCXBkYXRh
LT5kdmRkMTAgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAiZHZkZDEwIik7CgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
