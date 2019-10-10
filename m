Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBBD30E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745C6E3C7;
	Thu, 10 Oct 2019 18:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C56E3C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:54:35 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s22so5815162otr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o+zin2bL1A/EltcDjtt8OSEY4VLYK08n8Dj1hQ6Wf2k=;
 b=okP+f8qHQ1a2vmgFo2+nVbG4I7eXYKYuNayFymq4AI8FlaCPxgPovq2OcrTNbQ56DG
 mBCQFYzo5igrQZn4JL7+kaYG89qtIRICgPmWETHGASuG+oT7fdxy5EaGx4k0mEIeTjDc
 Tw+gdtI9k8BVAvDcSdskjoMdEbdLKlmCCc1YxKtQNbWUH3hIr1Ca9Z77XC9TVjlEWc4K
 0JElU+Xam/eE6FEqZ6vH+pn/73zV+Zn0AdxM/k8PmikxM8i8I5LtSOtH4yb1ZezaJaOw
 Uqqu81vVGcH3YHmcfINhjo1bI9GJeGQi+MaJbQZhO+++cirP0KODfp1letrSmYBd59ha
 47Ww==
X-Gm-Message-State: APjAAAVdhhhQBQ+SDAG4xTk6LCTla+jRy75BV5BeuatvxkmMlbqp/+rd
 +/f78yYWu/xklvcSWsPv5g==
X-Google-Smtp-Source: APXvYqxQEXGO9Uc01zKUGpeB8t0R+xv3eN1jyvC9TPfe47vyIsyRP58qHhRhPLQG1SNW3RGl2mO7pw==
X-Received: by 2002:a9d:73d8:: with SMTP id m24mr8810042otk.227.1570733674052; 
 Thu, 10 Oct 2019 11:54:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r19sm1846829ota.79.2019.10.10.11.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 11:54:33 -0700 (PDT)
Date: Thu, 10 Oct 2019 13:54:32 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
Message-ID: <20191010185432.GA17457@bogus>
References: <20191002164047.14499-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6NDA6NDZQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBDb252ZXJ0IGdlbmVyaWMgUFdNIGJpbmRpbmdzIHRvIERUIHNjaGVtYSBm
b3JtYXQgdXNpbmcganNvbi1zY2hlbWEuICBUaGUKPiBjb25zdW1lciBiaW5kaW5ncyBhcmUgc3Bs
aXQgdG8gc2VwYXJhdGUgZmlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAx
LiBDaGFuZ2UgYWxzbyBwd20tc3ByZC50eHQKPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IDEuIElu
ZGVudCBleGFtcGxlIHdpdGggZm91ciBzcGFjZXMgKG1vcmUgcmVhZGFibGUpLAo+IDIuIENoYW5n
ZSBwYXR0ZXJuIGZvciBwd20gbm9kZXMsCj4gMy4gUmVtb3ZlICRyZWYgZnJvbSAjY2VsbHMuCj4g
LS0tCgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9wd20tY29uc3VtZXJzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cHdtL3B3bS1jb25zdW1lcnMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi4zOWM4NDRmZTYzMzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tY29uc3VtZXJzLnlhbWwKPiBAQCAtMCww
ICsxLDc2IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArJVlBTUwg
MS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9wd20t
Y29uc3VtZXJzLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFNwZWNpZnlpbmcgUFdNIGluZm9ybWF0aW9u
IGZvciBkZXZpY2VzCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFBXTSBw
cm9wZXJ0aWVzIHNob3VsZCBiZSBuYW1lZCAicHdtcyIuIFRoZSBleGFjdCBtZWFuaW5nIG9mIGVh
Y2ggcHdtcwo+ICsgIHByb3BlcnR5IG11c3QgYmUgZG9jdW1lbnRlZCBpbiB0aGUgZGV2aWNlIHRy
ZWUgYmluZGluZyBmb3IgZWFjaCBkZXZpY2UuCj4gKyAgQW4gb3B0aW9uYWwgcHJvcGVydHkgInB3
bS1uYW1lcyIgbWF5IGNvbnRhaW4gYSBsaXN0IG9mIHN0cmluZ3MgdG8gbGFiZWwKPiArICBlYWNo
IG9mIHRoZSBQV00gZGV2aWNlcyBsaXN0ZWQgaW4gdGhlICJwd21zIiBwcm9wZXJ0eS4gSWYgbm8g
InB3bS1uYW1lcyIKPiArICBwcm9wZXJ0eSBpcyBnaXZlbiwgdGhlIG5hbWUgb2YgdGhlIHVzZXIg
bm9kZSB3aWxsIGJlIHVzZWQgYXMgZmFsbGJhY2suCj4gKwo+ICsgIERyaXZlcnMgZm9yIGRldmlj
ZXMgdGhhdCB1c2UgbW9yZSB0aGFuIGEgc2luZ2xlIFBXTSBkZXZpY2UgY2FuIHVzZSB0aGUKPiAr
ICAicHdtLW5hbWVzIiBwcm9wZXJ0eSB0byBtYXAgdGhlIG5hbWUgb2YgdGhlIFBXTSBkZXZpY2Ug
cmVxdWVzdGVkIGJ5IHRoZQo+ICsgIHB3bV9nZXQoKSBjYWxsIHRvIGFuIGluZGV4IGludG8gdGhl
IGxpc3QgZ2l2ZW4gYnkgdGhlICJwd21zIiBwcm9wZXJ0eS4KPiArCj4gK3Byb3BlcnRpZXM6Cj4g
KyAgcHdtczoKPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUtYXJyYXkKPiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgIFBoYW5kbGUgdG8gUFdN
IGNvbnRyb2xsZXIgbm9kZSBhbmQgcHdtLXNwZWNpZmllciAoY29udHJvbGxlciBzcGVjaWZpYyku
Cj4gKyAgICAgIHB3bS1zcGVjaWZpZXIgdHlwaWNhbGx5IGVuY29kZXMgdGhlIGNoaXAtcmVsYXRp
dmUgUFdNIG51bWJlciBhbmQgdGhlIFBXTQo+ICsgICAgICBwZXJpb2QgaW4gbmFub3NlY29uZHMu
Cj4gKyAgICAgIE9wdGlvbmFsbHksIHRoZSBwd20tc3BlY2lmaWVyIGNhbiBlbmNvZGUgYSBudW1i
ZXIgb2YgZmxhZ3MgKGRlZmluZWQgaW4KPiArICAgICAgPGR0LWJpbmRpbmdzL3B3bS9wd20uaD4p
IGluIGEgdGhpcmQgY2VsbDoKPiArICAgICAgICAtIFBXTV9QT0xBUklUWV9JTlZFUlRFRDogaW52
ZXJ0IHRoZSBQV00gc2lnbmFsIHBvbGFyaXR5Cj4gKwo+ICsgIHB3bS1uYW1lczoKPiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZy1hcnJheQo+ICsgICAg
ZGVzY3JpcHRpb246Cj4gKyAgICAgIEEgbGlzdCBvZiBzdHJpbmdzIHRvIGxhYmVsIGVhY2ggb2Yg
dGhlIFBXTSBkZXZpY2VzIGxpc3RlZCBpbiB0aGUgInB3bXMiCj4gKyAgICAgIHByb3BlcnR5LiBJ
ZiBubyAicHdtLW5hbWVzIiBwcm9wZXJ0eSBpcyBnaXZlbiwgdGhlIG5hbWUgb2YgdGhlIHVzZXIg
bm9kZQo+ICsgICAgICB3aWxsIGJlIHVzZWQgYXMgZmFsbGJhY2suCj4gKwo+ICtyZXF1aXJlZDoK
PiArICAtIHB3bXMKClRoaXMgc2NoZW1hIGlzIG5ldmVyIGFwcGxpZWQgYmVjYXVzZSBpdCBoYXMg
bm8gJ3NlbGVjdCcgd2hpY2ggaXMgb25seSAKYXV0b21hdGljIGZvciAkbm9kZW5hbWUgb3IgY29t
cGF0aWJsZS4gWW91IGNvdWxkIGluY2x1ZGUgdGhpcyBmcm9tIG90aGVyIApzY2hlbWFzLCBidXQg
d2h5PyBBbnkgY29uc3VtZXIgc3RpbGwgaGFzIHRvIGxpc3QgdGhlc2UgcHJvcGVydGllcyB0byAK
ZGVmaW5lIHRoZWlyIHNwZWNpZmljIGNvbnN0cmFpbnRzLgoKV2UgYWxyZWFkeSBoYXZlIGEgc2No
ZW1hIGluIGR0c2NoZW1hIGZvciBjb25zdW1lciBzaWRlLiBJdCdzIGp1c3QgCm1pc3NpbmcgZGVz
Y3JpcHRpb25zIHdoaWNoIG5lZWRzIHJlbGljZW5zaW5nIGZyb20gdGhpcy4KCj4gKwo+ICtkZXBl
bmRlbmNpZXM6Cj4gKyAgcHdtLW5hbWVzOiBbIHB3bXMgXQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
