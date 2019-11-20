Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E081410359C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 08:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8706E1F4;
	Wed, 20 Nov 2019 07:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41326E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 07:51:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 4C0C72813B8
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Fabio Estevam <festevam@gmail.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v3 3/4] drm: imx: Add i.MX 6 MIPI DSI host driver
In-Reply-To: <CAOMZO5C5gpW6KF9d-79wd=-7ZGAbXQLAXw3kLi+_5DBW_DYrTw@mail.gmail.com>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-4-adrian.ratiu@collabora.com>
 <CAOMZO5C5gpW6KF9d-79wd=-7ZGAbXQLAXw3kLi+_5DBW_DYrTw@mail.gmail.com>
Date: Wed, 20 Nov 2019 09:51:56 +0200
Message-ID: <87o8x7dlyb.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3
cm90ZToKPiBIaSBBZHJpYW4sIAoKSGkgRmFiaW8sCgo+IAo+IE9uIE1vbiwgTm92IDE4LCAyMDE5
IGF0IDEyOjI1IFBNIEFkcmlhbiBSYXRpdSAKPiA8YWRyaWFuLnJhdGl1QGNvbGxhYm9yYS5jb20+
IHdyb3RlOiAKPiAKPiBTb21lIG5pdHBpY2tzOiAKPiAKPj4gKyArY29uZmlnIERSTV9JTVhfTUlQ
SV9EU0kgKyAgICAgICB0cmlzdGF0ZSAiRnJlZXNjYWxlIGkuTVggRFJNIAo+PiBNSVBJIERTSSIg
Cj4gCj4gVGhpcyB0ZXh0IHNlZW1zIHRvbyBnZW5lcmljIGFzIHRoZXJlIGFyZSBpLk1YIFNvQ3Mg
dGhhdCB1c2UgCj4gZGlmZmVyZW50IE1JUEkgRFNJIElQLiAKPiAKPiBNYXliZSAiRnJlZXNjYWxl
IGkuTVg2IERSTSBNSVBJIERTSSIgaW5zdGVhZD8gCgpZZXMsIHRoaXMgaXMgYSBnb29kIGlkZWEs
IHdpbGwgdXBkYXRlIGluIGEgbmV3ZXIgdmVyc2lvbiB0byBtYWtlIAppdCBtb3JlIHNwZWNpZmlj
LiBJJ2xsIGxldCB0aGlzIHZlcnNpb24gc2l0IGEgbGl0dGxlIG1vcmUgb24gCnJldmlldyBzbyBv
dGhlcnMgYWxzbyBoYXZlIHRpbWUgdG8gcmV2aWV3LgoKVGhhbmsgeW91IQoKPiAKPj4gK21vZHVs
ZV9wbGF0Zm9ybV9kcml2ZXIoaW14X21pcGlfZHNpX2RyaXZlcik7ICsgCj4+ICtNT0RVTEVfREVT
Q1JJUFRJT04oImkuTVggTUlQSSBEU0kgaG9zdCBjb250cm9sbGVyIGRyaXZlciIpOyAKPiAKPiBp
Lk1YNiBNSVBJIERTSSwgcGxlYXNlLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
