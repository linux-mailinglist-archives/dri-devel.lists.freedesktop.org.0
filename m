Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5E2AD8BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876389B51;
	Tue, 10 Nov 2020 14:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BB489B51
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:26:15 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k26so14534584oiw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I6eINwgPGvryXHeca8G+4NRiZwWs6cwo0lxUCGUsnnM=;
 b=EE90ExlavyxnWS0Z8OsntYAbZ9VlT+ILDy9BatVe5z48OvEtF5PI/mYtIBMZ0TWQHd
 QwM3V08osYiHCY/Mg9nJ+M40saTLeouLOZUP2vlRT2McgegRiAD7DZ5eqYym8ZKbrwhg
 Vz+y7qvJLr5/N7uUVdSoW6mcR1/4w963YaNh8WqkNOkSUCCLPbruvJ4vcBStuA760POX
 txuXTMw/QU0/PPjGbhIYgO+2ZbZKN49jBgHMj5V/xOo0kaZ8n0kdeC1SLTe7/QHPNkK6
 H+oenPPaDKCqAkatu0Xg7xwizUUxlfmgN3YkAbjcAhyEhBb8o7P5ZbtOP9cn39/6Myo3
 7bRg==
X-Gm-Message-State: AOAM532anOrDVWwyjZmnwftFWhczGHCSF3u6nGTlocG3QlYIjQTUflVA
 0468tAawmG/aIpE0McOaMg==
X-Google-Smtp-Source: ABdhPJxmEBz2DgpgaTJfUBpq6k0kGF8zZgE3ZaEHQ0GkfG/X/Rq/tzCx9MOVxL5mhsN1tNj0erLv8A==
X-Received: by 2002:aca:ea54:: with SMTP id i81mr2775381oih.48.1605018374555; 
 Tue, 10 Nov 2020 06:26:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm3265678otr.25.2020.11.10.06.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:26:13 -0800 (PST)
Received: (nullmailer pid 3120474 invoked by uid 1000);
 Tue, 10 Nov 2020 14:26:12 -0000
Date: Tue, 10 Nov 2020 08:26:12 -0600
From: Rob Herring <robh@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 1/7] dt-bindings: devfreq: Add documentation for the
 interconnect properties
Message-ID: <20201110142612.GA3120426@bogus>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103718eucas1p1c103f1a96499b03c72e5457ac2542c3d@eucas1p1.samsung.com>
 <20201104103657.18007-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104103657.18007-2-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 robh+dt@kernel.org, b.zolnierkie@samsung.com, linux-pm@vger.kernel.org,
 sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.swigon@samsung.com, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, krzk@kernel.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwNCBOb3YgMjAyMCAxMTozNjo1MSArMDEwMCwgU3lsd2VzdGVyIE5hd3JvY2tpIHdy
b3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBuZXcgb3B0aW9uYWwgcHJvcGVydGllcyBpbiB0
aGUgZXh5bm9zIGJ1cyBub2RlczoKPiBpbnRlcmNvbm5lY3RzLCAjaW50ZXJjb25uZWN0LWNlbGxz
LCBzYW1zdW5nLGRhdGEtY2xvY2stcmF0aW8uCj4gVGhlc2UgcHJvcGVydGllcyBhbGxvdyB0byBz
cGVjaWZ5IHRoZSBTb0MgaW50ZXJjb25uZWN0IHN0cnVjdHVyZSB3aGljaAo+IHRoZW4gYWxsb3dz
IHRoZSBpbnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNpZmljCj4g
YmFuZHdpZHRoIHJlcXVpcmVtZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/F
hCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3Jv
Y2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY4Ogo+ICAt
IHVwZGF0ZWQgZGVzY3JpcHRpb24gb2YgdGhlIGludGVyY29ubmVjdHMgcHJvcGVydHksCj4gIC0g
Zml4ZWQgdHlwbyBpbiBzYW1zdW5nLGRhdGEtY2xrLXJhdGlvIHByb3BlcnR5IGRlc2NyaXB0aW9u
Lgo+IAo+IENoYW5nZXMgZm9yIHY3Ogo+ICAtIGJ1cy13aWR0aCBwcm9wZXJ0eSByZXBsYWNlZCB3
aXRoIHNhbXN1bmcsZGF0YS1jbG9jay1yYXRpbywKPiAgLSB0aGUgaW50ZXJjb25uZWN0IGNvbnN1
bWVyIGJpbmRpbmdzIHVzZWQgaW5zdGVhZCBvZiB2ZW5kb3Igc3BlY2lmaWMKPiAgICBwcm9wZXJ0
aWVzCj4gCj4gQ2hhbmdlcyBmb3IgdjY6Cj4gIC0gYWRkZWQgZHRzIGV4YW1wbGUgb2YgYnVzIGhp
ZXJhcmNoeSBkZWZpbml0aW9uIGFuZCB0aGUgaW50ZXJjb25uZWN0Cj4gICAgY29uc3VtZXIsCj4g
IC0gYWRkZWQgbmV3IGJ1cy13aWR0aCBwcm9wZXJ0eS4KPiAKPiBDaGFuZ2VzIGZvciB2NToKPiAg
LSBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlIHJlbmFtZWQgdG8gc2Ftc3VuZyxpbnRl
cmNvbm5lY3QtcGFyZW50Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEv
ZXh5bm9zLWJ1cy50eHQgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
