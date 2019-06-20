Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6A4CFAF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 15:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B13E6E579;
	Thu, 20 Jun 2019 13:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDB66E579
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:56:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a15so3174203wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFm7NdIa2HHNh0HHo0ufCJYY4GiimW3KQmJfZuX/+1A=;
 b=T+HOOLPDhHFjqWZbwkMCpr6wFfAkMw8sfCWpiR9D99TGjy4MYxGxMkVqrTdgJXaSyI
 UhaW0CZyj2IndQfyQbQh25dirvwmeGJoGRyy2Odfwil5ofCHRbxd/6iPAbPI1km0qPQD
 tweWdS3XNU/AFuPCv0aMgO55VW4KNem5Fc0qKpAlxzCt2mZiSRmaTtA707XTBxPQmMme
 BjfpqI3VG1TAM8nuYihDchhDN/EEgHw+qOs339IALSSU2EAtuijCmP0n/elfcMHH0nc2
 wva6Jk7sC9gRvs9Hyf7KlFoLQA8+Jbr3yVkQN/0p96I4Giu2f9f34XiVLucpnZMSiNHe
 VHGQ==
X-Gm-Message-State: APjAAAUs5TuHssEvHBWqM3LozhDUxpuaaxGBt8hAvrhWDGQDb5uiDjkd
 GGQgojvARhrNmE8tt8iU788U+g==
X-Google-Smtp-Source: APXvYqw2i7LeGM36+7/WxrmFj2jyg/Rfps966Iqc9Kr0ftD/oKO7Uqgzi6rVFaEgRy0R5VxDX5/biw==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr3145978wmb.81.1561038987399; 
 Thu, 20 Jun 2019 06:56:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id d18sm36948937wrb.90.2019.06.20.06.56.26
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 06:56:26 -0700 (PDT)
Subject: Re: Re: [PATCH] backlight: gpio-backlight: Set power state instead of
 brightness at probe
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20190517150546.4508-1-paul.kocialkowski@bootlin.com>
 <bee40295b2c6b489468d4e1fc12d7a1ac122cb9b.camel@bootlin.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <29712212-0567-702b-fbc9-c0f37806d84c@linaro.org>
Date: Thu, 20 Jun 2019 14:56:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bee40295b2c6b489468d4e1fc12d7a1ac122cb9b.camel@bootlin.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lFm7NdIa2HHNh0HHo0ufCJYY4GiimW3KQmJfZuX/+1A=;
 b=Ke6yJck4jVgEhh/tKvRzf4ORtRvDLepDlBQG7G/hYzHQMzbUIg7HdjRx50Eut9YlBw
 XY4sV2dTy/Xj36F66LMAAEym59Oa53iPPeBZJXoKXqxrnOUH+dOUJd32WQGYDfM7opNG
 J3AjnSL2NiTS/ThA75UTKJa/nPmqpEnSbFnhay98AkR/l4+yfCNwdC5HNQ+/4YTQl8Wr
 Y68y8KszF3i3UrkHx0aWzS8lD9GISUTkuGIzCvCgEnXLAHz93/VkIhqB+tBasCXhJ5WC
 4GIPtssQwjmmvH3+bRDbRGyrgyJTcexbC8Xb10toGo0T4GB4mgKNHy4+gIGl6fV5wWBZ
 auMA==
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDYvMjAxOSAxMzo1OCwgUGF1bCBLb2NpYWxrb3dza2kgd3JvdGU6Cj4gSGksCj4gCj4g
T24gRnJpLCAyMDE5LTA1LTE3IGF0IDE3OjA1ICswMjAwLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90
ZToKPj4gT24gYSB0cml2aWFsIGdwaW8tYmFja2xpZ2h0IHNldHVwIHdpdGggYSBwYW5lbCB1c2lu
ZyB0aGUgYmFja2xpZ2h0IGJ1dAo+PiBubyBib290IHNvZnR3YXJlIHRvIGVuYWJsZSBpdCBiZWZv
cmVoYW5kLCB3ZSBmYWxsIGluIGEgY2FzZSB3aGVyZSB0aGUKPj4gYmFja2xpZ2h0IGlzIGRpc2Fi
bGVkIChub3QganVzdCBibGFua2VkKSBhbmQgdGh1cyByZW1haW5zIGRpc2FibGVkIHdoZW4KPj4g
dGhlIHBhbmVsIGdldHMgZW5hYmxlZC4KPj4KPj4gU2V0dGluZyBnYmwtPmRlZl92YWx1ZSB2aWEg
dGhlIGRldmljZS10cmVlIHByb3AgYWxsb3dzIGVuYWJsaW5nIHRoZQo+PiBiYWNrbGlnaHQgaW4g
dGhpcyBzaXR1YXRpb24sIGJ1dCBpdCB3aWxsIGJlIHVuYmxhbmtlZCBzdHJhaWdodCBhd2F5LAo+
PiBpbiBjb21wbGlhbmNlIHdpdGggdGhlIGJpbmRpbmcuIFRoaXMgZG9lcyBub3Qgd29yayB3ZWxs
IHdoZW4gdGhlcmUgd2FzIG5vCj4+IGJvb3Qgc29mdHdhcmUgdG8gZGlzcGxheSBzb21ldGhpbmcg
YmVmb3JlLCBzaW5jZSB3ZSByZWFsbHkgbmVlZCB0byB1bmJsYW5rCj4+IGJ5IHRoZSB0aW1lIHRo
ZSBwYW5lbCBpcyBlbmFibGVkLCBub3QgYmVmb3JlLgo+Pgo+PiBSZXNvbHZlIHRoZSBzaXR1YXRp
b24gYnkgc2V0dGluZyB0aGUgYnJpZ2h0bmVzcyB0byAxIGF0IHByb2JlIGFuZAo+PiBtYW5hZ2lu
ZyB0aGUgcG93ZXIgc3RhdGUgYWNjb3JkaW5nbHksIGEgYml0IGxpa2UgaXQncyBkb25lIGluCj4+
IHB3bS1iYWNrbGlnaHQuCj4gCj4gQW55IGZlZWRiYWNrIG9uIHRoaXM/IEkgd2FzIHVuZGVyIHRo
ZSBpbXByZXNzaW9uIHRoYXQgaXQgY291bGQgYmUgcXVpdGUKPiBjb250cm92ZXJzaWFsLCBhcyBp
dCBpbXBsaWVzIHRoYXQgdGhlIGJhY2tsaWdodCBjYW4gbm8gbG9uZ2VyIGJlCj4gZW5hYmxlZCB3
aXRob3V0IGEgYm91bmQgcGFuZWwgKHdoaWNoIElNTyBtYWtlcyBnb29kIHNlbnNlIGJ1dCBjb3Vs
ZCBiZQo+IGEgbWF0dGVyIHRvIGRlYmF0ZSkuCgpNeSBhcG9sb2dpZXMuIFRoaXMgcGF0Y2ggYnJv
dWdodCBvbiBzdWNoIHNldmVyZSBkZWphLXZ1IEkgZ290IHJhdGhlciAKY29uZnVzZWQuIFRoZW4g
d2hlbiBJIHdlbnQgZGlnZ2luZyBJJ3ZlIGFsc28gZHJvcHBlZCB0aGUgYmFsbCBvbiB0aGUgCnNh
bWUgZmVhdHVyZSBwcmV2aW91c2x5LgoKUGV0ZXIgVWpmYWx1c2kgcHJvdmlkZWQgYSBzaW1pbGFy
IHBhdGNoIHRvIHlvdXJzIGJ1dCB3aXRoIGEgc2xpZ2h0bHkgCmRpZmZlcmVudCBpbXBsZW1lbnRh
dGlvbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwMDIzNTkvCgpP
biB0aGUgd2hvbGUgSSB0aGluayBpdCBpcyBpbXBvcnRhbnQgdG8gcmVhZCB0aGUgR1BJTyBwaW4g
c2luY2UgCm90aGVyd2lzZSB3ZSBzd2FwIHByb2JsZW1zIHdoZW4gdGhlcmUgYm9vdGxvYWRlciBk
b2VzIHNldHVwIHRoZSAKYmFja2xpZ2h0IGZvciBwcm9ibGVtcyB3aGVyZSBpdCBkb2VzIG5vdC4K
ClRoZSB0aGluZyBJIGRvbid0IGdldCBpcyB3aHkgYm90aCBwYXRjaGVzIHRyeSB0byBhdm9pZCBz
ZXR0aW5nIHRoZSAKYmFja2xpZ2h0IGJyaWdodG5lc3MgZnJvbSBkZWZfdmFsdWUuIFNpbXBsZSBk
aXNwbGF5cywgZXNwZWNpYWxseSAKbW9ub2Nocm9tZSBvbmVzIGFyZSBwZXJmZWN0bHkgcmVhZGFi
bGUgd2l0aCB0aGUgYmFja2xpZ2h0IG9mZi4uLiB6ZXJvIApicmlnaHRuZXNzIGlzIG5vdCBhICJi
YWQiIHZhbHVlLgoKTm90IHN1cmUgaWYgUGV0ZXIgaXMgc3RpbGwgd2lsbGluZyB0byByZXYgaGlz
IHZlcnNpb24gb2YgdGhpcyBjb2RlIAooZ2l2ZW4gaG93IGJhZGx5IHdlIG5lZ2xlY3RlZCBoaW0g
cHJldmlvdXNseSkgb3Igd2hldGhlciB5b3Ugd2FudCB0byB0cnkgCmFuZCBjb21iaW5lIGJvdGgg
aWRlYXMuCgoKRGFuaWVsLgoKCj4gCj4gQ2hlZXJzLAo+IAo+IFBhdWwKPiAKPj4gRml4ZXM6IDhi
NzcwZTNjOTgyNCAoImJhY2tsaWdodDogQWRkIEdQSU8tYmFzZWQgYmFja2xpZ2h0IGRyaXZlciIp
Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBi
b290bGluLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2dwaW9fYmFja2xpZ2h0LmMKPj4gaW5kZXggZTQ3MGRhOTVkODA2Li5jOWNiOTdmYTEzZDAgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPj4g
KysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+PiBAQCAtNTcs
NiArNTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xp
Z2h0X29wcyA9IHsKPj4gICAJLmNoZWNrX2ZiCT0gZ3Bpb19iYWNrbGlnaHRfY2hlY2tfZmIsCj4+
ICAgfTsKPj4gICAKPj4gK3N0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9z
dGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKPj4gK3sKPj4gKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsKPj4gKwo+PiArCS8qIElmIHdlIGFic29s
dXRlbHkgd2FudCB0aGUgYmFja2xpZ2h0IGVuYWJsZWQgYXQgYm9vdC4gKi8KPj4gKwlpZiAoZ2Js
LT5kZWZfdmFsdWUpCj4+ICsJCXJldHVybiBGQl9CTEFOS19VTkJMQU5LOwo+PiArCj4+ICsJLyog
SWYgdGhlcmUncyBubyBwYW5lbCB0byB1bmJsYW5rIHRoZSBiYWNrbGlnaHQgbGF0ZXIuICovCj4+
ICsJaWYgKCFub2RlIHx8ICFub2RlLT5waGFuZGxlKQo+PiArCQlyZXR1cm4gRkJfQkxBTktfVU5C
TEFOSzsKPj4gKwo+PiArCXJldHVybiBGQl9CTEFOS19QT1dFUkRPV047Cj4+ICt9Cj4+ICsKPj4g
ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlX2R0KHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYsCj4+ICAgCQkJCSAgIHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+PiAgIHsK
Pj4gQEAgLTE0Miw3ICsxNTcsOSBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCQlyZXR1cm4gUFRSX0VSUihibCk7Cj4+
ICAgCX0KPj4gICAKPj4gLQlibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IGdibC0+ZGVmX3ZhbHVlOwo+
PiArCWJsLT5wcm9wcy5icmlnaHRuZXNzID0gMTsKPj4gKwlibC0+cHJvcHMucG93ZXIgPSBncGlv
X2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKGdibCk7Cj4+ICsKPj4gICAJYmFja2xpZ2h0
X3VwZGF0ZV9zdGF0dXMoYmwpOwo+PiAgIAo+PiAgIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCBibCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
