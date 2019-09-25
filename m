Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E2EBDFBE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F836EBCA;
	Wed, 25 Sep 2019 14:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848D6EBC9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 14:14:08 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id u192so631677vkb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 07:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=hXznh7ddWgEY0omAsz7BCTPYLDlWX522V0N7VonIutM=;
 b=R8B7jfAT3jRDQtStYFGFjVswtH9BK0yrnmRYM7Tn7Kqg2Aq1DP+vTmrKqpIMOs5TwJ
 qzVOdi44DMG2n7pcI+et8gJ9aJBart4P2rmlNYNQMto5SRKPVvPmVheGtGLEk6ohOKfV
 mePHTnFCeOhnIsG0WXkZ3KHZYI1c4qL0qB+tGv6QT0bhGaxaptoBRSIma4ZORPeLdvpN
 Jg4iVuzJ/1s8ziksEEEbPdMaYFEpQyq7x7TX+qdjMAOY6dTeNRHYIlNQvVI2oln+QdJH
 clvczWJ9hc5KQnnrfeLuhq+nsQd2VBfjmAdCFfYQlaj0kc4aNwcmSEAEpMfh20DFAMm1
 BJzA==
X-Gm-Message-State: APjAAAXbnSwC5zGiZWDY7B9SKgHMz4RqTo578YyA4kXcksGyDNZKBhm3
 oBjBgeP2B4vMVX53JP6zjJ5yW7dx54Pwmb6eKlA=
X-Google-Smtp-Source: APXvYqz9YcaGbh9Xh0W2JSyMkgKvyaNxqWBV+HdV+O/w4rUrzxQxzEXGCLvKLb40I3IjR1/nGD6cRnbmWH9k2J0m0aU=
X-Received: by 2002:a1f:1897:: with SMTP id 145mr2545325vky.53.1569420847738; 
 Wed, 25 Sep 2019 07:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgH=JQeT3=tZ_AdBsV0e-S_JNEe4CtpFW8Wj5NfYW5PsA@mail.gmail.com>
In-Reply-To: <CAOuPNLgH=JQeT3=tZ_AdBsV0e-S_JNEe4CtpFW8Wj5NfYW5PsA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 25 Sep 2019 19:43:56 +0530
Message-ID: <CAOuPNLjqm+Dv5RARP6dzZRKSttCvqoLe7MNYOeChAGUWX1krRA@mail.gmail.com>
Subject: Re: imx6: hdmi black screen issue after resume
To: p.zabel@pengutronix.de, bob.beckett@collabora.com, 
 dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=hXznh7ddWgEY0omAsz7BCTPYLDlWX522V0N7VonIutM=;
 b=fk627vBl+OHFyBU2PGOp19mGQMiau1fweOhqdiK1rKm2uL2hdOl6ZFTpAy6TkoaJjd
 9Rwb2/dalE1bmba0+HMR5Mi7+nHCN2bjJiaWbcvUH32s9EaRDFIT1HE/fhgMzlR3KJUj
 /TmQtSev0Z9xsSChMNEPPU+7O2LrCzxWVQ+39GeHvtjDfXT5W04KfOuCMxtByafqM9ip
 J1sZ8W8C8uxeSL3fBkJqqgmovX50XnfXpGHZY5UJyav0HeOr7qFpiezH7bycSG0TX0+l
 nMFokUvx1dP+r9bR6CWT2TBtZiasa8bJ1SDU1NuJpqP7XDwJAGpzMTvxSpfPJI5SIOtY
 4JlA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBQaGlsaXBwLAoKQ2FuIHlvdSByZXBseSB0byBteSBpc3N1ZSBiZWxvdz8KSXQgd2lsbCBi
ZSBvZiBncmVhdCBoZWxwIQoKUmVnYXJkcywKUGludHUKCk9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0
IDE6MjggUE0gUGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
RGVhciBQaGlsaXBwLAo+Cj4gSSBoYXZlIGEgaU1YNmRsIGN1c3RvbSBib2FyZCB3aXRoIGN1c3Rv
bSBMaW51eCBLZXJuZWwgNC44Lgo+IEkgaGF2ZSBib3RoIExDRCBhbmQgSERNSSBjb25uZWN0ZWQg
dG8gdGhlIGJvYXJkLgo+IEFuZCB3ZSBhcmUgdXNpbmcgd2VzdG9uL3dheWxhbmQgYXMgdGhlIGRp
c3BsYXkgaW50ZXJmYWNlLgo+IEluIG5vcm1hbCBib290LCBib3RoIExDRCBhbmQgSERNSSBkaXNw
bGF5IGlzIHdvcmtpbmcgZmluZS4KPgo+IEJ1dCwgY3VycmVudGx5LCBmb3Igb25lIG9mIG91ciBj
dXN0b21lciwgSSBhbSB0cnlpbmcgdG8gZXhwbG9yZSBhbmQKPiBzdXBwb3J0IHNuYXBzaG90IGlt
YWdlIGJvb3Rpbmcgb24gaXQuCj4gQ3VycmVudGx5LCB3ZSBhcmUgYWJsZSB0byByZXN1bWUgdGhl
IHN5c3RlbSB3aXRob3V0IGRpc3BsYXkuCj4gQWxzbywgaWYgd2UgbWFrZSB0aGUgZW50aXJlIGlt
eC1kcm0gYXMgbW9kdWxlcywgYW5kIHRoZW4gaW5zdGFsbCB0aGUKPiBtb2R1bGVzIGFyZSByZXN1
bWUsIGV2ZW4gTENEIGlzIGFsc28gY29taW5nIHVwLgo+IEJ1dCBIRE1JIGRpc3BsYXkgaXMgYmxh
Y2sgb3V0Lgo+Cj4gQWZ0ZXIsIHJlc3VtZSwgd2hlbiBJIHRyeSB0byBsYXVuY2ggdGhlIHdlc3Rv
biwgSSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgZXJyb3JzOgo+IGVuYWJsaW5nIHZibGFuayBvbiBj
cnRjIDAsIHJldDogMAo+IFtQSU5UVV06IGRybV92YmxhbmtfZ2V0OiBDQUxMRUQ6IHZibGFuay0+
cmVmY291bnQ6IDEKPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiBXQVJO
SU5HOiBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYzoxMTIxCj4gZHJtX2F0
b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcysweDIyOC8weDI0YyBbZHJtX2ttc19oZWxwZXJd
KCkKPiBbQ1JUQzoyNF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0Cj4gLi4uLi4KPiBbZHJtOmRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF9jbGVhbnVwX2RvbmUgW2RybV9rbXNfaGVscGVyXV0gKkVSUk9S
Kgo+IFtDUlRDOjI0OmNydGMtMF0gZmxpcF9kb25lIHRpbWVkIG91dAo+Cj4gLi4uLgo+IFswMDow
Njo0Mi42MDBdIFdhcm5pbmc6IGNvbXB1dGVkIHJlcGFpbnQgZGVsYXkgaXMgaW5zYW5lOiAtNTA2
OSBtc2VjCj4gWzAwOjA2OjQyLjY2NV0gdW5leHBlY3RlZGx5IGxhcmdlIHRpbWVzdGFtcCBqdW1w
IChmcm9tIDM5NzUyMiB0byA0MDI2NDgpCj4gLi4uLgo+Cj4gQW5kLCB3aGVuIEkgdHJ5IHRvIHJl
Ym9vdCB0aGUgc3lzdGVtLCB0aGUgc3lzdGVtIGRvZXMgbm90IHJlYm9vdC4KPiBBbmQgSSBnZXQg
dGhlIGZvbGxvd2luZyBlcnJvcjoKPiAvd2F5bGFuZCAjIHJlYm9vdAo+IC4uLi4KPiBbMTc6NTU6
MDEuMTgwXSBkZXN0cm95IG91dHB1dCB3aGlsZSBwYWdlIGZsaXAgcGVuZGluZwo+IC4uLgo+IGlt
eC1pcHV2MyAyNDAwMDAwLmlwdTogREMgc3RvcCB0aW1lb3V0IGFmdGVyIDUwIG1zCj4KPgo+IC0t
LS0tLS0tLS0tLS0KPiBJZiB5b3UgaGF2ZSBhbnkgY2x1ZSBhYm91dCB0aGlzIGlzc3VlLCBwbGVh
c2UgbGV0IG1lIGtub3cuCj4KPiBBbnkgaGVscCB3aWxsIGJlIHJlYWxseSBhcHByZWNpYXRlZCEK
Pgo+Cj4gVGhhbmsgWW91IQo+Cj4gUmVnYXJkcywKPiBQaW50dQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
