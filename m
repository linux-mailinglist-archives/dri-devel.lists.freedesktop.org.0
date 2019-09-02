Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A4A5CFD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F0589A16;
	Mon,  2 Sep 2019 20:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B5F89105
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:35:41 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id f12so11376716iog.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vnhw4cu5Y19Ngs/FcBn3AtSwpWd+bzaeBt1B8o4ltr0=;
 b=JwsPdvVp8wLTMMFJ+FrYdcMg8DVNcQvdultjZ3GIaVmssjetig86kJOFLxNpzFMGts
 TFWGsdkA7gq5DBAMwQU+gkXeJ6uBkSEspDvHXsZi8VF8LEz8HrKjKroWO2XJ2dlfxrSx
 b7U4F2m9HN4IFj2Rw0UzT7Yk3nA5wY/BdJR+0UirW5cONhjhJ3PLBDePQh9UKkKV0TOt
 MZ4ORV+bqsdgejSiwdSXxg8nQ9IEGzH9/SJ+iyWnU+ZV6GefH/ORq6RdqfoXjTzqG23H
 XhTgMyO1CxuvSCjV7fLwtdw+7B7f8jpc4OVS9ZfccLVO+M3f6998F/U/kmDDznCc6OOy
 W0MA==
X-Gm-Message-State: APjAAAUsddztKM74Eom/zZ+vH26DABBTjN54KZo2JyjjLIZ9UX9Oylz6
 m4C5ujdyQe4PL58ZY3SrAI7Zwoy7U5E6XzGsZI770R6E
X-Google-Smtp-Source: APXvYqwH4WnK2YgFBebstftIqR2c3baQcgor+d3PzdCtsmEbNLL45XxEHTEDeCGgnIkf7NhdFMpzDt1Jmy5oZMTkWgQ=
X-Received: by 2002:a5d:870b:: with SMTP id u11mr29928734iom.220.1567427741022; 
 Mon, 02 Sep 2019 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190902093137.GI32232@dell>
In-Reply-To: <20190902093137.GI32232@dell>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2019 14:35:30 +0200
Message-ID: <CAMRc=Me2FYJDDHo=8noU5bPNdPXBL23jDU_3XQiPfRJ3-pGh7g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Lee Jones <lee.jones@linaro.org>
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vnhw4cu5Y19Ngs/FcBn3AtSwpWd+bzaeBt1B8o4ltr0=;
 b=qpXZrNFOf8FMkMWjsohOjNNDkWvo69WRgme+57+rTRmXKIOiO1IiNxMMiGWCQSg94p
 uKQg1D4YEnLemazeoGnZOS6K926UhvmB4PXev0a0SIEKpuA04Frl8bbWXiPZzrc0iZpU
 S4kbzpImRnUHETvZHhfHwZEPB8D8zYmyebN2Ht/yydHW+1WdeXyGygmDjzQ4P1yCV0xv
 jIVdjwpC34AgTkw54p5aFkpzLRm0cjkZ050coecWNregtgHKkGE2lkr6argOPvK6AB4v
 RXkbdicD7E7yBQJ/cJLAX1RMugFIrBYYajEWSQxVQ+BhXGyVq7OdZkN609bfjzKec+6e
 6ehQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG9uLiwgMiB3cnogMjAxOSBvIDExOjMxIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gV2VkLCAyNCBKdWwgMjAxOSwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJh
eWxpYnJlLmNvbT4KPiA+Cj4gPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxh
dGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFdIEkgbm90aWNlZAo+ID4gdGhhdCB3ZSBjb3VsZCBzaW1w
bGlmeSB0aGUgZHJpdmVyIGlmIHdlIG1hZGUgdGhlIG9ubHkgdXNlciBvZiBwbGF0Zm9ybQo+ID4g
ZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZpY2UgcHJvcGVydGllcy4gVGhpcyBzZXJpZXMg
dHJpZXMgdG8gZG8KPiA+IHRoYXQuCj4gPgo+ID4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgYWxsIG5l
Y2Vzc2FyeSBkYXRhIHN0cnVjdHVyZXMgdG8gZWNvdmVjMjQuIFBhdGNoCj4gPiAyLzcgdW5pZmll
cyBtdWNoIG9mIHRoZSBjb2RlIGZvciBib3RoIHBkYXRhIGFuZCBub24tcGRhdGEgY2FzZXMuIFBh
dGNoZXMKPiA+IDMtNC83IHJlbW92ZSB1bnVzZWQgcGxhdGZvcm0gZGF0YSBmaWVsZHMuIExhc3Qg
dGhyZWUgcGF0Y2hlcyBjb250YWluCj4gPiBhZGRpdGlvbmFsIGltcHJvdmVtZW50cyBmb3IgdGhl
IEdQSU8gYmFja2xpZ2h0IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJlYWR5Cj4gPiBtb2RpZnlpbmcg
aXQuCj4gPgo+ID4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkg
dGhpcyB3b3Jrcy4gT25seSBjb21waWxlCj4gPiB0ZXN0ZWQuCj4gPgo+ID4gWzFdIGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE5LzYvMjUvOTAwCj4gPgo+ID4gdjEgLT4gdjI6Cj4gPiAtIHJlYmFz
ZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5nZXMg
ZnJvbSBBbmR5Cj4gPiAtIGFkZGVkIGFkZGl0aW9uYWwgdHdvIHBhdGNoZXMgd2l0aCBtaW5vciBp
bXByb3ZlbWVudHMKPiA+Cj4gPiB2MiAtPiB2MzoKPiA+IC0gaW4gcGF0Y2ggNy83OiB1c2VkIGlu
aXRpYWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQgZGV2IGxvY2FsIHZhcnMKPiA+
Cj4gPiBCYXJ0b3N6IEdvbGFzemV3c2tpICg3KToKPiA+ICAgc2g6IGVjb3ZlYzI0OiBhZGQgYWRk
aXRpb25hbCBwcm9wZXJ0aWVzIHRvIHRoZSBiYWNrbGlnaHQgZGV2aWNlCj4gPiAgIGJhY2tsaWdo
dDogZ3Bpbzogc2ltcGxpZnkgdGhlIHBsYXRmb3JtIGRhdGEgaGFuZGxpbmcKPiA+ICAgc2g6IGVj
b3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCj4gPiAgIGJh
Y2tsaWdodDogZ3BpbzogcmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBkYXRhCj4g
PiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIGRldiBmcm9tIHN0cnVjdCBncGlvX2JhY2tsaWdo
dAo+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBkZWZfdmFsdWUgZnJvbSBzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHQKPiA+ICAgYmFja2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUg
Zm9yICZwZGV2LT5kZXYKPiA+Cj4gPiAgYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1
cC5jICAgICAgICAgfCAzMyArKysrKystLQo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMgICAgIHwgODIgKysrKystLS0tLS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaCB8ICAzIC0KPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQo+Cj4gQ2FuIHlvdSBj
b2xsZWN0IGFsbCB5b3VyIEFja3MgYW5kIHJlLXN1Ym1pdCBwbGVhc2U/Cj4KCkRvbmUuCgpCYXJ0
Cgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gTGluYXJvIFNlcnZpY2VzIFRlY2huaWNh
bCBMZWFkCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
Cj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
