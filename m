Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75D9FD40
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15427896E9;
	Wed, 28 Aug 2019 08:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B19F896E9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:36:59 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o101so1954936ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 01:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Erove1KI2K6GKd3UFaZlGI+A1u6CspqOGbjftwYs2o=;
 b=BdgZPjC3G50EJpq80PHOkqxOqwiosRAMvz0bL1dqzTmuMUkUTPGe76N8Wr4iyfF+Ob
 k3bR1nSX4R4YWofzLuWs45295wIhY/3PVAadQQWqC58/W4M8BHtS13pPhwwSYKmF48ly
 By4XkIXJny88PcZJbvD8FHsiq2DQN4oi2gDMdWSwy++DH8Xq8E9QOcHjMRljH12xPtOV
 Lv9ImGO/iC1kii1AL170CkIHcNN9I+CW353uAI39r8pIEOIslaL22A8XKMUMM9y1nkna
 68aJnO2HlcBfoJSITQPWAsYCTQjz2re/4DyDeB7lRq/+TslXTabCm/XK8Y5l/wJrbcB8
 Ntbw==
X-Gm-Message-State: APjAAAUbr9Nu69MyKfmwLfXe86WRkiISD55NwTxavzNSa+52FYo1bW2X
 +7bP0HYoCA9Z6hTj6/gocBBhVZwDmMAXhqi1OUe1Nw==
X-Google-Smtp-Source: APXvYqwTqVVwndN/cmFOt6L70c8aRtBjQJbRXGGSl1zhN+C4xJfXzPvGeTsPdgjseoyM2bIW2gDueQGp86hfFZCk314=
X-Received: by 2002:a9d:2cc:: with SMTP id 70mr2261989otl.145.1566981418736;
 Wed, 28 Aug 2019 01:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
 <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
In-Reply-To: <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2019 10:36:47 +0200
Message-ID: <CAMuHMdV3obGtQ7qohNedQNgpvZvyL9xjH0HUiBKD6b8Ou5F+XA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q0MgdGhlIHBvdXIgc291bCB3aXRoIHRoZSBlY292ZWMgYm9hcmQuCgpPbiBXZWQsIEF1ZyAyOCwg
MjAxOSBhdCA5OjMzIEFNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3Rl
Ogo+IHB0LiwgMTYgc2llIDIwMTkgbyAxNzo0OCBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJn
ZGV2LnBsPiBuYXBpc2HFgihhKToKPiA+IGN6dy4sIDggc2llIDIwMTkgbyAxMDoxNyBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiBuYXBpc2HFgihhKToKPiA+ID4gxZtyLiwgMjQg
bGlwIDIwMTkgbyAxMDoyNSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiBuYXBp
c2HFgihhKToKPiA+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lA
YmF5bGlicmUuY29tPgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgd29ya2luZyBvbiBteSBvdGhlciBz
ZXJpZXMgcmVsYXRlZCB0byBncGlvLWJhY2tsaWdodFsxXSBJIG5vdGljZWQKPiA+ID4gPiB0aGF0
IHdlIGNvdWxkIHNpbXBsaWZ5IHRoZSBkcml2ZXIgaWYgd2UgbWFkZSB0aGUgb25seSB1c2VyIG9m
IHBsYXRmb3JtCj4gPiA+ID4gZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZpY2UgcHJvcGVy
dGllcy4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KPiA+ID4gPiB0aGF0Lgo+ID4gPiA+Cj4gPiA+
ID4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhIHN0cnVjdHVyZXMgdG8g
ZWNvdmVjMjQuIFBhdGNoCj4gPiA+ID4gMi83IHVuaWZpZXMgbXVjaCBvZiB0aGUgY29kZSBmb3Ig
Ym90aCBwZGF0YSBhbmQgbm9uLXBkYXRhIGNhc2VzLiBQYXRjaGVzCj4gPiA+ID4gMy00LzcgcmVt
b3ZlIHVudXNlZCBwbGF0Zm9ybSBkYXRhIGZpZWxkcy4gTGFzdCB0aHJlZSBwYXRjaGVzIGNvbnRh
aW4KPiA+ID4gPiBhZGRpdGlvbmFsIGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8gYmFja2xpZ2h0
IGRyaXZlciB3aGlsZSB3ZSdyZSBhbHJlYWR5Cj4gPiA+ID4gbW9kaWZ5aW5nIGl0Lgo+ID4gPiA+
Cj4gPiA+ID4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkgdGhp
cyB3b3Jrcy4gT25seSBjb21waWxlCj4gPiA+ID4gdGVzdGVkLgo+ID4gPiA+Cj4gPiA+ID4gWzFd
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMjUvOTAwCj4gPiA+ID4KPiA+ID4gPiB2MSAt
PiB2MjoKPiA+ID4gPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0
byB0aGUgcmVjZW50IGNoYW5nZXMgZnJvbSBBbmR5Cj4gPiA+ID4gLSBhZGRlZCBhZGRpdGlvbmFs
IHR3byBwYXRjaGVzIHdpdGggbWlub3IgaW1wcm92ZW1lbnRzCj4gPiA+ID4KPiA+ID4gPiB2MiAt
PiB2MzoKPiA+ID4gPiAtIGluIHBhdGNoIDcvNzogdXNlZCBpbml0aWFsaXplcnMgdG8gc2V0IHZh
bHVlcyBmb3IgcGRhdGEgYW5kIGRldiBsb2NhbCB2YXJzCj4gPiA+ID4KPiA+ID4gPiBCYXJ0b3N6
IEdvbGFzemV3c2tpICg3KToKPiA+ID4gPiAgIHNoOiBlY292ZWMyNDogYWRkIGFkZGl0aW9uYWwg
cHJvcGVydGllcyB0byB0aGUgYmFja2xpZ2h0IGRldmljZQo+ID4gPiA+ICAgYmFja2xpZ2h0OiBn
cGlvOiBzaW1wbGlmeSB0aGUgcGxhdGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gPiA+ICAgc2g6IGVj
b3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCj4gPiA+ID4g
ICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSB1bnVzZWQgZmllbGRzIGZyb20gcGxhdGZvcm0gZGF0
YQo+ID4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgZGV2IGZyb20gc3RydWN0IGdwaW9f
YmFja2xpZ2h0Cj4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBkZWZfdmFsdWUgZnJv
bSBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQKPiA+ID4gPiAgIGJhY2tsaWdodDogZ3BpbzogdXNlIGEg
aGVscGVyIHZhcmlhYmxlIGZvciAmcGRldi0+ZGV2Cj4gPiA+ID4KPiA+ID4gPiAgYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAzMyArKysrKystLQo+ID4gPiA+
ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDgyICsrKysr
LS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlv
X2JhY2tsaWdodC5oIHwgIDMgLQo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKyksIDc0IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjIxLjAK
PiA+ID4gPgo+ID4gPgo+ID4gPiBIaSBSaWNoLCBZb3NoaW5vcmksCj4gPiA+Cj4gPiA+IGNhbiB5
b3UgYWNrIHRoZSBzaCBwYXRjaGVzIGluIHRoaXMgc2VyaWVzPwo+ID4gPgo+ID4gPiBCYXJ0Cj4g
Pgo+ID4gUGluZy4KPgo+IEhpLAo+Cj4gYW55IGNoYW5jZSBvZiBnZXR0aW5nIHRoaXMgcmV2aWV3
ZWQgZm9yIHNoPwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
