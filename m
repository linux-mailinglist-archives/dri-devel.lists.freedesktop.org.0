Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326923C079
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C271F89125;
	Tue, 11 Jun 2019 00:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949C289110
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 12:58:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j29so6543209lfk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 05:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DLFQ8by/jV1+O/LDvQ3huJEjoQ4sVNIYrRFls+hbxg=;
 b=DcnjFlxM83Pt0N0FUTQepTeMuWMfqc4IySnfmhJknPqzdeJfZ58LdxPUBGfIu+/99E
 a0m2x5unr7r4MhlK2EidDyYHnWdTqBiGzzl+/c72lUbgmjobLGdxg3DnAJyPjlcQEDsJ
 ZeK5ZPb1BAiw+InuGFSd1h9S0fstTmu9H9Rcl26gkU8qIapI5GmHAeRxrJ26d3sOxGqE
 dnz+cRl7J3iiLj2/y9YfbGgaYHx+nG/Kb0eXQgNhmEUvS0Y/vQwqgnLS9PDVJHYrgtKC
 W5EQHW41li+5F61Swbxi9pC292GDaeiek7X7sKW0/xKZTM9WMfp1gn6TeIrYOQTcdAiL
 aTdw==
X-Gm-Message-State: APjAAAW0gxz4CrfbU18PYsY/vRvsb8yBjXPodDIC8Q9PPrwuN40CmbFg
 a/auGP0KhoQLuk1JQvwLMReLortOJyMjbuOId0YUZA==
X-Google-Smtp-Source: APXvYqw+d2TzVaMlkIN2DtQbw9EMUt0fHjzFymluDcPEIw5oOSKylqjj5JhidkPvvSMbBAUtXjailq7IiV0LAj261QA=
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr28592327lfi.130.1560171510009; 
 Mon, 10 Jun 2019 05:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094657.23612-1-anders.roxell@linaro.org>
 <20190606071052.412a766d@coco.lan>
In-Reply-To: <20190606071052.412a766d@coco.lan>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 10 Jun 2019 14:58:18 +0200
Message-ID: <CADYN=9K0k30U5Uov3RHuSQAe2hfdVCWayWHmVdzQ9umD8Mpi-A@mail.gmail.com>
Subject: Re: [PATCH 0/8] fix warnings for same module names
To: Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:27:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7DLFQ8by/jV1+O/LDvQ3huJEjoQ4sVNIYrRFls+hbxg=;
 b=kJwSbhswbKbQHzM85JPdk5WWpRJM3BNteN454cZjnKRT4+2cK1IwcgVbguNeugjWKU
 anfYSptxIdmrRV7MDJsWRwyVls6QGDNJe5RT+rmXTGCG/V7I4ey08t14jgw3CqDZdqaM
 4iETn+6dLcyFpjEoplS3FYXNzJi3sRorfA74TrLC+x6NxDVEIZqzxw7UcdmfBUQRlhlD
 XI6GJjZNM0hgCsW6GDaj6cyDatbRJLDB/QZwR6Hjgxqcihk9ghBmHeWACTK2zvqac68v
 dsnJZUC75L3rxuEyKrjXMpty88ykkZ7ebW3xpLMPpt/RQC6Pk3NpgulvKjx1FFOGfJXq
 0hQA==
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, marex@denx.de, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 b.zolnierkie@samsung.com, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 shawnguo@kernel.org, David Miller <davem@davemloft.net>, hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEp1biAyMDE5IGF0IDEyOjExLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBFbSBUaHUsICA2IEp1biAyMDE5IDExOjQ2OjU3ICsw
MjAwCj4gQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPiBlc2NyZXZldToK
Pgo+ID4gSGksCj4gPgo+ID4gVGhpcyBwYXRjaCBzZXQgYWRkcmVzc2VzIHdhcm5pbmdzIHRoYXQg
bW9kdWxlIG5hbWVzIGFyZSBuYW1lZCB0aGUKPiA+IHNhbWUsIHRoaXMgbWF5IGxlYWQgdG8gYSBw
cm9ibGVtIHRoYXQgd3JvbmcgbW9kdWxlIGdldHMgbG9hZGVkIG9yIGlmIG9uZQo+ID4gb2YgdGhl
IHR3byBzYW1lLW5hbWUgbW9kdWxlcyBleHBvcnRzIGEgc3ltYm9sLCB0aGlzIGNhbiBjb25mdXNl
IHRoZQo+ID4gZGVwZW5kZW5jeSByZXNvbHV0aW9uLiBhbmQgdGhlIGJ1aWxkIG1heSBmYWlsLgo+
ID4KPiA+Cj4gPiBQYXRjaCAiZHJpdmVyczogbmV0OiBkc2E6IHJlYWx0ZWs6IGZpeCB3YXJuaW5n
IHNhbWUgbW9kdWxlIG5hbWVzIiBhbmQKPiA+ICJkcml2ZXJzOiBuZXQ6IHBoeTogcmVhbHRlazog
Zml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMiIHJlc29sdmVzIHRoZQo+ID4gbmFtZSBjbGF0
Y2ggcmVhbHRlay5rby4KPiA+Cj4gPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoK
PiA+ICAgZHJpdmVycy9uZXQvcGh5L3JlYWx0ZWsua28KPiA+ICAgZHJpdmVycy9uZXQvZHNhL3Jl
YWx0ZWsua28KPiA+Cj4gPgo+ID4gUGF0Y2ggICJkcml2ZXJzOiAodmlkZW98Z3B1KTogZml4IHdh
cm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMiIHJlc29sdmVzCj4gPiB0aGUgbmFtZSBjbGF0Y2ggbXhz
ZmIua28uCj4gPgo+ID4gd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiAgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvbXhzZmIua28KPiA+ICAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214
c2ZiLmtvCj4gPgo+ID4gUGF0Y2ggImRyaXZlcnM6IG1lZGlhOiBpMmM6IGZpeCB3YXJuaW5nIHNh
bWUgbW9kdWxlIG5hbWVzIiByZXNvbHZlcyB0aGUKPiA+IG5hbWUgY2xhdGNoIGFkdjc1MTEua28g
aG93ZXZlciwgaXQgc2VhbXMgdG8gcmVmZXIgdG8gdGhlIHNhbWUgZGV2aWNlCj4gPiBuYW1lIGlu
IGkyY19kZXZpY2VfaWQsIGRvZXMgYW55b25lIGhhdmUgYW55IGd1aWRhbmNlIGhvdyB0aGF0IHNo
b3VsZCBiZQo+ID4gc29sdmVkPwo+ID4KPiA+IHdhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZv
dW5kOgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5rbwo+ID4g
ICBkcml2ZXJzL21lZGlhL2kyYy9hZHY3NTExLmtvCj4gPgo+ID4KPiA+IFBhdGNoICJkcml2ZXJz
OiBtZWRpYTogY29kYTogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMiIHJlc29sdmVzIHRo
ZQo+ID4gbmFtZSBjbGF0Y2ggY29kYS5rby4KPiA+Cj4gPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBu
YW1lcyBmb3VuZDoKPiA+ICAgZnMvY29kYS9jb2RhLmtvCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vY29kYS9jb2RhLmtvCj4KPiBNZWRpYSBjaGFuZ2UgbG9vayBvaywgYW5kIHByb2JhYmx5
IHRoZSBvdGhlciBwYXRjaGVzIHRvbywgYnV0IHRoZQo+IHByb2JsZW0gaGVyZSBpczogd2hvIHdp
bGwgYXBwbHkgaXQgYW5kIHdoZW4uCj4KPiBUaGUgd2F5IHlvdSBncm91cGVkIHRoZSBjaGFuZ2Vz
IG1ha2VzIGhhcmRlciBmb3Igc3Vic3lzdGVtIG1haW50YWluZXJzCj4gdG8gcGljaywgYXMgdGhl
IHNhbWUgcGF0Y2ggdG91Y2hlcyBtdWx0aXBsZSBzdWJzeXN0ZW1zLgo+Cj4gT24gdGhlIG90aGVy
IGhhbmQsIGlmIHRoaXMgZ2V0cyBwaWNrZWQgYnkgc29tZW9uZSBlbHNlLCBpdCBoYXMgdGhlCj4g
cG90ZW50aWFsIHRvIGNhdXNlIGNvbmZsaWN0cyBiZXR3ZWVuIGxpbnV4LW5leHQgYW5kIHRoZSBt
YWludGFpbmVyJ3MKPiB0cmVlLgo+Cj4gU28sIHRoZSBiZXN0IHdvdWxkIGJlIGlmIHlvdSByZS1h
cnJhbmdlIHRoaXMgc2VyaWVzIHRvIHN1Ym1pdCBvbmUKPiBwYXRjaCBwZXIgc3Vic3lzdGVtLgoK
SSB3aWxsIHNlbmQgaXQgcGVyIHN1YnN5c3RlbS4KCkNoZWVycywKQW5kZXJzCgo+Cj4KPiA+Cj4g
Pgo+ID4gUGF0Y2ggImRyaXZlcnM6IG5ldDogcGh5OiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBu
YW1lcyIgcmVzb2x2ZXMgdGhlCj4gPiBuYW1lIGNsYXRjaCBhc2l4LmtvLgo+ID4KPiA+IHdhcm5p
bmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL25ldC9waHkvYXNpeC5r
bwo+ID4gICBkcml2ZXJzL25ldC91c2IvYXNpeC5rbwo+ID4KPiA+IFBhdGNoICJkcml2ZXJzOiBt
ZmQ6IDg4cG04MDA6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzIiBhbmQKPiA+ICJkcml2
ZXJzOiByZWd1bGF0b3I6IDg4cG04MDA6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzIiBy
ZXNvbHZlcwo+ID4gdGhlIG5hbWUgY2xhdGNoIDg4cG04MDAua28uCj4gPgo+ID4gd2FybmluZzog
c2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6Cj4gPiAgIGRyaXZlcnMvcmVndWxhdG9yLzg4cG04MDAu
a28KPiA+ICAgZHJpdmVycy9tZmQvODhwbTgwMC5rbwo+ID4KPiA+Cj4gPiBDaGVlcnMsCj4gPiBB
bmRlcnMKPiA+Cj4gPiBBbmRlcnMgUm94ZWxsICg4KToKPiA+ICAgZHJpdmVyczogbmV0OiBkc2E6
IHJlYWx0ZWs6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCj4gPiAgIGRyaXZlcnM6IG5l
dDogcGh5OiByZWFsdGVrOiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcwo+ID4gICBkcml2
ZXJzOiAodmlkZW98Z3B1KTogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMKPiA+ICAgZHJp
dmVyczogbWVkaWE6IGkyYzogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMKPiA+ICAgZHJp
dmVyczogbWVkaWE6IGNvZGE6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCj4gPiAgIGRy
aXZlcnM6IG5ldDogcGh5OiBmaXggd2FybmluZyBzYW1lIG1vZHVsZSBuYW1lcwo+ID4gICBkcml2
ZXJzOiBtZmQ6IDg4cG04MDA6IGZpeCB3YXJuaW5nIHNhbWUgbW9kdWxlIG5hbWVzCj4gPiAgIGRy
aXZlcnM6IHJlZ3VsYXRvcjogODhwbTgwMDogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUgbmFtZXMK
PiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL01ha2VmaWxlIHwgMTAgKysr
KystLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9NYWtlZmlsZSAgICAgICAgICB8ICA0
ICsrLS0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyAr
Ky0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUgICAgfCAgNCArKy0t
Cj4gPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKyst
LQo+ID4gIGRyaXZlcnMvbmV0L2RzYS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICA0ICsrLS0K
PiA+ICBkcml2ZXJzL25ldC9waHkvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgNiArKysrLS0K
PiA+ICBkcml2ZXJzL3JlZ3VsYXRvci9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyArKy0KPiA+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlICAgICAgICAgICAgfCAgMyArKy0KPiA+ICA5
IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+ID4KPgo+
Cj4KPiBUaGFua3MsCj4gTWF1cm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
