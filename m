Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03961B9844
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC563892D3;
	Mon, 27 Apr 2020 07:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D4289C9D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 19:31:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k1so18057584wrx.4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ddfze3qGmVwKRJLH5Pd6gdehcdFm5JRcS337ydQjW/U=;
 b=jQcl+bpXmxhFBTQ1M9eHnLMzFVPHRyZ/cLzBouQvUYniMNhGBH+5AXm1DlBj9u1f4c
 Lipke/EQrl3ISBSW/H+ZzrEoH/o+rXVFzj3bMcTy/OhN46NydVkgIuaeUwxBeLscmw6a
 HKwpJ1HHGToP9mkZt0I9t1sW71QECAzPn6juMlTudg8KpqbEYVHCVXaXrYrJzUNQ5I+v
 mGnWB2NcnNCw02lB8lyhanUPJyy+ayrshbwzHW7sRZyt+JTvJFVqH6SbKx+Y97TL6jZ8
 MjSaKyS5VFxmn9GyhaDx/6k4pgUo+rmyfuOEXKqq6yH+g5H0UPmdewApYWVYML7KSN9U
 nk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ddfze3qGmVwKRJLH5Pd6gdehcdFm5JRcS337ydQjW/U=;
 b=Fyew8z/2XNTj8PU1dPr7kLfk+v4k8gj8QYRoS5d5+dugk5NfvH2mCwpU6KCUcWwlDf
 xdatLLo91jJq8g45p3WeB1r4FMs9C+8RTaeGjHltzvYGtJxtB6ilO5baozXmt3PwXzPe
 dJaNf0aPMDk0u1E3B+4aCOWLrGI/CVDj1AIRDTvMXfUDKYi/NjxjD9DsxmKJDp9/1P2H
 FFhA2WM8Z0f3wpglVsC82mR3BP59/XvTy0FRaOjn+yWBYKT/YFX5LP3m9++iB68UWQoH
 lShlb932qiAo1BeMXuEF9ahtJd7Nl4G5QSNing8Zp/sVV81sv9vJo6kFWEQCJ1kVxkYE
 WhgA==
X-Gm-Message-State: AGi0PuZDrjkLr/mdwPEKcrTvhf/mPD+QM41CMTim5yLqjNLJ5793asuR
 v825/wFmTZYT6/m5lGDWWzo=
X-Google-Smtp-Source: APiQypL2Adb7hVF3vbjtHZE8Vu9e/+IvQOWRq3atLNaVZ0J2vDG1dCBedbrwuM1ZZYXc7bdUl12enw==
X-Received: by 2002:adf:9bd4:: with SMTP id e20mr23138649wrc.199.1587929515985; 
 Sun, 26 Apr 2020 12:31:55 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:10d8:ba05:5002:2dff?
 ([2a02:810d:340:2e50:10d8:ba05:5002:2dff])
 by smtp.gmail.com with ESMTPSA id a187sm12613135wmh.40.2020.04.26.12.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Apr 2020 12:31:55 -0700 (PDT)
Subject: Re: [PATCH v7 09/12] ARM: dts: sun6i: a31: add sgx gpu child node
To: Paul Cercueil <paul@crapouillou.net>,
 "H. Nikolaus Schaller" <hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
 <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <276c20d6-13f1-6fc8-c245-049b4a852181@gmail.com>
Date: Sun, 26 Apr 2020 21:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwKCk9uIDI2LjA0LjIwIDE0OjUzLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IAo+IAo+
IExlIHZlbi4gMjQgYXZyaWwgMjAyMCDDoCAyMjozNCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhu
c0Bnb2xkZWxpY28uY29tPiAKPiBhIMOpY3JpdCA6Cj4+IEZyb206IFBoaWxpcHAgUm9zc2FrIDxl
bWJlZDNkQGdtYWlsLmNvbT4KPj4KPj4gV2UgYXJlIGFkZGluZyB0aGUgZGV2aWNldHJlZSBiaW5k
aW5nIGZvciB0aGUgUFZSLVNHWC01NDQtMTE1IGdwdS4KPj4KPj4gVGhpcyBkcml2ZXIgaXMgY3Vy
cmVudGx5IHVuZGVyIGRldmVsb3BtZW50IGluIHRoZSBvcGVucHZyc2d4LWRldmdyb3VwLgo+PiBS
aWdodCBub3cgdGhlIGZ1bGwgYmluZGluZyBpcyBub3QgZmlndXJlZCBvdXQsIHNvIHdlIHByb3Zp
ZGUgaGVyZSBhCj4+IHBsYWNlaG9sZGVyLiBJdCB3aWxsIGJlIGNvbXBsZXRlZCBhcyBzb29uIGFz
IHRoZXJlIGlzIGEgZGVtbyBhdmFpbGFibGUuCj4+Cj4+IFRoZSBjdXJyZW50bHkgdXNlZCBiaW5k
aW5nIHRoYXQgaXMgdXNlZCBkdXJpbmcgZGV2ZWxvcG1lbnQgaXMgbW9yZQo+PiBjb21wbGV0ZSBh
bmQgd2FzIGFscmVhZHkgdmVyaWZ5ZWQgYnkgbG9hZGluZyB0aGUga2VybmVsbW9kdWxlIHN1Y2Nl
c3NmdWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgUm9zc2FrIDxlbWJlZDNkQGdtYWls
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxp
Y28uY29tPgo+PiAtLS0KPj4gwqBhcmNoL2FybS9ib290L2R0cy9zdW42aS1hMzEuZHRzaSB8IDEx
ICsrKysrKysrKysrCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjZpLWEzMS5kdHNpIAo+PiBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N1bjZpLWEzMS5kdHNpCj4+IGluZGV4IGYzNDI1YTY2ZmMwYS4uOTMzYTgy
NWJmNDYwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW42aS1hMzEuZHRzaQo+
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdW42aS1hMzEuZHRzaQo+PiBAQCAtMTQxNyw1ICsx
NDE3LDE2IEBAIHAyd2k6IGkyY0AxZjAzNDAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUt
Y2VsbHMgPSA8MD47Cj4+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgZ3B1OiBncHVAMWM0MDAwMDAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRp
YmxlID0gImFsbHdpbm5lcixzdW44aS1hMzEtc2d4NTQ0LTExNSIsCgpsb29rcyBsaWtlIGEgY29w
eSBwYXN0ZSBlcnJvciBmcm9tIG15IHNpZGUgdGhpcyBzaG91bGQgYmUgCmFsbHdpbm5lcixzdW42
aS1hMzEtc2d4NTQ0LTExNQoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgImltZyxzZ3g1NDQtMTE1IiwgImltZyxzZ3g1NDQiOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHgwMWM0MDAwMCAweDEwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFRoaXMgbm9kZSBpcyBjdXJy
ZW50bHkgYSBwbGFjZWhvbGRlciBmb3IgdGhlIGdwdS4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIFRoaXMgd2lsbCBiZSBjb21wbGV0ZWQgd2hlbiBhIGZ1bGwgZGVtb25zdHJhdGlvbgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogb2YgdGhlIG9wZW5wdnJzZ3ggZHJpdmVyIGlz
IGF2YWlsYWJsZSBmb3IgdGhpcyBib2FyZC4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
Lwo+IAo+IFRoaXMgbm9kZSBkb2Vzbid0IGhhdmUgY2xvY2tzLCBzbyBJIGRvbid0IHNlZSBob3cg
aXQnZCB3b3JrLgo+IAo+IEJldHRlciBkZWxheSB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBHUFUg
bm9kZSBmb3IgdGhpcyBib2FyZCB1bnRpbCB5b3UgCj4ga25vdyBpdCB3b3Jrcy4KPiAKPiAtUGF1
bApUaGlzIHdhcyBhbHJlYWR5IGRpc2N1c3MgaW4gYW4gZWFybGllciB2ZXJzaW9uIHRoYXQgc2Vy
aWVzIHRoYXQgdGhpcyAKc2hvdWxkIGJlIGRlbGF5ZWQuCgpJIHdpbGwgc2VuZCBhIGZvbGxvdyB1
cCBwYXRjaCBzZXJpZXMsIGFzIHNvb24gYXMgSSBtYWlubGluZWQgYW4gb3RoZXIgCmRyaXZlciB0
aGF0IEknbSB3b3JraW5nIG9uLCB3aGljaCBpcyByZXF1aXJlZCB0byBwcm9wZXJseSBkZXNjcmli
ZSB0aGUgZ3B1LgoKQ2hlZXJzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
