Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B42E0870
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86466E84D;
	Tue, 22 Dec 2020 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA9D6E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:59:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 190so1360582wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 01:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1uWQ1lsamrDj670psBGhqmITnRdEWIGipMAwVhvN0IQ=;
 b=nzzFQvbCE9iM4gRr0OHBQhW95iPZnUHGIevbHh6G8/1DaGIs5orfQtZMKTjTyY2zjJ
 pltvHVHec5UsnNGgJJfthUftOsewWy8YhxnXYppOWmN7Y3UqFISq3+f0ocm6pWy6s+ao
 uaRBF2vgyNBikZ7ShJgESCzRRRySZbSAjnMwIBBn8PSrZQ33zLQZUN9iSC4x/lmTq981
 FJ2Ly2VqTgTlLk7P1ecU0mMa6SWh/a/ZrKv1GDXYGD51DpKiA1XsULU+2oq9wzAV5jgw
 +k0KhDI7UdHfo056NDutP99ttFQbtHZfAKQ81sHnq9JXVyK6fylkzXtS8AJ7ez5tMlJX
 s4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1uWQ1lsamrDj670psBGhqmITnRdEWIGipMAwVhvN0IQ=;
 b=IiJhukiKOx8v+kiis1ZdevhRBuPd/EqmyTXlHGAWzYiR5z2WdjSYzASKJsCHUs+wZd
 fJ5JHPUII3GfgEwuXdkHeHW7817p05o/OuTCULqu9WujIF5ZpirJ9MtTbKy1K6mEPX0M
 S4qhZznql7BBCkNL/FUKJmTACDw/jNUnmL3KnBJqWsuQgTME1EroMMqOWLHmOwyMSzDE
 QCpW+TJz/BNQUQcxOfTIfl8mgMySIJerXiH7CSKI/hFBGz/0np1nR+AX9CPG2nrimVL6
 ZubiI73LLLYGsWsr3pKTg7cyHvA7BzAHMjgewN9+liP4Q1YtjLSqU0SFbNWOOBIq69hj
 YOBQ==
X-Gm-Message-State: AOAM533oTLL4yfMU4FRFwJ/OE8xbcvSKk6NEtEQ0TSpSyMcyv5whtaKK
 AL5//Z8g6+9yyff+7c+smG1hTQ==
X-Google-Smtp-Source: ABdhPJyryip6dXlJcoBpock1PWleQBmbQZcocbzF4ei8MZdMG4Bgcp5A9SM4uCOXJeAM5U9qRO3loQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr21458882wmb.98.1608631173322; 
 Tue, 22 Dec 2020 01:59:33 -0800 (PST)
Received: from dell ([91.110.221.175])
 by smtp.gmail.com with ESMTPSA id a65sm26056927wmc.35.2020.12.22.01.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 01:59:32 -0800 (PST)
Date: Tue, 22 Dec 2020 09:58:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary *-supply schemas properties
Message-ID: <20201222095651.GD53991@dell>
References: <20201221234659.824881-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221234659.824881-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-input@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMSBEZWMgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+ICotc3VwcGx5IHByb3Bl
cnRpZXMgYXJlIGFsd2F5cyBhIHNpbmdsZSBwaGFuZGxlLCBzbyBiaW5kaW5nIHNjaGVtYXMKPiBk
b24ndCBuZWVkIGEgdHlwZSAkcmVmIG5vciAnbWF4SXRlbXMnLgo+IAo+IEEgbWV0YS1zY2hlbWEg
Y2hlY2sgZm9yIHRoaXMgaXMgcGVuZGluZyBvbmNlIHRoZXNlIGV4aXN0aW5nIGNhc2VzIGFyZQo+
IGZpeGVkLgo+IAo+IENjOiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPgo+IENj
OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gQ2M6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+
IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4KPiBDYzogU2Fr
YXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPgo+IENjOiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5v
cmc+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1paW9Admdlci5rZXJuZWwub3Jn
Cj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvYW54NjM0NS55YW1sIHwgMiAtLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9pdGUsaXQ2NTA1LnlhbWwgICAgICAgIHwgMiAtLQo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwgICAgICAgIHwgMyArLS0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3BzODY0MC55
YW1sICB8IDIgLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lt
cGxlLWJyaWRnZS55YW1sICAgICB8IDEgLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
dGhpbmUsdGhjNjNsdmQxMDI0LnlhbWwgICAgICAgICAgIHwgMSAtCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3NzUueWFtbCAgfCAyIC0tCj4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2xsdGMsbHRjMjQ5Ni55
YW1sICAgfCA0ICstLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2h1bWlkaXR5L3Rp
LGhkYzIwMTAueWFtbCAgICAgICAgICB8IDMgKy0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lucHV0L2ZzbCxtcHIxMjEtdG91Y2hrZXkueWFtbCAgICAgICAgfCAzICstLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9lZHQtZnQ1eDA2LnlhbWwgICAgIHwg
MyArLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL21heGltLG1heDkyODYu
eWFtbCAgICAgICAgICB8IDEgLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvaTJjL21pcGktY2NzLnlhbWwgICAgIHwgMyAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9zb255LGlteDIxNC55YW1sICB8IDMgLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvc29ueSxpbXgyNzQueWFt
bCAgfCAzIC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0
bWZ4LnlhbWwgICAgICAgICAgIHwgMyArLS0KCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL2FuYXRv
cC1yZWd1bGF0b3IueWFtbCAgICAgICB8IDEgLQo+ICAxNyBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
