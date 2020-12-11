Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFE2D783F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56C16E3FC;
	Fri, 11 Dec 2020 14:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1716E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 14:53:47 +0000 (UTC)
X-Gm-Message-State: AOAM533TpWLgf4uG8cYDjOm4SoTxAGGorJJkfAXFbVpFAgrF/xYESZ3C
 0NpJwTE5N7SGMug7U1ZiQFfZFrK5LpYHtI0Iyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607698012;
 bh=kMGlC86uydZtd+hqrVgic6SM+HBSXPFoclUBLRZV+W0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oIyQEnHRnQVqjF3lPXkM2jdJZPuJrBRV4mjDmkyC7D2YkMytrKxvnLYtY/MuZ8U/Z
 W2OUDIdIl5P5nA+Grcj7irhjVn0ALUSpEaB9xq3sTtFco4Ioc5EaORLgi+/Fx1x1B1
 xuTzcH5vpNBd8jobFSsDlhuU/N6m6vTAlNmwOCa52uoTl+L+OKQeUIZBQMMDrnbCbl
 aWGhg7987Lki9Xe3xfn+ju4MxOO01qIDqA7zvZYo8oun/gimaAkwCOmj43NF6l0pID
 NrBJeFA4dAUjrbCc1WRzn31ZiyySttmX0+rmnlXaoevbPEZszXOPWO4MHLzSftdiW2
 VV7HliYYfHt3g==
X-Google-Smtp-Source: ABdhPJwAF2z+4ptZLYQgJaLTwt2m+q4kzvOhtU1ax7sWHg9DZiTR/rIDy9PKQk1Nfa6Qmwufx6w8ViJve1ZjDZ/qZUQ=
X-Received: by 2002:a5d:6443:: with SMTP id d3mr14035794wrw.422.1607698005242; 
 Fri, 11 Dec 2020 06:46:45 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
 <1607647416.12750.3.camel@mhfsdcap03>
In-Reply-To: <1607647416.12750.3.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 22:46:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__y70tF2ORQDgZfk7RfeQm4fKraPnOQWMDnWsBb7HmZnQ@mail.gmail.com>
Message-ID: <CAAOTY__y70tF2ORQDgZfk7RfeQm4fKraPnOQWMDnWsBb7HmZnQ@mail.gmail.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDPlr6vpgZPvvJoKPgo+IE9u
IFRodSwgMjAyMC0xMi0xMCBhdCAyMzo0MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INToyMuWvq+mBk++8
mgo+ID4gPgo+ID4gPiByZG1hIGZpZm8gc2l6ZSBtYXkgYmUgZGlmZmVyZW50IGV2ZW4gaW4gc2Ft
ZSBTT0MsIGFkZCB0aGlzCj4gPiA+IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEK
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiBpbmRleCAxMjEyMjA3Li42NGM2NGVl
IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+
ID4gPiBAQCAtNjYsNiArNjYsMTMgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoRE1BIGZ1bmN0aW9u
IGJsb2Nrcyk6Cj4gPiA+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dAo+ID4gPiAgICBmb3IgZGV0YWlscy4K
PiA+ID4KPiA+ID4gK09wdGlvbmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiA+ID4gKy0gbWVkaWF0ZWsscmRtYV9maWZvX3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBk
aWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywgYWRkIHRoaXMKPiA+ID4gKyAgcHJvcGVydHkgdG8g
dGhlIGNvcnJlc3BvbmRpbmcgcmRtYQo+ID4gPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1
ZSB3aGljaCBkZWZpbmVkIGluIGhhcmR3YXJlIGRhdGEgc2hlZXQuCj4gPiA+ICsgIHJkbWFfZmlm
b19zaXplIG9mIHJkbWEwIGluIG10ODE4MyBpcyA1MTIwCj4gPiA+ICsgIHJkbWFfZmlmb19zaXpl
IG9mIHJkbWExIGluIG10ODE4MyBpcyAyMDQ4Cj4gPiA+ICsKPiA+ID4gIEV4YW1wbGVzOgo+ID4g
Pgo+ID4gPiAgbW1zeXM6IGNsb2NrLWNvbnRyb2xsZXJAMTQwMDAwMDAgewo+ID4gPiBAQCAtMjA3
LDMgKzIxNCwxMiBAQCBvZEAxNDAyMzAwMCB7Cj4gPiA+ICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5fTU0+Owo+ID4gPiAgICAgICAgIGNsb2NrcyA9
IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Owo+ID4gPiAgfTsKPiA+ID4gKwo+ID4gPiArcmRtYTE6
IHJkbWFAMTQwMGMwMDAgewo+ID4gPiArICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLWRpc3AtcmRtYSI7Cj4gPiA+ICsgICAgICAgcmVnID0gPDAgMHgxNDAwYzAwMCAwIDB4MTAw
MD47Cj4gPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOSBJUlFfVFlQRV9MRVZF
TF9MT1c+Owo+ID4gPiArICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxODNfUE9X
RVJfRE9NQUlOX0RJU1A+Owo+ID4gPiArICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJ
U1BfUkRNQTE+Owo+ID4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFfZmlmb19zaXplID0gPDIwNDg+
Owo+ID4gPiArfTsKPiA+Cj4gPiBJbiBbMV0sIFJvYiBoYXMgc3VnZ2VzdCB0aGF0IG5vdCBhZGQg
ZXhhbXBsZSBvZiByZG1hMSwgaXQncyBiZXR0ZXIgdG8KPiA+IGFkZCBtZWRpYXRlayxyZG1hX2Zp
Zm9fc2l6ZSBpbiByZG1hMCBmb3IgZXhhbXBsZS4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzE1OTY4NTUyMzEtNTc4
Mi0yLWdpdC1zZW5kLWVtYWlsLXlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tLwo+ID4KPiA+IFJl
Z2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+Cj4gdGhlIGRlc2NyaXB0aW9uIG9mIHJkbWEwIGlzIG10
ODE3MywgYW5kIG10ODE3MyByZG1hIGRyaXZlciBzZXQgdGhlCj4gY29ycmVzcG9uZCBmaWZvIHNp
emUgYWxyZWFkeSBvayBsaWtlIHRoaXM6Cj4gc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9y
ZG1hX2RhdGEgbXQ4MTczX3JkbWFfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuZmlmb19zaXpl
ID0gU1pfOEssCj4gfTsKPgo+IHBsZWFzZSBkb3VibGUgY29uZmlybSBzaGFsbCB3ZSBhZGQgdGhp
cyBpbmZvcm1hdGlvbiBpbnRvIHJkbWEwCj4gZGVzY3JpcHRpb24uCj4KCkRldmljZSB0cmVlIGlz
IHVzZWQgdG8gZGVzY3JpYmUgaGFyZHdhcmUuIFRoYXQgbWVhbnMgZGV2aWNlIHRyZWUKZGVzY3Jp
cHRpb24gc2hvdWxkIG5vdCBjb25zaWRlciB5b3VyIGRyaXZlcidzIGltcGxlbWVudGF0aW9uLgpt
ZWRpYXRlayxyZG1hLWZpZm8tc2l6ZSBvZiBtdDgxNzMtcmRtYTAgaXMgOEssIHNvIEkgY291bGQg
d3JpdGUgdGhpcwppbmZvcm1hdGlvbiBpbiBkZXZpY2Ugbm9kZSBiZWNhdXNlIHRoaXMgaGFyZHdh
cmUgaXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4KPiA+ID4gLS0KPiA+ID4gMS44LjEu
MS5kaXJ0eQo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
