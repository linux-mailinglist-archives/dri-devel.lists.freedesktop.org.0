Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA92B77F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858A06E41D;
	Wed, 18 Nov 2020 08:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE846E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 04:21:24 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 35so281139ple.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=k+NY9c+px1FIBEsWz6q06ZNYk3nsdUunnWrMe/Tvt0s=;
 b=x05XYSCnX2pfVclqovwJGSApW0q+PJFqxYdSWinuurJK7+sFE1YFXh93IjbhpScjSf
 rqMv+GlvwtGjksPFV0MS/8/gxYiW8EHujQgZuT7V0I7D6hZpfVvUxNI+mKaR3PkoYrRE
 +wXAqhQre99DNnxOduMfN8vZtzPxssSXMGdu2X1+iC9JkDAM8/u3ylOoQS4vgrJgTLTs
 dfJFLMWfIaChr/S+x3aWAex34L/z3rCw9RcPnJ3xLs6fLRrpdRKVyzUYg7HBXn9TWLR5
 ZmAfdhLIHbh2/0lBPCTQ0OjhgS8ejBEBlbw6o3tp3S0CW5lkFKM6I4dVssBvTCivBTY/
 +BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=k+NY9c+px1FIBEsWz6q06ZNYk3nsdUunnWrMe/Tvt0s=;
 b=edNRIr2x4KB6n0brHwhoJVsIGvZ3nJh/sCpf4JbwT4Y8bn2Yv24wcNyqHbAsk5/BfJ
 MuBifEr5Ho/qcnBcnGkAprQbvFgshl/Xe0DHVRUkyqP70r1Cvj+4V5n39FOIBTSO3BFa
 wsNsJB+iJguDKRlDm/VhC0gY52PTwPrZsM3+tICzI9t5Z5w1Zftd9rn9mD5cAL7nnyLH
 sEfK7lMyMiJbRRGle/Js+Wpa45A+H5r2ZV4eFskOtJRy6aMvSbkSEryyoCAO4ufgiCsk
 XAhsUm7a+B3yEVq0N6k7o02AdKrGu9hpMQ6Ww3Txaf9RVuq0lm1TLp/dENiD1MWYtYNR
 Vd3Q==
X-Gm-Message-State: AOAM533IQr/FaY7Zri3+00tToFbT7r9c0K13w4NZUoUj/IhhJSUklzAy
 y1gmaCcK1MC61tji8d5QNrI2vg==
X-Google-Smtp-Source: ABdhPJwRaC+IQmmfuP8LCNaoTxzQFqRk93NVR4NjAXGOdw1Bsnc0hOD1mmfyGITGB5st8GooiDcIIw==
X-Received: by 2002:a17:902:8506:b029:d9:6dd:45ea with SMTP id
 bj6-20020a1709028506b02900d906dd45eamr2824765plb.72.1605673283767; 
 Tue, 17 Nov 2020 20:21:23 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id j11sm7489631pfe.26.2020.11.17.20.21.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 20:21:22 -0800 (PST)
Date: Wed, 18 Nov 2020 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 07/17] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
Message-ID: <20201118042117.q6nkwm7exakgfvu3@vireshk-i7>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-8-digetx@gmail.com>
 <20201117100705.i62qr4gosvu76o22@vireshk-i7>
 <956315a9-e806-3b18-6792-f01057a6c511@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <956315a9-e806-3b18-6792-f01057a6c511@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTctMTEtMjAsIDE3OjE3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTcuMTEuMjAyMCAx
MzowNywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAxNi0xMS0yMCwgMDA6MjksIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIG1vdmVzIEFDVE1PTiBkcml2ZXIg
YXdheSBmcm9tIGdlbmVyYXRpbmcgT1BQIHRhYmxlIGJ5IGl0c2VsZiwKPiA+PiB0cmFuc2l0aW9u
aW5nIGl0IHRvIHVzZSB0aGUgdGFibGUgd2hpY2ggY29tZXMgZnJvbSBkZXZpY2UtdHJlZS4gVGhp
cwo+ID4+IGNoYW5nZSBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIGRldmljZS10cmVl
cyBpbiBvcmRlciB0byBicmluZwo+ID4+IHN1cHBvcnQgZm9yIHRoZSBpbnRlcmNvbm5lY3QgZnJh
bWV3b3JrIHRvIHRoZSBkcml2ZXIuIFRoaXMgaXMgYSBtYW5kYXRvcnkKPiA+PiBjaGFuZ2Ugd2hp
Y2ggbmVlZHMgdG8gYmUgZG9uZSBpbiBvcmRlciB0byBpbXBsZW1lbnQgaW50ZXJjb25uZWN0LWJh
c2VkCj4gPj4gbWVtb3J5IERWRlMuIFVzZXJzIG9mIGxlZ2FjeSBkZXZpY2UtdHJlZXMgd2lsbCBn
ZXQgYSBtZXNzYWdlIHRlbGxpbmcgdGhhdAo+ID4+IHRoZWlycyBEVCBuZWVkcyB0byBiZSB1cGdy
YWRlZC4gTm93IEFDVE1PTiBpc3N1ZXMgbWVtb3J5IGJhbmR3aWR0aCByZXF1ZXN0Cj4gPj4gdXNp
bmcgZGV2X3BtX29wcF9zZXRfYncoKSwgaW5zdGVhZCBvZiBkcml2aW5nIEVNQyBjbG9jayByYXRl
IGRpcmVjdGx5Lgo+ID4+Cj4gPj4gVGVzdGVkLWJ5OiBQZXRlciBHZWlzIDxwZ3dpcGVvdXRAZ21h
aWwuY29tPgo+ID4+IFRlc3RlZC1ieTogTmljb2xhcyBDaGF1dmV0IDxrd2l6YXJ0QGdtYWlsLmNv
bT4KPiA+PiBBY2tlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+ID4+
IC0tLQo+ID4+ICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgfCA4NiArKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspLCA0MiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Rl
dmZyZXEvdGVncmEzMC1kZXZmcmVxLmMgYi9kcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVx
LmMKPiA+PiBpbmRleCAzOGNjMGQwMTQ3MzguLmVkNmQ0NDY5YzhjNyAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVxLmMKPiA+PiArKysgYi9kcml2ZXJzL2Rl
dmZyZXEvdGVncmEzMC1kZXZmcmVxLmMKPiA+PiBAQCAtMTksNiArMTksOCBAQAo+ID4+ICAjaW5j
bHVkZSA8bGludXgvcmVzZXQuaD4KPiA+PiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgo+
ID4+ICAKPiA+PiArI2luY2x1ZGUgPHNvYy90ZWdyYS9mdXNlLmg+Cj4gPj4gKwo+ID4+ICAjaW5j
bHVkZSAiZ292ZXJub3IuaCIKPiA+PiAgCj4gPj4gICNkZWZpbmUgQUNUTU9OX0dMQl9TVEFUVVMJ
CQkJCTB4MAo+ID4+IEBAIC0xNTUsNiArMTU3LDcgQEAgc3RydWN0IHRlZ3JhX2RldmZyZXFfZGV2
aWNlIHsKPiA+PiAgCj4gPj4gIHN0cnVjdCB0ZWdyYV9kZXZmcmVxIHsKPiA+PiAgCXN0cnVjdCBk
ZXZmcmVxCQkqZGV2ZnJlcTsKPiA+PiArCXN0cnVjdCBvcHBfdGFibGUJKm9wcF90YWJsZTsKPiA+
PiAgCj4gPj4gIAlzdHJ1Y3QgcmVzZXRfY29udHJvbAkqcmVzZXQ7Cj4gPj4gIAlzdHJ1Y3QgY2xr
CQkqY2xvY2s7Cj4gPj4gQEAgLTYxMiwzNCArNjE1LDE5IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2Fj
dG1vbl9zdG9wKHN0cnVjdCB0ZWdyYV9kZXZmcmVxICp0ZWdyYSkKPiA+PiAgc3RhdGljIGludCB0
ZWdyYV9kZXZmcmVxX3RhcmdldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKmZy
ZXEsCj4gPj4gIAkJCQl1MzIgZmxhZ3MpCj4gPj4gIHsKPiA+PiAtCXN0cnVjdCB0ZWdyYV9kZXZm
cmVxICp0ZWdyYSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4+IC0Jc3RydWN0IGRldmZyZXEg
KmRldmZyZXEgPSB0ZWdyYS0+ZGV2ZnJlcTsKPiA+PiAgCXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7
Cj4gPj4gLQl1bnNpZ25lZCBsb25nIHJhdGU7Cj4gPj4gLQlpbnQgZXJyOwo+ID4+ICsJaW50IHJl
dDsKPiA+PiAgCj4gPj4gIAlvcHAgPSBkZXZmcmVxX3JlY29tbWVuZGVkX29wcChkZXYsIGZyZXEs
IGZsYWdzKTsKPiA+PiAgCWlmIChJU19FUlIob3BwKSkgewo+ID4+ICAJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIGZpbmQgb3BwIGZvciAlbHUgSHpcbiIsICpmcmVxKTsKPiA+PiAgCQlyZXR1cm4g
UFRSX0VSUihvcHApOwo+ID4+ICAJfQo+ID4+IC0JcmF0ZSA9IGRldl9wbV9vcHBfZ2V0X2ZyZXEo
b3BwKTsKPiA+PiAtCWRldl9wbV9vcHBfcHV0KG9wcCk7Cj4gPj4gLQo+ID4+IC0JZXJyID0gY2xr
X3NldF9taW5fcmF0ZSh0ZWdyYS0+ZW1jX2Nsb2NrLCByYXRlICogS0haKTsKPiA+PiAtCWlmIChl
cnIpCj4gPj4gLQkJcmV0dXJuIGVycjsKPiA+PiAtCj4gPj4gLQllcnIgPSBjbGtfc2V0X3JhdGUo
dGVncmEtPmVtY19jbG9jaywgMCk7Cj4gPj4gLQlpZiAoZXJyKQo+ID4+IC0JCWdvdG8gcmVzdG9y
ZV9taW5fcmF0ZTsKPiA+PiAgCj4gPj4gLQlyZXR1cm4gMDsKPiA+PiAtCj4gPj4gLXJlc3RvcmVf
bWluX3JhdGU6Cj4gPj4gLQljbGtfc2V0X21pbl9yYXRlKHRlZ3JhLT5lbWNfY2xvY2ssIGRldmZy
ZXEtPnByZXZpb3VzX2ZyZXEpOwo+ID4+ICsJcmV0ID0gZGV2X3BtX29wcF9zZXRfYncoZGV2LCBv
cHApOwo+ID4+ICsJZGV2X3BtX29wcF9wdXQob3BwKTsKPiA+PiAgCj4gPj4gLQlyZXR1cm4gZXJy
Owo+ID4+ICsJcmV0dXJuIHJldDsKPiA+PiAgfQo+ID4+ICAKPiA+PiAgc3RhdGljIGludCB0ZWdy
YV9kZXZmcmVxX2dldF9kZXZfc3RhdHVzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+PiBAQCAtNjU1
LDcgKzY0Myw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZGV2ZnJlcV9nZXRfZGV2X3N0YXR1cyhzdHJ1
Y3QgZGV2aWNlICpkZXYsCj4gPj4gIAlzdGF0LT5wcml2YXRlX2RhdGEgPSB0ZWdyYTsKPiA+PiAg
Cj4gPj4gIAkvKiBUaGUgYmVsb3cgYXJlIHRvIGJlIHVzZWQgYnkgdGhlIG90aGVyIGdvdmVybm9y
cyAqLwo+ID4+IC0Jc3RhdC0+Y3VycmVudF9mcmVxdWVuY3kgPSBjdXJfZnJlcTsKPiA+PiArCXN0
YXQtPmN1cnJlbnRfZnJlcXVlbmN5ID0gY3VyX2ZyZXEgKiBLSFo7Cj4gPj4gIAo+ID4+ICAJYWN0
bW9uX2RldiA9ICZ0ZWdyYS0+ZGV2aWNlc1tNQ0FMTF07Cj4gPj4gIAo+ID4+IEBAIC03MDUsNyAr
NjkzLDEyIEBAIHN0YXRpYyBpbnQgdGVncmFfZ292ZXJub3JfZ2V0X3RhcmdldChzdHJ1Y3QgZGV2
ZnJlcSAqZGV2ZnJlcSwKPiA+PiAgCQl0YXJnZXRfZnJlcSA9IG1heCh0YXJnZXRfZnJlcSwgZGV2
LT50YXJnZXRfZnJlcSk7Cj4gPj4gIAl9Cj4gPj4gIAo+ID4+IC0JKmZyZXEgPSB0YXJnZXRfZnJl
cTsKPiA+PiArCS8qCj4gPj4gKwkgKiB0ZWdyYS1kZXZmcmVxIGRyaXZlciBvcGVyYXRlcyB3aXRo
IEtIeiB1bml0cywgd2hpbGUgT1BQIHRhYmxlCj4gPj4gKwkgKiBlbnRyaWVzIHVzZSBIeiB1bml0
cy4gSGVuY2Ugd2UgbmVlZCB0byBjb252ZXJ0IHRoZSB1bml0cyBmb3IgdGhlCj4gPj4gKwkgKiBk
ZXZmcmVxIGNvcmUuCj4gPj4gKwkgKi8KPiA+PiArCSpmcmVxID0gdGFyZ2V0X2ZyZXEgKiBLSFo7
Cj4gPj4gIAo+ID4+ICAJcmV0dXJuIDA7Cj4gPj4gIH0KPiA+PiBAQCAtNzc0LDYgKzc2Nyw3IEBA
IHN0YXRpYyBzdHJ1Y3QgZGV2ZnJlcV9nb3Zlcm5vciB0ZWdyYV9kZXZmcmVxX2dvdmVybm9yID0g
ewo+ID4+ICAKPiA+PiAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gIHsKPiA+PiArCXUzMiBod192ZXJzaW9uID0gQklUKHRl
Z3JhX3NrdV9pbmZvLnNvY19zcGVlZG9faWQpOwo+ID4+ICAJc3RydWN0IHRlZ3JhX2RldmZyZXFf
ZGV2aWNlICpkZXY7Cj4gPj4gIAlzdHJ1Y3QgdGVncmFfZGV2ZnJlcSAqdGVncmE7Cj4gPj4gIAlz
dHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKPiA+PiBAQCAtNzgxLDYgKzc3NSwxMyBAQCBzdGF0aWMg
aW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
PiAgCWxvbmcgcmF0ZTsKPiA+PiAgCWludCBlcnI7Cj4gPj4gIAo+ID4+ICsJLyogbGVnYWN5IGRl
dmljZS10cmVlcyBkb24ndCBoYXZlIE9QUCB0YWJsZSBhbmQgbXVzdCBiZSB1cGRhdGVkICovCj4g
Pj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCZwZGV2LT5kZXYsICJvcGVyYXRpbmct
cG9pbnRzLXYyIikpIHsKPiA+PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gPj4gKwkJCSJPUFAg
dGFibGUgbm90IGZvdW5kLCBwbGVhc2UgdXBkYXRlIHlvdXIgZGV2aWNlIHRyZWVcbiIpOwo+ID4+
ICsJCXJldHVybiAtRU5PREVWOwo+ID4+ICsJfQo+ID4+ICsKPiA+IAo+ID4gWW91IGZvcmdvdCB0
byByZW1vdmUgdGhpcyA/Cj4gCj4gWWVzLCBnb29kIGNhdGNoLiBJJ20gcGxhbm5pbmcgdG8gcmVw
bGFjZSB0aGlzIGNvZGUgd2l0aCBhIGNvbW1vbiBoZWxwZXIKPiBzb21ldGltZSBzb29uLCBzbyBp
ZiB0aGVyZSB3b24ndCBiZSBhbm90aGVyIHJlYXNvbnMgdG8gbWFrZSBhIG5ldwo+IHJldmlzaW9u
LCB0aGVuIEknZCBwcmVmZXIgdG8ga2VlcCBpdCBhcy1pcyBmb3Igbm93LgoKWW91IHNob3VsZCBq
dXN0IHJlcGxhY2UgdGhpcyBwYXRjaCBvbmx5IHdpdGggYSB2ZXJzaW9uIG9mIFY5LjEgYW5kIHlv
dQphcmVuJ3QgcmVhbGx5IHJlcXVpcmVkIHRvIHJlc2VuZCB0aGUgd2hvbGUgc2VyaWVzLiBBbmQg
eW91IHNob3VsZCBmaXgKaXQgYmVmb3JlIGl0IGdldHMgbWVyZ2VkLiBUaGlzIGlzbid0IGEgZm9y
bWF0dGluZyBpc3N1ZSB3aGljaCB3ZSBqdXN0CmxldCB0aHJvdWdoLiBJIHRydXN0IHlvdSB3aGVu
IHlvdSBzYXkgdGhhdCB5b3Ugd2lsbCBmaXggaXQsIGJ1dCB0aGlzCm11c3QgYmUgZml4ZWQgbm93
LgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
