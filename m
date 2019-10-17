Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3000DAC57
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797B16EA6A;
	Thu, 17 Oct 2019 12:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A226EA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:34:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id c6so2698169ioo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hqcMAOPR2X7ODa41IdyQT/JuuAWdzynnAq9471NRIDI=;
 b=HtWJpmjfOmIaIxrAGn3yueQXots5i5Wu6AUEjN095BKqSNSqx/Q0pP/QmTQpR8qPzg
 jxrsW/b4SUSSG+OK6u/WVmtRWHMiklMsBjdyjVl5Zm/hT8klrbFqw2TybPSNb6+8fx2l
 dj/puW5GXlr5knef8gIAhA1gpOvaVK9tJmlCGaFC5ahKRhHXe+lJJnC+/d4LOLsdYv7+
 9UwgDkkKR/UvYAspJVoU2uXN5Ar9G1W893Vg8JYjgUVNlPMFvBPI1xvjAy3+z8JHel/3
 n/tVpb29q1TqnVO9dv1T0AuC1VZJXkQNVPPqd75d9puv5BTJtoARvRrVt1nOZiWhtbtC
 kfaA==
X-Gm-Message-State: APjAAAVN11YxsFcUKID6HCfeDmNpR4BjhTc8wlQLnLMssjISRmLtLQ6k
 EtCU3UcR7b0YnUo7wkFuCiShdnuHIm0flZ8SrS0=
X-Google-Smtp-Source: APXvYqzR/+y0NTzJ2GAikr+XbmnFDQ09ygbG13oYC4gGevg+GtEzatL+TZA22iHddVSAPyKb8f+hNX53YJ26zaLYEhM=
X-Received: by 2002:a02:40c6:: with SMTP id n189mr3094296jaa.52.1571315689789; 
 Thu, 17 Oct 2019 05:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
In-Reply-To: <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Oct 2019 07:34:38 -0500
Message-ID: <CAHCN7xKogdqoLmbbTatPdtLzqz+MKh-jgrHkkCh+YA-bwwOkDA@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hqcMAOPR2X7ODa41IdyQT/JuuAWdzynnAq9471NRIDI=;
 b=Te4UGA+/OOQ96uWoNtOe1qRVDSkTsnMurWE+LWhaG1HrDNjU+KKm0bzT4t1seQT6+0
 mu3Q00/TucWB4siDGjY96JaDIErAU9e5Ri4e2CYHryI3v5cVqh05zM9rXl6Bivl9xi2M
 EP66YXXKIlMv/syN/WfvqVe2fq16Uhl/YhNOYYBOQOcUYYtFzJmmbqTxtjCjyfAYSwl2
 ly6NzpCDZgXNzwA150d4r/uJ+2hkCgi62yqGHgGUarGSmBm6jolshk2VbEzY4ozvVPIu
 Ks9rIOtkVx+vXvanEJ5b5tTrqcL+Bq4mUIrarY2BgjeGrucRGpr5fq79WAbe4iaC58S4
 JtMg==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgNzoxOSBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5
IGF0IDEyOjQ3OjI3UE0gKzAxMDAsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IE9uIFRodSwg
T2N0IDE3LCAyMDE5IGF0IDEwOjEwOjU5QU0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3Rl
Ogo+ID4gPiBBIHByZXZpb3VzIGNoYW5nZSBpbiB0aGUgcHdtIGNvcmUgKG5hbWVseSAwMWNjZjkw
M2VkZDYgKCJwd206IExldAo+ID4gPiBwd21fZ2V0X3N0YXRlKCkgcmV0dXJuIHRoZSBsYXN0IGlt
cGxlbWVudGVkIHN0YXRlIikpIGNoYW5nZWQgdGhlCj4gPiA+IHNlbWFudGljIG9mIHB3bV9nZXRf
c3RhdGUoKSBhbmQgZGlzY2xvc2VkIGFuIChhcyBpdCBzZWVtcykgY29tbW9uCj4gPiA+IHByb2Js
ZW0gaW4gbG93bGV2ZWwgUFdNIGRyaXZlcnMuIEJ5IG5vdCByZWx5aW5nIG9uIHRoZSBwZXJpb2Qg
YW5kIGR1dHkKPiA+ID4gY3ljbGUgYmVpbmcgcmV0cmlldmFibGUgZnJvbSBhIGRpc2FibGVkIFBX
TSB0aGlzIHR5cGUgb2YgcHJvYmxlbSBpcwo+ID4gPiB3b3JrZWQgYXJvdW5kLgo+ID4gPgo+ID4g
PiBBcGFydCBmcm9tIHRoaXMgaXNzdWUgb25seSBjYWxsaW5nIHRoZSBwd21fZ2V0X3N0YXRlL3B3
bV9hcHBseV9zdGF0ZQo+ID4gPiBjb21ibyBvbmNlIGlzIGFsc28gbW9yZSBlZmZlY3RpdmUuCj4g
Pgo+ID4gSSdtIG9ubHkgaW50ZXJlc3RlZCBpbiB0aGUgc2Vjb25kIHBhcmFncmFwaCBoZXJlLgo+
ID4KPiA+IFRoZXJlIHNlZW1zIHRvIGJlIGEgcmVhc29uYWJsZSBjb25zZW5zdXMgdGhhdCB0aGUg
aS5NWDI3IGFuZCBjcm9zLWVjCj4gPiBQV00gZHJpdmVycyBzaG91bGQgYmUgZml4ZWQgZm9yIHRo
ZSBiZW5lZml0IG9mIG90aGVyIFBXTSBjbGllbnRzLgo+ID4gU28gd2UgbWFrZSB0aGlzIGNoYW5n
ZSBiZWNhdXNlIGl0IG1ha2VzIHRoZSBwd20tYmwgYmV0dGVyLi4uIG5vdCB0bwo+ID4gd29yayBh
cm91bmQgYnVncyA7LSkuCj4KPiBUaGF0J3MgZmluZSwgc3RpbGwgSSB0aGluayBpdCdzIGZhaXIg
dG8gZXhwbGFpbiB0aGUgbW90aXZhdGlvbiBvZgo+IGNyZWF0aW5nIHRoaXMgcGF0Y2guCj4KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+ID4gaW5kZXggNzQ2ZWViYzQxMWRmLi5kZGVi
ZDYyYjM5NzggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9i
bC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gPiA+IEBA
IC02Nyw0MCArNjIsMjcgQEAgc3RhdGljIHZvaWQgcHdtX2JhY2tsaWdodF9wb3dlcl9vbihzdHJ1
Y3QgcHdtX2JsX2RhdGEgKnBiKQo+ID4gPgo+ID4gPiAgc3RhdGljIHZvaWQgcHdtX2JhY2tsaWdo
dF9wb3dlcl9vZmYoc3RydWN0IHB3bV9ibF9kYXRhICpwYikKPiA+ID4gIHsKPiA+ID4gLSAgIHN0
cnVjdCBwd21fc3RhdGUgc3RhdGU7Cj4gPiA+IC0KPiA+ID4gLSAgIHB3bV9nZXRfc3RhdGUocGIt
PnB3bSwgJnN0YXRlKTsKPiA+ID4gLSAgIGlmICghcGItPmVuYWJsZWQpCj4gPiA+IC0gICAgICAg
ICAgIHJldHVybjsKPiA+ID4gLQo+ID4KPiA+IFdoeSByZW1vdmUgdGhlIHBiLT5lbmFibGVkIGNo
ZWNrPyBJIHRob3VnaHQgdGhhdCB3YXMgdGhlcmUgdG8gZW5zdXJlIHdlCj4gPiBkb24ndCBtZXNz
IHVwIHRoZSByZWd1bGFyIHJlZmVyZW5jZSBjb3VudHMuCj4KPiBJIGhhdm4ndCBsb29rZWQgeWV0
LCBidXQgSSBndWVzcyBJIGhhdmUgdG8gcmVzcGluLiBFeHBlY3QgYSB2MiBsYXRlcgo+IHRvZGF5
LgoKSSB3b3VsZCBhZ3JlZSB0aGF0IGEgaGlnaC1sZXZlbCBmaXggaXMgYmV0dGVyIHRoYW4gYSBz
ZXJpZXMgb2YgbG93CmxldmVsIGRyaXZlciBmaXhlcy4gIEZvciB3aGF0IGl0cyB3b3J0aCwgeW91
ciBWMSBwYXRjaCB3b3JrZWQgZmluZSBvbgpteSBpLk1YNlEuICBJIGNhbiB0ZXN0IHRoZSBWMiBw
YXRjaCB3aGVuIGl0cyByZWFkeS4KCmFkYW0KPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gLS0K
PiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5l
LUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAg
ICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
