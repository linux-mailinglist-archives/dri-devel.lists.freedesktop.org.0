Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87049784
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50396E0BA;
	Tue, 18 Jun 2019 02:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A4D6E0BA;
 Tue, 18 Jun 2019 02:30:03 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so19206380eds.4;
 Mon, 17 Jun 2019 19:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+K2dK7BB+ZRPcC5GlPxOx9E2uiXydCb4k3N74jOxNw=;
 b=g7R59zr3CrTJM+SQPfLEKEfesUxytZFeds9tpk81pQ1H2QeM2d+MISqru4GH/qUdm9
 lQIOcm1yyML61XlLsWhvl+OIW4bsVgyJz3KAFq8UkGyO/BfXcN7KxLqlA1a4sWI8L8zw
 THP4Bw2KeFTy7tvtrCJz9SK0GiUVW+/L2JQnRwuoVrcRSCS6RBtPZwxcy86L/VMVn5pK
 X33Db49D6vzHlxoRSiCEehaaQQ5VE6LfDPiToqHItiqNOgLXduQvLFiHjPkB0LMIDCHH
 HXXd0UbxDjW8OPligm38GDGQdWkDItf7af/H5o+qRqAMmWF9BzirAmR/HnDGlAVN8Hwl
 50jg==
X-Gm-Message-State: APjAAAV9exOHHKRHCwXF50Xss3hhhJVCVlwR+Of6ty3ccK+LLF+6GjlK
 l6CSlLHLdecMetHmIZZy/77n0rJ1Q0YGY7oJbn4=
X-Google-Smtp-Source: APXvYqygOwpTD9IA5CyUz2wEgTceJDuw085NFm3Qof/qmK4dkSGOHrK44tOaUF27/hs7YV0dS75TPtWBLPZe5g0GQeI=
X-Received: by 2002:a50:cbc4:: with SMTP id l4mr89273565edi.264.1560825002272; 
 Mon, 17 Jun 2019 19:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-6-masneyb@onstation.org>
 <20190616174106.GO22737@tuxbook-pro> <20190618020200.GB22330@onstation.org>
In-Reply-To: <20190618020200.GB22330@onstation.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Jun 2019 19:29:47 -0700
Message-ID: <CAF6AEGsoPNL52h5gEHP8UtmD9_MhX89E=aWiPZXS7zepykEMFA@mail.gmail.com>
Subject: Re: [PATCH 5/6] soc: qcom: add OCMEM driver
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t+K2dK7BB+ZRPcC5GlPxOx9E2uiXydCb4k3N74jOxNw=;
 b=eWt7+9O8Te8FdO0baANBy+PyjNKsRirDGc/YMiULXRAQzbbf46urshe2L4HaunhBDl
 +6dEajtT4AC0XyOBf6LMFpeRYsM4yxgwKlf3hxjlCTRIPQl4IwI90+Gg6hE/Q7Az2O1a
 HqVYcoterlzR1FJwDrO2hAUseHILpm1RB3dhjzGctLJXB9mVs7OjxgfsmJxk2Tkn477c
 WdSUEQnrXD2Pvqs9V1UfG5vCQsQ/cqYFCe5sJGkBml4RCUSyxUFYqxYY7OWDFdNsYMvT
 Ljblp8OTZnRBbwFN1ESgnqCvqurvwsdNa95hg7kzDHzhHDP5L4mz27j5GoblSAC1YdJM
 E3ZQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>, Jonathan <jonathan@marek.ca>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>, agross@kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNzowMiBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBIaSBSb2IgQ2xhcmssCj4KPiBPbiBTdW4sIEp1biAxNiwg
MjAxOSBhdCAxMDo0MTowNkFNIC0wNzAwLCBCam9ybiBBbmRlcnNzb24gd3JvdGU6Cj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9xY29tL29jbWVtLnhtbC5oIGIvZHJpdmVycy9zb2MvcWNv
bS9vY21lbS54bWwuaAo+ID4KPiA+IEkgd291bGQgcHJlZmVyIHRoYXQgdGhlc2UgbGl2ZWQgYXQg
dGhlIHRvcCBvZiB0aGUgYyBmaWxlLCByYXRoZXIgdGhhbgo+ID4gYmVpbmcgZ2VuZXJhdGVkLgo+
Cj4gSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIG1ha2UgdGhpcyBjaGFuZ2UgYXMgd2VsbC4K
Pgo+IFJvYiBDOiBZb3VyIG9yaWdpbmFsIGZpbGUgb2NtZW0ueG1sLmggd2FzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSBNSVQKPiBsaWNlbnNlLiBJIGp1c3Qgd2FudGVkIGNvbmZpcm1hdGlvbiBmcm9tIHlv
dSB0aGF0IGl0J3MgT0sgdG8gcHV0Cj4gdGhlIGNvbnRlbnRzIG9mIHRoYXQgZmlsZSBpbnRvIG9j
bWVtLmMgd2hpY2ggaGFzIHRoZSBHUEwgMi4wIG9ubHkKPiBTUERYIGxpY2Vuc2UgdGFnLiBUaGlz
IHdpbGwgcmVsaWNlbnNlIHRoZSB3b3JrLiBJIGltYWdpbmUgaXQncyBub3QKPiBhbiBpc3N1ZSBi
dXQgSSBqdXN0IHdhbnRlZCB0byBnZXQgY29uZmlybWF0aW9uIHNvIHRoZXJlIGlzIG5vCj4gYW1i
aWd1aXR5IHJlZ2FyZGluZyB0aGUgbGljZW5zaW5nIGluIHRoZSBmdXR1cmUuCgpmaW5lIGJ5IG1l
Li4gSSBkZWZhdWx0ZWQgdG8gZ2VuZXJhdGVkIGhlYWRlcnMgc2luY2UgdGhhdCBpcyBleHRyZW1l
bHkKdXNlZnVsIGZvciBncHUgc2lkZSBvZiB0aGluZ3MgKGFuZCB1c2Vyc3BhY2Ugc3R1ZmYgZGVm
YXVsdHMgdG8gTUlUKSwKYnV0IHByb2JhYmx5IG92ZXJraWxsIGZvciBvY21lbSB3aGljaCBqdXN0
IGhhcyBhIGhhbmRmdWwgb2YgcmVnaXN0ZXJzCihhbmQgbm8gbmVlZCBmb3IgZGVjb2RpbmcgdXNl
cnNwYWNlIGJsb2IgY21kc3RyZWFtIGR1bXBzKQoKQlIsCi1SCgoKPgo+IEJyaWFuCj4KPgo+ID4K
PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5iNGJm
Yjg1ZDFlMzMKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9kcml2ZXJzL3NvYy9xY29t
L29jbWVtLnhtbC5oCj4gPiA+IEBAIC0wLDAgKzEsODYgQEAKPiA+ID4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQgKi8KPiA+ID4gKwo+ID4gPiArI2lmbmRlZiBPQ01FTV9YTUwKPiA+
ID4gKyNkZWZpbmUgT0NNRU1fWE1MCj4gPiA+ICsKPiA+ID4gKy8qIEF1dG9nZW5lcmF0ZWQgZmls
ZSwgRE8gTk9UIEVESVQgbWFudWFsbHkhCj4gPiA+ICsKPiA+ID4gK1RoaXMgZmlsZSB3YXMgZ2Vu
ZXJhdGVkIGJ5IHRoZSBydWxlcy1uZy1uZyBoZWFkZXJnZW4gdG9vbCBpbiB0aGlzIGdpdCByZXBv
c2l0b3J5Ogo+ID4gPiAraHR0cDovL2dpdGh1Yi5jb20vZnJlZWRyZW5vL2Vudnl0b29scy8KPiA+
ID4gK2dpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vZnJlZWRyZW5vL2Vudnl0b29scy5naXQK
PiA+ID4gKwo+ID4gPiArVGhlIHJ1bGVzLW5nLW5nIHNvdXJjZSBmaWxlcyB0aGlzIGhlYWRlciB3
YXMgZ2VuZXJhdGVkIGZyb20gYXJlOgo+ID4gPiArLSAvaG9tZS9yb2JjbGFyay9zcmMvZnJlZWRy
ZW5vL2Vudnl0b29scy9ybm5kYi9hZHJlbm8vb2NtZW0ueG1sICAgICAgICAgKCAgIDE3NzMgYnl0
ZXMsIGZyb20gMjAxNS0wOS0yNCAxNzozMDowMCkKPiA+ID4gKwo+ID4gPiArQ29weXJpZ2h0IChD
KSAyMDEzLTIwMTUgYnkgdGhlIGZvbGxvd2luZyBhdXRob3JzOgo+ID4gPiArLSBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+IChyb2JjbGFyaykKPiA+ID4gKyovCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
