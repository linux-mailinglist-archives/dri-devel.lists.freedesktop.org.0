Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E528EC1996
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 23:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094166E348;
	Sun, 29 Sep 2019 21:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EB56E348
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 21:26:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a22so7386977ljd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 14:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cC2bX0w7BKt8qLmTNhKxQHGiP8FOurrlK0x6rem2hpk=;
 b=ojMC6vtyrhH75K0tmaXuCur7Gw1A+8rJFk2QObDnLZbQSKpYqlbCVOrc9dnfbIsBBZ
 im+2IbldfeDrJnEKMeeX+gkQ8S5Wyop5U3KLnybUenAvDvww3PDcqL80VWlalR+U2kyb
 F+3GWxB87P3x9B0iS5bTjwFqK/lDx7cP+N0n6UwLWTrBptGRHSRcNEJXUmsvBXpY0fGh
 Upo2O3YvEddjzaLl7cWb2gB1PL2QmCyAgRSqGmicqwHCX7WovpyYGf3tgcpvbg+vvQfD
 gT5svarG/3pzUysTMeWBHTyTfdKSP4kGrEgqpCHKt1Lxo29Xgu7tFknJwA/e6tpCTeLQ
 HBag==
X-Gm-Message-State: APjAAAXUYC0wPSiINCttFerLOqwCe0ETNIJDb76Ha8z+7HM0nJufvCTX
 WHpCIdYg5yux5gdD9BHFPdsRwqEN8lFJDHbVocLkjw==
X-Google-Smtp-Source: APXvYqyIXXCHVyBpCMNZtSpFwvlpORmTnD6n5mVG0w3rBfbfmC2IgPW02xwOQ1SeQADdymh/0PtwVI+l6xoMr3KIthU=
X-Received: by 2002:a2e:b0d1:: with SMTP id g17mr9606505ljl.238.1569792397132; 
 Sun, 29 Sep 2019 14:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <45874e71-6a9b-e863-334f-f07f6bd30d64@metux.net>
In-Reply-To: <45874e71-6a9b-e863-334f-f07f6bd30d64@metux.net>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 30 Sep 2019 07:26:25 +1000
Message-ID: <CAPM=9tw=Zc51r=osv_GexX2L-A7AD1TnZXTnRAs_dzF+fhDNgg@mail.gmail.com>
Subject: Re: X11 + console switch - how does it actually work ?
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cC2bX0w7BKt8qLmTNhKxQHGiP8FOurrlK0x6rem2hpk=;
 b=HjiD5ZPben7sABz2WjytWB2UOmaauhpXUOkvALDGu5uow7t6jDbRIx6Ie7jZy4FIkb
 OrCY2Bvjue0g8KKfPKTieN7S9gZsCR/ut5lU9LfjZyFzYbSXB0ponOLE4i12WubO04kl
 X+l1Als0/2R6/FTZ1YUC49A/FdmC4yfPH9fdLJsi3zrQJw0/IhJT4Ijl8WdX2lbGgQnN
 UK7YkLhC87o04z1JpD3UMowraKiEgBROMw1zmkiGVW1pAvP48Io7USkX06gFFOp4VS4y
 Sq/MFYF7jR+3XSv4nxBRrrp2APQ3ulnhfOiTKv/gYWLb2fxBnRSk8YTn5Dt4jKod4+Ec
 +FLA==
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
Cc: dri devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBIZWxsbyBmb2xrcywKPgo+Cj4gY291bGQgYW55Ym9keSBwbGVhc2UgZ2l2ZSBtZSBzb21lIG1v
cmUgaW5zaWdodCwgaG93IHN3aXRjaGluZwo+IGZyb20gWCB0byBjb25zb2xlIChjdHJsK2FsdCtm
KikgYWN0dWFsbHkgd29ya3MgPwo+Cj4gV2hvIGNhdGNoZXMgdGhlIGtleXByZXNzIGV2ZW50IGFu
ZCBpbml0aWF0ZXMgdGhlIFZUIHN3aXRjaCA/Cj4gVGhlIFhzZXJ2ZXIgPyBDb3VsZCB0aGlzIGJl
IGRvbmUgaW4gdGhlIGtlcm5lbCAoZWcuIHdoZW4gWHNlcnZlcgo+IGlzIGhhbmdpbmcpID8KClRo
ZSBYIHNlcnZlciBpcyBpbiBmdWxsIGNvbnRyb2wgb2YgaXQgYWxsLiBObyB0aGUga2VybmVsIGNh
bid0IGRvIGl0LApTQUsgbWlnaHQgd29yayAoc2VjdXJlLWF0dGVudGlvbiBrZXkpIHVzaW5nIHN5
c3JxIGJ1dCBpdCBwcm9iYWJseSB3aWxsCmp1c3QgZW5kIHVwIHdpdGggYSBtb3JlIGNvbmZ1c2Vk
IHN5c3RlbS4KCkRhdmUuCgo+Cj4KPiAtLW10eAo+Cj4gLS0KPiBFbnJpY28gV2VpZ2VsdCwgbWV0
dXggSVQgY29uc3VsdAo+IEZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVy
aW5nCj4gaW5mb0BtZXR1eC5uZXQgLS0gKzQ5LTE1MS0yNzU2NTI4Nwo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
