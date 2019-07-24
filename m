Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C46736F7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51C6E620;
	Wed, 24 Jul 2019 18:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0E6E620
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:52:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h19so34085532wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3hQEInE7wPS7npsqDdyReFD8+DVG0G6gksarFiD+BUE=;
 b=dhhRl+YvzJs8eFDDa9uwJw61Iola/29n+nXxAH8Dsu6+fs76JVJRYMflhcNNJECIUx
 +io/iG6F42KtbxrEF/qWDIOkM2iCU7opoQiUOHkENHYmKd3keUaXD/UjQmfLFQo37ent
 cGNxi8QRVMOKQlYbWpRgASv72yAvA0exjuKAKHw51ULHWJO0VIgBXrhWUvxhrfexWz4W
 xiyaU6JBXD5SZk90dhIzEGSuJ5jgdbnB6PTIkkpGhqDoa5HVIFVN+59Nwq2aaSTg1SF+
 3FuWEaQZqoIvpI7ZXN3zDqOFHow364120Qs2GgnovpskWYiI0y1WOieCJKUz3n9BfZXD
 RJNQ==
X-Gm-Message-State: APjAAAWI9N+V+S0FiC+yawWI63YlB1L3gwaZXJgVDWtvX5+SyiPCKqip
 CwdCZEsDR+eTllffPZRJ6Kk=
X-Google-Smtp-Source: APXvYqybZTUdLFKKpdj8xlUt1rpHKS6FMa+wFWKprezrQieSHRxtcvXpOkuvDUOeXbkAfzPmH5YXgQ==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr73562275wmd.118.1563994357830; 
 Wed, 24 Jul 2019 11:52:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id w24sm37230033wmc.30.2019.07.24.11.52.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 11:52:36 -0700 (PDT)
Date: Wed, 24 Jul 2019 20:52:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 11/11] drm: exynos: mixer: Add interconnect support
Message-ID: <20190724185234.GB14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122029eucas1p2915f536d9ef43a7bd043a878a553439f@eucas1p2.samsung.com>
 <20190723122016.30279-12-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-12-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MTZQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gRnJvbTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29t
Pgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBpbnRlcmNvbm5lY3Qgc3VwcG9ydCB0byBleHlub3MtbWl4
ZXIuIFBsZWFzZSBub3RlIHRoYXQgdGhlCj4gbWl4ZXIgd29ya3MgdGhlIHNhbWUgYXMgYmVmb3Jl
IHdoZW4gQ09ORklHX0lOVEVSQ09OTkVDVCBpcyAnbicuCj4gCj4gQ28tZGV2ZWxvcGVkLWJ5OiBB
cnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5zYW1zdW5nLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5zYW1zdW5nLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgfCA2OCArKysrKysr
KysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX21peGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCj4g
aW5kZXggN2IyNDMzOGZhZDNjLi5mYjc2Mzg1NGIzMDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX21peGVyLmMKPiBAQCAtMTMsNiArMTMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgv
Y29tcG9uZW50Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcmNvbm5lY3QuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KPiBAQCAtOTcsNiArOTgsNyBAQCBzdHJ1Y3QgbWl4ZXJfY29udGV4
dCB7Cj4gIAlzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjCSpjcnRjOwo+ICAJc3RydWN0IGV4eW5vc19k
cm1fcGxhbmUJcGxhbmVzW01JWEVSX1dJTl9OUl07Cj4gIAl1bnNpZ25lZCBsb25nCQlmbGFnczsK
PiArCXN0cnVjdCBpY2NfcGF0aAkJKnNvY19wYXRoOwo+ICAKPiAgCWludAkJCWlycTsKPiAgCXZv
aWQgX19pb21lbQkJKm1peGVyX3JlZ3M7Cj4gQEAgLTkzMSw2ICs5MzMsMzcgQEAgc3RhdGljIHZv
aWQgbWl4ZXJfZGlzYWJsZV92Ymxhbmsoc3RydWN0IGV4eW5vc19kcm1fY3J0YyAqY3J0YykKPiAg
CW1peGVyX3JlZ193cml0ZW1hc2sobWl4ZXJfY3R4LCBNWFJfSU5UX0VOLCAwLCBNWFJfSU5UX0VO
X1ZTWU5DKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbWl4ZXJfc2V0X21lbW9yeV9iYW5kd2lk
dGgoc3RydWN0IGV4eW5vc19kcm1fY3J0YyAqY3J0YykKPiArewo+ICsJc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUgPSAmY3J0Yy0+YmFzZS5zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKPiArCXN0
cnVjdCBtaXhlcl9jb250ZXh0ICpjdHggPSBjcnRjLT5jdHg7Cj4gKwl1bnNpZ25lZCBsb25nIGJ3
LCBiYW5kd2lkdGggPSAwOwo+ICsJaW50IGksIGosIHN1YjsKPiArCgpFYXJseSBleGl0IGlmICFj
dHgtPnNvY19wYXRoLCBubyBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhlIGJhbmR3aWR0aC4KT3B0aW9u
YWxseSBjaGVjayBpdCBiZWZvcmUgY2FsbGluZyBtaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aCgp
IC0gc2hvdWxkCm5vdCBodXJ0IHJlYWRhYmlsaXR5LgoKPiArCWZvciAoaSA9IDA7IGkgPCBNSVhF
Ul9XSU5fTlI7IGkrKykgewo+ICsJCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gJmN0eC0+cGxh
bmVzW2ldLmJhc2U7Cj4gKwkJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0Owo+
ICsKPiArCQlpZiAocGxhbmUtPnN0YXRlICYmIHBsYW5lLT5zdGF0ZS0+Y3J0YyAmJiBwbGFuZS0+
c3RhdGUtPmZiKSB7Cj4gKwkJCWZvcm1hdCA9IHBsYW5lLT5zdGF0ZS0+ZmItPmZvcm1hdDsKPiAr
CQkJYncgPSBtb2RlLT5oZGlzcGxheSAqIG1vZGUtPnZkaXNwbGF5ICoKPiArCQkJCQkJCWRybV9t
b2RlX3ZyZWZyZXNoKG1vZGUpOwo+ICsJCQlpZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFH
X0lOVEVSTEFDRSkKPiArCQkJCWJ3IC89IDI7Cj4gKwkJCWZvciAoaiA9IDA7IGogPCBmb3JtYXQt
Pm51bV9wbGFuZXM7IGorKykgewo+ICsJCQkJc3ViID0gaiA/IChmb3JtYXQtPnZzdWIgKiBmb3Jt
YXQtPmhzdWIpIDogMTsKPiArCQkJCWJhbmR3aWR0aCArPSBmb3JtYXQtPmNwcFtqXSAqIGJ3IC8g
c3ViOwo+ICsJCQl9Cj4gKwkJfQo+ICsJfQo+ICsKPiArCS8qIGFkZCAyMCUgc2FmZXR5IG1hcmdp
biAqLwo+ICsJYmFuZHdpZHRoID0gNVVMICogYmFuZHdpZHRoIC8gNDsKPiArCj4gKwlwcl9pbmZv
KCJleHlub3MtbWl4ZXI6IHNhZmUgYmFuZHdpZHRoICVsZCBCcHNcbiIsIGJhbmR3aWR0aCk7Cgpk
ZXZfZGJnKCkKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
