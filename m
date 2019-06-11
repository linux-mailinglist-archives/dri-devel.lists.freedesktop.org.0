Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F04184E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 00:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C1988E6B;
	Tue, 11 Jun 2019 22:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E5C88E6B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 22:40:46 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i21so7691708ita.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HI3rHUK26/S2B0LA3WlM09q3Q/jcQRPOrltE5Dys4vg=;
 b=P2EApyfdETDqeTFgCBtoitIDfeHF+a1SuAO4RCiun6tPg3hxjiScR+/1TJ/E2ov5qq
 1yFS6PiZiTgcMXOsRnfgMV1FTMmdfqrQod2A8Lnj1lvJt+9nOM4RIq7BAE/JA1pAIGVS
 bNX5nXAUp1QBl2gyC982e8is9wNG5H1hcLO498JAMFos6X3Jp3tskHXazjwSJrxASbRu
 cfyql/gb8mi40SF/AczTz+MsDuBLzB3ITfKp8/4tnCak/CEWj09pHcdHhcwGxfiAncRy
 BJyqaus0UWecu/y5sqVOlbI4+ceWCijUIWWXrJEco+SVpqOWKorAtk+ZygmjyUqjjz4F
 4Z2Q==
X-Gm-Message-State: APjAAAVl69okUShg7sH+fmvrX4CbdvQ+YbALAfYcDU6GA16McTDr7M/4
 r7SgbIjaZdtNRx+n4i3EOA==
X-Google-Smtp-Source: APXvYqyYN7ZbEDoYi00MhHLqHL7FwPdCa2uF9Kv/WyYmja0MIBn3v9bIz1f2IeqAvvSfdbDWHNDRAg==
X-Received: by 2002:a24:b303:: with SMTP id e3mr18466988itf.170.1560292845706; 
 Tue, 11 Jun 2019 15:40:45 -0700 (PDT)
Received: from localhost (ip-174-149-252-64.englco.spcsdns.net.
 [174.149.252.64])
 by smtp.gmail.com with ESMTPSA id p10sm5553716iob.54.2019.06.11.15.40.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 15:40:45 -0700 (PDT)
Date: Tue, 11 Jun 2019 16:40:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [1/2] dt-bindngs: display: panel: Add BOE tv101wum-nl6 panel
 bindings
Message-ID: <20190611224041.GA407@bogus>
References: <20190608070230.55381-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608070230.55381-1-jitao.shi@mediatek.com>
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
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDM6MDI6MjlQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBib2UgdHYxMDF3dW0tbjE2IHBhbmVsLgoKVHlwbyBp
biB0aGUgc3ViamVjdCBhbmQgY2hlY2twYXRjaCBjb21wbGFpbnMgYWJvdXQgdHJhaWxpbmcgd2hp
dGVzcGFjZS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICAuLi4vZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4dCAg
ICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4dAo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2Us
dHYxMDF3dW0tbmw2LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2JvZSx0djEwMXd1bS1ubDYudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjJhODQ3MzVkNzQyZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3
dW0tbmw2LnR4dAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArQm9lIENvcnBvcmF0aW9uIDEwLjEiIFdV
WEdBIFRGVCBMQ0QgcGFuZWwKPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0
aWJsZTogc2hvdWxkIGJlICJib2UsdHYxMDF3dW0iCj4gKy0gcmVnOiB0aGUgdmlydHVhbCBjaGFu
bmVsIG51bWJlciBvZiBhIERTSSBwZXJpcGhlcmFsCj4gKy0gZW5hYmxlLWdwaW9zOiBhIEdQSU8g
c3BlYyBmb3IgdGhlIGVuYWJsZSBwaW4KPiArLSBwcDE4MDAtc3VwcGx5OiBjb3JlIHZvbHRhZ2Ug
c3VwcGx5Cj4gKy0gYXZkZC1zdXBwbHk6IAo+ICstIGF2ZWUtc3VwcGx5OiAKPiArLSBiYWNrbGln
aHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVs
Cj4gKwo+ICtUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gb25lICdwb3J0JyBjaGlsZCBub2Rl
IHdpdGggb25lIGNoaWxkCj4gKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5k
aW5ncyBkZWZpbmVkIGluCj4gK21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUg
c2hvdWxkIGRlc2NyaWJlIHBhbmVsJ3MgdmlkZW8gYnVzLgo+ICsKPiArRXhhbXBsZToKPiArJmRz
aSB7Cj4gKwkuLi4KPiArCXBhbmVsQDAgewo+ICsJCWNvbXBhdGlibGUgPSAiYm9lLHR2MTAxd3Vt
LW5sNiI7Cj4gKwkJcmVnID0gPDA+Owo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IDA+Owo+
ICsJCWF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKPiArCQlhdmVlLXN1cHBseSA9IDwmcHB2
YXJwX2xjZD47Cj4gKwkJcHAxODAwLXN1cHBseSA9IDwmcHAxODAwX2xjZD47Cj4gKwkJYmFja2xp
Z2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47Cj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+ICsJCXBvcnQg
ewo+ICsJCQlwYW5lbF9pbjogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZk
c2lfb3V0PjsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiBcIE5vIG5ld2xpbmUgYXQg
ZW5kIG9mIGZpbGUKCkZpeCB0aGlzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
