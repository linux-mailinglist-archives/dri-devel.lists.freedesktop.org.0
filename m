Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B005226F7
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328A88915B;
	Sun, 19 May 2019 14:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75C989132
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:50 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id n134so8394912lfn.11
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5pxJ2JFvl5eHZPFStjYysW3W1x+2ldXkY3yeb3RrcRc=;
 b=nEVKYQ7D5X6Ik5eUbY4xC3fpUwqFAk3J7ZZhD/4D8YpL6W/yLY864eGKI4d79loQ3q
 JQIfbTr4pkaSSM/cSaF9DIpY57oku6wmAA9PXQe4iLHSg9aG/cmwD26Iz+S921pfRuvX
 aqTbz7Hv1YNIjJ4X4UAKtZpUP2QnPgz/GZvPsh3GppO7jQaUp5Rp2jyR+YQT2DvcKaWn
 q0cCAtwl1yUQFvVaI4dD2OwzxBU9FwPG8Goi57GISchuCFxBDoijweICzBGQD0XrfTcq
 TZWUtWAhivlp4kydkB6JpO+9a13qK2hbvDycd1RFHzHuDC3l9eUY8NSRo3LZbr+q5V+V
 y1Xw==
X-Gm-Message-State: APjAAAWM71coiFwuALOmk1TZ7ovrBSl/Cc7p3yyMYvtw/I0E9XjjM3Hh
 ZAdvORmsdWhS46BWbt6Gw2NkfpCa
X-Google-Smtp-Source: APXvYqxmUAt4h33kZ1jh0U19c1F6YLmeSTRjjI4ywj4J2kRyyv7Yh9OZxmwAoC4Tm/2fG7o+8NuYoQ==
X-Received: by 2002:a19:2791:: with SMTP id n139mr25496436lfn.67.1558275649047; 
 Sun, 19 May 2019 07:20:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/6] drm: make headers self-contained
Date: Sun, 19 May 2019 16:20:30 +0200
Message-Id: <20190519142036.22861-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5pxJ2JFvl5eHZPFStjYysW3W1x+2ldXkY3yeb3RrcRc=;
 b=lYFdVz7BSXPnpn7LX1M9Q367zg+1a4X7cUwzn4rmQgR0zC7WGjiZ4qUrLNznUUqcnR
 31hvyyod8bGVmI7dNNpkJxPKD188xbWcxpQXKOSjTl0zU72dumcDv5woSBql6o2gkFHE
 dLyr0p82ARECCAGnKosQhpHfw3M3z7iU3UDUYmAX8rz0ef1C9VpzeuGl+/Bb/h6CsP5N
 NSoMWfm6K/ODL0ZC/u10icGC6chwEqI0RZRz/qkb6Zwo9FGIZrSVlb8TD5seM74HGpok
 L5ID3Fr301+HwyU9pb9apCmHW3CAl2NAjXGZqGsvsdW1R3m1C3o7mVr0b00MmJDfTABy
 dGFw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgcmVtb3ZpbmcgdXNlIG9mIGRybVAuaCBmcm9tIGZpbGVzIGluIGRybS8qIEkKbm90aWNl
ZCB0aGF0IEkgaGFkIHRvIGFkZCB0aGUgc2FtZSBpbmNsdWRlIGZpbGVzIGR1ZSB0bwpidWlsZCBl
cnJvcnMgaW4gdGhlIGhlYWRlciBmaWxlcy4KCkl0IGlzIGJldHRlciB0byBsZXQgdGhlIGhlYWRl
ciBmaWxlcyBpbmNsdWRlIHdoYXQgaXMgbmVjZXNzYXJ5CmFuZCBsZXQgdGhlIHVzZXJzIHB1bGwg
aW4gb25seSB0aGUgYWRkaXRpb25hbCBoZWFkZXJzIGZpbGVzIHJlcXVpcmVkLgpTbyBJIHdlbnQg
YWhlYWQgYW5kIG1hZGUgdGhlIGhlYWRlciBmaWxlcyBzZWxmLWNvbmF0aW5lZC4KKEkgZGlkIG5v
dCBjaGVjayBpZiB0aGlzIG1hZGUgYW55IGluY2x1ZGVzIHJlZHVuZGFudCBpbiBzb21lIGZpbGVz
LApJIGRvIG5vdCBoYXZlIHRvb2xpbmcgaW4gcGxhY2UgdG8gZG8gc28pLgoKVGhlc2UgcGF0Y2hl
cyBhcmUgcHJlcGFyYXRpb24gZm9yIHJlbW92aW5nIHVzZSBvZiBkcm1QLmggaW4gYWxsCnRoZSBm
aWxlcyBpbiBkcm0vKgoKSSBoYXZlIHRoZSBwYXRjaHNldCByZWFkeSAtIG9uZSBwYXRjaCBwZXIg
ZmlsZS4KSXQgaXMgYSBsb3Qgb2Ygc21hbGwgcGF0Y2hlcyAoNTkpIGFuZCBtYXliZSBpdCBpcyBi
ZXR0ZXIgdG8Kc3F1YXNoIHRoZW0gYWxsIGludG8gb25lIGJpZyBwYXRjaC4gQW55IG9waW5pb25z
IG9uIHRoaXM/CgpJIHdpbGwgYXdhaXQgZmVlZGJhY2sgb24gdGhpcyBwYXRjaHNldCBiZWZvcmUg
c2VuZGluZyB0aGUKcGF0Y2goZXMpIHRvIHJlbW92ZSBkcm1QLmggaW4gZHJtLyoKCglTYW0KClNh
bSBSYXZuYm9yZyAoNik6CiAgICAgIGRybTogbWFrZSBkcm1fYXV0aC5oIHNlbGYgY29udGFpbmVk
CiAgICAgIGRybTogbWFrZSBkcm1fbGVnYWN5Lmggc2VsZi1jb250YWluZWQKICAgICAgZHJtOiBt
YWtlIGRybV9jcnRjX2ludGVybmFsLmggc2VsZi1jb250YWluZWQKICAgICAgZHJtOiBtYWtlIGRy
bV9pbnRlcm5hbC5oIHNlbGYtY29udGFpbmVkCiAgICAgIGRybTogbWFrZSBkcm1fbGVnYWN5Lmgg
c2VsZi1jb250YWluZWQKICAgICAgZHJtOiBtYWtlIGRybV90cmFjZS5oIHNlbGYtY29udGFpbmVk
CgogZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjX2ludGVybmFsLmggfCAyNCArKysrKysrKysrKysr
KysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCAgICAgIHwgMTAgKysr
KysrKysrLQogZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3kuaCAgICAgICAgfCAgNCArKysrCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmggICAgICAgICB8ICAyICsrCiBpbmNsdWRlL2RybS9k
cm1fYXV0aC5oICAgICAgICAgICAgICB8ICA3ICsrKysrKysKIGluY2x1ZGUvZHJtL2RybV9sZWdh
Y3kuaCAgICAgICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
