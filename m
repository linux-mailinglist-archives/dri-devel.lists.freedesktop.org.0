Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F61A35A4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6183D6E219;
	Thu,  9 Apr 2020 14:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A94B6E219
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 14:15:10 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id m18so3964551uap.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WgFrJUcxVu3a2xeToy3QHwAASnOpe9p9bD6gy42DZaU=;
 b=LSzL+lvLwh+tbZRYF1sbzYpErDphaShvnR8QDewjxrtUQqM0l3lpi4zgBvfIH6q1iu
 +qHIQO3rsw2Z5qVqOePWB30HjDU/NIHTCp0dBBYOS/5Wy0zuQpuVHYr+eZWycJpkCQAy
 z9Nt0ErzzKLogbZMcv95pBz8xRTDH1CmdJfg6G76gSJmn7ntrYecO9IXqWETJDusc1qG
 AvtQmkKhrqh+LKFlOCSPvKVwUnYwR6Xa9gdlGnJM+8KsDNMkdIc+EcS6HxGPssHVb4B0
 Kz8wYGip6H1+6VZCt9JF9UqXOYRMregZt6QBW0oTkZrUcV8y4U6S+inoFSolFWo4IWXz
 HZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WgFrJUcxVu3a2xeToy3QHwAASnOpe9p9bD6gy42DZaU=;
 b=OxRdG+SFiqUHSiUx75TtRPzGjwWHWfT69oMlx7EGMZtxv9UDd04s4MO4vrbR+envgM
 urZlnTw92GQ4FYbdh0nnebu7R5jpOyGBj2xbL0Y6JDUJjl8kRJIcMdo526k26Y4hIUYa
 vs8f/8WC+OfCyafpxxrkzCxhO2G4JgDwY6x1hlxrGg8TwK1P1ToPyMaLo0GChzmoNM1N
 fG0YTXooWoKPMHPrb4wywMNPpRwtMiOSegJjgauweCqnkFWqnFJmxgRJrVNSdMfUMuyc
 dXxyTxuqoh6A3e3OYDLYqKcc/PXzB5n0Vn5dyIHbAXuMIh/oDcY7AwEkBwpkyQCxdwbu
 LIqw==
X-Gm-Message-State: AGi0Puau6elE0b/rvuq890RtEgEY5e0DKTGLjaQwRouVR4TIpvhDzrfj
 TXIUZjgZ2h92/TVF0IjrmsSsjBKKJQ51L72Nqd0=
X-Google-Smtp-Source: APiQypLsrtRIEVyo6jou2sX2F//OmEeewZJAdMyl+tAJ9iDPNb3GHOknus1fme7UF+2tuziINmPmWX5DYoEyl6n2lgI=
X-Received: by 2002:a9f:36c5:: with SMTP id p63mr3832085uap.19.1586441709669; 
 Thu, 09 Apr 2020 07:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200409115239.5149-1-sam@ravnborg.org>
 <20200409115239.5149-3-sam@ravnborg.org>
In-Reply-To: <20200409115239.5149-3-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 9 Apr 2020 15:13:28 +0100
Message-ID: <CACvgo50wKm15F8z6xmTcXZHZt0NoXqpeuitmLFoenueJuY9nNA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/panel: update backlight handling for
 samsung-s6e63j0x03
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: =?UTF-8?B?Sm9vbmFzIEt5bG3DpGzDpA==?= <joonas.kylmala@iki.fi>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Hyungwon Hwang <human.hwang@samsung.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA5IEFwciAyMDIwIGF0IDEyOjUzLCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+IHdyb3RlOgo+Cj4gVGhlIHNhbXN1bmctczZlNjNqMHgwMyBoYWQgYSBsb2NhbCB3YXkgdG8g
aGFuZGxlIGJhY2tsaWdodC4KPgo+IFVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSBhIGRldm1fIGJh
c2VkIHJlZ2lzdGVyIGZ1bmN0aW9uCj4gYW5kIHV0aWxpemUgZHJtX3BhbmVsIGJhY2tsaWdodCBz
dXBwb3J0LiBUaGUgY2hhbmdlcyByZXN1bHRzCj4gaW4gYSBzaW1wbGVyIGRyaXZlciB3aXRoIHRo
ZSBzYW1lIGZ1bmN0aW9uYWxpdHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IEpvb25hcyBLeWxtw6Rsw6QgPGpvb25hcy5reWxtYWxhQGlr
aS5maT4KPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogSW5raSBEYWUgPGlu
a2kuZGFlQHNhbXN1bmcuY29tPgo+IENjOiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4uaHdhbmdAc2Ft
c3VuZy5jb20+Cj4gQ2M6IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgo+
IC0tLQo+ICAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzajB4MDMuYyAgfCA1
NSArKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCsp
LCAyNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2Ftc3VuZy1zNmU2M2oweDAzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2Ftc3VuZy1zNmU2M2oweDAzLmMKPiBpbmRleCBhMzU3MGUwYTkwYTguLjJjMDM1Zjg3ZTNmMCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M2ow
eDAzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M2ow
eDAzLmMKPiBAQCAtMzYsNyArMzYsNiBAQAo+ICBzdHJ1Y3QgczZlNjNqMHgwMyB7Cj4gICAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwo+
IC0gICAgICAgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsX2RldjsKPgo+ICAgICAgICAgc3Ry
dWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEgc3VwcGxpZXNbMl07Cj4gICAgICAgICBzdHJ1Y3QgZ3Bp
b19kZXNjICpyZXNldF9ncGlvOwo+IEBAIC0xODQsNyArMTgzLDcgQEAgc3RhdGljIHVuc2lnbmVk
IGludCBzNmU2M2oweDAzX2dldF9icmlnaHRuZXNzX2luZGV4KHVuc2lnbmVkIGludCBicmlnaHRu
ZXNzKQo+ICBzdGF0aWMgaW50IHM2ZTYzajB4MDNfdXBkYXRlX2dhbW1hKHN0cnVjdCBzNmU2M2ow
eDAzICpjdHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBicmlnaHRuZXNzKQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmxfZGV2ID0gY3R4LT5ibF9kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmxfZGV2ID0gY3R4LT5wYW5lbC5iYWNrbGlnaHQ7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQg
aW5kZXggPSBzNmU2M2oweDAzX2dldF9icmlnaHRuZXNzX2luZGV4KGJyaWdodG5lc3MpOwo+ICAg
ICAgICAgaW50IHJldDsKPgo+IEBAIC0yMTcsNiArMjE2LDMwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYmFja2xpZ2h0X29wcyBzNmU2M2oweDAzX2JsX29wcyA9IHsKPiAgICAgICAgIC51cGRhdGVf
c3RhdHVzID0gczZlNjNqMHgwM19zZXRfYnJpZ2h0bmVzcywKPiAgfTsKPgo+ICtzdGF0aWMgaW50
IHM2ZTYzajB4MDNfYmFja2xpZ2h0X3JlZ2lzdGVyKHN0cnVjdCBzNmU2M2oweDAzICpjdHgpCj4g
K3sKPiArICAgICAgIHN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wcyA9IHsKUHJldHR5
IHN1cmUgd2UgY2FuIChzaG91bGQgcmVhbGx5KSBtYWtlIHRoZSBwcm9wcyBjb25zdC4KClF1aWNr
IGdyZXAgdGhyb3VnaCBkcm0sIHNob3dzIHRoYXQgdGhlcmUncmUgb3RoZXIgb2ZmZW5kZXJzLCBz
byBtaWdodAphcyB3ZWxsIGRvIHRoYXQgaW4gc2VwYXJhdGUgc2VyaWVzLgpTZWVtcyBsaWtlIG90
aGVyIHBhbmVscyBjb3VsZCBmb2xsb3cgc3VpdGUsIHdpdGggbGF0ZXIgc2VyaWVzIG9mIGNvdXJz
ZS4KCkJhY2sgb24gdG9waWMsIGl0J3Mgbm90IGltbWVkaWF0ZWx5IG9idmlvdXMgd2h5IHRoZSBG
Ql9CTEFOS18qCmhhbmRsaW5nIGlzIHNhZmUgdG8gcmVtb3ZlLiBQbGVhc2UgYWRkIHNtYWxsIG1l
bnRpb24gaW4gdGhlIGNvbW1pdCBsb2cKbWVudGlvbmluZyB3aHkuCgotRW1pbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
