Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDC229A1
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 02:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6A891A6;
	Mon, 20 May 2019 00:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16707891A6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 00:58:30 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id p13so4673609uaa.11
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 17:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUpSk0u5fKNrtbowvgPCMeUohiETj5dnbtiTjnfmoSQ=;
 b=ndT4rdyNRJx7fljyDa9+qhfXN0ws6uGAFjvQyRURfGWc1epB4piTSVSJ4ChWmrPSu9
 rVmFLDVaTaR5ewqWtsiXmKBlv12as2B+nrDPdCD/lXuuWyBS5sTCiittpyrkvY7HiXPB
 QvtkdoIa+mW1WP52hU2r/L2aL5ZuH0FhyUmaIX6Kde7cZztD2iHG8ST0GCCj40sF1tOu
 kBUzue0RG0PnD7n0+nazhZf7pqXcSsyp5N9PfP9+0C8scTDh7TuVPYLgaMrp297zKF8b
 4LGYP7Xtbu3hK7EipeJKSPwQBYMdK25SL0PAt2tibYxb/9/h8n9egIkSr0RrrSWjKPOw
 qLnw==
X-Gm-Message-State: APjAAAWZX1la7psdJhKCrlEajP1ODylhix5Mg/1FHasZ21RnAIaJdI3G
 PhxBb2PoNVLargNO+D4H/Y3J2/tBWjxTgUwYqN+9x6NR
X-Google-Smtp-Source: APXvYqxGEJ1+TX4APILyMUXhSvjAX1FQbtbcKC1ysdjajUbV2sHiu8j76mEpa+kR4zXTwRNM6EDpVrXtr8wiA2A5WtU=
X-Received: by 2002:ab0:3406:: with SMTP id z6mr4044555uap.102.1558313909128; 
 Sun, 19 May 2019 17:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190315161142.23gfu32lueyqrmyq@smtp.gmail.com>
In-Reply-To: <20190315161142.23gfu32lueyqrmyq@smtp.gmail.com>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Sun, 19 May 2019 21:58:17 -0300
Message-ID: <CADKXj+4ixRrfZC9FRShEf7=L__0qk-uYNXvtwCs_tuUhgrQhEQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/vkms: Remove useless call to
 drm_connector_register/unregister()
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iUpSk0u5fKNrtbowvgPCMeUohiETj5dnbtiTjnfmoSQ=;
 b=ndTocvTfGGCMlMrb4iCQwCHUVsSdGuIiocTk5H7o65Yb6SS92Jqzw27dXrTLTIcEsQ
 uVka+o94gmdsaQ5GLSRTnL+4GMB13c7MLe6ADwFJBrzYg8s0D21wVL0njfjUncvQa5fS
 rC8xpHc6hjGXyZtx5KJi6HOvEIBkYVh9de29JSjrO+RkPZ7uaowZFxdTQuCxgY3DJyje
 klGUeFsXZIRDOXaa0bOT1MGDpHWpdNb/n6V2CAQ9PNt4Ux5TXF+tImw25/5krzmL6Q4b
 Lo0vwa/VFj42EvhmeQFn9BurBG6O01SrMa4AwwCXcUr1EGZbLnVDs75JiLSpS56XmeOX
 X0dA==
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKSSBmb3Jnb3QgdG8gYXBwbHkgdGhpcyBwYXRjaC4gSXMgaXQgb2sgZm9yIHlv
dSBpZiBJIGFwcGx5IGl0PwoKCk9uIEZyaSwgTWFyIDE1LCAyMDE5IGF0IDE6MTEgUE0gUm9kcmln
byBTaXF1ZWlyYQo8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhl
IGZ1bmN0aW9uIHZrbXNfb3V0cHV0X2luaXQoKSBpcyBpbnZva2VkIGR1cmluZyB0aGUgbW9kdWxl
Cj4gaW5pdGlhbGl6YXRpb24sIGFuZCBpdCBoYW5kbGVzIHRoZSBjcmVhdGlvbi9jb25maWd1cmF0
aW9uIG9mIHRoZSB2a21zCj4gZXNzZW50aWFsIGVsZW1lbnRzIChlLmcuLCBjb25uZWN0b3JzLCBl
bmNvZGVyLCBldGMpLiBBbW9uZyB0aGUKPiBpbml0aWFsaXphdGlvbnMsIHRoaXMgZnVuY3Rpb24g
dHJpZXMgdG8gaW5pdGlhbGl6ZSBhIGNvbm5lY3RvciBhbmQKPiByZWdpc3RlciBpdCBieSBjYWxs
aW5nIGRybV9jb25uZWN0b3JfcmVnaXN0ZXIoKS4gSG93ZXZlciwgaW5zaWRlIHRoZQo+IGRybV9j
b25uZWN0b3JfcmVnaXN0ZXIoKSwgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGlzIGZ1bmN0aW9uIHRo
ZXJlIGlzIHRoZQo+IGZvbGxvd2luZyB2YWxpZGF0aW9uOgo+Cj4gIGlmICghY29ubmVjdG9yLT5k
ZXYtPnJlZ2lzdGVyZWQpCj4gICAgcmV0dXJuIDA7Cj4KPiBJbiB0aGlzIHNlbnNlLCBpbnZva2Ug
ZHJtX2Nvbm5lY3Rvcl9yZWdpc3RlcigpIGFmdGVyIGluaXRpYWxpemluZyB0aGUKPiBjb25uZWN0
b3IgaGFzIG5vIGVmZmVjdCBiZWNhdXNlIHRoZSByZWdpc3RlciBmaWVsZCBpcyBmYWxzZS4gVGhl
Cj4gY29ubmVjdG9yIHJlZ2lzdGVyIGhhcHBlbnMgd2hlbiBkcm1fZGV2X3JlZ2lzdGVyKCkgaXMg
aW52b2tlZDsgdGhlIHNhbWUKPiBpc3N1ZSBleGlzdHMgd2l0aCBkcm1fY29ubmVjdG9yX3VucmVn
aXN0ZXIoKS4gVGhlcmVmb3JlLCB0aGlzIGNvbW1pdAo+IHJlbW92ZXMgdGhlIHVubmVjZXNzYXJ5
IGNhbGwgdG8gZHJtX2Nvbm5lY3Rvcl9yZWdpc3RlcigpIGFuZAo+IGRybV9jb25uZWN0b3JfdW5y
ZWdpc3RlcigpLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAqIFJlbW92ZSB1bm5lY2Vzc2FyeSBj
YWxsIHRvIGRybV9jb25uZWN0b3JfdW5yZWdpc3RlcigpCj4gKiBSZW1vdmUgdW51c2VkIGxhYmVs
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxv
QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX291dHB1dC5jIHwgMTAgLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19vdXRwdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfb3V0cHV0LmMKPiBpbmRleCAzYjE2MmIyNTMxMmUuLjU2ZmI1YzJhMjMxNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX291dHB1dC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19vdXRwdXQuYwo+IEBAIC02LDcgKzYsNiBAQAo+Cj4gIHN0YXRp
YyB2b2lkIHZrbXNfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKPiAgewo+IC0gICAgICAgZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNvbm5lY3Rvcik7
Cj4gICAgICAgICBkcm1fY29ubmVjdG9yX2NsZWFudXAoY29ubmVjdG9yKTsKPiAgfQo+Cj4gQEAg
LTcxLDEyICs3MCw2IEBAIGludCB2a21zX291dHB1dF9pbml0KHN0cnVjdCB2a21zX2RldmljZSAq
dmttc2RldikKPgo+ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3Rvciwg
JnZrbXNfY29ubl9oZWxwZXJfZnVuY3MpOwo+Cj4gLSAgICAgICByZXQgPSBkcm1fY29ubmVjdG9y
X3JlZ2lzdGVyKGNvbm5lY3Rvcik7Cj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAg
ICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lzdGVyIGNvbm5lY3RvclxuIik7Cj4gLSAgICAg
ICAgICAgICAgIGdvdG8gZXJyX2Nvbm5lY3Rvcl9yZWdpc3RlcjsKPiAtICAgICAgIH0KPiAtCj4g
ICAgICAgICByZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRldiwgZW5jb2RlciwgJnZrbXNfZW5jb2Rl
cl9mdW5jcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RF
Ul9WSVJUVUFMLCBOVUxMKTsKPiAgICAgICAgIGlmIChyZXQpIHsKPiBAQCAtOTksOSArOTIsNiBA
QCBpbnQgdmttc19vdXRwdXRfaW5pdChzdHJ1Y3Qgdmttc19kZXZpY2UgKnZrbXNkZXYpCj4gICAg
ICAgICBkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+Cj4gIGVycl9lbmNvZGVyOgo+IC0g
ICAgICAgZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNvbm5lY3Rvcik7Cj4gLQo+IC1lcnJfY29u
bmVjdG9yX3JlZ2lzdGVyOgo+ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKGNvbm5lY3Rv
cik7Cj4KPiAgZXJyX2Nvbm5lY3RvcjoKPiAtLQo+IDIuMjEuMAoKCgotLSAKClJvZHJpZ28gU2lx
dWVpcmEKaHR0cHM6Ly9zaXF1ZWlyYS50ZWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
