Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C011B5681
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 21:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5466ED39;
	Tue, 17 Sep 2019 19:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3B6ED39
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 19:55:01 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i16so3991660oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FfvZUbzAP/zQ2k3JSnC90irEsHky5MjP/0GlIMrLMzM=;
 b=r4TSpBE66HSETjP2q8YrYcVEtRFyIVUpHdRDBfTFKpZvCG91YbYvkKivYuQswmOWL4
 R4tHw+zZV7HWKkBinrKu2JWM+XsPp0hwlugOjeKNKgA7En/HIwL7SwoBgSGYWXX0h4le
 Q12wqde7d1l2JTgMn2vQRsuyUDDMRg1hsnF04EJJsyBGymIRSRAFuEmc3fbTcMu4DCQR
 orhoRKfIv342PjBEV7qzphAvLUgngr3I1I6B3bgdD3bNilYSWEOWxqT1AgIbLZ97hqnm
 F8eUFJyAEXkJI2+WOCVc0niuQNzPhZ98Q27X8xn6P+cy8T0b1exdnQdSQHD9JC+45hJc
 IhQA==
X-Gm-Message-State: APjAAAVA/SRI7ZVbiJt3Lzkk9sEUeD0VsyQ1BniMz4QRe1e92IzI/l03
 5R7YPDeastqAxWSjjM13sA==
X-Google-Smtp-Source: APXvYqzyfRLZ/1PGRl1s19eFUtlBk39NtHpeVGis5b90++CPj5ZJD9OLPttfCnMXfk5OnbsCwOyi8g==
X-Received: by 2002:aca:642:: with SMTP id 63mr5442775oig.10.1568750100727;
 Tue, 17 Sep 2019 12:55:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l30sm995602otl.74.2019.09.17.12.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 12:54:59 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:54:58 -0500
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add binding for IT6505.
Message-ID: <20190917195458.GA7386@bogus>
References: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
 <1568259199-5827-2-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568259199-5827-2-git-send-email-allen.chen@ite.com.tw>
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
Cc: no To-header on input <>, Mark Rutland <mark.rutland@arm.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTE6MzI6MjhBTSArMDgwMCwgYWxsZW4gd3JvdGU6Cj4g
RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pgo+IAo+IEFkZCBhIERUIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgSVQ2NTA1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVu
IENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4KPiAKCkRyb3AgdGhlIGJsYW5rIGxpbmUuCgo+
IFNpZ25lZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9taXVtLm9yZz4KPiAKPiAt
LS0KPiBjcm9zLWVjIGRvZXMgbm90IGhhdmUgYW4gYXNzb2NpYXRlZCBkcml2ZXIgdGhhdCB1c2Vz
IHRoZSBzdGFuZGFyZCBMaW51eCBVU0ItQyBkcml2ZXIgY2xhc3MuCj4gZXh0Y29uIGlzIHVzZWQg
dG8gbW9kZWwgdGhlIFR5cGUtQyBjb25uZWN0b3IuKGNyYnVnLmNvbS85ODI5MzIpCj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dCAgICAgICAgIHwgMjgg
KysrKysrKysrKysrKysrKysrKysrKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbCAgICAgICB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9p
dGUsaXQ2NTA1LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uNzJk
YTBjNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKPiBAQCAtMCwwICsxLDI4IEBACj4g
K2lURSBpdDY1MDUgRFAgYnJpZGdlIGJpbmRpbmdzCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVz
Ogo+ICsgICAgICAgIC0gY29tcGF0aWJsZTogIml0ZSxpdDY1MDUiCj4gKyAgICAgICAgLSByZWc6
IGkyYyBhZGRyZXNzIG9mIHRoZSBicmlkZ2UKPiArICAgICAgICAtIG92ZGQtc3VwcGx5OiBJL08g
dm9sdGFnZQo+ICsgICAgICAgIC0gcHdyMTgtc3VwcGx5OiBDb3JlIHZvbHRhZ2UKPiArICAgICAg
ICAtIGludGVycnVwdHM6IGludGVycnVwdCBzcGVjaWZpZXIgb2YgSU5UIHBpbgo+ICsgICAgICAg
IC0gcmVzZXQtZ3Bpb3M6IGdwaW8gc3BlY2lmaWVyIG9mIFJFU0VUIHBpbgo+ICsJLSBocGQtZ3Bp
b3M6Cj4gKwkJSG90cGx1ZyBkZXRlY3QgR1BJTy4KPiArCQlJbmRpY2F0ZXMgd2hpY2ggR1BJTyBz
aG91bGQgYmUgdXNlZCBmb3IgaG90cGx1ZyBkZXRlY3Rpb24KClRoaXMgYmVsb25ncyBpbiBhIGRw
LWNvbm5lY3RvciBub2RlLgoKPiArCS0gcG9ydEBbeF06IFNvQyBzcGVjaWZpYyBwb3J0IG5vZGVz
IHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZAo+ICsJCWluIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQK
CkkgYXNzdW1lIHRoaXMgYnJpZGdlIHdvcmtzIHdpdGggbW9yZSB0aGFuIGp1c3QgTWVkaWF0ZWs/
IFRoZSBwb3J0IApkZWZpbml0aW9ucyBuZWVkIHRvIGJlIGluIHRlcm1zIG9mIHdoYXQncyB0aGUg
ZGF0YSBvbiBlYWNoIHBvcnQuIAoKPiArCj4gK0V4YW1wbGU6Cj4gKwlkcC1icmlkZ2VANWMgewo+
ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpdGUsaXQ2NTA1IjsKPiArICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8MTUyIElSUV9UWVBFX0VER0VfUklTSU5HIDE1MiAwPjsKPiAr
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDVjPjsKPiArICAgICAgICAgICAgICAgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7Cj4gKyAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8Jml0NjUw
NV9waW5zPjsKPiArICAgICAgICAgICAgICAgIG92ZGQtc3VwcGx5ID0gPCZtdDYzNThfdnNpbTFf
cmVnPjsKPiArICAgICAgICAgICAgICAgIHB3cjE4LXN1cHBseSA9IDwmaXQ2NTA1X3BwMThfcmVn
PjsKPiArICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8gMTc5IDE+Owo+ICsgICAg
ICAgICAgICAgICAgaHBkLWdwaW9zID0gPCZwaW8gOSAwPjsKPiArICAgICAgICAgICAgICAgIGV4
dGNvbiA9IDwmdXNiY19leHRjb24+OwoKTm90IGRvY3VtZW50ZWQgYW5kIGRlcHJlY2F0ZWQgYW55
d2F5cy4gVXNlIHRoZSBjb25uZWN0b3IgYmluZGluZ3MuCgo+ICsgICAgICAgIH07Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbAo+IGluZGV4IDk2N2U3OGMuLmZiM2I2NDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gQEAgLTQ2
MSw2ICs0NjEsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAgIGRlc2NyaXB0aW9uOiBJbnRl
cnNpbAo+ICAgICJeaXNzaSwuKiI6Cj4gICAgICBkZXNjcmlwdGlvbjogSW50ZWdyYXRlZCBTaWxp
Y29uIFNvbHV0aW9ucyBJbmMuCj4gKyAgIl5pdGUsLioiOgo+ICsgICAgZGVzY3JpcHRpb246IElU
RSBUZWNoLiBJbmMuCj4gICAgIl5pdGVhZCwuKiI6Cj4gICAgICBkZXNjcmlwdGlvbjogSVRFQUQg
SW50ZWxsaWdlbnQgU3lzdGVtcyBDby5MdGQKPiAgICAiXml3YXZlLC4qIjoKPiAtLSAKPiAxLjku
MQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
