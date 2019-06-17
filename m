Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D485747A82
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37B189189;
	Mon, 17 Jun 2019 07:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE7E89159
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:17:24 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f21so5024110pgi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 21:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fF6C6yU+ctNlGc2XdhZFZfZxRPV+pLz7dQXBNdsmYaM=;
 b=tgQVF22ZZ3Jk83a8fh3ijDpXCG7RT7/ksTHz/X/26putBCsWGCNLgwegzaAelr8sBZ
 eLHRtSisF1eD+CIl+oWcOF2ISJc2NJFjpmq8JnynaPMDtACUSzJ/ZnEWCM/tIsXmumwo
 l6xilHJxfxA4CO1OpB8/WfaI50rVvQbL7RK1NfroPRCqSp+hMXyAlUP9IJbB1YAowaRO
 1hAfS+Wv8l2gahDf16XAZjKgO/jOnGnoPgLM5IpspswKSnkUf/Z8CVFX3W2CAUHq6rYL
 MtWG0qEbEgDYYGhd16bbJvRDCwjMMBR8ERQ/kSo/gPYkTI9Hqz1/EtCd3balbc4RPHOy
 zfkA==
X-Gm-Message-State: APjAAAXMjayo07bxdJt/FLy4y9bPe/lX5bSJMo4EP2dEiB+LSPxjvz+P
 ysEx8GczWp0lNX+Tc2APk/SY2Z57G24=
X-Google-Smtp-Source: APXvYqwGCOwwX/fHLmkix7aoXMTAB8HwyZ9nxohqcmG4iD/6uJ9F4lZt0jQoC6EC0dO6ZKmwaf0C7Q==
X-Received: by 2002:a17:90a:24e4:: with SMTP id
 i91mr25143081pje.9.1560745043955; 
 Sun, 16 Jun 2019 21:17:23 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id w187sm11086622pfb.4.2019.06.16.21.17.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 21:17:23 -0700 (PDT)
Date: Mon, 17 Jun 2019 09:47:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190617041721.5xdr3kl4xxe6gy4m@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
 <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
 <20190613095419.lfjeko7nmxtix2n4@vireshk-i7>
 <20190614052732.4w6vvwwich2h4cgu@vireshk-i7>
 <20190617035058.veo7uwqjrpa6kykt@vireshk-i7>
 <a912c8b2-080d-7ab7-670b-b687ec3a2c92@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a912c8b2-080d-7ab7-670b-b687ec3a2c92@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fF6C6yU+ctNlGc2XdhZFZfZxRPV+pLz7dQXBNdsmYaM=;
 b=PYYs/y+1YUsOQ0sFRqqd6xXWi4ZM2jSQo31Oth3e1idd3rfW2G4cEqPfTxb906ZHhS
 J20pfjoh+JPr7Ik4Gntk4Q/Pvj8u46EIUPLIJ6ioGwBUrShNhVxeyDWglmH9Ok9TzYhF
 wSZTjnUSQ+qfJxhiBuKgGfh+2fCmWigoLv68DKRuRn6DGjQevSTZ30B10Cx8jD4rNGCh
 eYqw9FCi14QTDsvH7z9+e5wfdAp1yRo61z0kEDVzIrIrgn4kzs674wKYT/MJtQy7+C0H
 IvC1qJHq2Zhw/cgnuPlQpl2i/1E5EmllbfvhrBNp6UdC//DXdizXv6Gxhec6lDyctSGO
 qCwA==
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, vincent.guittot@linaro.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mturquette@baylibre.com, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTctMDYtMTksIDA5OjM3LCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiAKPiAKPiBPbiA2LzE3
LzIwMTkgOToyMCBBTSwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+ID4gT24gMTQtMDYtMTksIDEwOjU3
LCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gPiA+IEhtbSwgc28gdGhpcyBwYXRjaCB3b24ndCBicmVh
ayBhbnl0aGluZyBhbmQgSSBhbSBpbmNsaW5lZCB0byBhcHBseSBpdCBhZ2FpbiA6KQo+ID4gPiAK
PiA+ID4gRG9lcyBhbnlvbmUgc2VlIGFueSBvdGhlciBpc3N1ZXMgd2l0aCBpdCwgd2hpY2ggSSBt
aWdodCBiZSBtaXNzaW5nID8KPiA+IAo+ID4gSSBoYXZlIHVwZGF0ZWQgdGhlIGNvbW1pdCBsb2cg
YSBiaXQgbW9yZSB0byBjbGFyaWZ5IG9uIHRoaW5ncywgcGxlYXNlIGxldCBtZQo+ID4ga25vdyBp
ZiBpdCBsb29rcyBva2F5Lgo+ID4gCj4gPiAgICAgIG9wcDogRG9uJ3Qgb3ZlcndyaXRlIHJvdW5k
ZWQgY2xrIHJhdGUKPiA+ICAgICAgVGhlIE9QUCB0YWJsZSBub3JtYWxseSBjb250YWlucyAnZm1h
eCcgdmFsdWVzIGNvcnJlc3BvbmRpbmcgdG8gdGhlCj4gPiAgICAgIHZvbHRhZ2Ugb3IgcGVyZm9y
bWFuY2UgbGV2ZWxzIG9mIGVhY2ggT1BQLCBidXQgd2UgZG9uJ3QgbmVjZXNzYXJpbHkgd2FudAo+
ID4gICAgICBhbGwgdGhlIGRldmljZXMgdG8gcnVuIGF0IGZtYXggYWxsIHRoZSB0aW1lLiBSdW5u
aW5nIGF0IGZtYXggbWFrZXMgc2Vuc2UKPiA+ICAgICAgZm9yIGRldmljZXMgbGlrZSBDUFUvR1BV
LCB3aGljaCBoYXZlIGEgZmluaXRlIGFtb3VudCBvZiB3b3JrIHRvIGRvIGFuZAo+ID4gICAgICBz
aW5jZSBhIHNwZWNpZmljIGFtb3VudCBvZiBlbmVyZ3kgaXMgY29uc3VtZWQgYXQgYW4gT1BQLCBp
dHMgYmV0dGVyIHRvCj4gPiAgICAgIHJ1biBhdCB0aGUgaGlnaGVzdCBwb3NzaWJsZSBmcmVxdWVu
Y3kgZm9yIHRoYXQgdm9sdGFnZSB2YWx1ZS4KPiA+ICAgICAgT24gdGhlIG90aGVyIGhhbmQsIHdl
IGhhdmUgSU8gZGV2aWNlcyB3aGljaCBuZWVkIHRvIHJ1biBhdCBzcGVjaWZpYwo+ID4gICAgICBm
cmVxdWVuY2llcyBvbmx5IGZvciB0aGVpciBwcm9wZXIgZnVuY3Rpb25pbmcsIGluc3RlYWQgb2Yg
bWF4aW11bQo+ID4gICAgICBwb3NzaWJsZSBmcmVxdWVuY3kuCj4gPiAgICAgIFRoZSBPUFAgY29y
ZSBjdXJyZW50bHkgcm91bmR1cCB0byB0aGUgbmV4dCBwb3NzaWJsZSBPUFAgZm9yIGEgZnJlcXVl
bmN5Cj4gPiAgICAgIGFuZCBzZWxlY3QgdGhlIGZtYXggdmFsdWUuIFRvIHN1cHBvcnQgdGhlIElP
IGRldmljZXMgYnkgdGhlIE9QUCBjb3JlLAo+ID4gICAgICBsZXRzIGRvIHRoZSByb3VuZHVwIHRv
IGZldGNoIHRoZSB2b2x0YWdlIG9yIHBlcmZvcm1hbmNlIHN0YXRlIHZhbHVlcywKPiA+ICAgICAg
YnV0IG5vdCB1c2UgdGhlIE9QUCBmcmVxdWVuY3kgdmFsdWUuIFJhdGhlciB1c2UgdGhlIHZhbHVl
IHJldHVybmVkIGJ5Cj4gPiAgICAgIGNsa19yb3VuZF9yYXRlKCkuCj4gPiAgICAgIFRoZSBjdXJy
ZW50IHVzZXIsIGNwdWZyZXEsIG9mIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBhbHJlYWR5IGRvZXMg
dGhlCj4gPiAgICAgIHJvdW5kaW5nIHRvIHRoZSBuZXh0IE9QUCBiZWZvcmUgY2FsbGluZyB0aGlz
IHJvdXRpbmUgYW5kIGl0IHdvbid0Cj4gPiAgICAgIGhhdmUgYW55IHNpZGUgYWZmZWN0cyBiZWNh
dXNlIG9mIHRoaXMgY2hhbmdlLgo+IAo+IExvb2tzIGdvb2QgdG8gbWUuIFNob3VsZCB0aGlzIGFs
c28gYmUgZG9jdW1lbnRlZCBzb21lcGxhY2UgdGhhdCBkZXZfcG1fb3BwX3NldF9yYXRlKCkKPiB3
b3VsZCBub3QgYmUgYWJsZSB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGl0cyB1c2VycyB0cnlpbmcg
dG8gc2NhbGUgQ1BVL0dQVSdzIHZzIElPCj4gZGV2aWNlcywgc28gaXRzIHRoZSBjYWxsZXJzIHJl
c3BvbnNpYmlsaXR5IHRvIHJvdW5kIGl0IGFjY29yZGluZ2x5IGJlZm9yZSBjYWxsaW5nIHRoZQo+
IEFQST8KCmRpZmYgLS1naXQgYS9kcml2ZXJzL29wcC9jb3JlLmMgYi9kcml2ZXJzL29wcC9jb3Jl
LmMKaW5kZXggMGZiYzc3ZjA1MDQ4Li5iYWU5NGJmYTFlOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
b3BwL2NvcmUuYworKysgYi9kcml2ZXJzL29wcC9jb3JlLmMKQEAgLTc1MSw4ICs3NTEsMTEgQEAg
c3RhdGljIGludCBfc2V0X3JlcXVpcmVkX29wcHMoc3RydWN0IGRldmljZSAqZGV2LAogICogQGRl
djogICAgICAgIGRldmljZSBmb3Igd2hpY2ggd2UgZG8gdGhpcyBvcGVyYXRpb24KICAqIEB0YXJn
ZXRfZnJlcTogZnJlcXVlbmN5IHRvIGFjaGlldmUKICAqCi0gKiBUaGlzIGNvbmZpZ3VyZXMgdGhl
IHBvd2VyLXN1cHBsaWVzIGFuZCBjbG9jayBzb3VyY2UgdG8gdGhlIGxldmVscyBzcGVjaWZpZWQK
LSAqIGJ5IHRoZSBPUFAgY29ycmVzcG9uZGluZyB0byB0aGUgdGFyZ2V0X2ZyZXEuCisgKiBUaGlz
IGNvbmZpZ3VyZXMgdGhlIHBvd2VyLXN1cHBsaWVzIHRvIHRoZSBsZXZlbHMgc3BlY2lmaWVkIGJ5
IHRoZSBPUFAKKyAqIGNvcnJlc3BvbmRpbmcgdG8gdGhlIHRhcmdldF9mcmVxLCBhbmQgcHJvZ3Jh
bXMgdGhlIGNsb2NrIHRvIGEgdmFsdWUgPD0KKyAqIHRhcmdldF9mcmVxLCBhcyByb3VuZGVkIGJ5
IGNsa19yb3VuZF9yYXRlKCkuIERldmljZSB3YW50aW5nIHRvIHJ1biBhdCBmbWF4CisgKiBwcm92
aWRlZCBieSB0aGUgb3BwLCBzaG91bGQgaGF2ZSBhbHJlYWR5IHJvdW5kZWQgdG8gdGhlIHRhcmdl
dCBPUFAncworICogZnJlcXVlbmN5LgogICovCgotLSAKdmlyZXNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
