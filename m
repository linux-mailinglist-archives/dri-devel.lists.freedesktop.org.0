Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C8C5AEF6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4765B6E9E1;
	Sun, 30 Jun 2019 06:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3521F6E9D0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:53 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q26so6610069lfc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xcdvZqJXhf35uYtoPKF6sH/y03GS1SxqXP4/qp6utxQ=;
 b=dGGouvs/inM+kJqVEVLz1qbpMqZsPpteOalFgHDc3xQEbXCQViqlk1NaLrUqHlgUOX
 Wmnw8YeO+nbZtvBgIo8ufeiRQT76TKkHtgr2mTv9oTp0JUDz0ovNca1imNQkbNwL6MgO
 N5653lWFfOD9LOup5vmcn6wiSmr94CT3WmhFwd4HFTAwZW3Bn/29auMU4LM2IcJpFCYs
 YDmWyTMRpYIRvYx3Uh84MWXV0Qpz3XaHR+IW1W6ozvAYok0klhDHzFL2othnuWk+l8vg
 UrlriK94BZKEzdEKGz04EMJXOHDyOU4CgBd3OA62j1lRRS9xQ4bN9ixIOAJ8FwOrTzkW
 HqXg==
X-Gm-Message-State: APjAAAXqm2ezvs9oCy78aUARD8fJe6TIecYUY0yYA8pXahJo9IIQ3QnV
 kcvJY0Nhi7srf3zFkyQR7ZMNo+1exi7M6Q==
X-Google-Smtp-Source: APXvYqw4LqTLBsX3V3TjyHZx2LEy5eFzH3d8iJRMeNfZw7eRixEw2QVEbdAFbw9tjAbh6sOuT0x+5Q==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr8980117lfj.167.1561875591143; 
 Sat, 29 Jun 2019 23:19:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 23/33] drm/i2c/ch7006: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:12 +0200
Message-Id: <20190630061922.7254-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcdvZqJXhf35uYtoPKF6sH/y03GS1SxqXP4/qp6utxQ=;
 b=IzI2iIndBARKSSPvnc/EJuzL7NbvrXRGlixma41aWFXLNmUEIcsDddZPHT6opCiMVE
 STHY8sUv/jdto8iYL7feJU3J3vSc5CKIhlWeghxC5dnY/yDSh3pdPvIA/gYsWGiG1lq1
 MuBP9rSw6mXQAjyXYSH29xQQ5TK+GQIN6d7c7SAMiQZoWuHvKwh+KNaCT/nljvfx4VBE
 L01UQ39upAYzDAQTi5wNQ5cM9dO6IZRZNv6Wt01q+c+sdY7Rbe1bdA4KKGK7ki3Abx3i
 lfSTTjWKQ58TlkFrzAeYLjIYtJNKqiEM2S/eLPfds2Lx6z7nsh1eXC2ObG7qQzKflWEG
 TOog==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2luZyB0aGUgZGVwcmVjYXRlZCBkcm1QLmggaGVhZGVyIGZpbGUuCkZpeCBmYWxsb3V0
LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTmVpbCBBcm1z
dHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1
ZGF1QGFybS5jb20+CkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNj
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQpUaGUg
bGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVudHMgdG8gdGhlIGNv
dmVyIGxldHRlci4KUGxlYXNlIGZpbmQgY292ZXIgbGV0dGVyIGhlcmU6Cmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhyZWFkLmh0bWwK
U2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1pc2MiCgogICAgICAg
IFNhbQoKIGRyaXZlcnMvZ3B1L2RybS9pMmMvY2g3MDA2X3ByaXYuaCB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJjL2No
NzAwNl9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTJjL2NoNzAwNl9wcml2LmgKaW5kZXggYjZl
MDkxOTM1OTc3Li45ODZiMDQ1OTk5MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMv
Y2g3MDA2X3ByaXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL2NoNzAwNl9wcml2LmgKQEAg
LTI3LDcgKzI3LDYgQEAKICNpZm5kZWYgX19EUk1fSTJDX0NINzAwNl9QUklWX0hfXwogI2RlZmlu
ZSBfX0RSTV9JMkNfQ0g3MDA2X1BSSVZfSF9fCiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXJf
c2xhdmUuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
