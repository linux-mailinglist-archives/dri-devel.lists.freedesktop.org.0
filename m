Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F293086482
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8C6E852;
	Thu,  8 Aug 2019 14:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9896E852
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:39:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9136C21874
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:39:23 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h21so92316707qtn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 07:39:23 -0700 (PDT)
X-Gm-Message-State: APjAAAW/bAkvGZiWi79Sm7dshAaPNGq+AQ8UfeZshtmMMD69x5REesSM
 /s7eUZEv+bZWvAj3MVXks37Lp6vCZHKX7AEEcQ==
X-Google-Smtp-Source: APXvYqxkLzzttoPRjG6OdCBUUa/q7s74JQQoPiqFZuI9R0rWgz463Pe7xeEL3H479RPtJ3gRI9+MBXG5aL25v9QXpC8=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr2253174qto.224.1565275162761; 
 Thu, 08 Aug 2019 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190808134417.10610-1-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 08:39:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+iSWpKsdCjzhq-=utg=cLArUgariZEdEs5BqKAotcpQA@mail.gmail.com>
Message-ID: <CAL_Jsq+iSWpKsdCjzhq-=utg=cLArUgariZEdEs5BqKAotcpQA@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565275163;
 bh=OXm5um8wc+1NJpke9HE+isnB7tJvw8ZlcF/w7VhOXN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N4B4Vh5kvlCVOLcJ0EgZ/JBR6zQ2z5Bk/Wm2oraz4cH0woyrF/wkLVCbMkcf1WNKo
 yRaUfZQuFvHfUvKIMc2psNcnrWJRvOFJr4HOQBjdYX8VLZrXkEYAONO+FAJpfRxTXT
 FDLMKwRVits67M+tve9DpbMemvu5rBYGAlbnC8Bk=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA3OjQ0IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+Cj4KPiBHZXJkIEhvZmZtYW5uICgxNyk6Cj4gICBkcm0vdHRtOiB0
dXJuIHR0bV9ib19kZXZpY2Uudm1hX21hbmFnZXIgaW50byBhIHBvaW50ZXIKPiAgIGRybS90dG06
IGFkZCBnZW1fdHRtX2JvX2RldmljZV9pbml0KCkKPiAgIGRybS92cmFtOiBzd2l0Y2ggdnJhbSBo
ZWxwZXJzIHRvIHRoZSBuZXcgZ2VtX3R0bV9ib19kZXZpY2VfaW5pdCgpCj4gICBkcm0vcXhsOiBz
d2l0Y2ggcXhsIHRvIHRoZSBuZXcgZ2VtX3R0bV9ib19kZXZpY2VfaW5pdCgpCj4gICBkcm06IGFk
ZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MKPiAgIGRybS9zaG1lbTogc3dpdGNoIHNo
bWVtIGhlbHBlciB0byBkcm1fZ2VtX29iamVjdF9mdW5jcy0+bW1hcAo+ICAgZHJtL3NobWVtOiBk
cm9wIERFRklORV9EUk1fR0VNX1NITUVNX0ZPUFMKPiAgIGRybS90dG06IGZhY3RvciBvdXQgdHRt
X2JvX21tYXBfdm1hX3NldHVwCj4gICBkcm0vdHRtOiBhZGQgZHJtX2dlbV90dG1fbW1hcCgpCj4g
ICBkcm0vdnJhbTogc3dpdGNoIHZyYW0gaGVscGVyIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzLT5t
bWFwIGNvZGVwYXRoCj4gICBkcm0vdnJhbTogZHJvcCB2ZXJpZnlfYWNjZXNzCj4gICBkcm06IGRy
b3AgRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TCj4gICBkcm0vcXhsOiB1c2UgZHJtX2dlbV9v
YmplY3RfZnVuY3MKPiAgIGRybS9xeGw6IGRyb3AgcXhsX3R0bV9mYXVsdAo+ICAgZHJtL3F4bDog
c3dpdGNoIHF4bCB0byBkcm1fZ2VtX29iamVjdF9mdW5jcy0+bW1hcCBjb2RlcGF0aAo+ICAgZHJt
L3F4bDogZHJvcCB2ZXJpZnlfYWNjZXNzCj4gICBkcm0vcXhsOiB1c2UgREVGSU5FX0RSTV9HRU1f
Rk9QUygpCgpQZXJoYXBzIGluc3RlYWQgb2YgY2hhbmdpbmcgZHJpdmVycyB0byB1c2UgREVGSU5F
X0RSTV9HRU1fRk9QUywgbWFrZQp0aGF0IHRoZSBkZWZhdWx0IGlmIC5mb3BzIGlzIE5VTEwgKGFu
ZCBwZXJoYXBzIGFsc28gaWYgdGhlIGRyaXZlciBzZXRzCkRSSVZFUl9HRU0pLiBUaGF0IHdvdWxk
IGJlIGluIGxpbmUgd2l0aCBvdGhlciByZWNlbnQgcmV3b3JrIG1ha2luZwp2YXJpb3VzIGZ1bmN0
aW9uIHB0cnMgb3B0aW9uYWwuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
