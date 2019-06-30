Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50105B22F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 23:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E53089CAA;
	Sun, 30 Jun 2019 21:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271A89CAA
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 21:58:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69527255;
 Sun, 30 Jun 2019 23:58:02 +0200 (CEST)
Date: Mon, 1 Jul 2019 00:57:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup
 panel-id
Message-ID: <20190630215742.GK7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com>
 <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561931882;
 bh=bKYlTNmqOvfD/Do5/wFG9DgDcZ3okJ4ozjFGaT7II18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjdZwHk0ehQgG3Hies1OH3Kq/mNYVosA+lPCM0umbcIl6zSd41M/Rtgq9P3rerb19
 TC0so/zXYByvZ/uOttoXuBDPz0+N3sjb4eLII51Q4TtvryPpH+FyJmDPcjC72i4YNB
 WMHG/l1Agpq906bDV4JWUGPgbyJ2XjJ7ryMM8sIM=
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDI6NTA6NTlQTSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDI6MTcgUE0gTGF1cmVudCBQaW5j
aGFydCB3cm90ZToKPiA+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDAxOjM2OjA4UE0gLTA3MDAs
IFJvYiBDbGFyayB3cm90ZToKPiA+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPgo+ID4gPiBVc2UgdGhlIGRybV9vZl9maW5kX3BhbmVsX2lkKCkgaGVscGVy
IHRvIGRlY2lkZSB3aGljaCBlbmRwb2ludCB0byB1c2UKPiA+ID4gd2hlbiBsb29raW5nIHVwIHBh
bmVsLiAgVGhpcyB3YXkgd2UgY2FuIHN1cHBvcnQgZGV2aWNlcyB0aGF0IGhhdmUKPiA+ID4gbXVs
dGlwbGUgcG9zc2libGUgcGFuZWxzLCBzdWNoIGFzIHRoZSBhYXJjaDY0IGxhcHRvcHMuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
PiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwg
NSArKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiA+
IGluZGV4IDI3MTlkOWMwODY0Yi4uNTZjNjZhNDNmMWE2IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiA+ID4gQEAgLTc5MCw3ICs3OTAsNyBAQCBzdGF0
aWMgaW50IHRpX3NuX2JyaWRnZV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQg
KmlkKQo+ID4gPiAgewo+ID4gPiAgICAgICBzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YTsKPiA+
ID4gLSAgICAgaW50IHJldDsKPiA+ID4gKyAgICAgaW50IHJldCwgcGFuZWxfaWQ7Cj4gPiA+Cj4g
PiA+ICAgICAgIGlmICghaTJjX2NoZWNrX2Z1bmN0aW9uYWxpdHkoY2xpZW50LT5hZGFwdGVyLCBJ
MkNfRlVOQ19JMkMpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJkZXZpY2UgZG9l
c24ndCBzdXBwb3J0IEkyQ1xuIik7Cj4gPiA+IEBAIC04MTEsNyArODExLDggQEAgc3RhdGljIGlu
dCB0aV9zbl9icmlkZ2VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ID4KPiA+
ID4gICAgICAgcGRhdGEtPmRldiA9ICZjbGllbnQtPmRldjsKPiA+ID4KPiA+ID4gLSAgICAgcmV0
ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBkYXRhLT5kZXYtPm9mX25vZGUsIDEsIDAs
Cj4gPiA+ICsgICAgIHBhbmVsX2lkID0gZHJtX29mX2ZpbmRfcGFuZWxfaWQoKTsKPiA+ID4gKyAg
ICAgcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKHBkYXRhLT5kZXYtPm9mX25vZGUs
IDEsIHBhbmVsX2lkLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnBkYXRhLT5wYW5lbCwgTlVMTCk7Cj4gPiA+ICAgICAgIGlmIChyZXQpIHsKPiA+ID4gICAg
ICAgICAgICAgICBEUk1fRVJST1IoImNvdWxkIG5vdCBmaW5kIGFueSBwYW5lbCBub2RlXG4iKTsK
PiA+Cj4gPiBObywgSSdtIHNvcnJ5LCBidXQgdGhhdCdzIGEgbm8tZ28uIFdlIGNhbid0IHBhdGNo
IGV2ZXJ5IHNpbmdsZSBicmlkZ2UKPiA+IGRyaXZlciB0byBzdXBwb3J0IHRoaXMgaGFjay4gV2Ug
bmVlZCBhIHNvbHV0aW9uIGltcGxlbWVudGVkIGF0IGFub3RoZXIKPiA+IGxldmVsIHRoYXQgd2ls
bCBub3Qgc3ByZWFkIHRocm91Z2hvdXQgdGhlIHdob2xlIHN1YnN5c3RlbS4KPiAKPiBpdCBjb3Vs
ZCBiZSBwb3NzaWJsZSB0byBtYWtlIGEgYmV0dGVyIGhlbHBlci4uIGJ1dCByZWFsbHkgdGhlcmUg
YXJlbid0Cj4gKnRoYXQqIG1hbnkgYnJpZGdlIGRyaXZlcnMKPiAKPiBzdWdnZXN0aW9ucyBvZmMg
d2VsY29tZSwgYnV0IEkgdGhpbmsgb25lIHdheSBvciBhbm90aGVyIHdlIGFyZSBnb2luZwo+IHRv
IG5lZWQgdG8gcGF0Y2ggYnJpZGdlcyBieSB0aGUgdGltZSB3ZSBnZXQgdG8gYWRkaW5nIEFDUEkg
c3VwcG9ydCwgc28KPiByZWFsbHkgdHJpdmlhbCBjb3VwbGUgbGluZSBwYXRjaGVzIHRvIHRoZSBo
YW5kZnVsIG9mIGJyaWRnZXMgd2UgaGF2ZQo+IGlzbid0IHJlYWxseSBzb21ldGhpbmcgdGhhdCB3
b3JyaWVzIG1lCgpJdCdzIG9ubHkgb25lIHJpZ2h0IG5vdyBhcyB0aGF0J3MgdGhlIG9ubHkgb25l
IHlvdSBjYXJlIGFib3V0LCBidXQKYmVmb3JlIHdlJ2xsIGhhdmUgdGltZSB0byBibGluaywgaXQg
d2lsbCBiZSBhbm90aGVyIG9uZSwgYW5kIGFub3RoZXIKb25lLCAuLi4gU29ycnksIHRoYXQncyBh
IG5vLWdvIGZvciBtZS4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
