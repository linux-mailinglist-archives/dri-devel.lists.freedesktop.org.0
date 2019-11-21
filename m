Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6407105BEB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 22:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986546E1B3;
	Thu, 21 Nov 2019 21:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADF46E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 21:26:53 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id b16so4311171otk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 13:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7unmkKTrQHIYD9VjilpLd5U4jqcZCUM1ECGAv4waV3g=;
 b=DUgkG78TawuleGSwmRhZaKHvpTRrqF/YECylIVpCentlD/9Oeo5YodpxxHls7m0Avm
 C/J22rTokLShKXAD6gwUdprgnlXF4EKwcVzNnF7LXdB2VKeTTZMroQe5jTBanp+pbyN+
 WcbX3eraIiUcJ472cn9wc06T2VFQ9lMuAlpXkNU9zqcgPDtgAPLwked7VFVpiRmPMeVP
 zjsbJTy9zfaQkPwYVjPufdCXqM5XH8CDV9MCOG2XJGQEUo9+9iKCTK6ckbXYuBvjj6T1
 cMMsF6Fa199AHlfw2mEen8eGqIjaHJurORtfX7I28J5O0S7Y/gQjAAaBkEKBsHFV+Yei
 oknw==
X-Gm-Message-State: APjAAAV/PJ+f+knmn4UhvNLqhLLF53L5jw9tO8bsT7keaOZ+tqHZPnq+
 PnpNX/6FZl6B1WEzkvaF0QGV/3qHYRYoktC2rPj4NA==
X-Google-Smtp-Source: APXvYqyTJgoVdyO+mfe7fhguPiANswNmiImuWvt6Lgt0Texy/QaAZTwUFGOHgpeG3w6+/Vk7PjK6BGwFnT07wDglgSg=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr8545680otc.188.1574371612518; 
 Thu, 21 Nov 2019 13:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20191101153754.22803-1-robh@kernel.org>
In-Reply-To: <20191101153754.22803-1-robh@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Nov 2019 22:26:41 +0100
Message-ID: <CAKMK7uHmE2JNn+SVnGOat8LR4oSq4LwPEeMv2dfq7i=pK0wdJw@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem: Add docbook comments for drm_gem_shmem_object
 madvise fields
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7unmkKTrQHIYD9VjilpLd5U4jqcZCUM1ECGAv4waV3g=;
 b=QQH6Lohxxe5i4+QXrtlTWQUhcCgbph/Mu43q8kAE78UVQe5xJyj7iAUy4r6CPmUB2f
 nBjbP4LmxdsDqEB6AXsVLhIx0LQBW9GGq4zGwLsZBnUPnfZzUAub4mm1nw7eavDaeJci
 lEvWPhoJlq63TreTxglU38PFQBiZRLfzXmyMQ=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMSwgMjAxOSBhdCA0OjM3IFBNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gQWRkIG1pc3NpbmcgZG9jYm9vayBjb21tZW50cyB0byBtYWR2aXNlIGZp
ZWxkcyBpbiBzdHJ1Y3QKPiBkcm1fZ2VtX3NobWVtX29iamVjdCB3aGljaCBmaXhlcyB0aGVzZSB3
YXJuaW5nczoKPgo+IGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmg6ODc6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21hZHYnIG5vdCBkZXNjcmliZWQgaW4g
J2RybV9nZW1fc2htZW1fb2JqZWN0Jwo+IGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
Lmg6ODc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21hZHZfbGlzdCcg
bm90IGRlc2NyaWJlZCBpbiAnZHJtX2dlbV9zaG1lbV9vYmplY3QnCj4KPiBGaXhlczogMTdhY2I5
ZjM1ZWQ3ICgiZHJtL3NobWVtOiBBZGQgbWFkdmlzZSBzdGF0ZSBhbmQgcHVyZ2UgaGVscGVycyIp
Cj4gUmVwb3J0ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpLZXJuZWxkb2MgZm9yIHRo
ZSBmdW5jdGlvbnMgeW91J3ZlIGFkZGVkIGluIDE3YWNiOWYzNWVkNyAoImRybS9zaG1lbToKQWRk
IG1hZHZpc2Ugc3RhdGUgYW5kIHB1cmdlIGhlbHBlcnMiKSBpcyBhbHNvIG1pc3NpbmcuIENhbiB5
b3UgcGxzIGZpeAp0aGF0IHRvbz8KClRoYW5rcywgRGFuaWVsCgo+IC0tLQo+ICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oIHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oCj4g
aW5kZXggZTJlOTk0N2I0NzcwLi45MDFlYWZiMDkyMDkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmgKPiBAQCAtNDQsNyArNDQsMjAgQEAgc3RydWN0IGRybV9nZW1fc2htZW1fb2Jq
ZWN0IHsKPiAgICAgICAgICAqLwo+ICAgICAgICAgdW5zaWduZWQgaW50IHBhZ2VzX3VzZV9jb3Vu
dDsKPgo+ICsgICAgICAgLyoqCj4gKyAgICAgICAgKiBAbWFkdjogU3RhdGUgZm9yIG1hZHZpc2UK
PiArICAgICAgICAqCj4gKyAgICAgICAgKiAwIGlzIGFjdGl2ZS9pbnVzZS4KPiArICAgICAgICAq
IEEgbmVnYXRpdmUgdmFsdWUgaXMgdGhlIG9iamVjdCBpcyBwdXJnZWQuCj4gKyAgICAgICAgKiBQ
b3NpdGl2ZSB2YWx1ZXMgYXJlIGRyaXZlciBzcGVjaWZpYyBhbmQgbm90IHVzZWQgYnkgdGhlIGhl
bHBlcnMuCj4gKyAgICAgICAgKi8KPiAgICAgICAgIGludCBtYWR2Owo+ICsKPiArICAgICAgIC8q
Kgo+ICsgICAgICAgICogQG1hZHZfbGlzdDogTGlzdCBlbnRyeSBmb3IgbWFkdmlzZSB0cmFja2lu
Zwo+ICsgICAgICAgICoKPiArICAgICAgICAqIFR5cGljYWxseSB1c2VkIGJ5IGRyaXZlcnMgdG8g
dHJhY2sgcHVyZ2VhYmxlIG9iamVjdHMKPiArICAgICAgICAqLwo+ICAgICAgICAgc3RydWN0IGxp
c3RfaGVhZCBtYWR2X2xpc3Q7Cj4KPiAgICAgICAgIC8qKgo+IC0tCj4gMi4yMC4xCj4KCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
