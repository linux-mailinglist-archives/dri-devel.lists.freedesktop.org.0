Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E834C43611
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B374898EA;
	Thu, 13 Jun 2019 12:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC20898EA;
 Thu, 13 Jun 2019 12:52:05 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8748E217F4;
 Thu, 13 Jun 2019 12:52:05 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id s15so22318576qtk.9;
 Thu, 13 Jun 2019 05:52:05 -0700 (PDT)
X-Gm-Message-State: APjAAAUW82VtjYfZe+LcmiDH6LgMx2NlR2mcSXoYtMg+ZQ+X/iGLSrnZ
 jtS4gG+rn4cTgKBgcklIa7rBucJrG8C0Bsy+SA==
X-Google-Smtp-Source: APXvYqyQSf3AAUre27+KCK29BAV13oivw2pUie02NLqVC7Y0PandMlDUCad0+vn9k1QO92NFUsbnlgd0BItkrNEdFVo=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr3426471qve.148.1560430324645; 
 Thu, 13 Jun 2019 05:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-3-dbasehore@chromium.org>
 <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
 <CAGAzgsoWGqf0JQPNyRFnv2xZTMxje6idce7Dy5FZzuxj30mQyw@mail.gmail.com>
In-Reply-To: <CAGAzgsoWGqf0JQPNyRFnv2xZTMxje6idce7Dy5FZzuxj30mQyw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 13 Jun 2019 06:51:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
Message-ID: <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/panel: Expand rotation
 documentation
To: "dbasehore ." <dbasehore@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560430325;
 bh=hGTL0UDB9YcWjm74Ir6wQQkX+JwdFyiJOCXF2M+5evU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wTbq5CEloa5SHhkjgeBYGYhL8+3cX1A9KNfN+w4wcEsou4uoK3R8GYYknSIbC0XIw
 yMulQoFX7Op9+tmF1uisRQ1zdrMdT6oHMrM5jwVwc6ZR0HX/6KT6sJuFaqhby7RTL4
 hoqPqr8M2vylF39fcb7bXFgXZLZDkOMCY3ZSYu+A=
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
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNDowMiBQTSBkYmFzZWhvcmUgLiA8ZGJhc2Vob3JlQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCA4OjI1IEFNIFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVu
IDEwLCAyMDE5IGF0IDEwOjAzIFBNIERlcmVrIEJhc2Vob3JlIDxkYmFzZWhvcmVAY2hyb21pdW0u
b3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBhZGRzIHRvIHRoZSByb3RhdGlvbiBkb2N1bWVu
dGF0aW9uIHRvIGV4cGxhaW4gaG93IGRyaXZlcnMgc2hvdWxkCj4gPiA+IHVzZSB0aGUgcHJvcGVy
dHkgYW5kIGdpdmVzIGFuIGV4YW1wbGUgb2YgdGhlIHByb3BlcnR5IGluIGEgZGV2aWNldHJlZQo+
ID4gPiBub2RlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJh
c2Vob3JlQGNocm9taXVtLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9wYW5lbC50eHQgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwudHh0Cj4gPiA+IGluZGV4IGUyZTY4Njc4NTJiOC4uZjM1ZDYyZDkzM2ZjIDEwMDY0NAo+ID4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC50eHQKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwudHh0Cj4gPiA+IEBAIC0yLDMgKzIsMzUgQEAgQ29tbW9uIGRpc3Bs
YXkgcHJvcGVydGllcwo+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPgo+ID4g
PiAgLSByb3RhdGlvbjogICAgRGlzcGxheSByb3RhdGlvbiBpbiBkZWdyZWVzIGNvdW50ZXIgY2xv
Y2t3aXNlICgwLDkwLDE4MCwyNzApCj4gPiA+ICsKPiA+ID4gK1Byb3BlcnR5IHJlYWQgZnJvbSB0
aGUgZGV2aWNlIHRyZWUgdXNpbmcgb2Ygb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbgo+ID4K
PiA+IERvbid0IHB1dCBrZXJuZWwgc3BlY2lmaWNzIGludG8gYmluZGluZ3MuCj4KPiBXaWxsIHJl
bW92ZSB0aGF0LiBJJ2xsIGNsZWFuIHVwIHRoZSBkb2N1bWVudGF0aW9uIHRvIGluZGljYXRlIHRo
YXQKPiB0aGlzIGJpbmRpbmcgY3JlYXRlcyBhIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IHVu
bGVzcyB0aGUgcm90YXRpb24KPiBpcyBoYW5kbGVkIGluIHRoZSBUaW1pbmcgQ29udHJvbGxlciBv
biB0aGUgcGFuZWwgaWYgdGhhdCBzb3VuZHMgZmluZS4KCkV2ZW4gaWYgdGhlIHRpbWluZyBjdHJs
ciBoYW5kbGVzIGl0LCBkb24ndCB5b3Ugc3RpbGwgbmVlZCB0byBrbm93IHdoYXQKdGhlIG5hdGl2
ZSBvcmllbnRhdGlvbiBpcz8KCj4gPiA+ICsKPiA+ID4gK1RoZSBwYW5lbCBkcml2ZXIgbWF5IGFw
cGx5IHRoZSByb3RhdGlvbiBhdCB0aGUgVENPTiBsZXZlbCwgd2hpY2ggd2lsbAo+ID4KPiA+IFdo
YXQncyBUQ09OPyBTb21ldGhpbmcgTWVkaWF0ZWsgc3BlY2lmaWMgSUlSQy4KPgo+IFRoZSBUQ09O
IGlzIHRoZSBUaW1pbmcgY29udHJvbGxlciwgd2hpY2ggaXMgb24gdGhlIHBhbmVsLiBFdmVyeSBw
YW5lbAo+IGhhcyBvbmUuIEknbGwgYWRkIHRvIHRoZSBkb2MgdGhhdCB0aGUgVENPTiBpcyBpbiB0
aGUgcGFuZWwsIGV0Yy4KPgo+ID4KPiA+ID4gK21ha2UgdGhlIHBhbmVsIGxvb2sgbGlrZSBpdCBp
c24ndCByb3RhdGVkIHRvIHRoZSBrZXJuZWwgYW5kIGFueSBvdGhlcgo+ID4gPiArc29mdHdhcmUu
Cj4gPiA+ICsKPiA+ID4gK0lmIG5vdCwgYSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBzaG91
bGQgYmUgYWRkZWQgdGhyb3VnaCB0aGUgU29DCj4gPiA+ICt2ZW5kb3IgRFJNIGNvZGUgdXNpbmcg
dGhlIGRybV9jb25uZWN0b3JfaW5pdF9wYW5lbF9vcmllbnRhdGlvbl9wcm9wZXJ0eQo+ID4gPiAr
ZnVuY3Rpb24uCj4gPgo+ID4gVGhlICdyb3RhdGlvbicgcHJvcGVydHkgc2hvdWxkIGJlIGRlZmlu
ZWQgcHVyZWx5IGJhc2VkIG9uIGhvdyB0aGUKPiA+IHBhbmVsIGlzIG1vdW50ZWQgcmVsYXRpdmUg
dG8gYSBkZXZpY2UncyBvcmllbnRhdGlvbi4gSWYgdGhlIGRpc3BsYXkKPiA+IHBpcGVsaW5lIGhh
cyBzb21lIGFiaWxpdHkgdG8gaGFuZGxlIHJvdGF0aW9uLCB0aGF0J3MgYSBmZWF0dXJlIG9mIHRo
ZQo+ID4gZGlzcGxheSBwaXBlbGluZSBhbmQgbm90IHRoZSBwYW5lbC4KPgo+IFRoaXMgaXMgaG93
IHRoZSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBpcyBhbHJlYWR5IGhhbmRsZWQgaW4gdGhl
Cj4ga2VybmVsLiBTZWUgZHJpdmVycy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5jIGZvciBtb3JlIGRl
dGFpbHMuCgpUaGUgcG9pbnQgaXMgeW91ciBkZXNjcmlwdGlvbiBpcyBhbGwgYWJvdXQgdGhlIGtl
cm5lbC4gVGhpcyBpcyBhCmJpbmRpbmcgd2hpY2ggaXMgbm90IGtlcm5lbCBzcGVjaWZpYy4KCj4g
PiA+ICsKPiA+ID4gK0V4YW1wbGU6Cj4gPgo+ID4gVGhpcyBmaWxlIGlzIGEgY29sbGVjdGlvbiBv
ZiBjb21tb24gcHJvcGVydGllcy4gSXQgc2hvdWxkbid0IGhhdmUgYW4KPiA+IGV4YW1wbGUgZXNw
ZWNpYWxseSBhcyB0aGlzIGV4YW1wbGUgaXMgbW9zdGx5IG5vbi1jb21tb24gcHJvcGVydGllcy4K
Pgo+IEp1c3QgY29waWVkIG9uZSBvZiBvdXIgRFRTIGVudHJpZXMgdGhhdCB1c2VzIHRoZSBwcm9w
ZXJ0eS4gSSdsbCByZW1vdmUKPiBldmVyeXRoaW5nIHVuZGVyIGNvbXBhdGlibGUgZXhjZXB0IGZv
ciByb3RhdGlvbiBhbmQgc3RhdHVzLgoKSnVzdCByZW1vdmUgdGhlIGV4YW1wbGUgb3IgYWRkIHdo
YXQgeW91IHdhbnQgdG8gdGhlICJib2UsaGltYXg4Mjc5ZDhwIgpiaW5kaW5nIGRvYy4gV2UgYXJl
IG1vdmluZyB0b3dhcmRzIGV4YW1wbGVzIGJlaW5nIGNvbXBpbGVkIGFuZAp2YWxpZGF0ZWQsIHNv
IGluY29tcGxldGUgb25lcyB3b24ndCB3b3JrLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
