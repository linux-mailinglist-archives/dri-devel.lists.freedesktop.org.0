Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD581E6F88
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1416E1B4;
	Thu, 28 May 2020 22:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC05B6E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 22:48:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D64742A8;
 Fri, 29 May 2020 00:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590706127;
 bh=cdsHXo6OKUnTW5BR3DkvIcc+0E7wWVVJF01vOkcdybU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOlOp9ERp7sP/cv0RcfSVx08Rs5F2NJ38mNzxDiouoKsk3hbBPCZ4D3usqCEltwlx
 H0bzwLrayVMrscNMyMLoVT9bgJyUqzqTHKq63rbHmmyoT6zhhe85OroD/VutySHmBt
 p1Fb6nOSufjvYXgzSFrPc29VlFgr1gGJP+7C/UeQ=
Date: Fri, 29 May 2020 01:48:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display/bridge: Add binding for
 input mux bridge
Message-ID: <20200528224832.GE14756@pendragon.ideasonboard.com>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <14a44a664f40584ffa25c1764aab5ebf97809c71.1589548223.git.agx@sigxcpu.org>
 <20200528194804.GA541078@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528194804.GA541078@bogus>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDE6NDg6MDRQTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBNYXkgMTUsIDIwMjAgYXQgMDM6MTI6MTBQTSArMDIwMCwg
R3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gPiBUaGUgYnJpZGdlIGFsbG93cyB0byBzZWxlY3QgdGhl
IGlucHV0IHNvdXJjZSB2aWEgYSBtdXggY29udHJvbGxlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9kaXNw
bGF5L2JyaWRnZS9tdXgtaW5wdXQtYnJpZGdlLnlhbWwgICAgICB8IDEyMyArKysrKysrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL211eC1pbnB1dC1icmlkZ2UueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL211eC1pbnB1dC1icmlkZ2Uu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9t
dXgtaW5wdXQtYnJpZGdlLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjQwMjljZjYzZWU1Ywo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL211eC1pbnB1dC1i
cmlkZ2UueWFtbAo+ID4gQEAgLTAsMCArMSwxMjMgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+
ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJp
ZGdlL211eC1pbnB1dC1icmlkZ2UueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogRFJNIGlucHV0
IHNvdXJjZSBzZWxlY3Rpb24gdmlhIG11bHRpcGxleGVyCj4gCj4gRFJNIGlzIG5vdCBhIGhhcmR3
YXJlIHRoaW5nLgo+IAo+IFRoZSBncmFwaCBiaW5kaW5nIGlzIGFscmVhZHkgZGVzaWduZWQgdG8g
c3VwcG9ydCBtdXhpbmcuIEdlbmVyYWxseSwgCj4gbXVsdGlwbGUgZW5kcG9pbnRzIG9uIGFuIGlu
cHV0IG5vZGUgaXMgYSBtdXguIFNvIGVpdGhlciB0aGUgZGV2aWNlIHdpdGggCj4gdGhlIGlucHV0
IHBvcnRzIGtub3dzIGhvdyB0byBzZWxlY3QgdGhlIGlucHV0LCBvciB5b3UganVzdCBuZWVkIGEg
Cj4gbXV4LWNvbnRyb2wgcHJvcGVydHkgZm9yIHRoZSBwb3J0IHRvIGhhdmUgc29tZSBvdGhlciBk
ZXZpY2UgaW1wbGVtZW50IAo+IHRoZSBjb250cm9sLgoKVGhlIG11eCBtb2RlbGxlZCBieSB0aGlz
IGJpbmRpbmcgaXMgdXNlZCBieSBHdWlkbyB3aXRoIHRoZSBOV0wgRFNJCmJyaWRnZSBpbnRlZ3Jh
dGVkIGluIHRoZSBpLk1YOC4gVGhlIE5XTCBEU0kgaXMgYW4gSVAgY29yZSB0aGF0IGhhcyBhCnNp
bmdsZSBpbnB1dC4gVGhlIGkuTVg4IGhhcyBhbiBhZGRpdGlvbmFsIG11eCBpbiBmcm9udCBvZiB0
aGUgTldMIERTSSwKdG8gc2VsZWN0IGJldHdlZW4gdGhlIHR3byBkaXNwbGF5IGNvbnRyb2xsZXJz
IGluIHRoZSBTb0MgKGVMQ0RJRiBhbmQKRENTUykuIFRoZSBtdXggZG9lc24ndCBiZWxvbmcgdG8g
YW55IG9mIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIsIGl0J3MKcmVhbGx5IGdsdWUgbG9naWMgYmV0
d2VlbiB0aGUgZGlzcGxheSBjb250cm9sbGVycyBhbmQgdGhlIE5XTCBEU0kKYnJpZGdlLgoKSSBh
Z3JlZSB0aGF0IHRoZSBiaW5kaW5ncyBzaG91bGRuJ3QgbWVudGlvbiBEUk0uIEkgd291bGQgaG93
ZXZlciBwcmVmZXIKbm90IGFkZGluZyBhIG11eC1jb250cm9sIHByb3BlcnR5IGFuZCBtdWx0aXBs
ZSBpbnB1dCBwb3J0cyB0byB0aGUgTldMCkRTSSBiaW5kaW5nLCBhcyB0aGUgbXV4IGlzbid0IGlu
dGVybmFsIHRvIHRoYXQgSVAgY29yZSAoaWYgd2UgZ28gdGhhdApyb3V0ZSwgd2Ugd291bGQgbmVl
ZCB0byBhZGQgbXV4IGNvbnRyb2wgdG8gYW55IElQIGNvcmUgdGhhdCB3b3VsZCBiZQppbnRlZ3Jh
dGVkIGluIGFuIFNvQyB3aXRoIGEgbXV4IGluIGZyb250KS4gQXMgRFQgc2hvdWxkIGRlc2NyaWJl
IHRoZQpoYXJkd2FyZSwgSSB0aGluayBkZXNjcmliaW5nIHRoZSBzdGFuZGFsb25lIG11eCBiZXR3
ZWVuIHRoZSBkaXNwbGF5CmNvbnRyb2xsZXJzIGFuZCB0aGUgTldMIERTSSBicmlkZ2UgbWFrZXgg
c2Vuc2UuCgpXZSBhbHJlYWR5IGhhdmUgYSBEVCBiaW5kaW5nIGZvciBhIHZpZGVvIG11eAooRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLW11eC50eHQpLiBGcm9t
IGEgRFQgcG9pbnQKb2YgdmlldywgSSBzZWUgbm8gcmVhc29uIG5vdCB0byByZXVzZSB0aGF0LiBG
cm9tIGEgZHJpdmVyIHBvaW50IG9mIHZpZXcKdGhhdCB3aWxsIGJlIG1lc3N5LCBhcyB0aGUgZHJp
dmVyIHRoYXQgYmluZHMgdG8gdGhlIHZpZGVvLW11eCBjb21wYXRpYmxlCnN0cmluZyBpcyBwYXJ0
IG9mIFY0TDIuIFRoYXQncyBhIGRyaXZlciBpc3N1ZSBob3dldmVyIChhbmQgbm90IGEgbmV3Cm9u
ZSwgd2UgYWxyZWFkeSBoYXZlIGRldmljZXMgdGhhdCBjYW4gYmUgcGFydCBvZiBhIHZpZGVvIGNh
cHR1cmUKcGlwZWxpbmUgb3IgYSB2aWRlbyBkaXNwbGF5IHBpcGVsaW5lKSwgYW5kIHNob3VsZCBi
ZSBzb2x2ZWQgb24gdGhlCnNvZnR3YXJlIHNpZGUsIG5vdCB0aGUgRFQgc2lkZS4gSXQgd2lsbCBo
b3dldmVyIG5vdCBiZSBlYXN5IHdvcmssIHdoaWNoCmV4cGxhaW5zIHdoeSwgc28gZmFyLCBldmVy
eWJvZHkgaGFzIGlnbm9yZWQgdGhlIGlzc3VlIGhvcGluZyB0aGF0CnNvbWVvbmUgZWxzZSB3b3Vs
ZCBiZSBoaXQgYnkgaXQgZmlyc3QuIFdlIG1heSBoYXZlIHJlYWNoZWQgdGhhdCBkYXkuCgo+IFlv
dSBjb3VsZCBkbyBpdCBsaWtlIHlvdSBoYXZlIGJlbG93LiBUaGF0IHdvdWxkIGJlIGFwcHJvcHJp
YXRlIGlmIAo+IHRoZXJlJ3MgYSBzZXBhcmF0ZSBoL3cgZGV2aWNlIGNvbnRyb2xsaW5nIHRoZSBt
dXhpbmcuIFNheSBmb3IgZXhhbXBsZSAKPiBzb21lIGJvYXJkIGxldmVsIGRldmljZSBjb250cm9s
bGVkIGJ5IGkyYy4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
