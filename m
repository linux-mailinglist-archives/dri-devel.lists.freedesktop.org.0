Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95138A9AB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 23:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96476E400;
	Mon, 12 Aug 2019 21:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB8F6E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 21:49:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o101so11862696ota.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bId57j+xCMgHmNke4H/rs1zm5GrySxRkVxKOzngNvUM=;
 b=qsKBcSWGaFDcObu2l7sNjwr+tLBdzbV1sD7tdrWfLCHF6ZeJxh64BKhuVV6NgEVx0n
 pLHg6q/tvmbSRdKUEsqaBKLtAWoOHrwre2bWuS6qOirVf4OMKAxeso4tJ20X08F8DOYa
 gxYqCO+RDlQfp3YVc5l+lCLpTLx4penocLXUJvtfZ+2uE44XFU4EvWxXz5dgzW6kyyDV
 s9SW7jONmGu0aO9A5Jh1iT8GxUE8S0KMq94vXsknRspEI07s7/VlP7sJKb//819tjlKZ
 3F4b/8R9gGoQ7RqazRCknTsk50SnMDcRKOwmXH8gm1ivDPj0dCdTejs4P1YiVIaM30U1
 qOeA==
X-Gm-Message-State: APjAAAVp78iweucYVMMkQN4XgMWrlpf7oqwCrMtaVpHGSnRvRZj7V1vd
 V7q1vyh2CGhRlRKKym3/OA==
X-Google-Smtp-Source: APXvYqydXCuTRQqJ+qulK7XUYr9oCHuac1Wfp89EYjWA89p2UUzerGucxvamiLfRUxWnafYzdRe2lA==
X-Received: by 2002:a6b:fd10:: with SMTP id c16mr34339686ioi.217.1565646575229; 
 Mon, 12 Aug 2019 14:49:35 -0700 (PDT)
Received: from localhost ([74.118.88.158])
 by smtp.gmail.com with ESMTPSA id r5sm86648270iom.42.2019.08.12.14.49.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 14:49:34 -0700 (PDT)
Date: Mon, 12 Aug 2019 15:49:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
Message-ID: <20190812214933.GA5954@bogus>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
 <20190807060257.57007-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807060257.57007-2-jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDI6MDI6NTRQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEFkZCBkZWNyaXB0aW9ucyBhYm91dCBzdXBwb3J0ZWQgY2hpcHMsIGluY2x1ZGluZyBNVDI3
MDEgJiBNVDgxNzMgJgo+IG10ODE4Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZHBpLnR4dCAgICAgICAgfCAxMSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHBpLnR4dAo+IGluZGV4IGI2YTdlNzM5N2I4Yi4uY2Q2YTE0NjljOGI3IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRwaS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkudHh0Cj4gQEAgLTcsNiArNyw3IEBAIG91dHB1dCBi
dXMuCj4gIAo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBhdGlibGU6ICJtZWRpYXRl
ayw8Y2hpcD4tZHBpIgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSAsIG10ODE3
MyBhbmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGgg
b2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJy
dXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jay4KPiAgLSBjbG9ja3M6IGRldmljZSBj
bG9ja3MKPiBAQCAtMTYsNiArMTcsMTEgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0LiBUaGlzIHBvcnQgc2hvdWxk
IGJlIGNvbm5lY3RlZAo+ICAgIHRvIHRoZSBpbnB1dCBwb3J0IG9mIGFuIGF0dGFjaGVkIEhETUkg
b3IgTFZEUyBlbmNvZGVyIGNoaXAuCj4gIAo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIGRw
aV9waW5fbW9kZV9zd2FwOiBTd2FwIHRoZSBwaW4gbW9kZSBiZXR3ZWVuIGRwaSBtb2RlIGFuZCBn
cGlvIG1vZGUuCj4gKy0gcGluY3RybC1uYW1lczogQ29udGFpbiAiZ3Bpb21vZGUiIGFuZCAiZHBp
bW9kZSIuCj4gKy0gZHBpX2R1YWxfZWRnZTogQ29udHJvbCB0aGUgUkdCIDI0Yml0IGRhdGEgb24g
MTIgcGlucyBvciAyNCBwaW5zLgoKTm90aGluZyBhYm91dCB0aGlzIGluIHRoZSBjb21taXQgbXNn
Li4uCgpUaGUgZHBpKiBwcm9wZXJ0aWVzIG5lZWQgdmVuZG9yIHByZWZpeGVzIGFuZCB1c2UgJy0n
IHJhdGhlciB0aGFuICdfJy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
