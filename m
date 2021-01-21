Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 813542FE4C8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACD16E520;
	Thu, 21 Jan 2021 08:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D37D6E516
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65E1723976;
 Thu, 21 Jan 2021 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611217141;
 bh=hhhptWrujcElAbSl2ou/FOxBVarF2/4ZICpA78koQKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mOSdaqmeY7neZr1NBdUhHGAUKUpB/zX8/VLMLHq0RUKZrQm5L/GslnlEd/F0MmgDs
 KmDJSbUyVPrRRYMjLpHTZFacGkiu2MzPBeB3+ZF/hGQ26lmZlKTazZ/o2LlxuL1E39
 DA0psnM6msta+GWNePYVYBp/ct2i+jmVrMIK399eteygz67RoZmJC+y4azViV7HWQV
 vSzPpc1cJT/RDpgUL4SCbxvsQK27k3yNIIoadcN/3PCMYc1QBowK9ToZ3eru3tWvGG
 oOS/WNXftOI/g647lAalt85eSJoVi4EI92NujfyXHBgXEm3dIzVO55Mbw7q9I2+3rC
 gwZRcTkLQpEFA==
Date: Thu, 21 Jan 2021 09:18:55 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in
 mtk mutex driver
Message-ID: <YAk4722oCzcegGdx@ziggy.stardust>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
 <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgMDc6NDY6NDRBTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgTWF0dGhpYXM6Cj4gCj4gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdn
QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDIx5pelIOmAseWbmyDkuIrljYgyOjI35a+r6YGT
77yaCj4gPgo+ID4gT24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMDc6MTc6MjdBTSArMDgwMCwgQ2h1
bi1LdWFuZyBIdSB3cm90ZToKPiA+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
PiA+ID4KPiA+ID4gbXRrIG11dGV4IGlzIHVzZWQgYnkgYm90aCBkcm0gYW5kIG1kcCBkcml2ZXIs
IHNvIGNoYW5nZSBkaXNwL2RkcCB0ZXJtIHRvCj4gPiA+IG11dGV4IHRvIHNob3cgdGhhdCBpdCdz
IGEgY29tbW9uIGRyaXZlciBmb3IgZHJtIGFuZCBtZHAuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8ICAzMCArLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAgMiArLQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggIHwgICAyICstCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgICAgfCAzMDUgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmggICAgfCAg
MjYgKy0KPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2VydGlvbnMoKyksIDE4MyBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+IFsuLi5dCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211
dGV4LmMKPiA+ID4gaW5kZXggMWM4YTI1M2Y0Nzg4Li45OGEwNjBiZjIyNWQgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYwo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMKPiA+IFsuLi5dCj4gPiA+Cj4gPiA+
IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkZHBfZHJpdmVyX2R0X21hdGNoW10g
PSB7Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdXRleF9kcml2ZXJf
ZHRfbWF0Y2hbXSA9IHsKPiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3
MDEtZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJf
ZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAmbXQyNzAxX211dGV4X2RyaXZlcl9kYXRhfSwK
PiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItZGlzcC1tdXRleCIs
Cj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzEyX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsg
ICAgICAgLmRhdGEgPSAmbXQyNzEyX211dGV4X2RyaXZlcl9kYXRhfSwKPiA+ID4gICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAg
LmRhdGEgPSAmbXQ4MTY3X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAm
bXQ4MTY3X211dGV4X2RyaXZlcl9kYXRhfSwKPiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQ4MTcz
X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAmbXQ4MTczX211dGV4X2Ry
aXZlcl9kYXRhfSwKPiA+ID4gICAgICAge30sCj4gPiA+ICB9Owo+ID4gPiAtTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgZGRwX2RyaXZlcl9kdF9tYXRjaCk7Cj4gPiA+ICtNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOwo+ID4KPiA+IEkgdGhpbmsgaXQgd291bGQg
bWFrZSBzZW5zZSBpbiBhIGZvbGxvdy11cCBwYXRjaCB0byB1cGRhdGUgdGhlIGJpbmRpbmcKPiA+
IHRvIHVzZSAibWVkaWF0ZWssbXQyNzAxLW11dGV4IiB0byByZWZsZWN0IHRoYXQgbXV0ZXggaXMg
dXNlZCBmb3IgZHJtIGFuZAo+ID4gbWRwIGRyaXZlci4gTWFrZSBzZW5zZT8KPiAKPiBZZXMsIGl0
IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0ZSB0aGUgYmluZGluZywgYnV0IEkgd29u
ZGVyCj4gZGV2aWNlIHRyZWUgc2hvdWxkIGJlIGJhY2t3YXJkIGNvbXBhdGlibGU/IExldCdzIGRp
c2N1c3MgaW4gdGhhdAo+IGZvbGxvdy11cCBwYXRjaGVzLgo+IAoKRnJvbSBteSB1bmRlcnN0YW5k
aW5nLCB3ZSB3aWxsIG5lZWQgdG8ga2VlcCB0aGUgb2ZfZGV2aWNlX2lkIGVudHJpZXMgZm9yCnRo
ZSBvbGQgYmluZGluZyBpbiB0aGUgZHJpdmVyIChzbyB0aGF0IG9sZCBEVHMgc3RpbGwgd29yaykg
d2hpbGUgd2UKc2hvdWxkIGVuZm9yY2UgdGhlIG5ldyBiaW5kaW5nLiBJJ20gbm90IHN1cmUgaWYg
dGhlIHlhbWwgaGFzIGEgb3B0aW9uCmZvciBvdXQtb2YtZGF0ZSBjb21wYXRpYmxlcy4KClJlZ2Fy
ZHMsCk1hdHRoaWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
