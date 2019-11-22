Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51397107BC0
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565156F568;
	Fri, 22 Nov 2019 23:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25606F568
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:57:46 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d5so7734440otp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 15:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=frUbXg9HVcTRfaaxELwHERf+lloS19EI1WW6S+yHA38=;
 b=KdCIYHVyO8poZesZ9Q2JMan8wn+OVC9NnFOWqmQumF9R3DPidXmUFTrk8Bf1yTQECY
 T/mhXBrC2OUcDu77oXrAUDTK52LzaBvvQcnEPuLigJhyZC4AHyI/KZTQBgT3jkxYc/2q
 W178r47NzilQVFlGaD3VuzpdVSlq98uiHwZqD7LpVuEdtplVJR3vNG2amfEmnnGNeN6c
 9I8PkDn0TKn44wYd28iva7rwydGYg2Epl7z1nGfb1UNuV9WoJZl4lSAG8bTn18a1lRWu
 HGkM+OwmkXDlOENb6PBxX72yN+4ENCNWlEbjj2VRzC6Mn/BGJc9+BquALd9E5do4cZpe
 bQ0A==
X-Gm-Message-State: APjAAAWNEgMAroZ32vhz6RchZGRl8ZVBpRFM1eZniHLw+EySWGeLzxH9
 Sn6mcNw+cp/KGcSdQhOy7g==
X-Google-Smtp-Source: APXvYqwHRHTMvmyvayb6oZ7vqTCt5okUxjvzyr/SweEAZ3HXsEH7Y8guZbnlyFulghfXVoQpjJozjw==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr13180792otg.232.1574467066059; 
 Fri, 22 Nov 2019 15:57:46 -0800 (PST)
Received: from localhost ([2607:fb90:bd7:3743:c9ec:246b:67b7:9768])
 by smtp.gmail.com with ESMTPSA id b135sm2608451oii.1.2019.11.22.15.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 15:57:45 -0800 (PST)
Date: Fri, 22 Nov 2019 17:57:31 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add binding for IT6505.
Message-ID: <20191122235731.GB7738@bogus>
References: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
 <1573811564-320-4-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573811564-320-4-git-send-email-allen.chen@ite.com.tw>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDU6NTI6MTlQTSArMDgwMCwgYWxsZW4gd3JvdGU6Cj4g
RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pgo+IAo+IEFkZCBhIERUIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgSVQ2NTA1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVu
IENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4KPiBTaWduZWQtb2ZmLWJ5OiBQaS1Ic3VuIFNo
aWggPHBpaHN1bkBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9pdGUsaXQ2NTA1LnR4dCAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1
MDUudHh0CgpQbGVhc2UgbWFrZSB0aGlzIGEgRFQgc2NoZW1hLiBTZWUgCkRvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS93cml0aW5nLXNjaGVtYS5yc3QuCiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1
MDUudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMC4uNzJkYTBjNAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKPiBAQCAtMCwwICsxLDI4IEBACj4gK2lURSBp
dDY1MDUgRFAgYnJpZGdlIGJpbmRpbmdzCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsg
ICAgICAgIC0gY29tcGF0aWJsZTogIml0ZSxpdDY1MDUiCj4gKyAgICAgICAgLSByZWc6IGkyYyBh
ZGRyZXNzIG9mIHRoZSBicmlkZ2UKPiArICAgICAgICAtIG92ZGQtc3VwcGx5OiBJL08gdm9sdGFn
ZQo+ICsgICAgICAgIC0gcHdyMTgtc3VwcGx5OiBDb3JlIHZvbHRhZ2UKPiArICAgICAgICAtIGlu
dGVycnVwdHM6IGludGVycnVwdCBzcGVjaWZpZXIgb2YgSU5UIHBpbgo+ICsgICAgICAgIC0gcmVz
ZXQtZ3Bpb3M6IGdwaW8gc3BlY2lmaWVyIG9mIFJFU0VUIHBpbgo+ICsJLSBocGQtZ3Bpb3M6Cj4g
KwkJSG90cGx1ZyBkZXRlY3QgR1BJTy4KPiArCQlJbmRpY2F0ZXMgd2hpY2ggR1BJTyBzaG91bGQg
YmUgdXNlZCBmb3IgaG90cGx1ZyBkZXRlY3Rpb24KCkluZGVudGF0aW9uIGlzIG5vdCBjb25zaXN0
ZW50LgoKPiArCS0gcG9ydEBbeF06IFNvQyBzcGVjaWZpYyBwb3J0IG5vZGVzIHdpdGggZW5kcG9p
bnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZAo+ICsJCWluIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQKCllvdSBuZWVkIHRv
IGRlZmluZSB3aGF0IGVhY2ggcG9ydCBpcy4gV2l0aCB0aGUgc2NoZW1hLCB0aGF0IHdpbGwgYmUg
Cidwb3J0QDAnIGFuZCAncG9ydEAxJyBwcm9wZXJ0aWVzLgoKPiArCj4gK0V4YW1wbGU6Cj4gKwlk
cC1icmlkZ2VANWMgewo+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpdGUsaXQ2NTA1
IjsKPiArICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTUyIElSUV9UWVBFX0VER0VfUklT
SU5HIDE1MiAwPjsKPiArICAgICAgICAgICAgICAgIHJlZyA9IDwweDVjPjsKPiArICAgICAgICAg
ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKyAgICAgICAgICAgICAgICBwaW5j
dHJsLTAgPSA8Jml0NjUwNV9waW5zPjsKPiArICAgICAgICAgICAgICAgIG92ZGQtc3VwcGx5ID0g
PCZtdDYzNThfdnNpbTFfcmVnPjsKPiArICAgICAgICAgICAgICAgIHB3cjE4LXN1cHBseSA9IDwm
aXQ2NTA1X3BwMThfcmVnPjsKPiArICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8g
MTc5IDE+Owo+ICsgICAgICAgICAgICAgICAgaHBkLWdwaW9zID0gPCZwaW8gOSAwPjsKPiArICAg
ICAgICAgICAgICAgIGV4dGNvbiA9IDwmdXNiY19leHRjb24+OwoKTm90IGRvY3VtZW50ZWQgcGx1
cyBpdCdzIGRlcHJlY2F0ZWQuCgpZb3UncmUgbWlzc2luZyBwb3J0cyBoZXJlIGFuZCB0aGV5IGFy
ZSByZXF1aXJlZC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
