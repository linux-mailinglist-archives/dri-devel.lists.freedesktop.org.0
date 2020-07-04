Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A3214905
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 00:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB46EBE4;
	Sat,  4 Jul 2020 22:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F15F6EBE4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 22:19:21 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A72B20870
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593901161;
 bh=9v1dX1d5CT4OlZG432LBpmp+z8QjBxiwBh7CgA1A544=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=se3OQJClKKjKhYoH9WhQiUxEFZX2L1NvaCCUMqtw7TdurqgGX58PSFP4Skgh6Vvju
 vh4aaV/eWxRDjkmOCifgaTNdIJMHSYciq6XCi2nR+4YsxXKzZYgzkWkdfIIR/oAscc
 tkMswjD4s1D410+EJomp69qFD7gFMMT8MZv//3+w=
Received: by mail-ej1-f51.google.com with SMTP id y10so38352964eje.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 15:19:21 -0700 (PDT)
X-Gm-Message-State: AOAM5322gQpUpPIrKrmyMNXEkRYEA9D5GSiZnmhtUZOagnxmzYgaTjjw
 Ma3rOD8o7QV7U/x6UjvW1CqvUGtjFbLgOI+Q/A==
X-Google-Smtp-Source: ABdhPJzpbnPFMQGBtbgHPK/mpFFqynZ8/TPSZmE0VOmdWVSRLcQBDhVy6aNOzos4UlWBPw4oa0qmR7WsUfFu23y1s4M=
X-Received: by 2002:a17:906:856:: with SMTP id
 f22mr36036089ejd.245.1593901159756; 
 Sat, 04 Jul 2020 15:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200518112254.23692-1-matthias.bgg@kernel.org>
In-Reply-To: <20200518112254.23692-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 06:19:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gcFvNv26FgKHwN7cxha57sDJ8dzvmBKf-vtUx82YcoA@mail.gmail.com>
Message-ID: <CAAOTY_9gcFvNv26FgKHwN7cxha57sDJ8dzvmBKf-vtUx82YcoA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
To: matthias.bgg@kernel.org
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzoyM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBkcml2ZXIgd2lsbCBiZSBsb2FkZWQg
YnkgdmlhIGEgcGxhdGZvcm0gZGV2aWNlLiBTbyB3ZQo+IHdpbGwgbmVlZCB0byBnZXQgdGhlIGRl
dmljZV9ub2RlIGZyb20gdGhlIHBhcmVudCBkZXZpY2UuCj4gRGVwZW5kaW5nIG9uIHRoaXMgd2Ug
d2lsbCBzZXQgdGhlIGRyaXZlciBkYXRhLgo+IEFzIGFsbCB0aGlzIGlzIGRvbmUgbGF0ZXIgYWxy
ZWFkeSwganVzdCBkZWxldGUgdGhlIGNhbGwgdG8KPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEu
CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1maXhlcyBbMV0sIHRoYW5rcy4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggZTJiYjBkMTllZjk5Li42M2VjOTJiYTBlOTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00NDcsNyArNDQ3LDYg
QEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICBpZiAoIXByaXZhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+Cj4gLSAgICAgICBwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7Cj4gICAgICAgICBwcml2YXRlLT5tbXN5c19kZXYgPSBkZXYtPnBhcmVudDsKPiAgICAgICAg
IGlmICghcHJpdmF0ZS0+bW1zeXNfZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBNTVNZUyBkZXZpY2VcbiIpOwo+IC0tCj4gMi4yNi4yCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
