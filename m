Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D3AA7D5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C803C6E125;
	Thu,  5 Sep 2019 16:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DFF6E121;
 Thu,  5 Sep 2019 16:01:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w13so3429929wru.7;
 Thu, 05 Sep 2019 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uksgHQqym9FTXjau+CLwDkQVwZBZUZ/0GAHlxLtQEnY=;
 b=ujTd0SzfBWC3du96xjsntBBJs6iWHwNlGEZzc0oZroKii8/s4c/RmVpr6rF7j5TLON
 1YZBnBDBz3htEGPfX4T3l87nEwSffKI3WTdt1SL0XhfNOmvNVR1lJg3yTcC+SG/fs/tt
 DsDQWjjMrvif9ZPEUUgRX8wv+gR4Io9XiaJb58kshqniB2Pqropu9QolA0NNzF/6cXBY
 8MPmAbjYs7roe6TROa/zd3fA5figBrfbzNZX3tcZ9gzczlPpuK2xJRvZyIYLVJGAiZfv
 +EV01sqjwSQUgFSNdkeFmsh5/8Nf/fs1uu64LW7JiJh+A6swCiKNhcaYYnhKg/xaOTzG
 j6tw==
X-Gm-Message-State: APjAAAXOBknaUyoeP3fg4epQlqZvM84OFV+g2N5hByWTIcSxs+eOWSzf
 hddJ43en7Rzw0qdl23PAfHJ0q3k0McRfHHLvJfY=
X-Google-Smtp-Source: APXvYqwuNe6IStrPna5UDpowFs+fcv7r24QevShC0UTiUXAeOYg/rgj/MCFFGcVDbOcUVqD8hjzWoATDmg3xK3VFAVE=
X-Received: by 2002:adf:e286:: with SMTP id v6mr3450317wri.4.1567699314241;
 Thu, 05 Sep 2019 09:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190830212650.5055-1-alexander.deucher@amd.com>
 <CAPM=9tw3xmLCnmckvkG3SzAO82rwj2KMfP2yYw=2-WPWLg7fJQ@mail.gmail.com>
In-Reply-To: <CAPM=9tw3xmLCnmckvkG3SzAO82rwj2KMfP2yYw=2-WPWLg7fJQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Sep 2019 12:01:11 -0400
Message-ID: <CADnq5_MGkEhS1NjHZOkQn0DPMCH_GSEOiLBRGSb5UDebmK4dVA@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.4
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uksgHQqym9FTXjau+CLwDkQVwZBZUZ/0GAHlxLtQEnY=;
 b=fLSOEokxxbkRKzGLtZkwAL2LC6xlP7bnSG2ZCfte/Egy7aFt2XKzZyIfuosoJjh+qI
 XtodXQMwYF3kHp7e21ApR5W7zuHWrM63kb/wmP5RJA/SSbHnzcQQ6aqfiP1TzCqZ8i2T
 aTyKvmhhpdeaXpWg/aWU8KtasxSa2UgF9YNdHF/s6dJAD/TNvnLoQmx//tiaNOYs/Q3H
 YCPfyTXrlaCOKVGExlFZo9iV8k7uJtAwvq6PdPUiP9ruAvFXy2gnTLo5HUKEbQh/IFah
 rLDWZEtMM/+aR8uVqry8ViKBBCFfCO2EyMg4Y0xbeMyHbkr+htkbZX1GZblJocEsrt9E
 Zlxw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAyOjM3IEFNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIDMxIEF1ZyAyMDE5IGF0IDA3OjI3LCBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgRGF2ZSwgRGFuaWVs
LAo+ID4KPiA+IE1vc3RseSBidWcgZml4ZXMuICBUaGUgYmlnIGFkZGl0aW9uIGlzIGRpc3BsYXkg
c3VwcG9ydCBmb3IgcmVub2lyCj4gPiB3aGljaCBpcyBuZXcgZm9yIDUuNC4gIEkgcmVhbGl6ZSBp
dCdzIGEgYml0IGxhdGUgdG8gYWRkIGl0IGJ1dCB0aGUKPiA+IHJlc3Qgb2YgdGhlIGNvZGUgZm9y
IHJlbm9pciBpcyBhbHJlYWR5IGluIHNvIGl0IHdvdWxkIGJlIG5pY2UgdG8KPiA+IGdldCB0aGUg
ZGlzcGxheSBwYXJ0IGluIGFzIHdlbGwuICBJZiBub3QsIGxldCBtZSBrbm93LCBhbmQgSSdsbAo+
ID4gcmVzcGluIHdpdGhvdXQgaXQuICBUaGFua3MhCj4KPiBkaW06IGMwNzJiMGMyNGU2YiAoImRy
bS9hbWRncHU6IGZpeCBHRlhPRkYgb24gUGljYXNzbyBhbmQgUmF2ZW4yIik6Cj4gRml4ZXM6IFNI
QTEgaW4gbm90IHBvaW50aW5nIGF0IGFuIGFuY2VzdG9yOgo+IGRpbTogICAgIDk4ZjU4YWRhMmQz
NyAoImRybS9hbWRncHUvZ2Z4OTogdXBkYXRlIHBnX2ZsYWdzIGFmdGVyCj4gZGV0ZXJtaW5pbmcg
aWYgZ2Z4IG9mZiBpcyBwb3NzaWJsZSIpCj4gZGltOiBFUlJPUjogaXNzdWVzIGluIGNvbW1pdHMg
ZGV0ZWN0ZWQsIGFib3J0aW5nCj4KPiBiMDVmNjVkNzcyMGIxNzJiNmZkZTNhYmZhNDllZDY2ODM3
MDcxZDQ1Cj4gIHNlZW1zIHRvIGJlIHRoZSBjb3JyZWN0IGFuY2VzdG9yIGluIG15IHRyZWUuCgpJ
IGNoZXJyeS1waWNrZWQgdGhhdCBjaGFuZ2UgdG8gLWZpeGVzIGFzIHdlbGw6Cmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9j
b21taXQvP2lkPTk4ZjU4YWRhMmQzNwoKQWxleAoKPgo+IE5vIHByb2JsZW1zIG9uIHRoZSByZW5v
aXIgY29kZS4KPgo+IERhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
