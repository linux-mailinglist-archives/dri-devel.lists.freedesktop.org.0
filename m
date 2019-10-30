Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F60E9CA7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 14:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76AC6E9FF;
	Wed, 30 Oct 2019 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73A56E9FF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:50:33 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b20so1619492lfp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 06:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKvVM+Lts2ZimWoF8BpQfrXJptOfWTU/76y+dUo91Xg=;
 b=Xa0p6LkuHJaIOBjFYdsAXGK5v63qz1zRl+tQ8JisdAEH2gLeWKoUUUgMZ5qzRkcv2b
 pnuUq3ItLavYcDpjMp8lRZ8RGJ1BSMWRS+xd8mnF43mCKBT3Oaaz6PgCeCvFXAjiDM1S
 0sXUTWYErlABAPQPX/6sfOIAmSQSNHpPhJlHcXwETZosY/nLWKVYGnXHQX1DkdddCA54
 CMSs2ArIUT4Ok6FFt5YlE7/MmcMXQKIQ/QwuZcelTJlIS4lC657m7vZrxR1JDBjZpLJQ
 2p68V4XatGV7IyNW+4SPGo7eNRuxb/wx4of167nkHUvCGaMfjSh2IuKS4rcaN851ihln
 4mjQ==
X-Gm-Message-State: APjAAAW5/UMhuh4A6/56tvLEms+TLHjEwIXEgtxYV4OeYnZUkSS9cFiq
 RsCzIA6FiJDkj19xWlY3yLYQ4h3fi3VXJ5RXUW1TOQ==
X-Google-Smtp-Source: APXvYqy0c7Qf7SbNHkI8EEMumWKBAHA3H3uCgrvSX/PLtGNFb6KJ6a8grwgYyBfTZ+//S8rbMyS5lBXpJRawaWya4YY=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr517648lfp.5.1572443432053;
 Wed, 30 Oct 2019 06:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191025192054.GA7415@bogus>
In-Reply-To: <20191025192054.GA7415@bogus>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Oct 2019 14:50:20 +0100
Message-ID: <CACRpkdZ67mC9m6inJSfbS0NqeThfJ0tUJQTP5stX3Kzw+zhEyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v4] drm/panel: Add generic DSI panel YAML bindings
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hKvVM+Lts2ZimWoF8BpQfrXJptOfWTU/76y+dUo91Xg=;
 b=ise6gsWZjYd+YEvdWj6TeziR+YM/ap5c2m+tbfumbVKlsLneIoCe1NeOSUBSPfrMUZ
 N/N8xE70oDjDMUbzzc0L5qpmNhiyAWw/JA+P4HFtj0Yr1Om2yid5undvOgXSxfYVhNeU
 6d2nOtKI2nVBYIf8hP0DRLolprxmuJQ6E7DtPesVX0HRtIMOseA0JVNyGKxf9qieuu1w
 LMJ/sQGOmwm8f3x7mAK2e0YXXiOlL3MGOD5h4JioInkefqcKu9qSntkzQaaa/JxpJTfC
 Rdo6wFTs2A4+zIncrx88AwRkKrfFu+5h5Bq2ib9NalYH5URFOK3upX4tlIXDZGlKM2jj
 YPPw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgOToyMCBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKCj4gW01lXQo+ID4gKyAgICBkc2ktY29udHJvbGxlckA1NWFhNTVhYSB7Cj4g
PiArICAgICAgY29tcGF0aWJsZSA9ICJhY21lLGZvbyI7Cj4KPiBFdmVudHVhbGx5LCBJIHdhbnQg
dG8gc3RhcnQgcmVwb3J0aW5nIGlmIGNvbXBhdGlibGUgc3RyaW5ncyBhcmVuJ3QKPiBkb2N1bWVu
dGVkIChpLmUuIG1hdGNoZWQgdG8gYSBzY2hlbWEpLiBUaGlzIHdpbGwgYnJlYWsgdGhlbi4uLgoK
T0sgSSBkcm9wIHRoaXMuCgo+ID4gKyAgICAgIHJlZyA9IDwweDU1YWE1NWFhPjsKPgo+IFRoaXMg
d2lsbCBmYWlsIGJlY2F1c2UgYSBzaXplIGNlbGwgaXMgZXhwZWN0ZWQuCgpEbyB5b3UgbWVhbiBp
dCB3aWxsIGZhaWwgdGhlIGRheSB3ZSBhY3R1YWxseSBjaGVjayByZWcgcHJvcGVydGllcyB0bwpi
ZSBwcm9wZXJseSBmb3JtZWQgdW5kZXIgdGhlIGNpcmN1bXN0YW5jZXM/CgpCZWNhdXNlOgogIEhP
U1RMRCAgc2NyaXB0cy9kdGMvZHRjCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sCiAgQ0hLRFQgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9kc2ktY29udHJvbGxlci55YW1s
CiAgU0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJvY2Vzc2VkLXNj
aGVtYS55YW1sCiguLi4pCgpJdCBwYXNzZXMganVzdCBmaW5lLgoKSSBnZXQgYSBiaXQgbmVydm91
cyBzaW5jZSB0aGUgc2NoZW1hIGlzIGFsbCBhYm91dCBiZWluZyBzdHJpY3QgYWJvdXQKc3R1ZmYg
c28gSSBnZXQgdGhlIGZlZWxpbmcgdGhhdCAic2hvdWxkIGhhdmUgZmFpbGVkIi4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
