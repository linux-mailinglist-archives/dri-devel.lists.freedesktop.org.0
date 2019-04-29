Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062CECBD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 00:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016DC8934B;
	Mon, 29 Apr 2019 22:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02158934B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 22:26:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a10so1356696otl.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 15:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oRenui5Af25LDBg0th7gwZb/BUZtc0JZI0y66saQTqM=;
 b=iTEU37EaUg+NTT0D3xYp6dBZEiWwHQQ+fCJN290MBYZXUiCGKnG2YIyg0kZ6KVgq81
 M0WfhdOljct4g9i515vzgCNzBIcqsIgJbt1JynDNNZvtSA+XGpvOT9DOwPJQYtkZGEWf
 lCRGezc20wcFDK0L1ElWBicBp0HRyMo3PnWu52hGYTKYvX44r9kweCf9A9/IbyfMWLwV
 Jf5SIgWZnVEjh+rsqcjB/edvKr3FXz7uIDNucn48jKlwVpA2T8N+zoUpKQ2psOM8WjGd
 er6XX9cDSWYggp7Ac1TLSb9SmZYvFdkTg3gahz1MpfXkMIE2oCDdqqg/fL2LEB7arPMD
 wJuQ==
X-Gm-Message-State: APjAAAXnqyiZFAwhX8vITzKC++RACZMZm2eCTDXtHtnQhCAALTGd3LwM
 G0n1mWGhR/bNBDrDHij0ig==
X-Google-Smtp-Source: APXvYqwld5ffy3XYYJumXMPmkKQz5Gc5XST2UIO1EEhtfK4zl1hJZzjNCevWVUbeRLAFuTl7ew5iqw==
X-Received: by 2002:a9d:6397:: with SMTP id w23mr274180otk.332.1556576807861; 
 Mon, 29 Apr 2019 15:26:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j82sm14504482oih.31.2019.04.29.15.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 15:26:46 -0700 (PDT)
Date: Mon, 29 Apr 2019 17:26:46 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v2 1/3] dt-bindings: display: mediatek: update dsi supported
 chips
Message-ID: <20190429222646.GA20752@bogus>
References: <20190416054217.75387-1-jitao.shi@mediatek.com>
 <20190416054217.75387-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190416054217.75387-2-jitao.shi@mediatek.com>
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
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Kumar Gala <galak@codeaurora.org>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDE6NDI6MTVQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IFVwZGF0ZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBkc2kg
Zm9yCj4gTWVkaWF0ZWsgTVQ4MTgzIFNvQ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hp
IDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgICAgICAgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IGluZGV4IGZhZGYzMjdjN2NkZi4uYmQ2ODE5NTQ1
OGI5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gQEAgLTI2
LDcgKzI2LDcgQEAgVGhlIE1JUEkgVFggY29uZmlndXJhdGlvbiBtb2R1bGUgY29udHJvbHMgdGhl
IE1JUEkgRC1QSFkuCj4gIAo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBhdGlibGU6
ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBt
dDI3MDEgYW5kIG10ODE3My4KPiArICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEgLCBt
dDgxNzMgYW5kIG10ODE4My4KCmRyb3AgdGhlIHNwYWNlICAgICAgICAgICAgICAgICAgICAgXgoK
V2l0aCB0aGF0LAoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
