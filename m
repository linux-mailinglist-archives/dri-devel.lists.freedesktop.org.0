Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84172209BD9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55089D42;
	Thu, 25 Jun 2020 09:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A989D42
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:24:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so5181125wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EaOaR3l9HHxJyu97gRJLmzWQVTWMAcMmNEcB1lcmPNM=;
 b=l0NeXiakjdrXrLaBLIadefKz8F7+uyKt5t8RNkWbO405PGH/BZlG7ucw7IkjzZ9wK5
 pOFvA45fVJyNpEcvwKTJ4EG0KhFxxfY3pjjhc9JzCoT3kHSe1jOgmHODowQxUGG2FiKI
 yZKssraojrjtQZI6OtOlcrvQCZo1hNcJlSJyToTanRleQMoy+FooP2BSXH93BwrhKzi0
 +zryj2eO1f08xEkWifRc0qeLiBx2LzTlRzbY8yPbRKajweEMeycjGzvCiACtHFxLbRLK
 EgS2b5n252zk49kR0c4T7PyzpHEdZ1+hFE2Hkk25xROet1O/dW+JLLQjtJsCj4GzbSde
 JvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EaOaR3l9HHxJyu97gRJLmzWQVTWMAcMmNEcB1lcmPNM=;
 b=oMDznO519M4p54WCZUS/0r7fjmBFxyaAHKaGl77kVtHiTCjdhxJDky3nH+sOYUoq1S
 HYB5CjGZAWuIpc5PwudMPfRH5ItAvBKUycFeq2sddpnC5bY7xEy/oNVn/XkrqSP4VVPF
 /iQifshqURjJO8c3y76ikMqJOP2eiUBVW4aOikggR/VEjispX6vqj3y/Cr1Hyc3wIAU/
 DOP5iBQEn2f+d1qTVDZH5qEsQw88s6BkzimrUUKt4DAsZ37DsDCi5RrRkwup7ctICphg
 EUIm9yfNfXE88VNZDx2unzX9SCfNiRWIq0dw5R9zTJrNyD1wjaQs0smBPXkXUivaGH44
 y5BA==
X-Gm-Message-State: AOAM533gcpQefXY3zXtC7FpBHWvy/1OrtVN8s79zz48Ckgpq4YuQls2M
 CX+P4ShF+ez5Jvera18kParwbisU7QM=
X-Google-Smtp-Source: ABdhPJxraWfUM9OicOYalfWG6fhp1iNyu1akGB9XabtzprNxns7odWMJc425dq+X61YgK7Y4EfXJrw==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr2381038wmb.61.1593077077320; 
 Thu, 25 Jun 2020 02:24:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 138sm12311705wma.23.2020.06.25.02.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:24:36 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:24:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/8] backlight: lms501kf03: Remove unused const variables
Message-ID: <20200625092434.szrdyt3sxmxmfajg@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-2-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MTRQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IFc9MSBrZXJuZWwgYnVpbGQgcmVwb3J0czoKPiAKPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvbG1zNTAxa2YwMy5jOjk2OjI4OiB3YXJuaW5nOiDigJhzZXFfc2xlZXBfaW7igJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgOTYgfCBzdGF0aWMg
Y29uc3QgdW5zaWduZWQgY2hhciBzZXFfc2xlZXBfaW5bXSA9IHsKPiAgfCBefn5+fn5+fn5+fn4K
PiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jOjkyOjI4OiB3YXJuaW5nOiDi
gJhzZXFfdXBfZG7igJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlh
YmxlPV0KPiAgOTIgfCBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBzZXFfdXBfZG5bXSA9IHsK
PiAgfCBefn5+fn5+fn4KPiAKPiBFaXRoZXIgJ3NlcV9zbGVlcF9pbicgbm9yICdzZXFfdXBfZG4n
IGhhdmUgYmVlbiB1c2VkIHNpbmNlIHRoZQo+IGRyaXZlciBmaXJzdCBsYW5kZWQgaW4gMjAxMy4K
PiAKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNv
biA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbG1zNTAxa2YwMy5jIHwgOCAtLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1z
NTAxa2YwMy5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jCj4gaW5kZXgg
OGFlMzJlMzU3M2MxYS4uYzFiZDAyYmI4YjJlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbXM1MDFrZjAzLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9s
bXM1MDFrZjAzLmMKPiBAQCAtODksMTQgKzg5LDYgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNo
YXIgc2VxX3JnYl9nYW1tYVtdID0gewo+ICAJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwKPiAgfTsKPiAgCj4gLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFy
IHNlcV91cF9kbltdID0gewo+IC0JMHgzNiwgMHgxMCwKPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25z
dCB1bnNpZ25lZCBjaGFyIHNlcV9zbGVlcF9pbltdID0gewo+IC0JMHgxMCwKPiAtfTsKPiAtCj4g
IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV9zbGVlcF9vdXRbXSA9IHsKPiAgCTB4MTEs
Cj4gIH07Cj4gLS0gCj4gMi4yNS4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
