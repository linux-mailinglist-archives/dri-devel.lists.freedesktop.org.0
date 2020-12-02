Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649FE2CC995
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 23:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5535E6EB1B;
	Wed,  2 Dec 2020 22:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8E16EB1B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 22:26:10 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t143so60684oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 14:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fnhN9UOxm8yZGjT96bQxYlA5AMhpFK2GY0QG/cY/x2o=;
 b=gVN+M3vBn6BT/7zWo8tMMD0w57z4TDQHDGVZdUDeuD1OLVFN8iuhj/PH5qXljMdqPX
 tl0aG93gxq3bTs5sgEPI5kxWcFKXaM9mb0e6/DCfnSDPwL9Cmrun2tI3WGaYanrKDlrC
 A5NSYW0BcirLqcYbxwTmq4dvP8pegAX1vBxRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fnhN9UOxm8yZGjT96bQxYlA5AMhpFK2GY0QG/cY/x2o=;
 b=gwd2omwvf1OlWQR7EFrMBoyLD8/6KO3e93li+D8H8FOsmt7DX4Hxj8poLD8FCb8UJp
 dTKTfgluOzKBMIc3VT28C13nTFR8DVxKUWttiLPGNsCBk3AKNOa+ds6KcDMe4UyRczTu
 q7WCjRKuwI/6jIrO7KD8PLn29wIReueR2eRm4C4/zeahcSoryg+UvqxpTJBy5n3jriXP
 ebIo7gxolhx7NkvuDdlwNvftHDWURv+6/tYw+JsiPVxK9na35ASPfBjcQm+qfqP1rA7l
 IqEWQmpUPlwJVFAigiUEafMd4ydCeQrBDI7kWIJ5RceRWFWGZLXjsXJ9BPo7m6bCZY68
 OpoQ==
X-Gm-Message-State: AOAM530Q7QcPG/NGTvRlWIgW8HLgmAYYMA9cFX+QIEZb4+tW4wve2q02
 LwlVV3OBu6u7NlJByyHyXPcW6QvBeUA1UJLkLjjyeaBbnxs=
X-Google-Smtp-Source: ABdhPJwgB5GqYj7pW+ZzvnQW4K3794UlftN7CCBlI2eVSUMmMn5Ac3dWZNjbL/P4Ukyhn33EYLKWCowxJWWl4gh0IpE=
X-Received: by 2002:aca:47cf:: with SMTP id u198mr3208295oia.14.1606947969938; 
 Wed, 02 Dec 2020 14:26:09 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
In-Reply-To: <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Dec 2020 23:25:58 +0100
Message-ID: <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: James Park <james.park@lagfreegames.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCA4OjQ4IFBNIEphbWVzIFBhcmsgPGphbWVzLnBhcmtAbGFn
ZnJlZWdhbWVzLmNvbT4gd3JvdGU6Cj4KPiBJIGNhbiBhdm9pZCBtb2RpZnlpbmcgZHJtLmggYnkg
ZG9pbmcgdGhpcyB0byBkcm1fZm91cmNjLmg6Cj4KPiAjaWZkZWYgX1dJTjMyCj4gI2luY2x1ZGUg
PHN0ZGludC5oPgo+IHR5cGVkZWYgdWludDY0X3QgX191NjQ7Cj4gI2Vsc2UKPiAjaW5jbHVkZSAi
ZHJtLmgiCj4gI2VuZGlmCj4KPiBBbmQgdGhpcyB0byBhbWRncHVfZHJtLmg6Cj4KPiAjaWZkZWYg
X1dJTjMyCj4gI2luY2x1ZGUgPHN0ZGludC5oPgo+IHR5cGVkZWYgaW50MzJfdCAgX19zMzI7Cj4g
dHlwZWRlZiB1aW50MzJfdCBfX3UzMjsKPiB0eXBlZGVmIHVpbnQ2NF90IF9fdTY0Owo+ICNlbHNl
Cj4gI2luY2x1ZGUgImRybS5oIgo+ICNlbmRpZgo+Cj4gQnV0IG5vdyBJJ20gdG91Y2hpbmcgdHdv
IGZpbGVzIHVuZGVyIGRybS11YXBpIGluc3RlYWQgb2Ygb25lLCBhbmQgd2VpcmRseS4KPgo+IElm
IHdlJ3JlIHRyeWluZyB0byBjdXQgdGllcyB3aXRoIHRoZSBkcm0tdWFwaSBmb2xkZXIgZW50aXJl
bHksIHRoZSBzdHVmZiBhY19zdXJmYWNlLmMgbmVlZCBpbmNsdWRlcyB0aGUgQU1EX0ZNVF9NT0Qg
c3R1ZmYgaW4gZHJtX2ZvdXJjYy5oLCBhbmQgQU1ER1BVX1RJTElOR18qIHVuZGVyIGFtZGdwdV9k
cm0uaC4gSXMgdGhlcmUgYSBiZXR0ZXIgc3BvdCBmb3IgdGhlc2UgZGVmaW5pdGlvbnM/CgpUaGUg
ZHJtX2ZvdXJjYy5oIG1heWJlIG1ha2VzIHNvbWUgc2Vuc2UgKEkgdGhpbmsgaW4gc29tZSBwbGFj
ZXMgbWVzYQp1c2VzIHRoZXNlIGludGVybmFsbHksIGFuZCBtYW55IGRyaXZlcnMgdXNlIHRoZSBt
b2RpZmllcnMgZGlyZWN0bHkgaW4KdGhlIG1haW4gZHJpdmVyKS4gQnV0IHRoZSBhbWRncHUgaGVh
ZGVyIHNob3VsZCBiZSBhbGwgaW9jdGwgc3R1ZmYsCndoaWNoIHNob3VsZCBiZSBhbGwgZW50aXJl
bHkgaW4gdGhlIHdpbnN5cyBvbmx5LgoKQWxzbyBraW5kYSBkaXNhcHBvaW50aW5nIHRoYXQgZHJt
X2ZvdXJjYy5oIGluY2x1ZGVzIGRybS5oIGFuZCBpc24ndApzdGFuZGFsb25lLCBidXQgSSBndWVz
cyB0aGF0IHNhaWxlZCAoYXQgbGVhc3QgZm9yIGxpbnV4KS4KLURhbmllbAoKPiBUaGFua3MsCj4g
SmFtZXMKPgo+IE9uIFdlZCwgRGVjIDIsIDIwMjAgYXQgMTA6MDYgQU0gTWljaGVsIETDpG56ZXIg
PG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjAtMTItMDIgMTo0NiBwLm0u
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiA+IE9uIFdlZCwgRGVjIDIsIDIwMjAgYXQgMTI6NDMg
UE0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4+ID4+Cj4+ID4+
IE9uIDIwMjAtMTItMDEgMTE6MDEgYS5tLiwgSmFtZXMgUGFyayB3cm90ZToKPj4gPj4+IFRoaXMg
d2lsbCBhbGxvdyBNZXNhIHRvIHBvcnQgY29kZSB0byBXaW5kb3dzIG1vcmUgZWFzaWx5Lgo+PiA+
Pgo+PiA+PiBBcyBkaXNjdXNzZWQgaW4KPj4gPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzYxNjIjbm90ZV83MTI3NzkKPj4gPj4gLCBp
bmNsdWRpbmcgZHJtLmggbWFrZXMgbm8gc2Vuc2Ugd2hlbiBidWlsZGluZyBmb3IgV2luZG93cy4K
Pj4gPgo+PiA+IFllYWggSSB0aGluayBpdCdkIGJlIGNsZWFuZXN0IGlmIHdlIGNhbiBhdm9pZCB0
aGlzLiBJZiBub3QgSSB0aGluayB0aGUKPj4gPiByaWdodCBmaXggd291bGQgYmUgdG8gc3BsaXQg
b3V0IHRoZSBhY3R1YWxseSBuZWVkZWQgcGFydHMgZnJvbSBkcm0uaAo+PiA+IGludG8gYSBuZXcg
aGVhZGVyIChzdGlsbCBpbmNsdWRlZCBieSBkcm0uaCBmb3IgYmFja3dhcmRzIGNvbXBhdAo+PiA+
IHJlYXNvbnMpIHdoaWNoIG1lc2EgY2FuIHVzZS4gU2luY2UgaXQgbG9va3MgbGlrZSB0aGUgcHJv
YmxlbWF0aWMgcGFydHMKPj4gPiBhcmUgdGhlIGxlZ2FjeSBndW5rLCBhbmQgbm90IHRoZSBuZXcg
aW9jdGwgc3RydWN0dXJlcy4gUHVsbGluZyBvdXQKPj4gPiBkcm1fcmVuZGVyLmggZm9yIGFsbCB0
aGUgcmVuZGVyIHN0dWZmIGFuZCBtYWJlIGRybV92YmxhbmsuaCBmb3IgdGhlCj4+ID4gdmJsYW5r
IHN0dWZmICh3aGljaCB3b3VsZCBmaXQgYmV0dGVyIGluIGRybV9tb2RlLmggYnV0IG1pc3Rha2Vz
IHdlcmUKPj4gPiBtYWRlLCBvb3BzKS4KPj4KPj4gSWYgYW55dGhpbmcgY3VycmVudGx5IGluIGRy
bS5oIGlzIG5lZWRlZCB3aGlsZSBidWlsZGluZyBmb3IgV2luZG93cywgaXQKPj4gcG9pbnRzIHRv
IGEgYnJva2VuIGFic3RyYWN0aW9uIHNvbWV3aGVyZSBpbiB1c2Vyc3BhY2UuIChTcGVjaWZpY2Fs
bHksCj4+IHRoZSBNZXNhIEdhbGxpdW0vVnVsa2FuIHdpbnN5cyBpcyBzdXBwb3NlZCB0byBhYnN0
cmFjdCBhd2F5IHBsYXRmb3JtCj4+IGRldGFpbHMgbGlrZSB0aGVzZSkKPj4KPj4KPj4gLS0KPj4g
RWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0
dHBzOi8vcmVkaGF0LmNvbQo+PiBMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKCgoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
