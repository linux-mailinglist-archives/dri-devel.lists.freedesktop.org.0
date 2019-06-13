Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC1436BC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F07589A86;
	Thu, 13 Jun 2019 13:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBB689A86
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:38:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so16935135iot.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZxzfjXxlmdBmM0AYjQ9pAKh31UA8zMXP2MpnLaIB+M=;
 b=bAou0l3j8W6zpOReg663+mC6I6+Zz3wCaMl89YIH6FB+veIi0bmxjAOGjMNSr3CGbQ
 m7euSzNdEOAsaRd5D/4tFevrcGXyf/l3BWkTjCyxyROTeT+LYJD4zgZVrhJljNVg4VdK
 dvZNaKNuDhvQ4bw89wmtVh4LgeYX8r0UD+7KkndsrPJUMvMAUaK3ZV5fn5EQ0LneJZRK
 mL8ZNKJlGfGHy3sVhzAct7eS3K9eOKaAHbY/KNbOTAXvybtK+ZPdwnszNrcOgGpIxBvJ
 2rfTQJs+SRXwVZKzegL+7MYDhd8bjrjC3zBeVMDCdQdNl87qHgkmUAXg4+LAOtb6uTW9
 vs0Q==
X-Gm-Message-State: APjAAAVZZTc8OpFvJBKcY39+wk0RTWSBPPTVOvR94hASjaH7wtQaG5mc
 iHBcWR2TDKLDdsjbcJoFovYWzNJO4WhC8KqXch3+HWtPSbQ=
X-Google-Smtp-Source: APXvYqxTD9WliaeoqP7H05mWjCiP5KhFEKc49dB9EfBd5QrjHT2/JPl1sG5KMSghGAtPaS047QWE0ahfzc5xX/cGFwQ=
X-Received: by 2002:a6b:6b0d:: with SMTP id g13mr7653009ioc.55.1560433121239; 
 Thu, 13 Jun 2019 06:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190610165806.24854-1-robh@kernel.org>
In-Reply-To: <20190610165806.24854-1-robh@kernel.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Thu, 13 Jun 2019 15:38:29 +0200
Message-ID: <CAAObsKD=Jn0YL4O75FpudEQpyGVVXMn9T7FsQgS6mCZ0QPqX6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Align GEM objects GPU VA to 2MB
To: Rob Herring <robh@kernel.org>
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMCBKdW4gMjAxOSBhdCAxODo1OCwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBJbiBvcmRlciB0byBpbmNyZWFzZSB0aGUgY2hhbmNlcyBvZiB1c2luZyAy
TUIgcGFnZXMsIHdlIG5lZWQgdG8gYWxpZ24gdGhlCj4gR1BVIFZBIG1hcHBpbmcgdG8gMk1CLiBP
bmx5IGRvIHRoaXMgaWYgdGhlIG9iamVjdCBzaXplIGlzIDJNQiBvciBtb3JlLgo+Cj4gQ2M6IFJv
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxh
Ym9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
ClJldmlld2VkLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgoK
VGhhbmtzIQoKVG9tZXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9nZW0uYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMK
PiBpbmRleCBhNTUyOGEzNjBlZjQuLjg4Njg3NWFlMzFkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKPiBAQCAtNTIsNiArNTIsNyBAQCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKnBhbmZyb3N0X2dlbV9jcmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHNpemVfdAo+ICAgICAgICAgaW50IHJldDsKPiAgICAgICAgIHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKPiAgICAgICAgIHN0cnVjdCBwYW5mcm9z
dF9nZW1fb2JqZWN0ICpvYmo7Cj4gKyAgICAgICB1NjQgYWxpZ247Cj4KPiAgICAgICAgIG9iaiA9
IGt6YWxsb2Moc2l6ZW9mKCpvYmopLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlmICghb2JqKQo+
IEBAIC01OSw5ICs2MCwxMiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnBhbmZyb3N0X2dlbV9j
cmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdAo+Cj4gICAgICAgICBv
YmotPmJhc2UuYmFzZS5mdW5jcyA9ICZwYW5mcm9zdF9nZW1fZnVuY3M7Cj4KPiArICAgICAgIHNp
emUgPSByb3VuZHVwKHNpemUsIFBBR0VfU0laRSk7Cj4gKyAgICAgICBhbGlnbiA9IHNpemUgPj0g
U1pfMk0gPyBTWl8yTSA+PiBQQUdFX1NISUZUIDogMDsKPiArCj4gICAgICAgICBzcGluX2xvY2so
JnBmZGV2LT5tbV9sb2NrKTsKPiAtICAgICAgIHJldCA9IGRybV9tbV9pbnNlcnRfbm9kZSgmcGZk
ZXYtPm1tLCAmb2JqLT5ub2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJv
dW5kdXAoc2l6ZSwgUEFHRV9TSVpFKSA+PiBQQUdFX1NISUZUKTsKPiArICAgICAgIHJldCA9IGRy
bV9tbV9pbnNlcnRfbm9kZV9nZW5lcmljKCZwZmRldi0+bW0sICZvYmotPm5vZGUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID4+IFBBR0VfU0hJRlQsIGFs
aWduLCAwLCAwKTsKPiAgICAgICAgIHNwaW5fdW5sb2NrKCZwZmRldi0+bW1fbG9jayk7Cj4gICAg
ICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfb2JqOwo+IC0tCj4gMi4y
MC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
