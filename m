Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A870928498
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E976E03E;
	Thu, 23 May 2019 17:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E796E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:13:43 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p18so4297717qkk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RG+ZTctD0E4v327H7cj6U2Hv8U+evNfg4/vbfaRFcSQ=;
 b=h7u9SCBketmCliAYbF5mczXgBaCHfyJ51S7Kt5i+RHRZJmB3YLeEBq1Dae1q1q5a3B
 ZfHfo6XwEktq4DJbLWV6ARHc57vRPdHkPqKJd5j8SqjDVtClbONgDJ5jetDjLUksUB1h
 2mR0UiQunAAQnSDT6LMfx7Qa1POceJ1UVfmEtJkCgnqemoY//WM8W7MFipUCA8JjmOTC
 GGWCrhpv2hWxLNwY7YdlSS9eIQDlUb6fqVSB0KwBaRNdJZ//fNRjh22/fa2TOcvbH/he
 j68K1XsTpeQeXmt4/KkNsS1g8A6gJ+ua8CUqThS6gMOPYz8fM6QWFQLCGjQ3EXH01ccY
 bnFg==
X-Gm-Message-State: APjAAAUSy04UlZ3aLrZVa06SC76efDeoXDwsx63GeUTRdndidEh0sGzt
 phC24EqUr13Kqgw9SgPkb7EfsQ==
X-Google-Smtp-Source: APXvYqwR8DdTVAFjAIqdgYPHYDveml4zJbuXzWAAGKqsZUpKcEbD0sJt5SWRXnFR6IP80s+Fsbq8Ew==
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr75623860qkf.342.1558631622684; 
 Thu, 23 May 2019 10:13:42 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y129sm10428193qkc.63.2019.05.23.10.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 10:13:42 -0700 (PDT)
Date: Thu, 23 May 2019 13:13:41 -0400
From: Sean Paul <sean@poorly.run>
To: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: Fix warning about unhandled enum value
Message-ID: <20190523171341.GE17077@art_vandelay>
References: <20190522202207.223110-1-sean@poorly.run>
 <1558592000.552.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558592000.552.3.camel@mtksdaap41>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=RG+ZTctD0E4v327H7cj6U2Hv8U+evNfg4/vbfaRFcSQ=;
 b=ENE+0RYKSEH2yccpeqmJwI4WpkWm0RIq+YORI72XIt4Agw/uC+Q69wkfG/Ur5L4jn5
 GYTSbO/vIvsySxUq6zTxv1kjEk2VH8OMzREx+EZ/TB2/FgeNt0iiXptICVmULubVorn6
 LHRSZR7TE04fPy9qqUsfb83t4QdBmGq8WI34nK4JE5y/oMdDU0g8Qxza5vuZezATeddZ
 QSkF179XpwfLIhgw4HnGTCEpy5U7yftX18UbxUVLEZlKH+RSaDvg805Za0yxYF1wAxYk
 Spgwrq00qsW2TBQOuT1cAaXIy5khgucTd3yKSvbyMTQ7dqYxeK+Qsl9+1RrA3cR0JDEB
 D+ow==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hansverk@cisco.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6MTM6MjBQTSArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4g
SGksIFNlYW46Cj4gCj4gT24gV2VkLCAyMDE5LTA1LTIyIGF0IDE2OjIxIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nOgo+ID4gZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pLmM6MzI3OjI6IHdhcm5pbmc6IGVudW1lcmF0aW9uIHZhbHVl
IOKAmEhETUlfSU5GT0ZSQU1FX1RZUEVfRFJN4oCZIG5vdCBoYW5kbGVkIGluIHN3aXRjaCBbLVdz
d2l0Y2hdCj4gPiAKPiA+IEludHJvZHVjZWQgd2l0aCB0aGUgYWRkaXRpb24gb2YgSERNSV9JTkZP
RlJBTUVfVFlQRV9EUk0gaW4gdGhlIGNvbW1pdAo+ID4gYmVsb3csIGJ1dCB0aGUgY29kZSByZWFs
bHkgc2hvdWxkIGhhdmUgYmVlbiBmdXR1cmUtcHJvb2ZlZCBmcm9tIHRoZQo+ID4gc3RhcnQuCj4g
Cj4gQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gCj4gPiAKPiA+IEZpeGVz
OiAyY2RiZmQ2NmE4MjkgKCJkcm06IEVuYWJsZSBIRFIgaW5mb2ZyYW1lIHN1cHBvcnQiKQo+IAo+
IEkgdGhpbmsgImRybTogRW5hYmxlIEhEUiBpbmZvZnJhbWUgc3VwcG9ydCIgZXhpc3Qgb25seSBp
biBkcm0tbWlzYyB0cmVlLAo+IGNvdWxkIHlvdSBqdXN0IG1lcmdlIHRoaXMgcGF0Y2ggdG8gImRy
bTogRW5hYmxlIEhEUiBpbmZvZnJhbWUgc3VwcG9ydCI/CgpZZXMsIEkndmUgYXBwbGllZCBpdCB0
byBkcm0tbWlzYy1uZXh0LiBUaGFua3MgZm9yIHlvdXIgQWNrIQoKU2VhbgoKPiAKPiBSZWdhcmRz
LAo+IENLCj4gCj4gPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiA+
IENjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Cj4gPiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
Q2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiBD
YzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4g
Q2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
PiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAzICsrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMKPiA+IGluZGV4IGUwNGU2YzI5M2QzOS4uMTBjYzk5MTBmMTY0IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiBAQCAtMzQxLDYgKzM0MSw5
IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX2h3X3NlbmRfaW5mb19mcmFtZShzdHJ1Y3QgbXRrX2hk
bWkgKmhkbWksIHU4ICpidWZmZXIsCj4gPiAgCQljdHJsX2ZyYW1lX2VuID0gVlNfRU47Cj4gPiAg
CQljdHJsX3JlZyA9IEdSTF9BQ1BfSVNSQ19DVFJMOwo+ID4gIAkJYnJlYWs7Cj4gPiArCWRlZmF1
bHQ6Cj4gPiArCQlkZXZfZXJyKGhkbWktPmRldiwgIlVua25vd24gaW5mb2ZyYW1lIHR5cGUgJWRc
biIsIGZyYW1lX3R5cGUpOwo+ID4gKwkJcmV0dXJuOwo+ID4gIAl9Cj4gPiAgCW10a19oZG1pX2Ns
ZWFyX2JpdHMoaGRtaSwgY3RybF9yZWcsIGN0cmxfZnJhbWVfZW4pOwo+ID4gIAltdGtfaGRtaV93
cml0ZShoZG1pLCBHUkxfSU5GT0ZSTV9UWVBFLCBmcmFtZV90eXBlKTsKPiAKPiAKCi0tIApTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
