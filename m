Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B51B906
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3E89F3C;
	Mon, 13 May 2019 14:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4E489F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:48:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m32so11969983qtf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8IHMOkhmEb6QT/ZiWX3DdDfZLIknej7rKf5m2D6xNuc=;
 b=L9a3ZYeLpzSHQQ8rst8ETOB613Vfb+FfMYgdnNihhuoSXkuqd5jPpm+dxrqaG2K7J8
 W9qmSo4aLCxTokfuuhV+Wn4USc7IQZLgyiKYhU7pCEyngFSAswN8+w/4jB2ylxMrRcCU
 EqAFdFdQqjVwG8FOvpuw24bYehAewNrcjP77i+vK0rwyhFiUF10QP7PKwUx/aNiYM4SS
 b0yUhJLhXfhivE8LnIET0Wr7LlnrQaLdjgqs6S7GA2m3FG6ad1dQVsSmoJ5dY2BfSG+O
 9eZTAli+zO3grfJ4c+VuLECxDFhPbHdupEuNM61tVNkDl6CnHN1gGC2yr6P1jzNobfNM
 Hpyg==
X-Gm-Message-State: APjAAAUQVIOJfeuXQqH5Xpdn1S4LIZr4sMp+OySOOXXJRd7RiQAJM4O6
 8CjTMATxDYanM4K0sUaZAyySqA==
X-Google-Smtp-Source: APXvYqxNdvAKxfxX7AKNCeVbrRHlGE3pAiuxcTmOZ5y5s0sru4T1T0lw8xsnCCgpIxTSa2x70VK59w==
X-Received: by 2002:ac8:3509:: with SMTP id y9mr24571513qtb.336.1557758885215; 
 Mon, 13 May 2019 07:48:05 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 22sm4038205qkl.4.2019.05.13.07.48.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:48:04 -0700 (PDT)
Date: Mon, 13 May 2019 10:48:03 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect
 bindings for MDSS on SDM845
Message-ID: <20190513144803.GP17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-4-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8IHMOkhmEb6QT/ZiWX3DdDfZLIknej7rKf5m2D6xNuc=;
 b=gilxhSCldOJPRo4SMSKe6WlhN7JItK+oQioLxN8lSziUeONl5Y/Y8STILpTSOUhhMU
 DyTKkxvSUFOLOt3yBLSenRYoZHKnOgX10A2zizp9IxWx3HVCpRbhHd3yH4CT1Ydsqhhz
 YX8h4KWHHSU+gRbGwEIXP6UG6sBabn8tDeUSoNlyvm5ba/2z58W1dJMOJFWQ9wgpk0ap
 IrKOlg4dEYpHpDifZ/kaNjyVI8evx3Xr/R66baPU71WCa8FnP4U+7GE5ZlVACa2ds2im
 e8mDbcRkn/By+hPdkKROpknY+9Qn7Z2JsEBKIDxCnhJ9/tExJHH1Kv0W9N0lP5xbS/jq
 Kscg==
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jayant Shekhar <jshekhar@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDE6NDI6MTNQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IEpheWFudCBTaGVraGFyIDxqc2hla2hhckBjb2RlYXVyb3JhLm9yZz4KPiAKPiBB
ZGQgaW50ZXJjb25uZWN0IHByb3BlcnRpZXMgc3VjaCBhcyBpbnRlcmNvbm5lY3QgcHJvdmlkZXIg
c3BlY2lmaWVyCj4gLCB0aGUgZWRnZSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIHBvcnRzIHdoaWNo
IGFyZSByZXF1aXJlZCBieSB0aGUKPiBpbnRlcmNvbm5lY3QgQVBJIHRvIGNvbmZpZ3VyZSBpbnRl
cmNvbm5lY3QgcGF0aCBmb3IgTURTUy4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IAktIE5vbmUKPiAK
PiBDaGFuZ2VzIGluIHYzOgo+IAktIFJlbW92ZSBjb21tb24gcHJvcGVydHkgZGVmaW5pdGlvbnMg
KFJvYiBIZXJyaW5nKQo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gCS0gVXNlIHBvcnQgbWFjcm9zIGFu
ZCBjaGFuZ2UgcG9ydCBzdHJpbmcgbmFtZXMgKEdlb3JnaSBEamFrb3YpCj4gCj4gQ2hhbmdlcyBp
biB2NS12NzoKPiAJLSBOb25lCj4gCj4gU2lnbmVkLW9mZi1ieTogU3JhdmFudGhpIEtvbGx1a3Vk
dXJ1IDxza29sbHVrdUBjb2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKYXlhbnQgU2hl
a2hhciA8anNoZWtoYXJAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+Cgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
PiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2Rw
dS50eHQgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9kcHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2RwdS50eHQKPiBpbmRleCBhZDJlODgzMDMyNGUuLmE2MWRkNDBmMzc5MiAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHB1
LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9kcHUudHh0Cj4gQEAgLTI4LDYgKzI4LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0g
I2FkZHJlc3MtY2VsbHM6IG51bWJlciBvZiBhZGRyZXNzIGNlbGxzIGZvciB0aGUgTURTUyBjaGls
ZHJlbi4gU2hvdWxkIGJlIDEuCj4gIC0gI3NpemUtY2VsbHM6IFNob3VsZCBiZSAxLgo+ICAtIHJh
bmdlczogcGFyZW50IGJ1cyBhZGRyZXNzIHNwYWNlIGlzIHRoZSBzYW1lIGFzIHRoZSBjaGlsZCBi
dXMgYWRkcmVzcyBzcGFjZS4KPiArLSBpbnRlcmNvbm5lY3RzIDogaW50ZXJjb25uZWN0IHBhdGgg
c3BlY2lmaWVyIGZvciBNRFNTIGFjY29yZGluZyB0bwo+ICsgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnR4dC4gU2hvdWxkIGJlCj4g
KyAgMiBwYXRocyBjb3JyZXNwb25kaW5nIHRvIDIgQVhJIHBvcnRzLgo+ICstIGludGVyY29ubmVj
dC1uYW1lcyA6IE1EU1Mgd2lsbCBoYXZlIDIgcG9ydCBuYW1lcyB0byBkaWZmZXJlbnRpYXRlIGJl
dHdlZW4gdGhlCj4gKyAgMiBpbnRlcmNvbm5lY3QgcGF0aHMgZGVmaW5lZCB3aXRoIGludGVyY29u
bmVjdCBzcGVjaWZpZXIuCj4gIAo+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAtIGFzc2lnbmVk
LWNsb2NrczogbGlzdCBvZiBjbG9jayBzcGVjaWZpZXJzIGZvciBjbG9ja3MgbmVlZGluZyByYXRl
IGFzc2lnbm1lbnQKPiBAQCAtODYsNiArOTEsMTEgQEAgRXhhbXBsZToKPiAgCQlpbnRlcnJ1cHQt
Y29udHJvbGxlcjsKPiAgCQkjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+ICAKPiArCQlpbnRlcmNv
bm5lY3RzID0gPCZyc2NfaGxvcyBNQVNURVJfTURQMCAmcnNjX2hsb3MgU0xBVkVfRUJJMT4sCj4g
KwkJCQk8JnJzY19obG9zIE1BU1RFUl9NRFAxICZyc2NfaGxvcyBTTEFWRV9FQkkxPjsKPiArCj4g
KwkJaW50ZXJjb25uZWN0LW5hbWVzID0gIm1kcDAtbWVtIiwgIm1kcDEtbWVtIjsKPiArCj4gIAkJ
aW9tbXVzID0gPCZhcHBzX2lvbW11IDA+Owo+ICAKPiAgCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsK
PiAtLSAKPiAyLjIwLjEKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29n
bGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
