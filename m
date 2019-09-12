Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6ECB0B15
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D26E103;
	Thu, 12 Sep 2019 09:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1806E103
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:18:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d17so14827289wrq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 02:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Nabyzt7ZNfI2GC8vuMbUvyEMGGfNet5Q3cJhBhtdhB4=;
 b=DMlKtKY8XZfQ5yC0gwGpXwDvxTEoWZ1wE/XF5434Zh/os4+YYx9krxMZdWYTSDmC/o
 0e3zJox2e/CTIUlHQYqCfo/m/Hn5ryfRHAX4nuCiqaul4nqlLz6bGxt/tB50fQbiUhpE
 movLXYKgRNT7Fp/1zJ1JpoT2qBhTsdN72GWbyt1/RGDYvtj19AoUANQiUvlqnAHaE2sr
 XMlYv/pvJUKo14FFuZBCNR6OQgsWuzuCf6GQL6IWT0jrWk6eZ2XCePacVXSondQEIU6y
 WviJk/5jL0Ql0jHzyuma36Xwk+9dD0MZPhepryGy4MBQtCpIyDRzPY5QwSEMqs8s5fVY
 Csaw==
X-Gm-Message-State: APjAAAWoDyuH++fC6r0ruOA5NYXmH4QfTP7xEwCrVLXKvfkEn9ef3KaG
 qNY1JPv6FYE+Q/DgmrAALqudUg==
X-Google-Smtp-Source: APXvYqxCGCU66UuCueEY0dHWk91IVAe9nVu64XZCj5O1ESR1clrbZ/EdxDXjvUOa4sFQtdLH0hqStQ==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr15980991wrb.233.1568279894345; 
 Thu, 12 Sep 2019 02:18:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x17sm5359764wmj.19.2019.09.12.02.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 02:18:13 -0700 (PDT)
Date: Thu, 12 Sep 2019 10:18:11 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190912091811.evlmeeuoai6phy3l@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
 <20190911102533.not4ta3xwgm6bhjo@holly.lan>
 <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Nabyzt7ZNfI2GC8vuMbUvyEMGGfNet5Q3cJhBhtdhB4=;
 b=Wq0rUCRG5tJLLgE6MWPhkRG8ybUxTrM0lLW+DTbMHhnduPs7tV/5JWHTc2x7XTGY21
 ItmLWpSnDhcJDB6VVGUmiJhMPH/c4B9xbd7VOYSrHe+N2TorZ3VdTvo+SvMitkqqCJSD
 9MO7We6vXQC74VJaFERbF4w/AkH55BatgfBlBZz6hs3zgBl6Lp9mtIFMC4ASVrZxVrV0
 cAx8XCw9PFir8uyHo5eF8xAEBHDffovVSF35r40o8Q7T26veq+aaExdSiJDngIESpW3O
 B2BMW70hlGwx4jxxO9tNVFhm21OTquM4bhXwGbqDvWmNCda5RR1OEUWQJJWB7n3qgMnU
 0FtQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andreas Kemnade <andreas@kemnade.info>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDE6NDg6MzZQTSAtMDUwMCwgRGFuIE11cnBoeSB3cm90
ZToKPiAKPiBPbiA5LzExLzE5IDU6MjUgQU0sIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IE9u
IFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDExOjI5OjA5UE0gKzAyMDAsIEFuZHJlYXMgS2VtbmFkZSB3
cm90ZToKPiA+ID4gRm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24g
dG8gYWxsb3cgaTJjCj4gPiA+IGFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5n
IHRoZSByZWdpc3RlciB2YWx1ZXMKPiA+ID4gdG8gZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRo
ZSBkYXRhc2hlZXQgZG9lcyBub3QgZ2l2ZQo+ID4gPiBwb3dlciBzYXZpbmdzCj4gPiA+IAo+ID4g
PiBUZXN0ZWQgb24gS29ibyBDbGFyYSBIRC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Cj4gPiA+IC0tLQo+ID4gPiBjaGFu
Z2VzIGluIHYyOgo+ID4gPiAtIHNpbXBsaWZpY2F0aW9uCj4gPiA+IC0gY29ycmVjdCBncGlvIGRp
cmVjdGlvbiBpbml0aWFsaXNhdGlvbgo+ID4gPiAKPiA+ID4gICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sbTM2MzBhX2JsLmMgfCAxMCArKysrKysrKysrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBh
X2JsLmMKPiA+ID4gaW5kZXggOGY4NGYzNjg0ZjA0Li45ZDA2MzlkNDIwMmQgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwo+ID4gPiArKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiA+ID4gQEAgLTEyLDYgKzEyLDgg
QEAKPiA+ID4gICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ID4gPiAgICNpbmNsdWRlIDxs
aW51eC9pbnRlcnJ1cHQuaD4KPiA+ID4gICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L2dwaW8uaD4KPiA+IE5pdHBpY2tpbmcuLi4gYnV0IEkgZG9uJ3QgdGhpbmsgbGludXgvZ3Bpby5o
IGlzIHVzZWQgYW55bW9yZS4KPiA+IAo+ID4gCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3B3bS5o
Pgo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2xtMzYzMGFfYmwuaD4KPiA+
ID4gQEAgLTQ4LDYgKzUwLDcgQEAgc3RydWN0IGxtMzYzMGFfY2hpcCB7Cj4gPiA+ICAgCXN0cnVj
dCBsbTM2MzBhX3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+ID4gPiAgIAlzdHJ1Y3QgYmFja2xpZ2h0
X2RldmljZSAqYmxlZGE7Cj4gPiA+ICAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVkYjsK
PiA+ID4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsKPiA+ID4gICAJc3RydWN0IHJl
Z21hcCAqcmVnbWFwOwo+ID4gPiAgIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtZDsKPiA+ID4gICB9
Owo+ID4gPiBAQCAtNTM1LDYgKzUzOCwxMyBAQCBzdGF0aWMgaW50IGxtMzYzMGFfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ID4gICAJfQo+ID4gPiAgIAlwY2hpcC0+cGRhdGEg
PSBwZGF0YTsKPiA+ID4gKwlwY2hpcC0+ZW5hYmxlX2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRp
b25hbCgmY2xpZW50LT5kZXYsICJlbmFibGUiLAo+ID4gPiArCQkJCQkJR1BJT0RfT1VUX0hJR0gp
Owo+ID4gPiArCWlmIChJU19FUlIocGNoaXAtPmVuYWJsZV9ncGlvKSkgewo+ID4gPiArCQlydmFs
ID0gUFRSX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pOwo+ID4gPiArCQlyZXR1cm4gcnZhbDsKPiAK
PiB0aGUgZW5hYmxlIGdwaW8gaXMgb3B0aW9uYWwgc28gaWYgaXQgZmFpbHMgeW91IGxvZyB0aGUg
ZXJyb3IgYW5kIG1vdmUgb24KCklzbid0IHRoZSBlZmZlY3Qgb2YgdGhpcyB0byBjb3BlIGdyYWNl
ZnVsbHkgaWYgZW5hYmxlLWdwaW9zIGlzIGFic2VudApidXQgdG8gZmFpbCB3aXRoIGFuIGVycm9y
IGlmIGVuYWJsZS1ncGlvcyBleGlzdHMgYW5kIGlzIGJyb2tlbi4gSQp0aG91Z2h0IHRoaXMgY29k
ZSBwYXR0ZXJuIGlzIGZhaXJseSBjb21tb24uCgoKPiBBbHNvIG9uIGRyaXZlciByZW1vdmFsIGRp
ZCB5b3Ugd2FudCB0byBzZXQgdGhlIEdQSU8gdG8gbG93IHRvIGRpc2FibGUgdGhlCj4gZGV2aWNl
IHRvIHNhdmUgcG93ZXI/CgpBcyBpdCBoYXBwZW5zIEkgb2ZmZXJlZCB0byBvcHBvc2l0ZSBmZWVk
YmFjayBmb3IgdjE6Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1k
ZXZlbC8yMDE5LVNlcHRlbWJlci8yMzQ5MTguaHRtbAoKQmFzaWNhbGx5IGlmIHRoZSBwb3dlciBt
YXR0ZXJzIHRoZW4gd2Ugc2hvdWxkIHRha2UgY2FyZSBvZiB0aGluZ3MgaW4gdGhlClBNIGNvZGUg
cGF0aCAod2hpY2ggZm9yIHRoaXMgZHJpdmVyIG1lYW5zIHJlYWN0aW5nIHByb3Blcmx5IHRvCnN1
c3BlbmRlZCBmbGFnIHdoZW4gdXBkYXRpbmcgdGhlIGJyaWdodG5lc3MpLiBJZiB0aGUgcG93ZXIg
ZG9lc24ndCBtYXR0ZXIKdGhlbiwgZ2l2ZW4gdW5hbGxvY2F0ZWQgR1BJTyBwaW5zIGFyZSBpbiBh
biB1bmtub3duIHN0YXRlIGFueXdheSwgdGhlcmUKaXMgbm8gcG9pbnQgaW4gdGlkeWluZyB1cCBi
ZWNhdXNlIHdlIGRvbid0IGtub3cgd2hhdCB2YWx1ZSB0byByZXN0b3JlLgoKCkRhbmllbC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
