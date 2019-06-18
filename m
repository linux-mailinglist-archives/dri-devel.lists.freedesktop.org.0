Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0E49A55
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5F36E0FD;
	Tue, 18 Jun 2019 07:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C936E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:19:58 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i11so20175772edq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGRhkqGQodehH6nOoVQY2z539WKIaQS1uhzFQI2YTfU=;
 b=rDakVAFA3ENzj7oie5xyMwgKCW2tzC4WlPTfM/PWANbfXKpv94BvrpYTW2G/+w5/bS
 w0AsoT87dVhJ1n77CGwNvPQvO3ftS7l1qnkbhzjiPKZ9dlvsX6mEGY1ksjmX0xwetuNd
 vA0e2bizSUG+a2sOQcp1QTWyBtkCzdOJeo+GukgeV3p03wuvr1tOIJ9D5IBKWKPInBTq
 ZYG3IQ+o1tudRL+zcTI8JZDldTX9MFumtD+7/hjO8SJpgco31FzTo0MUSVwxI9UjZ4K2
 YvLPbVI2mRMlaIEeFYKRDcBfNORVaEGrUSBRUSg4t5O8QAh2lZ6KBTTjJxqHRzWvlOsM
 ZReg==
X-Gm-Message-State: APjAAAU2dmgXjGMUFiH2f1SlPLIhTmiw8a2d198o0LLQ/6JgusH5KoZx
 3GM0rlK5edr2yHDbkxylUvhgX+nle2c=
X-Google-Smtp-Source: APXvYqzXlHdqj9pobOw2T8K9t0Z4kRUUrrjrA0icOA0z9fbvoOd6zBa7o699R9U6Bn+JiXNRgFWrdA==
X-Received: by 2002:a50:97da:: with SMTP id f26mr87588082edb.88.1560842396986; 
 Tue, 18 Jun 2019 00:19:56 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id s17sm2600074ejf.48.2019.06.18.00.19.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 00:19:55 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id n4so4591439wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:19:55 -0700 (PDT)
X-Received: by 2002:adf:fc85:: with SMTP id g5mr79869381wrr.324.1560842394887; 
 Tue, 18 Jun 2019 00:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ@mail.gmail.com>
 <CAMty3ZDRYBPKrGQxAZoB+trFiDLJ5BxDfNUOnPzgd+UWcpwCoQ@mail.gmail.com>
In-Reply-To: <CAMty3ZDRYBPKrGQxAZoB+trFiDLJ5BxDfNUOnPzgd+UWcpwCoQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Jun 2019 15:19:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67uNhie9mb2-m04FGEi4Z7q7TYChOogGj2HgmSmEo4Arg@mail.gmail.com>
Message-ID: <CAGb2v67uNhie9mb2-m04FGEi4Z7q7TYChOogGj2HgmSmEo4Arg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 5/9] drm/sun4i: tcon_top: Register clock
 gates in probe
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNjozMCBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAxMTowMSBB
TSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgSnVu
IDE1LCAyMDE5IGF0IDEyOjQ0IEFNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVENPTiBUT1AgaGF2ZSBjbG9jayBnYXRlcyBmb3IgVFYw
LCBUVjEsIGRzaSBhbmQgcmlnaHQKPiA+ID4gbm93IHRoZXNlIGFyZSByZWdpc3RlciBkdXJpbmcg
YmluZCBjYWxsLgo+ID4gPgo+ID4gPiBPZiB3aGljaCwgZHNpIGNsb2NrIGdhdGUgd291bGQgcmVx
dWlyZWQgZHVyaW5nIERQSFkgcHJvYmUKPiA+ID4gYnV0IHNhbWUgY2FuIG1pc3MgdG8gZ2V0IHNp
bmNlIHRjb24gdG9wIGlzIG5vdCBib3VuZCBhdAo+ID4gPiB0aGF0IHRpbWUuCj4gPiA+Cj4gPiA+
IFRvIHNvbHZlLCB0aGlzIGNpcmN1bGFyIGRlcGVuZGVuY3kgbW92ZSB0aGUgY2xvY2sgZ2F0ZQo+
ID4gPiByZWdpc3RyYXRpb24gZnJvbSBiaW5kIHRvIHByb2JlIHNvLXRoYXQgRFBIWSBjYW4gZ2V0
IHRoZQo+ID4gPiBkc2kgZ2F0ZSBjbG9jayBvbiB0aW1lLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyB8IDk0ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90
Y29uX3RvcC5jCj4gPiA+IGluZGV4IDQ2NWU5YjBjZGZlZS4uYTg5NzhiM2ZlODUxIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwo+ID4gPiBAQCAtMTI0
LDcgKzEyNCw1MyBAQCBzdGF0aWMgc3RydWN0IGNsa19odyAqc3VuOGlfdGNvbl90b3BfcmVnaXN0
ZXJfZ2F0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICBzdGF0aWMgaW50IHN1bjhpX3Rjb25f
dG9wX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+ID4gPiAgewo+ID4g
PiAtICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZp
Y2UoZGV2KTsKPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc3VuOGlfdGNvbl90b3AgKnRjb25fdG9wID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiA+ICsgICAgICAgaW50IHJldDsKPiA+ID4gKwo+ID4g
PiArICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQodGNvbl90b3AtPnJzdCk7Cj4g
PiA+ICsgICAgICAgaWYgKHJldCkgewo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYs
ICJDb3VsZCBub3QgZGVhc3NlcnQgY3RybCByZXNldCBjb250cm9sXG4iKTsKPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAg
ICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHRjb25fdG9wLT5idXMpOwo+ID4gPiArICAgICAg
IGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiQ291bGQgbm90
IGVuYWJsZSBidXMgY2xvY2tcbiIpOwo+ID4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfYXNz
ZXJ0X3Jlc2V0Owo+ID4gPiArICAgICAgIH0KPiA+Cj4gPiBZb3UgaGF2ZSB0byBkZS1hc3NlcnQg
dGhlIHJlc2V0IGNvbnRyb2wgYW5kIGVuYWJsZSB0aGUgY2xvY2sgYmVmb3JlIHRoZQo+ID4gY2xv
Y2tzIGl0IHByb3ZpZGVzIGFyZSByZWdpc3RlcmVkLiBPdGhlcndpc2UgYSBjb25zdW1lciBtYXkg
Y29tZSBpbiBhbmQKPiA+IGFzayBmb3IgdGhlIHByb3ZpZGVkIGNsb2NrIHRvIGJlIGVuYWJsZWQs
IGJ1dCBzaW5jZSB0aGUgVENPTiBUT1AncyBvd24KPiA+IHJlc2V0IGFuZCBjbG9jayBhcmUgc3Rp
bGwgZGlzYWJsZWQsIHlvdSBjYW4ndCBhY3R1YWxseSBhY2Nlc3MgdGhlIHJlZ2lzdGVycwo+ID4g
dGhhdCBjb250cm9scyB0aGUgcHJvdmlkZWQgY2xvY2suCj4KPiBUaGVzZSByc3QgYW5kIGJ1cyBh
cmUgY29tbW9uIHJlc2V0IGFuZCBidXMgY2xvY2tzIG5vdCB0Y29uIHRvcCBjbG9ja3MKPiB0aGF0
IGFyZSB0cnlpbmcgdG8gcmVnaXN0ZXIgaGVyZS4gaWUgcmVhc29uIEkgaGF2ZSBub3QgbW92ZWQg
aXQgaW4KPiB0b3AuCgpBbmQgeW91J3JlIHN1cmUgdGhhdCB0b2dnbGluZyBiaXRzIGluIHRoZSBU
Q09OIFRPUCBibG9jayBkb2Vzbid0IHJlcXVpcmUKdGhlIHJlc2V0IHRvIGJlIGRlLWFzc2VydGVk
IGFuZCB0aGUgYnVzIGNsb2NrIGVuYWJsZWQ/CgpTb21laG93IEkgZG91YnQgdGhhdC4KCk9uY2Ug
dGhlIGRyaXZlciByZWdpc3RlciB0aGUgY2xvY2tzIGl0IHByb3ZpZGVzLCB0aGV5IGFic29sdXRl
bHkgbXVzdCB3b3JrLgpUaGV5IGNhbid0IG9ubHkgd29yayBhZnRlciB0aGUgYmluZCBwaGFzZSB3
aGVuIHRoZSByZXNldCBnZXRzIGRlLWFzc2VydGVkCmFuZCB0aGUgYnVzIGNsb2NrIGVuYWJsZWQu
IE9yIHlvdSBzaG91bGQgcHJvdmlkZSBwcm9wZXIgZXJyb3IgcmVwb3J0aW5nCmluIHRoZSBjbG9j
ayBvcHMuIEkgZG91YnQgeW91IHdhbnQgdG8gZ28gdGhhdCB3YXkgZWl0aGVyLgoKQ2hlbll1Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
