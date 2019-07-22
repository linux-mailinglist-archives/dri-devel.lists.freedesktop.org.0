Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1987128C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585566E062;
	Tue, 23 Jul 2019 07:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8892489A83
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:27:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y17so12144922ljk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 01:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nj8hr54aC91iZO9zPn8MMR4EigRoMAm4mTd0A3+k1NE=;
 b=jRdOpG+4GvawBavj+zpj+y4HgviQjvZxF0WNsOOgb/8Qb+G2LEjCF+nizOemfHHWcT
 A6OnirdxpzaTmfK6+E1DK4XLELLYj4hXE7bcNP8cOAekfS8NIXM2tRCn5ZzGp34sOWoK
 HvTo2Qxd5lym4H/LCtIhUZIJYDlu4nd0NkBbdMEe7hsn4Tt68y53IQ2uf7UHdygIQtSC
 yBW/TeHTfbLfd9+X1Dfi8U8EyNXzXqsUxid6N22DEXMPcRTNQ5GLs41559yE/LPvIAJH
 LEFet2bX4mHiMPKqWESSSyDHnHKxqeRZzfGmNNhitMCpHdLMcKkktAtIZ7NyM+xyq8to
 xMfQ==
X-Gm-Message-State: APjAAAUz+lbu8uQdu4aCpc3DgwYMejQK+buArymlmMAvu4ZGUpbDsDoT
 y3lcZqqsCG7HskUTQFwrddGhvoGLTtICv6Ey3HE=
X-Google-Smtp-Source: APXvYqwyDiZeM7CIZXMroBkoG2dnBbbNmuL1qR3F0kaVqk9dbQIfb9/GjjWTnFV6oLhY9burQ68yiDemISxthkZmRUM=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr24641129ljk.152.1563784023026; 
 Mon, 22 Jul 2019 01:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <1562782586-3994-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1562782586-3994-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 22 Jul 2019 13:56:51 +0530
Message-ID: <CAFqt6zaNcNdxcT2WLOvL0LTX_R9ShRNx6UW6s4k+wc=Zj2MaSg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: nvidia: Remove dead code
To: adaplas@gmail.com, b.zolnierkie@samsung.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nj8hr54aC91iZO9zPn8MMR4EigRoMAm4mTd0A3+k1NE=;
 b=hP5neMlyz+5e+2U8xDlE89eOLeTQWHaifGHF/QjpvKArO1BhhnEsqT7HfLg9KGm/qq
 qIlacbQp7CcFspokSaYv541f0QtAhFynrZGozw8oMU/qBIcvkfJVZrU4S+SJm6VYc0aX
 f8zJTvmroLD6bt+a1ZpBpbYye4JVoJ7yalM9I7ypuMDnyA0XSGC82n76FuLSIvytLjje
 nEI58UEqbDznzAcxz+0ma6vKfsFuhxI6cFn73UmXAaHE2NTYJviyzBaph9Edaq4c2CGw
 6nNbCothbaDr1NUvgUJhDFKig8UrVfqLN8Ab8baYlI+iCE/Dmi4LfZaMwjBw+8Z92hwC
 7Sjg==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTE6NDEgUE0gU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBkZWFkIGNvZGUgc2luY2UgMy4xNS4g
SWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2UgaXQKPiBmdXJ0aGVyLCB0aGlzIGNhbiBiZSByZW1v
dmVkIGZvcmV2ZXIuCgpBbnkgY29tbWVudCBvbiB0aGlzIHBhdGNoID8KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy92aWRlby9mYmRldi9udmlkaWEvbnZfc2V0dXAuYyB8IDI0IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZfc2V0dXAuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvbnZpZGlhL252X3NldHVwLmMKPiBpbmRleCBiMTdhY2QyLi4yZmE2ODY2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252X3NldHVwLmMKPiArKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9zZXR1cC5jCj4gQEAgLTExOSwzNCArMTE5LDEwIEBA
IHU4IE5WUmVhZE1pc2NPdXQoc3RydWN0IG52aWRpYV9wYXIgKnBhcikKPiAgewo+ICAgICAgICAg
cmV0dXJuIChWR0FfUkQwOChwYXItPlBWSU8sIFZHQV9NSVNfUikpOwo+ICB9Cj4gLSNpZiAwCj4g
LXZvaWQgTlZFbmFibGVQYWxldHRlKHN0cnVjdCBudmlkaWFfcGFyICpwYXIpCj4gLXsKPiAtICAg
ICAgIHZvbGF0aWxlIHU4IHRtcDsKPiAtCj4gLSAgICAgICB0bXAgPSBWR0FfUkQwOChwYXItPlBD
SU8sIHBhci0+SU9CYXNlICsgMHgwYSk7Cj4gLSAgICAgICBWR0FfV1IwOChwYXItPlBDSU8sIFZH
QV9BVFRfSVcsIDB4MDApOwo+IC0gICAgICAgcGFyLT5wYWxldHRlRW5hYmxlZCA9IDE7Cj4gLX0K
PiAtdm9pZCBOVkRpc2FibGVQYWxldHRlKHN0cnVjdCBudmlkaWFfcGFyICpwYXIpCj4gLXsKPiAt
ICAgICAgIHZvbGF0aWxlIHU4IHRtcDsKPiAtCj4gLSAgICAgICB0bXAgPSBWR0FfUkQwOChwYXIt
PlBDSU8sIHBhci0+SU9CYXNlICsgMHgwYSk7Cj4gLSAgICAgICBWR0FfV1IwOChwYXItPlBDSU8s
IFZHQV9BVFRfSVcsIDB4MjApOwo+IC0gICAgICAgcGFyLT5wYWxldHRlRW5hYmxlZCA9IDA7Cj4g
LX0KPiAtI2VuZGlmICAvKiAgMCAgKi8KPiAgdm9pZCBOVldyaXRlRGFjTWFzayhzdHJ1Y3QgbnZp
ZGlhX3BhciAqcGFyLCB1OCB2YWx1ZSkKPiAgewo+ICAgICAgICAgVkdBX1dSMDgocGFyLT5QRElP
LCBWR0FfUEVMX01TSywgdmFsdWUpOwo+ICB9Cj4gLSNpZiAwCj4gLXU4IE5WUmVhZERhY01hc2so
c3RydWN0IG52aWRpYV9wYXIgKnBhcikKPiAtewo+IC0gICAgICAgcmV0dXJuIChWR0FfUkQwOChw
YXItPlBESU8sIFZHQV9QRUxfTVNLKSk7Cj4gLX0KPiAtI2VuZGlmICAvKiAgMCAgKi8KPiAgdm9p
ZCBOVldyaXRlRGFjUmVhZEFkZHIoc3RydWN0IG52aWRpYV9wYXIgKnBhciwgdTggdmFsdWUpCj4g
IHsKPiAgICAgICAgIFZHQV9XUjA4KHBhci0+UERJTywgVkdBX1BFTF9JUiwgdmFsdWUpOwo+IC0t
Cj4gMS45LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
