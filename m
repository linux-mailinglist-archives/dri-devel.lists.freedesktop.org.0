Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038AB313A70
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21A56E959;
	Mon,  8 Feb 2021 17:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDA96E959;
 Mon,  8 Feb 2021 17:07:03 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id h8so4875766qkk.6;
 Mon, 08 Feb 2021 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1oGhDlZioI/4IhmuPNoORENZJtYwROVwa2Eu/Yq2MKY=;
 b=evL/b/OtHFxEGv48CBf9AivYj/HGimawzVr2biAkibG47OfjrycLq+5x8B4eD7MltH
 +DyXjkDn/ro67yMuL2onX/LSJchsjktQmAh3lhe+6oicdZ+SY/PSG7fhJFm7FtulhHJJ
 waqzXnHb0w13uQ1M/UaR7B5g2coG4HZ8VLwVdZfRp5TkjOcQ/rVYObk7hZzPOcS6OlMP
 utiiBE9zaUccT+ElKHPNRi4HBhSyeR6B+EvZpYmuoTBmFjkRB4Zw33rSt8/0edgyTvLf
 84WJcpFS0ItY7D8KPJHs22lsdUzHmx1oFBxQYYstbkH5mnziRYt9ZA3F656MnqDzbM4g
 9WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1oGhDlZioI/4IhmuPNoORENZJtYwROVwa2Eu/Yq2MKY=;
 b=hii5OZLobSI+LvkOgynyfpzYy+59M0nOZ7aOH49PJCiIUbmBYbif/t+MIxfAPK9Nnc
 Ga88qg4OThnq6YS+BxhddBH88UJ8/Dhebp+sxxzbzT1xdQUuo7pPvS2DhVL/gZ2pxixK
 YN/6uQD1HsdOCebjMUadRCZpUk7mG/ePUIQW3qJU8/ZA8iwdIg5z9p6N9JVD3Xx6gDtn
 UHnZkCitvKrR/Df8WueQ7Lr1pbfhuLp1iL3NMPwV50EOyQA8PG8ER4AgU7TQ6MfpO7JT
 ROwO691oHCe262Oq9eMEiakk8mDiWOKM2c0SLO0YYTVuqgQ1+ezfaUxYiaufQMWXEg7s
 O6Fg==
X-Gm-Message-State: AOAM533Zfiyf8KUc8YPA4IF49udQb7qyT+h+HA2BwEF6klzVUosFBAjN
 9y8gBxxntKBbCKOS9d06BsI=
X-Google-Smtp-Source: ABdhPJznEoqgrHXPLVqPXpUAQXwj4urj/fuzcMyhxRW/39Idqc0HaJedHlfbgkXdxEfpuf486vlk8g==
X-Received: by 2002:a37:41d2:: with SMTP id o201mr534123qka.204.1612804022590; 
 Mon, 08 Feb 2021 09:07:02 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:15d6:ef8f:290b:734a?
 ([2601:5c0:c200:27c6:15d6:ef8f:290b:734a])
 by smtp.gmail.com with ESMTPSA id l128sm16649708qkf.68.2021.02.08.09.07.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:07:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] drm/qxl: properly handle device init failures
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <20210208104149.423758-1-kraxel@redhat.com>
Date: Mon, 8 Feb 2021 12:07:01 -0500
Message-Id: <E07153A4-9B42-4050-903E-8BBB99D8ED8E@gmail.com>
References: <20210208104149.423758-1-kraxel@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9lcyB0aGlzIHBhdGNoIGZpeCBhbiBpc3N1ZSByYWlzZWQgcHJldmlvdXNseT8gT3Igc2hvdWxk
IHRoZXkgYmUgdXNlZCB0b2dldGhlcj8KaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9saW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnL21zZzI0NjY1NDEuaHRtbCAKCklNSE8gdXNpbmcgdGhp
cyBwYXRjaCBhbG9uZSB3b27igJl0IGZpeCB0aGUgaXNzdWUgLS0KCkJlc3QsCi0gVG9uZwoKPiBP
biBGZWIgOCwgMjAyMSwgYXQgNTo0MSBBTSwgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+IHdyb3RlOgo+IAo+IFNwZWNpZmljYWxseSBkbyBub3QgdHJ5IHJlbGVhc2UgcmVzb3VyY2Vz
IHdoaWNoIHdoZXJlCj4gbm90IGFsbG9jYXRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gCj4gQ2M6
IFRvbmcgWmhhbmcgPHp0b25nMDAwMUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfZGlzcGxheS5jIHwgMyArKysKPiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9rbXMuYyAgICAg
fCA0ICsrKysKPiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kaXNwbGF5LmMKPiBpbmRleCBjMzI2NDEyMTM2YzUuLmVjNTBkMmNmZDRlMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMKPiBAQCAtMTE4Myw2ICsxMTgzLDkgQEAgaW50
IHF4bF9kZXN0cm95X21vbml0b3JzX29iamVjdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRldikKPiB7
Cj4gCWludCByZXQ7Cj4gCj4gKwlpZiAoIXFkZXYtPm1vbml0b3JzX2NvbmZpZ19ibykKPiArCQly
ZXR1cm4gMDsKPiArCj4gCXFkZXYtPm1vbml0b3JzX2NvbmZpZyA9IE5VTEw7Cj4gCXFkZXYtPnJh
bV9oZWFkZXItPm1vbml0b3JzX2NvbmZpZyA9IDA7Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKPiBp
bmRleCA2NmQ3NGFhYWVlMDYuLjRkYzVhZDEzZjEyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5j
Cj4gQEAgLTI4OCw2ICsyODgsMTAgQEAgdm9pZCBxeGxfZGV2aWNlX2Zpbmkoc3RydWN0IHF4bF9k
ZXZpY2UgKnFkZXYpCj4gewo+IAlpbnQgY3VyX2lkeDsKPiAKPiArCS8qIGNoZWNrIGlmIHF4bF9k
ZXZpY2VfaW5pdCgpIHdhcyBzdWNjZXNzZnVsIChnY193b3JrIGlzIGluaXRpYWxpemVkIGxhc3Qp
ICovCj4gKwlpZiAoIXFkZXYtPmdjX3dvcmsuZnVuYykKPiArCQlyZXR1cm47Cj4gKwo+IAlmb3Ig
KGN1cl9pZHggPSAwOyBjdXJfaWR4IDwgMzsgY3VyX2lkeCsrKSB7Cj4gCQlpZiAoIXFkZXYtPmN1
cnJlbnRfcmVsZWFzZV9ib1tjdXJfaWR4XSkKPiAJCQljb250aW51ZTsKPiAtLSAKPiAyLjI5LjIK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
