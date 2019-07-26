Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A967634B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 12:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA5890EE;
	Fri, 26 Jul 2019 10:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4CC890EE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 10:15:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7F69B2003C;
 Fri, 26 Jul 2019 12:15:14 +0200 (CEST)
Date: Fri, 26 Jul 2019 12:15:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 2/3] drm/panel: jh057n00900: Move
 mipi_dsi_dcs_set_display_off to disable()
Message-ID: <20190726101513.GA15658@ravnborg.org>
References: <cover.1564132646.git.agx@sigxcpu.org>
 <b139adf5f47a0988b12542780963a5fbabb77389.1564132646.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b139adf5f47a0988b12542780963a5fbabb77389.1564132646.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8
 a=5NzjFCevEPO7GEHoP-oA:9 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8uCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAxMToyMTo0MkFNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBUaGlzIG1ha2VzIGl0IHN5bW1ldHJpYyB3aXRoIHRoZSBwYW5l
bCBpbml0IGhhcHBlbmluZyBpbiBlbmFibGUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBH
w7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyB8IDEwICsrKysrKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+IGluZGV4IGM2
YjRiZmQ3OWZkZS4uY2M4OTgzMWUzMGE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKPiBAQCAtMTU4LDE5ICsxNTgsMjMg
QEAgc3RhdGljIGludCBqaDA1N25fZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICBz
dGF0aWMgaW50IGpoMDU3bl9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICB7Cj4g
IAlzdHJ1Y3QgamgwNTduICpjdHggPSBwYW5lbF90b19qaDA1N24ocGFuZWwpOwo+ICsJc3RydWN0
IG1pcGlfZHNpX2RldmljZSAqZHNpID0gdG9fbWlwaV9kc2lfZGV2aWNlKGN0eC0+ZGV2KTsKPiAr
CWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gYmFja2xpZ2h0X2Rpc2FibGUoY3R4LT5iYWNrbGlnaHQp
Owo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJldDsKV2UgbW9zdCBsaWtlbHkgZG8gbm90
IHdhbnQgdG8gc2tpcCBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKCkKanVzdCBiZWNhdXNl
IHdlIGZhaWwgdG8gZGlzYWJsZSBiYWNrbGlnaHQuCk1vc3Qgb3RoZXIgcGFuZWxzIGRpc2FibGUg
YmFja2xpZ2h0IHdpdGhvdXQgYSBjaGVjayBmb3IgdGhlIHJldHVybgp2YWx1ZS4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
