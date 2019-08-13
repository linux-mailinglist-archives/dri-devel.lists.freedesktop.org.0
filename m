Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CF8B1C0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDED89CF6;
	Tue, 13 Aug 2019 07:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D6489D2F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:57:22 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h13so3260655edq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fKIsNPiU1qgWlGFpcrVtQzN3wMwn9O3DN3Qq4GHH2r0=;
 b=L68/UvV8siXJx1j9MI98BAGPIHg49S8wnB+ZPLj6M1uxGIleDtKKtVEYhLxzjhTrDU
 EaT9xE7Tmj7mID70hrsv/ad9LvpyBDtRgSfkEcq6j5O/rsiSzXsNyL+PxYdjfdI9R+qR
 F25cfgZ5WyRk3bb4+70ePkCVIlPmnF4phTCfeZLcvW1mi1EnfvknWYU0DpW9JoQO5KZh
 CrInC8ryMgkqbxDY3hBJuHZhjyWqk2fgCHURzozjYP93G5h88Xpfzf6N54EXjUHEJ2My
 1W8nubESAo1TeOeR86mREpQskaSJQscDCIOs+LLYywdJWnzGlDUwz3Y7ryB1TJmHf0fv
 US5A==
X-Gm-Message-State: APjAAAU5hehKWXfimFCGXbKWaOBK+5T/Tv+U+Bes+7LL0ufDMWlKNw5c
 yP8Y8SDG/RpkbhJ644yBT7lSot7bybs=
X-Google-Smtp-Source: APXvYqxnhSJmJdM3pB1O7YF7UbfyLSw+s1E6YtOwH5xFF0auZsQJ3jZuTUB7iOm41rovgKgiKZfH1Q==
X-Received: by 2002:a17:906:fcd7:: with SMTP id
 qx23mr18822365ejb.299.1565683040946; 
 Tue, 13 Aug 2019 00:57:20 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id x11sm24990303eda.80.2019.08.13.00.57.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 00:57:20 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
Date: Tue, 13 Aug 2019 09:57:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813062548.24770-1-nishkadg.linux@gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMy0wOC0xOSAwODoyNSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOgo+IFRoZSBzdGF0
aWMgc3RydWN0dXJlIHZib3hfZmJfaGVscGVyX2Z1bmNzLCBvZiB0eXBlIGRybV9mYl9oZWxwZXJf
ZnVuY3MsCj4gaXMgdXNlZCBvbmx5IHdoZW4gaXQgaXMgcGFzc2VkIGFzIHRoZSB0aGlyZCBhcmd1
bWVudCB0bwo+IGRybV9mYl9oZWxwZXJfZmJkZXZfc2V0dXAoKSwgd2hpY2ggZG9lcyBub3QgbW9k
aWZ5IGl0LiBIZW5jZSBtYWtlIGl0Cj4gY29uc3RhbnQgdG8gcHJvdGVjdCBpdCBmcm9tIHVuaW50
ZW5kZWQgbW9kaWZpY2F0aW9ucy4KPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+
CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgdGhpcyBsb29rcyBnb29kIHRvIG1lOgoKUmV2aWV3
ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpSZWdhcmRzLAoKSGFu
cwoKCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCj4gaW5kZXggMDI1MzdhYjljYzA4Li4yYjU3
ZWEzMTk1ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Ry
di5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCj4gQEAgLTMy
LDcgKzMyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtd
ID0gewo+ICAgfTsKPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBwY2lpZGxpc3QpOwo+ICAg
Cj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9mdW5jcyB2Ym94X2ZiX2hlbHBlcl9mdW5j
cyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZmJfaGVscGVyX2Z1bmNzIHZib3hfZmJf
aGVscGVyX2Z1bmNzID0gewo+ICAgCS5mYl9wcm9iZSA9IHZib3hmYl9jcmVhdGUsCj4gICB9Owo+
ICAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
