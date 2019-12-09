Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015F2116E37
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 14:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2876B89CA4;
	Mon,  9 Dec 2019 13:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03CC89CA4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 13:55:06 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id d6so5589726uam.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 05:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9o3u8x33+G2twfJE746oiIUkUFZh9fPdh3dQp71KR7A=;
 b=Nh7TtxFoVnnlOVIwx1prub3WBt5xvLbYH5n6Gc5I6vI/M9VXOwyLRJGpdACXk9ILtX
 8y6zrsrd76DmHLHcsU0TxVoEb5UhVoq6nL4VOA+UgiLE6Tulatu/TS6ahLjPkMiHqUp9
 I4Wgc6beyytEO2wTChRo7cYIoBNdM2udlL+vBYeObpF+g8emCbsGRUv/7mjRAAcp047c
 968jyNc7ZikPSh3O6XJLZM/vp1RbNoe1Lc4zZYT2v8+hFrHamjse56V+DkQY9MjAKH9P
 Oup/QSRMPfJdw9tqV7NkQTXhK2C7q74JAU7Kv6yqLAVYi1JHjuNMReHlbeJfFZ1w+JeQ
 mlfw==
X-Gm-Message-State: APjAAAXZ8wUzmb56AdIwDrwGTjYIlzcB1BZPFZ87yEcXyRsIa47iiB5p
 KP/3JWAC90A6z6yivgOOWmQEHZIWwxtHuBWjWM0=
X-Google-Smtp-Source: APXvYqzrf2CkB3mjtmX/kk2VPUNb3IzPmKP+MMICh2e3y+I830pbMB4tA+Vj1llhp/RhIRz/MF2PQdYdpplaM8VfvfI=
X-Received: by 2002:a9f:3d83:: with SMTP id c3mr16441822uai.46.1575899705487; 
 Mon, 09 Dec 2019 05:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20191209014641.24685-1-jerry.han.hq@gmail.com>
In-Reply-To: <20191209014641.24685-1-jerry.han.hq@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Dec 2019 13:53:53 +0000
Message-ID: <CACvgo52SSEEdZWeze+HQraiQfUdWkE+ZRz4F2nR6UsidwQz06Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: Jerry Han <jerry.han.hq@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9o3u8x33+G2twfJE746oiIUkUFZh9fPdh3dQp71KR7A=;
 b=aICkb0AOmZQvPgmHuMz7IQ3fALldSCEXQnixAulPkoGndRggEIFan8uVbXHgc9Q4wW
 cc24IGxwLjFYjKhnfvOXGJptQPZvCKtvGot0AZmkvv7SthDP/o51ZtzzB22oKCLBWkHS
 Cym9jBfbD7gwUoxZERITvtfdSaLd0pVL+3Q/Os/XwgjQuH+Rw3H2oEjvom6JZz9iid4l
 x/QcHLawxa521larjtUFhT4SCg/tKuafjqQ5jRSTb4QoTQnX3/W1ay75nkJ5QPECjk1Z
 z9R4USX9L3E9Qxe8+SI50Yvr9QJOJEUBso9JqH3zWEo3S/KxVVCGhmKNQ1PYKmzEfD9G
 42qw==
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA5IERlYyAyMDE5IGF0IDA5OjQ3LCBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gU3VwcG9ydCBCb2UgSGltYXg4Mjc5ZCA4LjAiIDEyMDB4MTkyMCBU
RlQgTENEIHBhbmVsLCBpdCBpcyBhIE1JUEkgRFNJCj4gcGFuZWwuCj4KPiBWOToKPiAtIEFkanVz
dCBpbml0IGNvZGUsIG1ha2UgdGhlIGZvcm1hdCBtb3JlIGNvbmNpc2UKPiAtIGtpbGwgb2ZmIGRl
ZmF1bHRfb2ZmX2NtZHMgKEVtaWwpCj4gLSB1c2UgbWlwaV9kc2lfZGNzX3NldF9kaXNwbGF5X3tv
bixvZmZ9IGluIHRoZWlyIGVuYWJsZS9kaXNhYmxlCj4gICAgIGNhbGxiYWNrcy4gKEVtaWwpCj4g
LSBBZGp1c3RpbmcgdGhlIGRlbGF5IGZ1bmN0aW9uIChFbWlsKQo+Cj4gVjg6Cj4gLSBtb2RpZnkg
UEFSRU5USEVTSVNfQUxJR05NRU5UIGZvcm1hdCAoU2FtKQo+IC0gdXNlIGdwaW9zIGFyZSByZXF1
aXJlZCBBUEkgcmVwbGFjZSBvcHRpb25hbCBncGlvIEFQSSAoRW1pbCkKPgo+IFY3Ogo+IC0gTW9k
aWZ5IGNvbW11bmljYXRpb24gYWRkcmVzcwo+Cj4gVjY6Cj4gLSBBZGQgdGhlIGluZm9ybWF0aW9u
IG9mIHRoZSByZXZpZXdlcgo+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlbGF5cywgVGhlIHVkZWxh
eV9yYW5nZSBjb2RlIGdyYWNlZnVsbHkgcmV0dXJucwo+ICAgICB3aXRob3V0IGhpdHRpbmcgdGhl
IHNjaGVkdWxlciBvbiBhIGRlbGF5IG9mIDAuIChEZXJlaykKPiAtIE1lcmdlIHRoZSBzYW1lIGRh
dGEgc3RydWN0dXJlcywgbGlrZSBkaXNwbGF5X21vZGUgYW5kIG9mZl9jbWRzIChEZXJlaykKPiAt
IE9wdGltaXplIHRoZSBwcm9jZXNzaW5nIG9mIHJlc3VsdHMgcmV0dXJuZWQgYnkKPiAgICAgZGV2
bV9ncGlvZF9nZXRfb3B0aW9uYWwgKERlcmVrKQo+Cj4gVjU6Cj4gLSBBZGQgdGhlIGluZm9ybWF0
aW9uIG9mIHRoZSByZXZpZXdlciAoU2FtKQo+IC0gRGVsZXRlIHVubmVjZXNzYXJ5IGhlYWRlciBm
aWxlcyAjaW5jbHVkZSA8bGludXgvZmIuaD4gKFNhbSkKPiAtIFRoZSBjb25maWcgRFJNX1BBTkVM
X0JPRV9ISU1BWDgyNzlEIGFwcGVhcnMgdHdpY2UuIERyb3Agb25lIG9mIHRoZW0gKFNhbSkKPiAt
IEFERCBzdGF0aWMsIHNldF9ncGlvcyBmdW5jdGlvbiBpcyBub3QgdXNlZCBvdXRzaWRlIHRoaXMg
bW9kdWxlIChTYW0pCj4KPiBWNDoKPiAtIEZyZWZpeCBhbGwgZnVuY3Rpb24gbWFlcyB3aXRoIGJv
ZV8gKFNhbSkKPiAtIEZzZWQgImVuYWJsZV9ncGlvIiByZXBsYWNlICJyZXNldF9ncGlvIiwgTWFr
ZSBpdCBsb29rIGNsZWFyZXIgKFNhbSkKPiAtIFNvcnQgaW5jbHVkZSBsaW5lcyBhbHBoYWJldGlj
YWxseSAoU2FtKQo+IC0gRml4ZWQgZW50cmllcyBpbiB0aGUgbWFrZWZpbGUgbXVzdCBiZSBzb3J0
ZWQgYWxwaGFiZXRpY2FsbHkgKFNhbSkKPiAtIEFkZCBzZW5kX21pcGlfY21kcyBmdW5jdGlvbiB0
byBhdm9pZCBkdXBsaWNhdGluZyB0aGUgY29kZSAoU2FtKQo+IC0gQWRkIHRoZSBuZWNlc3Nhcnkg
ZGVsYXkocmVzZXRfZGVsYXlfdDUpIGJldHdlZW4gcmVzZXQgYW5kIHNlbmRpbmcKPiAgICAgdGhl
IGluaXRpYWxpemF0aW9uIGNvbW1hbmQgKFJvY2sgd2FuZykKPgo+IFYzOgo+IC0gUmVtb3ZlIHVu
bmVjZXNzYXJ5IGRlbGF5cyBpbiBzZW5kaW5nIGluaXRpYWxpemF0aW9uIGNvbW1hbmRzIChKaXRh
byBTaGkpCj4KPiBWMjoKPiAtIFVzZSBTUERYIGlkZW50aWZpZXIgKFNhbSkKPiAtIFVzZSBuZWNl
c3NhcnkgaGVhZGVyIGZpbGVzIHJlcGxhY2UgZHJtUC5oIChTYW0pCj4gLSBEZWxldGUgdW5uZWNl
c3NhcnkgaGVhZGVyIGZpbGVzICNpbmNsdWRlIDxsaW51eC9lcnIuaD4gKFNhbSkKPiAtIFNwZWNp
ZmllcyBhIEdQSU9zIGFycmF5IHRvIGNvbnRyb2wgdGhlIHJlc2V0IHRpbWluZywKPiAgICAgaW5z
dGVhZCBvZiByZWFkaW5nICJkc2ktcmVzZXQtc2VxdWVuY2UiIGRhdGEgZnJvbSBEVFMgKFNhbSkK
PiAtIERlbGV0ZSBiYWNrbGlnaHRfZGlzYWJsZSgpIGZ1bmN0aW9uIHdoZW4gYWxyZWFkeSBkaXNh
YmxlZCAoU2FtKQo+IC0gVXNlIGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoKSByZXBsYWNlIG9mX2Zp
bmRfYmFja2xpZ2h0X2J5X25vZGUoKSAoU2FtKQo+IC0gTW92ZSB0aGUgbmVjZXNzYXJ5IGRhdGEg
aW4gdGhlIERUUyB0byB0aGUgY3VycmVudCBmaWxlLAo+ICAgICBsaWtlIHBvcmNoLCBkaXNwbGF5
X21vZGUgYW5kIEluaXQgY29kZSBldGMuIChTYW0pCj4gLSBBZGQgY29tcGF0aWJsZSBkZXZpY2Ug
ImJvZSxoaW1heDgyNzlkMTBwIiAoU2FtKQo+Cj4gVjE6Cj4gLSBTdXBwb3J0IEJvZSBIaW1heDgy
NzlkIDguMCIgMTIwMHgxOTIwIFRGVCBMQ0QgcGFuZWwsIGl0IGlzIGEgTUlQSSBEU0kKPiAgICAg
cGFuZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBnbWFpbC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBSZXZp
ZXdlZC1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgp2OSBsb29rcyBt
dWNoIGJldHRlciB0aGFua3MuIE15IFItQiBub3cgc3RhbmRzOgpSZXZpZXdlZC1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+CgpTYW0sIGNhcmUgeW91IGdpdmUgdGhp
cyBhIHF1aWNrIGxvb2sgYW5kIG1lcmdlIGlmIHlvdSdyZSBoYXBweSB3aXRoCmxhdGVzdCByZXZp
c2lvbj8KdjkgaGF2ZSBjaGFuZ2VkIHF1aXRlIGEgYml0IHNpbmNlIHlvdSd2ZSByZXZpZXdlZCBp
dCAtIHNhbWUKZnVuY3Rpb25hbGl0eSB3aXRoIDEwJSBsZXNzIGNvZGUgOy0pCgotRW1pbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
