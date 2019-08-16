Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD688F9B1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 06:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8386EABB;
	Fri, 16 Aug 2019 04:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522B6EABB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 04:22:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id e27so4110883ljb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 21:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=idW84Lt4wQrZ+T6IktWRZghuJXQuOYw1V00dQ6+sPDY=;
 b=a3WRwZ+NrKujS/h4WGQOr8qMoZar0FfqM+/4ON3sBPlFi/psXoVWTKjUhtY8PF6uzb
 48MEBlZH64HYvazMjnnntEf6lmuv2TxJNaeuDuD1FeOBkdmboGA5RjyX64OzoSJW4sBN
 th6W9CpElBVgO9YmdWRL7p1tQ3ZlkSpY2TUIFpBZxAhfWqvJV4j6Q3kxg2JyTLIVKkt8
 Vq7v1rXFLe7wOf4Iggp8RsQP+TPc3XYsiNvOjsGUxeRgNCh1V5iQ6Ra6IHUMEn1jgiIa
 ONiRdwEbQW4/Gp0iKpWBQXL1mkTYpsmqQkmGfG6iW6qhkACuyt5jHa0xPJgo4rjTgYnh
 HxvQ==
X-Gm-Message-State: APjAAAUau6XsRnHVZ+P+3TSgJHprheBC0qIl9+A+d2ziWPeQMBInT6PJ
 E2oZ/59arqxzwWNU6+KiQIgoJihgEvm59oLthR8=
X-Google-Smtp-Source: APXvYqyDqwbU6cnzYDXq7vqgdm22zPpOJCbB9e2lxfaUyzwy+oREAXrRGsDmd97RB7vxX79EZ6D80xLc8XWlTirrSoE=
X-Received: by 2002:a2e:6342:: with SMTP id x63mr4308964ljb.95.1565929327525; 
 Thu, 15 Aug 2019 21:22:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Aug 2019 14:21:56 +1000
Message-ID: <CAPM=9tx2Kkbyor2-EnK31VE1eARbq6zCyNgqj39tyLqd8uUWKA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.3-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=idW84Lt4wQrZ+T6IktWRZghuJXQuOYw1V00dQ6+sPDY=;
 b=U1cPBKH2eroajZ/Rc9Gv7dAvg+LwRrqHqwMod0qeBi+X1I95MN8gDPAmhzC+Op3UY/
 2C+ZPAVee2tDe9IOPPjPDGRu3A9YfXLq0SL5iDh7CH/+axxLDk4oPCliPZr12s5a/L3I
 PTEy8hXSut8dXgwi2hIU3sHJRLxCSteqBVrGWnc0iDC9RAS8UF4J0x2xssZqnWfNmHOW
 KyWXgkFJzorxMwhO0k/Ahm8cPHXcraiAr+u4FnePdyVPXPzjZMvusWL9J2WYcvrPPymR
 aPmx9YuC4gKBgW7y4ZQPL0FwblWvY+3L5ZrPF6TwfFaBTAMzlhL7IQhNk3S+CwgQb6Az
 MnTA==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpOb3RoaW5nIHRvbyBjcmF6eSB0aGlzIHdlZWssIG9uZSBhbWRncHUgZml4IHRv
IHVzZSB2bWFsbG9jIGZvciBhCnN0cnVjdCB0aGF0IGdyZXcgaW4gc2l6ZSwgYW5kIGFub3RoZXIg
TVNUIGZpeCBmb3Igbm91dmVhdSwgYW5kIHNvbWUKb3RoZXIgbWlzYyBmaXhlcy4KClJlZ2FyZHMs
CkRhdmUuCgpkcm0tZml4ZXMtMjAxOS0wOC0xNjoKZHJtIGZpeGVzIGZvciA1LjMtcmM1CgppOTE1
OgotIHNpbmdsZSBHVlQgdXNlIGFmdGVyIGZyZWUgZml4CgpzY2hlZHVsZXI6Ci0gZW50aXR5IGRl
c3RydWN0aW9uIHJhY2UgZml4CgphbWRncHU6Ci0gc3RydWN0IGFsbG9jYXRpb24gZml4Ci0gZ2Z4
OSBzb2Z0IHJlY292ZXJ5IGZpeAoKbm91dmVhdToKLSBmb2xsb3d1cCBNU1QgZml4Cgphc3Q6Ci0g
dmdhIHJlZ2lzdGVyIHJhY2UgZml4LgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IGQ0NTMzMWIwMGRkYjE3OWUyOTE3NjY2MTcyNTkyNjFjMTEyZGI4NzI6CgogIExpbnV4IDUuMy1y
YzQgKDIwMTktMDgtMTEgMTM6MjY6NDEgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybSB0
YWdzL2RybS1maXhlcy0yMDE5LTA4LTE2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
YTg1YWJkNWQ0NWFkYmE3NTUzNWI3ZmM2ZDlmNzgzMjlhNjkzYjdhOToKCiAgTWVyZ2UgdGFnICdk
cm0taW50ZWwtZml4ZXMtMjAxOS0wOC0xNScgb2YKZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5v
cmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1maXhlcyAoMjAxOS0wOC0xNgoxMjo0MTo1MiArMTAw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZHJtIGZpeGVzIGZvciA1LjMtcmM1CgppOTE1OgotIHNpbmdsZSBHVlQgdXNl
IGFmdGVyIGZyZWUgZml4CgpzY2hlZHVsZXI6Ci0gZW50aXR5IGRlc3RydWN0aW9uIHJhY2UgZml4
CgphbWRncHU6Ci0gc3RydWN0IGFsbG9jYXRpb24gZml4Ci0gZ2Z4OSBzb2Z0IHJlY292ZXJ5IGZp
eAoKbm91dmVhdToKLSBmb2xsb3d1cCBNU1QgZml4Cgphc3Q6Ci0gdmdhIHJlZ2lzdGVyIHJhY2Ug
Zml4LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpBbGV4IERldWNoZXIgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IHVz
ZSBrdm1hbGxvYyBmb3IgZGNfc3RhdGUgKHYyKQoKQ2hyaXN0aWFuIEvDtm5pZyAoMSk6CiAgICAg
IGRybS9zY2hlZHVsZXI6IHVzZSBqb2IgY291bnQgaW5zdGVhZCBvZiBwZWVrCgpEYW4gQ2FycGVu
dGVyICgxKToKICAgICAgZHJtL2k5MTU6IFVzZSBhZnRlciBmcmVlIGluIGVycm9yIHBhdGggaW4g
aW50ZWxfdmdwdV9jcmVhdGVfd29ya2xvYWQoKQoKRGF2ZSBBaXJsaWUgKDIpOgogICAgICBNZXJn
ZSB0YWcgJ2RybS1maXhlcy01LjMtMjAxOS0wOC0xNCcgb2YKZ2l0Oi8vcGVvcGxlLmZyZWVkZXNr
dG9wLm9yZy9+YWdkNWYvbGludXggaW50byBkcm0tZml4ZXMKICAgICAgTWVyZ2UgdGFnICdkcm0t
aW50ZWwtZml4ZXMtMjAxOS0wOC0xNScgb2YKZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
ZHJtL2RybS1pbnRlbCBpbnRvIGRybS1maXhlcwoKSmFuaSBOaWt1bGEgKDEpOgogICAgICBNZXJn
ZSB0YWcgJ2d2dC1maXhlcy0yMDE5LTA4LTEzJyBvZgpodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
Z3Z0LWxpbnV4IGludG8gZHJtLWludGVsLWZpeGVzCgpMeXVkZSBQYXVsICgxKToKICAgICAgZHJt
L25vdXZlYXU6IE9ubHkgcmVjYWxjdWxhdGUgUEJOL1ZDUEkgb24gbW9kZS9jb25uZWN0b3IgY2hh
bmdlcwoKUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBm
aXggZ2Z4OSBzb2Z0IHJlY292ZXJ5CgpZLkMuIENoZW4gKDEpOgogICAgICBkcm0vYXN0OiBGaXhl
ZCByZWJvb3QgdGVzdCBtYXkgY2F1c2Ugc3lzdGVtIGhhbmdlZAoKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGMuYyB8IDExICsrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tYWluLmMgICAgICAgICAgIHwgIDUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgICAg
IHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICB8IDIy
ICsrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZW50aXR5LmMgfCAgNCArKy0tCiA4IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
