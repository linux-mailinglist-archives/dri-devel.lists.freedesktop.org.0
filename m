Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94CD334E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 23:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF726EB8D;
	Thu, 10 Oct 2019 21:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089006EB8D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 21:23:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z6so6203514otb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 14:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8fsaLFcYDAROH9HBoKC5Vafqp1MCH4HA/pJSglSZ4co=;
 b=SS7aRKf+fBNWQPTTj540pR5yckX3kddKEFlRBCvIj73TVOtHH1/I7OjHE1WBf+egVM
 AFUuimlSg6GYnyy+e7/sFxkE0PgVBSU1ETdbezm666NZI3pYE/moQu86Wp+6DYbqDawD
 uDn7wFlsUBRj2N3/jjbzfdOA14pXws0DUXgGwgLanxZfygrTYAK4WtzG6Q8tP6sWhECp
 YKpJVLtEervmeohRBSHyZDuqSFSbxQBxQ77skyBp34ISgyGk5aoUzAM7EFBLvopgw1xB
 X6nhSMp0nO4/OM6wFpv3V1arALjYrNNRoWLmFIChtOVYKD4VYg/v4KeWuM+AfGZc5MEA
 +OJA==
X-Gm-Message-State: APjAAAXIxjKDozYKmq7EIk48wBDXRCHk1G9s+Wf3he2IiVBpdHc7Z/sZ
 62i7eKwwxsSDkSpAAnA7pQ==
X-Google-Smtp-Source: APXvYqyIyxVe/QML8xBJW19srjEWY1fzMm01BIPfEyxogOHEBtnRrO0q0z3M7piA63qkH2laitZG7g==
X-Received: by 2002:a05:6830:13d8:: with SMTP id
 e24mr9348918otq.42.1570742627232; 
 Thu, 10 Oct 2019 14:23:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v132sm2027358oif.34.2019.10.10.14.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:23:46 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:23:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: memory-controllers: Convert Samsung
 Exynos SROM bindings to json-schema
Message-ID: <20191010212346.GA7896@bogus>
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918173141.4314-4-krzk@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBTZXAgMjAxOSAxOTozMTozNyArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBDb252ZXJ0IFNhbXN1bmcgRXh5bm9zIFNST00gY29udHJvbGxlciBiaW5kaW5ncyB0
byBEVCBzY2hlbWEgZm9ybWF0Cj4gdXNpbmcganNvbi1zY2hlbWEuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IAo+IC0tLQo+IAo+IENo
YW5nZXMgc2luY2UgdjE6Cj4gMS4gSW5kZW50IGV4YW1wbGUgd2l0aCBmb3VyIHNwYWNlcyAobW9y
ZSByZWFkYWJsZSksCj4gMi4gU3BsaXQgZXhhbXBsZXMgaW50byB0d28sCj4gMy4gRml4IHBhdHRl
cm4gZm9yIHN1Ym5vZGUgbmFtZSwKPiA0LiBSZW1vdmUgY2hlY2tzIGZvciAjYWRkcmVzcy1jZWxs
cy1yYW5nZXMtI3NpemUtY2VsbHMsCj4gNS4gQWRkICJhZGRpdGlvbmFsUHJvcGVydGllcyIgc28g
dGhlIHdyb25nbHkgbmFtZWQgc3Vibm9kZXMgd291bGQgYmUKPiAgICBtYXRjaGVkLgo+IC0tLQo+
ICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2V4eW5vcy1zcm9tLnR4dCAgICAgICAgfCAgNzkgLS0t
LS0tLS0tLS0KPiAgLi4uL21lbW9yeS1jb250cm9sbGVycy9leHlub3Mtc3JvbS55YW1sICAgICAg
IHwgMTI4ICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRp
b25zKCspLCA3OSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZXh5bm9zLXNyb20udHh0
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVtb3J5LWNvbnRyb2xsZXJzL2V4eW5vcy1zcm9tLnlhbWwKPiAKCkFwcGxpZWQsIHRoYW5rcy4K
ClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
