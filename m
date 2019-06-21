Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF984E89D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92F36E863;
	Fri, 21 Jun 2019 13:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAF76E863
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:10:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g135so6267545wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zWWuR+34CKSqeHNm3DAPIfBogtgjv1yPdEZeTsKzETc=;
 b=cMH5bNMq+NFiK+E9B12g4qz5q0WNlrl6+rzmWX5ybxeRDNtVx6bf9tivzUZx1rOHUp
 XfF643zIqlBpTE4A7KnIOrlV3Pci8A2lH5V7f3EMUehxEbMSymlvQH7s7j0qsafGwRWj
 IuqZK8Ttjja5Jsc/fUqxiRHsb/2S8ZPK9cjg1ckWjIP+X6k5+klhglfpx+f0FHyR3h7V
 FojTydx8LLpbmCsv/BtXYY5eXuGTvGejuKaftO5NKLyCdKDMkRso3Jc+h+miDncNvUt7
 ZPTJPnV86jIBBXX7w26V4wGV4EAHukoeViZkG9rEQ8zwpIA+Xk/r5nWeVMV9J0JQYKPK
 DT5w==
X-Gm-Message-State: APjAAAVOJ8oXxFhz6RZHZohm8/6jFyjgqfACnS3LILeZLvmnpwcDa+RM
 1y1Tx3bl8qEdj7/ir3Wy+eB/TA==
X-Google-Smtp-Source: APXvYqxugcFhasT6oqykCSfSXIx0XEa8A82CS0oO38cZlbubwFnhNoEfk4Ul2IhYgZbeXiAhzedHNg==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr3959660wmg.177.1561122621229; 
 Fri, 21 Jun 2019 06:10:21 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id 5sm4910909wrc.76.2019.06.21.06.10.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 06:10:20 -0700 (PDT)
Subject: Re: [PATCH 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-5-mka@chromium.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <9ea1bb40-95a6-7a67-a8a6-ecc77a70e547@linaro.org>
Date: Fri, 21 Jun 2019 14:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613194326.180889-5-mka@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zWWuR+34CKSqeHNm3DAPIfBogtgjv1yPdEZeTsKzETc=;
 b=sYlMGLg6ofrBMB6etYJLvDsNE5GKSrdcKhDZuMxtsWNYhzpHM6Uy+v9WkmTMKC9TuH
 1BgOvayYHCsQ3pSt95VOMUAD69bfUn5Hf0vJ44o+ofRUSzCZPeO+QfbDh5fPsROQ3HBo
 y5iBhArohMB4DGOLR+RH8I1mXpsm2L+hfGSQ+k1wx/vLYpq4o3U7snuZuSkGlinhlmDl
 z4cb29V1wDixND0F3ai2WMCO5MGx0E09t400/uCxSYi+U1rmXTdett8MgyCzGRNIwzkc
 mQuXyWXkFWeIpz3epAvNkd/D3gGUreOjHWwFCpIfilLjZ8TykTObi5CN5gmQIiUa8fw0
 YuWA==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDYvMjAxOSAyMDo0MywgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gQ2hlY2sgaWYg
YSBicmlnaHRuZXNzIGN1cnZlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUgaXMgbGluZWFy
IG9yCj4gbm90IGFuZCBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgcHJvcGVydHkgYWNjb3JkaW5nbHku
IFRoaXMgbWFrZXMgdGhlCj4gc2NhbGUgdHlwZSBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIHZpYSB0
aGUgJ3NjYWxlJyBzeXNmcyBhdHRyaWJ1dGUuCj4gCj4gVG8gZGV0ZXJtaW5lIGlmIGEgY3VydmUg
aXMgbGluZWFyIGl0IGlzIGNvbXBhcmVkIHRvIGEgaW50ZXJwb2xhdGVkIGxpbmVhcgo+IGN1cnZl
IGJldHdlZW4gbWluIGFuZCBtYXggYnJpZ2h0bmVzcy4gVGhlIGN1cnZlIGlzIGNvbnNpZGVyZWQg
bGluZWFyIGlmCj4gbm8gdmFsdWUgZGV2aWF0ZXMgbW9yZSB0aGFuICsvLTUlIG9mICR7YnJpZ2h0
bmVzc19yYW5nZX0gZnJvbSB0aGVpcgo+IGludGVycG9sYXRlZCB2YWx1ZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYwo+IGluZGV4IGYwNjdmZTdhYTM1ZC4uOTEyNDA3YjZkNjdmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBAQCAtNDA0LDYgKzQwNCwyNiBAQCBpbnQgcHdtX2Jh
Y2tsaWdodF9icmlnaHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgfQo+ICAg
I2VuZGlmCj4gICAKPiArc3RhdGljIGJvb2wgcHdtX2JhY2tsaWdodF9pc19saW5lYXIoc3RydWN0
IHBsYXRmb3JtX3B3bV9iYWNrbGlnaHRfZGF0YSAqZGF0YSkKPiArewo+ICsJdW5zaWduZWQgaW50
IG5sZXZlbHMgPSBkYXRhLT5tYXhfYnJpZ2h0bmVzcyArIDE7Cj4gKwl1bnNpZ25lZCBpbnQgbWlu
X3ZhbCA9IGRhdGEtPmxldmVsc1swXTsKPiArCXVuc2lnbmVkIGludCBtYXhfdmFsID0gZGF0YS0+
bGV2ZWxzW25sZXZlbHMgLSAxXTsKPiArCXVuc2lnbmVkIGludCBzbG9wZSA9ICgxMDAgKiAobWF4
X3ZhbCAtIG1pbl92YWwpKSAvIG5sZXZlbHM7CgpXaHkgMTAwIChyYXRoZXIgdGhhbiBhIHBvd2Vy
IG9mIDIpPwoKSXQgd291bGQgYWxzbyBiZSBnb29kIHRvIGhhdmUgYSBjb21tZW50IGhlcmUgc2F5
aW5nIHdoYXQgdGhlIG1heGltdW0gCnF1YW50aXphdGlvbiBlcnJvciBpcy4gRG9lc24ndCBoYXZl
IHRvIGJlIG92ZXIgY29tcGxleCBqdXN0IG1lbnRpb25pbmcgCnNvbWV0aGluZyBsaWtlIHRoZSBm
b2xsb3dpbmcgKGFzc3VtaW5nIHlvdSBhZ3JlZSB0aGF0IGl0cyB0cnVlIDstKSApOgoKICAgTXVs
dGlwbHlpbmcgYnkgWFhYIG1lYW5zIHRoYXQgZXZlbiBpbiBwYXRoYWxvZ2ljYWwgY2FzZXMgc3Vj
aCBhcwogICAobWF4X3ZhbCAtIG1pbl92YWwpID09IG5sZXZlbHMgdGhlbiB0aGUgZXJyb3IgYXQg
bWF4X3ZhbCBpcyBsZXNzIHRoYW4KICAgMSUuCgpXaXRoIGEgc3VpdGFibGUgY29tbWVudCBpbiB0
aGUgZml4ZWQgcG9pbnQgY29kZToKQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRo
b21wc29uQGxpbmFyby5vcmc+CgoKRGFuaWVsLgoKCj4gKwl1bnNpZ25lZCBpbnQgbWFyZ2luID0g
KG1heF92YWwgLSBtaW5fdmFsKSAvIDIwOyAvKiA1JSAqLwo+ICsJaW50IGk7Cj4gKwo+ICsJZm9y
IChpID0gMTsgaSA8IG5sZXZlbHM7IGkrKykgewo+ICsJCXVuc2lnbmVkIGludCBsaW5lYXJfdmFs
dWUgPSBtaW5fdmFsICsgKChpICogc2xvcGUpIC8gMTAwKTsKPiArCQl1bnNpZ25lZCBpbnQgZGVs
dGEgPSBhYnMobGluZWFyX3ZhbHVlIC0gZGF0YS0+bGV2ZWxzW2ldKTsKPiArCj4gKwkJaWYgKGRl
bHRhID4gbWFyZ2luKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHRy
dWU7Cj4gK30KPiArCj4gICBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9z
dGF0ZShjb25zdCBzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQo+ICAgewo+ICAgCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSA9IHBiLT5kZXYtPm9mX25vZGU7Cj4gQEAgLTU2Nyw2ICs1ODcsMTEgQEAg
c3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gICAKPiAgIAkJCXBiLT5sZXZlbHMgPSBkYXRhLT5sZXZlbHM7Cj4gICAJCX0KPiArCj4g
KwkJaWYgKHB3bV9iYWNrbGlnaHRfaXNfbGluZWFyKGRhdGEpKQo+ICsJCQlwcm9wcy5zY2FsZSA9
IEJBQ0tMSUdIVF9TQ0FMRV9MSU5FQVI7Cj4gKwkJZWxzZQo+ICsJCQlwcm9wcy5zY2FsZSA9IEJB
Q0tMSUdIVF9TQ0FMRV9OT05fTElORUFSOwo+ICAgCX0gZWxzZSBpZiAoIWRhdGEtPm1heF9icmln
aHRuZXNzKSB7Cj4gICAJCS8qCj4gICAJCSAqIElmIG5vIGJyaWdodG5lc3MgbGV2ZWxzIGFyZSBw
cm92aWRlZCBhbmQgbWF4X2JyaWdodG5lc3MgaXMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
