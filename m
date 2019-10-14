Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C47D5D2F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1A089E3E;
	Mon, 14 Oct 2019 08:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ED289E3E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:12:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so16150743wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+deUZXsERBoIwuF8w37rkTqOJuJ0YNPkmp+VXhLAItk=;
 b=P4Wi3xwS60HtMCzvWwS+vZI1dgX8q331uV1Bmt9TPUxpBLIimhVY3k+F6InZFiqbfq
 fgTkecUHk92akttHrbJ7525+1u9uQITr7/l6U3Nbiucv4fKqxg6wsAhw0tqaSaf/rQ/A
 hnRaqJPBQ15HsjzyzJ+C5fTiBoueW7+k8qyfniVQbmwaJ1ER06YljsCLfdUR+WPEMkTY
 EVKqZyha1jHXtZ0gEM7v8m5gF0+ip+HwL4GcQqhfT2KL932IWHNqL/hdX06D0Qez3l74
 L9ELc9vsPTYJygBD+ll4xSWMUJPOODcG2K01NJlAdb1EpLDi7Nz0CQcB37ufGARduXU6
 lZOA==
X-Gm-Message-State: APjAAAVszhwSXnfWaFMTiw5wHITP4e43SdW9uoXwdJfenPQahidGCECo
 SgH+t1EqkPb4Bl/HwHZIZZVaPw==
X-Google-Smtp-Source: APXvYqzzMPmMnU/mdIbw3oXsYhkR72iWEBpRtwUxn8lSxoffzDIn8VIjfySG7MOoXzNCS5f6xEQ2pA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr13965770wmj.2.1571040743235;
 Mon, 14 Oct 2019 01:12:23 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id c9sm16087692wrt.7.2019.10.14.01.12.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 01:12:22 -0700 (PDT)
Date: Mon, 14 Oct 2019 09:12:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
Message-ID: <20191014081220.GK4545@dell>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=+deUZXsERBoIwuF8w37rkTqOJuJ0YNPkmp+VXhLAItk=;
 b=LD7yH42N59JCCaLRFfXRFerOH8rkSLiF+LkhxjTWD8eNTeij5IMQn1woDobFZE2iCw
 T7PRQ5NqIOzxbidAmveDF27g/uRI4cYMXqKO/PiT6vh6oSEh5FGBE6Qpt93GBWqnaEGH
 lmBXwIYnLtN3udyc40lT+rQqfc2okHAYI2K6oBmuKA/w4jSTcX3jV3q0ApsAULz+4gmY
 VlAEmK5rk0W33jfbswlq2l3XI2DuvEvHpgXpf26c0IXqlDSe7GMgnINcA03sbbgoQM7N
 T1vcoiZ56aqBt+IXEp1ThrluAiAOm+Bm/XI852XhW4XdnC238NJb/RqDGBbxXyCEc5Yf
 dWwQ==
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gRnJvbTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiAKPiBXaGls
ZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFd
IEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRl
IHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRl
dmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBkbwo+IHRoYXQuCj4gCj4gVGhl
IGZpcnN0IHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhIHN0cnVjdHVyZXMgdG8gZWNvdmVj
MjQuIFBhdGNoCj4gMi83IHVuaWZpZXMgbXVjaCBvZiB0aGUgY29kZSBmb3IgYm90aCBwZGF0YSBh
bmQgbm9uLXBkYXRhIGNhc2VzLiBQYXRjaGVzCj4gMy00LzcgcmVtb3ZlIHVudXNlZCBwbGF0Zm9y
bSBkYXRhIGZpZWxkcy4gTGFzdCB0aHJlZSBwYXRjaGVzIGNvbnRhaW4KPiBhZGRpdGlvbmFsIGlt
cHJvdmVtZW50cyBmb3IgdGhlIEdQSU8gYmFja2xpZ2h0IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJl
YWR5Cj4gbW9kaWZ5aW5nIGl0Lgo+IAo+IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBIVyBi
dXQgaG9wZWZ1bGx5IHRoaXMgd29ya3MuIE9ubHkgY29tcGlsZQo+IHRlc3RlZC4KPiAKPiBbMV0g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85MDAKPiAKPiB2MSAtPiB2MjoKPiAtIHJl
YmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5n
ZXMgZnJvbSBBbmR5Cj4gLSBhZGRlZCBhZGRpdGlvbmFsIHR3byBwYXRjaGVzIHdpdGggbWlub3Ig
aW1wcm92ZW1lbnRzCj4gCj4gdjIgLT4gdjM6Cj4gLSBpbiBwYXRjaCA3Lzc6IHVzZWQgaW5pdGlh
bGl6ZXJzIHRvIHNldCB2YWx1ZXMgZm9yIHBkYXRhIGFuZCBkZXYgbG9jYWwgdmFycwo+IAo+IHYz
IC0+IHY0Ogo+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuNC1yYzEKPiAtIHJlbW92ZWQgY2hhbmdl
cyB0aGF0IGFyZSBubyBsb25nZXIgcmVsZXZhbnQgYWZ0ZXIgY29tbWl0IGVjNjY1Yjc1NmU2Zgo+
ICAgKCJiYWNrbGlnaHQ6IGdwaW8tYmFja2xpZ2h0OiBDb3JyZWN0IGluaXRpYWwgcG93ZXIgc3Rh
dGUgaGFuZGxpbmciKQo+IC0gYWRkZWQgcGF0Y2ggNy83Cj4gCj4gdjQgLT5WNToKPiAtIGluIHBh
dGNoIDcvNzogYWRkZWQgYSBjb21tZW50IHJlcGxhY2luZyB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rp
b24gYmVpbmcKPiAgIHB1bGxlZCBpbnRvIHByb2JlKCkKPiAKPiBCYXJ0b3N6IEdvbGFzemV3c2tp
ICg3KToKPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVubmVlZGVkIGluY2x1ZGUKPiAgIHNo
OiBlY292ZWMyNDogYWRkIGFkZGl0aW9uYWwgcHJvcGVydGllcyB0byB0aGUgYmFja2xpZ2h0IGRl
dmljZQo+ICAgYmFja2xpZ2h0OiBncGlvOiBzaW1wbGlmeSB0aGUgcGxhdGZvcm0gZGF0YSBoYW5k
bGluZwo+ICAgc2g6IGVjb3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9y
bSBkYXRhCj4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSB1bnVzZWQgZmllbGRzIGZyb20gcGxh
dGZvcm0gZGF0YQo+ICAgYmFja2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUgZm9y
ICZwZGV2LT5kZXYKPiAgIGJhY2tsaWdodDogZ3BpbzogcHVsbCBncGlvX2JhY2tsaWdodF9pbml0
aWFsX3Bvd2VyX3N0YXRlKCkgaW50byBwcm9iZQo+IAo+ICBhcmNoL3NoL2JvYXJkcy9tYWNoLWVj
b3ZlYzI0L3NldHVwLmMgICAgICAgICB8ICAzMyArKysrLS0KCkkgZ3Vlc3Mgd2UncmUganVzdCB3
YWl0aW5nIGZvciB0aGUgU0ggQWNrcyBub3c/Cgo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jICAgICB8IDEwOCArKysrKy0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUv
bGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oIHwgICAzIC0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA5MSBkZWxldGlvbnMoLSkKPiAKCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
