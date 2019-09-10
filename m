Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D4AE7E9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 12:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986E96E8AE;
	Tue, 10 Sep 2019 10:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DE46E8AE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 10:22:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l11so19011028wrx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 03:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wpr2coDySs9Rh34jajBcihEANouoWM4tiMrDCeWl8sg=;
 b=q0aTOD9Rc6SqFi00y/5ADtoSWgOknkjREwZCRXz2jVXGBvGDrA5krxkoles7yE3n6J
 H2nvW8tmf3CPD1EqSC2De9R5gz5dDtHTioqOXXoBydJvfBPVNph1nd24n0kcckr0LNMo
 jbS0p2hn09dLhBVBoo8xU+iqrajMeV3XavxA42oW5FqHT+7o0e+CEox24XOJ0SFzbfsN
 fjKpsCk62Bfx7GX6gj5WogmIH/8UmYFdQ55xWUHDxGBsCYyp1eLNppq3MES5tWAreWbC
 AEc9pMXqHSP+oENeMJC462BS8gV+6xOoB+IQ4zhh73b2nQSCnVWmXVxkwDIQQZ3b2Fel
 728A==
X-Gm-Message-State: APjAAAXhAaJ101Az+KHxj65+vnzKI+ehcn27+FXuydMpuFlXg1qCRUhk
 Suc8Gu4EoxEnwwbq0TdcZXcEkA==
X-Google-Smtp-Source: APXvYqzG45USjR48kMX2kVZsXNO4YuCGkE3qBxH6BwrxuV+lwOeTtCvs9XVNlmc/kSobyXOtgJDQdA==
X-Received: by 2002:adf:f04f:: with SMTP id t15mr13262934wro.250.1568110919018; 
 Tue, 10 Sep 2019 03:21:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o19sm23744301wro.50.2019.09.10.03.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 03:21:58 -0700 (PDT)
Date: Tue, 10 Sep 2019 11:21:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190910102156.vmprsjebmlphkv34@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
 <20190909105729.w5552rtop7rhghy2@holly.lan>
 <20190909221349.46ca5a1f@aktux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909221349.46ca5a1f@aktux>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wpr2coDySs9Rh34jajBcihEANouoWM4tiMrDCeWl8sg=;
 b=OWD1IplSbH+Uj6fRnvAWQMTtgsLhiEt+qYbKjXaLSulXC/QfZK1S8iBbPUxjl80LQs
 Sxa/NOEYbyoMdACAwtywuw45EkqtZ4cwdzmxnQTw9JieI26ywI5teAX/795GB6Jtqmp9
 SK1E4X5R8xry3MoVaEDSWL3tNsjqoxoGYqC+m1t6M9u5PG5TtnU76MQiPPj/ch8FZCVh
 VNAkXR11i4Q+SFgNCBjUbiUoEY9M8+hM44rio0gVfl4Q1Eof5sap2IoUobfy8txXXqGa
 SdF6Z2HV1FVkF11y1n4OqbppwEtKiDW3lebmGQ+6jAoCKHsYYEQQTXBbwSvCj25uPmQ+
 BMfA==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMTA6MTM6NDlQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRl
IHdyb3RlOgo+IE9uIE1vbiwgOSBTZXAgMjAxOSAxMTo1NzoyOSArMDEwMAo+IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+ID4gT24gU3VuLCBT
ZXAgMDgsIDIwMTkgYXQgMTA6Mzc6MDNQTSArMDIwMCwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgo+
ID4gPiBGb3Igbm93IGp1c3QgZW5hYmxlIGl0IGluIHRoZSBwcm9iZSBmdW5jdGlvbiB0byBhbGxv
dyBpMmMKPiA+ID4gYWNjZXNzIGFuZCBkaXNhYmxlIGl0IG9uIHJlbW92ZS4gRGlzYWJsaW5nIGFs
c28gbWVhbnMgcmVzZXR0aW5nCj4gPiA+IHRoZSByZWdpc3RlciB2YWx1ZXMgdG8gZGVmYXVsdC4K
PiA+ID4gCj4gPiA+IFRlc3RlZCBvbiBLb2JvIENsYXJhIEhELgo+ID4gPiAKPiA+ID4gU2lnbmVk
LW9mZi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KPiA+ID4gLS0t
Cj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCAxOCArKysrKysr
KysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gPiA+
IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5j
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gPiA+IGluZGV4IGIwNGIz
NWQwMDdhMi4uM2I0NWExNzMzMTk4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9sbTM2MzBhX2JsLmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
bG0zNjMwYV9ibC5jCj4gPiA+IEBAIC0xMiw2ICsxMiw4IEBACj4gPiA+ICAjaW5jbHVkZSA8bGlu
dXgvdWFjY2Vzcy5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29u
c3VtZXIuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9ncGlvLmg+Cj4gPiA+ICAjaW5jbHVkZSA8
bGludXgvcHdtLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9sbTM2MzBh
X2JsLmg+Cj4gPiA+ICAKPiA+ID4gQEAgLTQ4LDYgKzUwLDcgQEAgc3RydWN0IGxtMzYzMGFfY2hp
cCB7Cj4gPiA+ICAJc3RydWN0IGxtMzYzMGFfcGxhdGZvcm1fZGF0YSAqcGRhdGE7Cj4gPiA+ICAJ
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRhOwo+ID4gPiAgCXN0cnVjdCBiYWNrbGlnaHRf
ZGV2aWNlICpibGVkYjsKPiA+ID4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsKPiA+
ID4gIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gPiA+ICAJc3RydWN0IHB3bV9kZXZpY2UgKnB3
bWQ7Cj4gPiA+ICB9Owo+ID4gPiBAQCAtNTA2LDYgKzUwOSwxNCBAQCBzdGF0aWMgaW50IGxtMzYz
MGFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+ID4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gPiA+ICAJcGNoaXAtPmRldiA9ICZjbGllbnQtPmRldjsKPiA+ID4gIAo+ID4gPiArCXBj
aGlwLT5lbmFibGVfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwg
ImVuYWJsZSIsCj4gPiA+ICsJCQkJCQlHUElPRF9BU0lTKTsgIAo+ID4gCj4gPiBJbml0aWFsaXpp
bmcgR1BJT0RfQVNJUyBkb2Vzbid0IGxvb2sgcmlnaHQgdG8gbWUuCj4gPiAKPiA+IElmIHlvdSBp
bml0aWFsaXplIEFTSVMgdGhlbiB0aGUgZHJpdmVyIG11c3QgY29uZmlndXJlIHRoZSBwaW4gYXMg
YW4KPiA+IG91dHB1dC4uLiBmYXIgZWFzaWVyIGp1c3QgdG8gc2V0IEdQSU9EX09VVF9ISUdIIGR1
cmluZyB0aGUgZ2V0Lgo+ID4gCj4gPiBOb3RlIGFsc28gdGhhdCB0aGUgY2FsbCB0byB0aGlzIGZ1
bmN0aW9uIHNob3VsZCBhbHNvIGJlIG1vdmVkICpiZWxvdyoKPiA+IHRoZSBjYWxscyBwYXJzZSB0
aGUgRFQuCj4gPiAKPiBvb3BzLCBtdXN0IGhhdmUgZm9yZ290dGVuIHRoYXQsIGFuZCBoYWQgZ29v
ZCBsdWNrIGhlcmUuCj4gPiAKPiA+ID4gKwlpZiAoSVNfRVJSKHBjaGlwLT5lbmFibGVfZ3Bpbykp
IHsKPiA+ID4gKwkJcnZhbCA9IFBUUl9FUlIocGNoaXAtPmVuYWJsZV9ncGlvKTsKPiA+ID4gKwkJ
cmV0dXJuIHJ2YWw7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsKPiA+ID4gIAlwY2hpcC0+cmVn
bWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LCAmbG0zNjMwYV9yZWdtYXApOwo+ID4g
PiAgCWlmIChJU19FUlIocGNoaXAtPnJlZ21hcCkpIHsKPiA+ID4gIAkJcnZhbCA9IFBUUl9FUlIo
cGNoaXAtPnJlZ21hcCk7Cj4gPiA+IEBAIC01MzUsNiArNTQ2LDEwIEBAIHN0YXRpYyBpbnQgbG0z
NjMwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ID4gPiAgCX0KPiA+ID4gIAlw
Y2hpcC0+cGRhdGEgPSBwZGF0YTsKPiA+ID4gIAo+ID4gPiArCWlmIChwY2hpcC0+ZW5hYmxlX2dw
aW8pIHsKPiA+ID4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHBjaGlwLT5lbmFibGVfZ3Bp
bywgMSk7ICAKPiA+IAo+ID4gTm90IG5lZWRlZCwgdXNlIEdQSU9EX09VVF9ISUdIIGluc3RlYWQu
Cj4gPiAKPiA+IAo+ID4gPiArCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7ICAKPiA+IAo+ID4g
Tm90IG5lZWRlZCwgdGhpcyBzbGVlcCBpcyBhbHJlYWR5IHBhcnQgb2YgbG0zNjMwYV9jaGlwX2lu
aXQoKS4KPiA+IAo+IHlvdSBhcmUgcmlnaHQuCj4gPiAKPiA+ID4gKwl9Cj4gPiA+ICAJLyogY2hp
cCBpbml0aWFsaXplICovCj4gPiA+ICAJcnZhbCA9IGxtMzYzMGFfY2hpcF9pbml0KHBjaGlwKTsK
PiA+ID4gIAlpZiAocnZhbCA8IDApIHsKPiA+ID4gQEAgLTU4Niw2ICs2MDEsOSBAQCBzdGF0aWMg
aW50IGxtMzYzMGFfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gPiA+ICAJaWYg
KHJ2YWwgPCAwKQo+ID4gPiAgCQlkZXZfZXJyKHBjaGlwLT5kZXYsICJpMmMgZmFpbGVkIHRvIGFj
Y2VzcyByZWdpc3RlclxuIik7Cj4gPiA+ICAKPiA+ID4gKwlpZiAocGNoaXAtPmVuYWJsZV9ncGlv
KQo+ID4gPiArCQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAocGNoaXAtPmVuYWJsZV9ncGlvLCAw
KTsKPiA+ID4gKyAgCj4gPiAKPiA+IElzIHRoaXMgbmVlZGVkPwo+ID4gCj4gPiBUaGlzIGlzIGEg
cmVtb3ZlIHBhdGgsIG5vdCBhIHBvd2VyIG1hbmFnZW1lbnQgcGF0aCwgYW5kIHdlIGhhdmUgbm8g
aWRlYQo+ID4gd2hhdCB0aGUgb3JpZ2luYWwgc3RhdHVzIG9mIHRoZSBwaW4gd2FzIGFueXdheT8K
PiA+IAo+IAo+IExvb2tpbmcgYXQgSXNoZG4gb24gcGFnZSA1IG9mIHRoZSBkYXRhc2hlZXQsIHN3
aXRjaGluZyBpdCBvZmYgZXZlcnl0aW1lCj4gcG9zc2libGUgc2VlbXMgbm90IG5lZWRlZC4gV2Ug
d291bGQgbmVlZCB0byBjYWxsIGNoaXBfaW5pdCgpIGV2ZXJ5dGltZQo+IHdlIGVuYWJsZSB0aGUg
Z3BpbyBvciBsaXZlIHdpdGggZGVmYXVsdCB2YWx1ZXMuCj4gVGhlcmVmb3JlIEkgZGlkIGRlY2lk
ZSB0byBub3QgcHV0IGl0IGludG8gYW55IHBvd2VyIG1hbmFnZW1lbnQgcGF0aC4KPiBCdXQgc3dp
dGNoaW5nIGl0IG9uIGFuZCBub3Qgc3dpdGNoaW5nIGl0IG9mZiBmZWVscyBzbyB1bmJhbGFuY2Vk
LiAKCkVpdGhlciB0aGUgcG93ZXIgY29uc3VtZWQgYnkgdGhlIGNvbnRyb2xsZXIgd2hlbiBzdHJp
bmdzIGFyZW4ndCBsaXQgdXAKbWF0dGVycywgaW4gd2hpY2ggY2FzZSB0aGUgZHJpdmVyIHNob3Vs
ZCBpbXBsZW1lbnQgcHJvcGVyIHBvd2VyCm1hbmFnZW1lbnQgb3IgaXQgZG9lc24ndCBtYXR0ZXIg
YW5kIGNoYW5naW5nIHRoZSBwaW4gc3RhdGUgaXNuJ3QgbmVlZGVkLgoKSSdtIGhhcHB5IHdpdGgg
ZWl0aGVyIG9mIHRoZSBhYm92ZSBidXQgdGhpcyBsb29rcyBsaWtlIGEgdGhpcmQgd2F5LAp3aGVy
ZSBlYWdlciB1c2VycyBjb3VsZCBoYWNrIGluIGEgYml0IG9mIGV4dHJhIHBvd2VyIG1hbmFnZW1l
bnQgYnkKZm9yY2luZyBkcml2ZXJzIHRvIHVuYmluZC4gCgoKRGFuaWVsLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
