Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9475AB8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 00:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B006E837;
	Thu, 25 Jul 2019 22:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF926E837
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 22:24:06 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3467022C7D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 22:24:06 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d23so50737213qto.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:24:06 -0700 (PDT)
X-Gm-Message-State: APjAAAW//uIzLbpQ6l2bsrzoYoj43UdJ+/lXZA3T1D4+krJcXsekCtUy
 oAJfOOxE8YOhLVfgK2klVjUWc2c/2fa8Rlh9qw==
X-Google-Smtp-Source: APXvYqymuR/CfxglS3eGlra1LScgdzgYCXA7Zoh0YgXpzw19WOcSOu4dPi51w8tk0qDx2h76/kSXt+skkFTYNwydBEM=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr65093826qth.136.1564093445297; 
 Thu, 25 Jul 2019 15:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-6-git-send-email-yongqiang.niu@mediatek.com>
 <20190724201635.GA18345@bogus> <1564024819.2621.4.camel@mtksdaap41>
In-Reply-To: <1564024819.2621.4.camel@mtksdaap41>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Jul 2019 16:23:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL439PCnG3B75uqCXb3-OfH2uK6qtU7XpUb-cEnPWRkkQ@mail.gmail.com>
Message-ID: <CAL_JsqL439PCnG3B75uqCXb3-OfH2uK6qtU7XpUb-cEnPWRkkQ@mail.gmail.com>
Subject: Re: [PATCH v4, 05/33] dt-bindings: mediatek: add RDMA1 description
 for mt8183 display
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564093446;
 bh=3JLogo6H+bSfeYeWtbaf6Mngs+H5aQPOTF5AdZi4JbQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qQ0pmHASFnfLaGawnik5VEoSJv0ubNcBHj1bRacJYGJRhko66TxkYcoc0ZNJiWtRM
 /okS464Oy2UMDzloZChf/rj6Bx3I39iCuYcOl2CWKKdV+eX2zOLVyfM4V+SctfAXHT
 Rn+V2exDT35fhGJEVrOJoteHZDhoBpSCZFGmrwHA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, yongqiang.niu@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgOToyMCBQTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPgo+IEhpLCBSb2I6Cj4KPiBPbiBXZWQsIDIwMTktMDctMjQgYXQgMTQ6MTYgLTA2
MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDY6MzM6
NDVBTSArMDgwMCwgeW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gPiA+IEZyb206
IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPgo+ID4gPiBU
aGlzIHBhdGNoIGFkZCBSRE1BMSBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsKPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dAo+ID4gPiBpbmRleCBhZmQzYzkwLi5iYjkyNzRhIDEwMDY0NAo+ID4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiBAQCAtMzAs
NiArMzAsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxvY2tzKToKPiA+
ID4gICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiICAgICAgICAgICAgICAtIG92ZXJsYXkg
KDQgbGF5ZXJzLCBibGVuZGluZywgY3NjKQo+ID4gPiAgICAgIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LW92bC0ybCIgICAgICAgICAgIC0gb3ZlcmxheSAoMiBsYXllcnMsIGJsZW5kaW5nLCBjc2MpCj4g
PiA+ICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIgICAgICAgICAgICAgLSByZWFkIERN
QSAvIGxpbmUgYnVmZmVyCj4gPiA+ICsgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYTEiICAg
ICAgICAgICAgLSBmdW5jdGlvbiBpcyBzYW1lIHdpdGggUkRNQSwgZmlmbyBzaXplIGlzIGRpZmZl
cmVudAo+ID4KPiA+IFRoaXMgY2FuJ3QgYmUgZGV0ZXJtaW5lZCBieSB3aGljaCBjaGlwIGl0IGlz
PyBJT1csIGEgY2hpcCBtYXkgaGF2ZSBib3RoCj4gPiByZG1hIGFuZCByZG1hMT8KPgo+IEluIE1U
ODE4MywgdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgcmRtYS4gVGhlIGRpZmZlcmVuY2UgaXMgdGhl
IGZpZm8gc2l6ZQo+IGluIGVhY2ggb25lLiBJJ3ZlIGEgcXVlc3Rpb246IGlzIGl0IGJldHRlciB0
byBoYXZlIHR3byBjb21wYXRpYmxlIHN0cmluZwo+IGZvciBlYWNoIG9uZSwgb3IganVzdCBvbmUg
Y29tcGF0aWJsZSBzdHJpbmcgZm9yIGJvdGggYnV0IHdpdGggYSBwcm9wZXJ0eQo+IHRvIHNldCBm
aWZvIHNpemU/CgpJZiB0aGF0J3MgdGhlIG9ubHkgZGlmZiwgdGhlbiBhIHByb3BlcnR5IGZvciBm
aWZvIHNpemUgaXMgZmluZS4gV2UKanVzdCBkb24ndCB3YW50IHRvIGJlIGFkZGluZyBhIG5ldyBw
cm9wZXJ0eSBmb3IgZWFjaCBuZXcgZGlmZmVyZW5jZS4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
