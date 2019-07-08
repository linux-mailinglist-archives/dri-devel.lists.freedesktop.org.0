Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2BD61D41
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3789C6E;
	Mon,  8 Jul 2019 10:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DE589C6E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:50:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a10so15419050wrp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 03:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lej7Q+QP3kcSJDvUANx4MpD1co7bVMerIr3ru5n/a4c=;
 b=fvjE8/YyLBJWiMhi5eAq5W2r3AYFdbNY2Gim25qJcnU27XaqRWyRgKCW3jdDaGgWG4
 lQuoPOk6pISAOKnn0442zDmf51812XW6oZPYN3THmY5bixF7F/TRAaKuH/1IZ+kzXgNn
 dYouGjqf2uaVEWIhXaccNCpokUavt29ewoaQTaFAyYod4p8Ng/DY0GMEE3KhuOGgmBFO
 yWBbZCBczHrCGs+HyqD52nAAQQjNkmNgCCM3QEaFv4CbB/wOXBBrqcXW6vzWpJCO26Tp
 coOw3D8DW0Yyj6OoyUh9ee+Gz3pVgx9UzJoHo4xUiGlM8kdqRLKlo6zEivqE4q7NH1b0
 wkog==
X-Gm-Message-State: APjAAAWhk89eGsou2UTuOItPxMLkqkToLgufoqXEY/XGsdluYTotGvHS
 FcemCryhWB5cy+bVId9dzlj4rA==
X-Google-Smtp-Source: APXvYqyu3f1q1SnNB9p5IHgyIAns7STGef0JfhMHOgez/jYHIaz1D/lShD2tvop5KW5jyBLxrvSP+g==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr13496134wrv.164.1562583029398; 
 Mon, 08 Jul 2019 03:50:29 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o11sm16642628wmh.37.2019.07.08.03.50.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 03:50:28 -0700 (PDT)
Date: Mon, 8 Jul 2019 11:50:26 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20190708105026.jfl4krv2veb7gzow@holly.lan>
References: <20190708102700.23138-1-jjhiblot@ti.com>
 <20190708102700.23138-4-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708102700.23138-4-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lej7Q+QP3kcSJDvUANx4MpD1co7bVMerIr3ru5n/a4c=;
 b=tx0P6Ygyb6DdA7G9POdLYsY1nwSb8R4k49+VwLBqIM1T9U1q/43us/Hdp8RMCdxoM6
 CxuFx8aefoTs/hCz3yvx7UmSMCQs75fPh2oqTpzSzgEAVtuMo0TiIddSX/MloG/0NaMC
 /OuHfKw1t3wHozbRyinjBNu/uYqpLFdPDxvZTgi28Oj1nGIxdbftq3SUKZrE3RxOOkST
 1JZo4hQM22IsH+9TgOURFthDgZYKAc/w1OfQpWX5hwJ4HsE0k/ydx+szAcuMarDgp4qs
 4If7zr2vnPvh63kFDa+exPDoE6uCHeBsdsee98ujGIC3d2X6vubZP2v1YiFM3agasNf0
 SaBQ==
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
Cc: mark.rutland@arm.com, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTI6MjY6NTlQTSArMDIwMCwgSmVhbi1KYWNxdWVzIEhp
YmxvdCB3cm90ZToKPiBBZGQgRFQgYmluZGluZyBmb3IgbGVkLWJhY2tsaWdodC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCB8IDI5ICsrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2ts
aWdodC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGY1
NDUzMTZiMjg4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+IEBAIC0wLDAgKzEs
MjkgQEAKPiArbGVkLWJhY2tsaWdodCBiaW5kaW5ncwo+ICsKPiArVGhpcyBiaW5kaW5nIGlzIHVz
ZWQgdG8gZGVzY3JpYmUgYSBiYXNpYyBiYWNrbGlnaHQgZGV2aWNlIG1hZGUgb2YgTEVEcy4KPiAr
SXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZpY2UgY29udHJv
bGxlZCBieSB0aGUgb3V0cHV0IG9mCj4gK2EgTEVEIGRyaXZlci4KPiArCj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXM6Cj4gKyAgLSBjb21wYXRpYmxlOiAibGVkLWJhY2tsaWdodCIKPiArICAtIGxlZHM6
IGEgbGlzdCBvZiBMRURzCj4gKwo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICsgIC0gYnJpZ2h0
bmVzcy1sZXZlbHM6IEFycmF5IG9mIGRpc3RpbmN0IGJyaWdodG5lc3MgbGV2ZWxzLiBUaGVzZQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGFyZSBpbiB0aGUgcmFuZ2UgZnJvbSAwIHRvIDI1NS4g
VGhlIGFjdHVhbCBicmlnaHRuZXNzCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbGV2ZWwgcHJv
Z3JhbW1lZCBpbiBlYWNoIExFRCB3aWxsIGJlIGFkanVzdGVkIGJhc2VkIG9uCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaXRzIG1heGltdW0gYnJpZ2h0bmVzczoKPiArICAgICAgICAgICAgICAg
ICAgICAgICBsZWQgYnJpZ2h0bmVzcyA9IChsZXZlbCAqIG1heGltdW0gYnJpZ2h0bmVzcykgLyAy
NTUKCjgtYml0cyBpcyBhIG5hcnJvdyByYW5nZSBhbmQgbGlrZWx5IHRvIG1ha2UgYW5pbWF0ZWQg
YmFja2xpZ2h0IGVmZmVjdHMKaW1wb3NzaWJsZSBiZWNhdXNlIHRoZSBzdGVwcGluZyBhcnRlZmFj
dHMgd291bGQgYmUgdG9vIG9idmlvdXMuCgpJJ2QgcmF0aGVyIHNlZSB0aGUgYnJpZ2h0bmVzcy1s
ZXZlbHMgdGFibGUgZXhwcmVzc2VkIGluIHRoZSBuYXRpdmUKc3RlcHMgb2YgdGhlIExFRHMgaW4g
dGhlIGxlZHMgbGlzdC4KCkkga25vdyB0aGlzIG1lYW5zIHRoYXQgdGhlIExFRHMgbXVzdCBoYXZl
IGlkZW50aWNhbCByYW5nZXMgYnV0IEkgdGhpbmsKaXQgaXMgT0suIEEgYmFja2xpZ2h0IGRlc2ln
biB3aG9zZSBMRURzIGFyZSBjb25uZWN0ZWQgdG8gbm9uLWlkZW50aWNhbApkcml2ZXJzIGlzIGVp
dGhlciBiYWRseSBicm9rZW4gb3Igc3VmZmljaWVudGx5IGV4b3RpYyB0byBuZWVkIHRvIHNwZWNp
YWwKcHVycG9zZSBkcml2ZXIuIFRoZSBkcml2ZXIgY2FuIHRoZXJlZm9yZSBmYWlsIHRvIHByb2Jl
IGlmIHRoZSBMRURzIGFyZQptaXNtYXRjaGVkLgoKPiArCj4gKyAgLSBkZWZhdWx0LWJyaWdodG5l
c3MtbGV2ZWw6IFRoZSBkZWZhdWx0IGJyaWdodG5lc3MgbGV2ZWwgKGluZGV4IGludG8gdGhlCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFycmF5IGRlZmluZWQgYnkgdGhlICJicmln
aHRuZXNzLWxldmVscyIgcHJvcGVydHkpLgoKVGhlIGJyaWdodG5lc3MtbGV2ZWxzIHByb3BlcnR5
IGlzIG9wdGlvbmFsLi4uIHRoaXMgdGV4dCBuZWVkcyB0byBiZQp1cGRhdGVkLgoKCkRhbmllbC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
