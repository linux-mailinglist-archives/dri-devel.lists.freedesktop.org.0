Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40724C504
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2CA6E9B5;
	Thu, 20 Aug 2020 18:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810476E9AD;
 Thu, 20 Aug 2020 18:04:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so2948486wrs.8;
 Thu, 20 Aug 2020 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LeRFjvgtCyux0Evs7yc9oix8Hrc6YHLHgKJRYeIXm9g=;
 b=FAGJH2JEUEHoCpdJw0cm0l3P4WYL3CMpFPdt/cXsAiWunaoSJDC99Yn/qyuqxeqmiW
 W02MYpgl8MdBhhC3brLb94opDv9BFtKvYAd7Z/xuwM1nQ9bW6ZaEtwVsQIhgN5SihIAs
 YJMnNrtYLoDlm18vYsX5W7ygrcaX+W2iN5ljtsOtP2yKTGa5FTm5x/axEDPPpZhe52u8
 RsQyi70djMGrTcUhSGcjMi0YxESh6TTuIlCZ+sF/14PnMp1hVCRhgR0IFjZyDLrDCbY9
 +FxnW2I9LOREnPga+AqrlhdAfpQ5+zdOXOiCBMm7CI+vdKFdTXzbWso0SmbZoIAvJOxS
 2+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LeRFjvgtCyux0Evs7yc9oix8Hrc6YHLHgKJRYeIXm9g=;
 b=f3TD8yXAFSQub1hBZHGhEXlujDYcN6EKOKKiDuVldMDHAn+cJWZv8RVW20v+2bpLFo
 vm2Z4/YTMmf5yEHNeenP5MFsK+GqrihkOCd+PC9Oa9AV3lObBZj/IzrutsOCA+SzxET+
 bChSKphQvxCK+UfuhbCQUkEtnLdMNc0ykQbT5DlkWSoXZTN8+aSVPirZMOZ/emeQgzLx
 h79I0DaK6/EtZMYFfBzEgrXmqyI3b8jj4dENDZQLM3zusIyncqoLuQ3YBDfS/0CmrFt8
 SqOZKHUUGl3iVkpLklsXvrkwbNYSrE1aK49gwcbmplL8jCJ2MFiIHfqjzu4ayJpK3mBp
 qtdg==
X-Gm-Message-State: AOAM531p1AobPcQD6ky5+l4CeKl2ZWhns0elvC1LPPgdPxxlBUh7UuHb
 DK62KsbJCD4n0Z/FBwzHl9XKGhX7klo4TI6oigs=
X-Google-Smtp-Source: ABdhPJwFnxDVqryk2d5u+r3zOBTy3CQLKMNm1UXJVNWqLw1pNA8KPsrtB2vGwU+fkyhUIVCSBQXWSnYpAJOS0XhlCqg=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr4587835wrs.124.1597946643168; 
 Thu, 20 Aug 2020 11:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081808.26796-1-lukas.bulwahn@gmail.com>
 <f0d3f57c-416c-6a6a-0e9e-d3dc308f2b52@amd.com>
In-Reply-To: <f0d3f57c-416c-6a6a-0e9e-d3dc308f2b52@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Aug 2020 14:03:52 -0400
Message-ID: <CADnq5_NXykUUP8j53EEzo0uDtheokCkjEvjOF+DPaOT=a40=9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unintended executable mode
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Guchun Chen <guchun.chen@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jerry Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgQXVnIDE5LCAyMDIwIGF0IDQ6NTMgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDE5LjA4LjIwIHVtIDEwOjE4IHNjaHJpZWIgTHVrYXMgQnVsd2FobjoKPiA+IEJlc2lkZXMgdGhl
IGludGVuZGVkIGNoYW5nZSwgY29tbWl0IDRjYzExNzhlMTY2YSAoImRybS9hbWRncHU6IHJlcGxh
Y2UgRFJNCj4gPiBwcmVmaXggd2l0aCBQQ0kgZGV2aWNlIGluZm8gZm9yIGdmeC9tbWh1YiIpIGFs
c28gc2V0IHRoZSBzb3VyY2UgZmlsZXMKPiA+IG1taHViX3YxXzAuYyBhbmQgZ2Z4X3Y5XzQuYyB0
byBiZSBleGVjdXRhYmxlLCBpLmUuLCBjaGFuZ2VkIGZyb21vbGQgbW9kZQo+ID4gNjQ0IHRvIG5l
dyBtb2RlIDc1NS4KPiA+Cj4gPiBDb21taXQgMjQxYjJlYzkzMTdlICgiZHJtL2FtZC9kaXNwbGF5
OiBBZGQgZGNuMzAgSGVhZGVycyAodjIpIikgYWRkZWQgdGhlCj4gPiBmb3VyIGhlYWRlciBmaWxl
cyB7ZHBjcyxkY259XzNfMF8wX3tvZmZzZXQsc2hfbWFza30uaCBhcyBleGVjdXRhYmxlLCBpLmUu
LAo+ID4gbW9kZSA3NTUuCj4gPgo+ID4gU2V0IHRvIHRoZSB1c3VhbCBtb2RlcyBmb3Igc291cmNl
IGFuZCBoZWFkZXJzIGZpbGVzIGFuZCBjbGVhbiB1cCB0aG9zZQo+ID4gbWlzdGFrZXMuIE5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1
a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiBhcHBsaWVzIGNsZWFubHkg
b24gY3VycmVudCBtYXN0ZXIgYW5kIG5leHQtMjAyMDA4MTkKPiA+Cj4gPiBBbGV4LCBDaHJpc3Rp
YW4sIHBsZWFzZSBwaWNrIHRoaXMgbWlub3Igbm9uLXVyZ2VudCBjbGVhbnVwIHBhdGNoLgo+Cj4g
QWxleCBpcyB1c3VhbGx5IHRoZSBvbmUgcGlja2luZyB0aG9zZSB1cC4gSWYgaGUgbWlzc2VzIHNv
bWV0aGluZyBmZWVsCj4gZnJlZSB0byBwaW5nIHVzIG9uY2UgbW9yZS4KPgo+IFRoYW5rcywKPiBD
aHJpc3RpYW4uCj4KPiA+Cj4gPiBEZW5uaXMsIEplcnJ5LCBwbGVhc2UgYWNrLgo+ID4KPiA+IERl
bm5pcywgSmVycnksIHlvdSBtaWdodCB3YW50IHRvIGNoZWNrIHlvdXIgZGV2ZWxvcG1lbnQgZW52
aXJvbm1lbnQKPiA+IGludHJvZHVjaW5nIHRob3NlIGV4ZWN1dGFibGUgbW9kZXMgb24gZmlsZXMu
Cj4gPgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNC5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMAo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92MV8wLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMAo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2Rjbl8zXzBfMF9vZmZzZXQuaCAgIHwgMAo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2Rjbl8zXzBfMF9zaF9tYXNr
LmggIHwgMAo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2Rw
Y3NfM18wXzBfb2Zmc2V0LmggIHwgMAo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
YXNpY19yZWcvZGNuL2RwY3NfM18wXzBfc2hfbWFzay5oIHwgMAo+ID4gICA2IGZpbGVzIGNoYW5n
ZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKPiA+ICAgbW9kZSBjaGFuZ2UgMTAw
NzU1ID0+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNC5jCj4gPiAg
IG1vZGUgY2hhbmdlIDEwMDc1NSA9PiAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bW1odWJfdjFfMC5jCj4gPiAgIG1vZGUgY2hhbmdlIDEwMDc1NSA9PiAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL2Rjbi9kY25fM18wXzBfb2Zmc2V0LmgKPiA+ICAg
bW9kZSBjaGFuZ2UgMTAwNzU1ID0+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
YXNpY19yZWcvZGNuL2Rjbl8zXzBfMF9zaF9tYXNrLmgKPiA+ICAgbW9kZSBjaGFuZ2UgMTAwNzU1
ID0+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2RwY3Nf
M18wXzBfb2Zmc2V0LmgKPiA+ICAgbW9kZSBjaGFuZ2UgMTAwNzU1ID0+IDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2RwY3NfM18wXzBfc2hfbWFzay5oCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV80LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNC5jCj4gPiBvbGQgbW9kZSAxMDA3
NTUKPiA+IG5ldyBtb2RlIDEwMDY0NAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L21taHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHVi
X3YxXzAuYwo+ID4gb2xkIG1vZGUgMTAwNzU1Cj4gPiBuZXcgbW9kZSAxMDA2NDQKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2Rjbl8zXzBf
MF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9kY24vZGNu
XzNfMF8wX29mZnNldC5oCj4gPiBvbGQgbW9kZSAxMDA3NTUKPiA+IG5ldyBtb2RlIDEwMDY0NAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9kY24v
ZGNuXzNfMF8wX3NoX21hc2suaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3Jl
Zy9kY24vZGNuXzNfMF8wX3NoX21hc2suaAo+ID4gb2xkIG1vZGUgMTAwNzU1Cj4gPiBuZXcgbW9k
ZSAxMDA2NDQKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvZGNuL2RwY3NfM18wXzBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvYXNpY19yZWcvZGNuL2RwY3NfM18wXzBfb2Zmc2V0LmgKPiA+IG9sZCBtb2RlIDEwMDc1NQo+
ID4gbmV3IG1vZGUgMTAwNjQ0Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2FzaWNfcmVnL2Rjbi9kcGNzXzNfMF8wX3NoX21hc2suaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9kY24vZHBjc18zXzBfMF9zaF9tYXNrLmgKPiA+IG9sZCBt
b2RlIDEwMDc1NQo+ID4gbmV3IG1vZGUgMTAwNjQ0Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
