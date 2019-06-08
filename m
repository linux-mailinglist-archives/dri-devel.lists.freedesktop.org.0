Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855439BC4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E89892B1;
	Sat,  8 Jun 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03993892B1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 08:19:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u10so3263901lfm.12
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2019 01:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=o0+cwbFXWNkOvt9ImmS+Hcr58+fBEyXg8yewheAIzRQ=;
 b=ZuzmLEsaKUurRHtjEulyxoW39TtcG2iahRz42qp4o3sCDUf6I+O7F3AG+CXoNSdMoQ
 xlm7QGM0xWrNgGURtRDIz2PrI8NWhJ6d4h08nxlIazQ3bbB2C5gsbInzXxwPPH14AnSP
 1A6Oib5/mJfdVjlYRI19Ea3/kYIgGfFQlYZkTFik0RCqOhMNJ/QrHhGPFiDEtVbB/MBL
 QWKUuw3XqJTkcHaewCBlUpxwunNqNT2GQloFXPl9ZUY6XDuJRVWhNbRa6S7feesbgvt+
 J2LcF/5F9AM4wnsuNJLIqJqHb1pZphbDmAzdkIH+tRtjCR9Cmm3kv7Cb8VPXDX43NaS7
 iCGQ==
X-Gm-Message-State: APjAAAUXq3E43X4QYKKXhkOlCRfyFdtnU6lpvyBrg+OrqnfEmZEDk1Fs
 DZ1h/t+Eu+YeLyv+FmrFO084fNNo8n4=
X-Google-Smtp-Source: APXvYqwEwOmr66HvwmlL6YsXv2giLDSW12HoYVUiaIjoDMmO+/yT9omUB2LFLTrkEvI3XzxsGx+cbA==
X-Received: by 2002:a19:bec9:: with SMTP id o192mr6249556lff.78.1559981970246; 
 Sat, 08 Jun 2019 01:19:30 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k82sm747311lje.30.2019.06.08.01.19.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:19:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/{mga,mgag200}: drop use of drmP.h
Date: Sat,  8 Jun 2019 10:19:19 +0200
Message-Id: <20190608081923.6274-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o0+cwbFXWNkOvt9ImmS+Hcr58+fBEyXg8yewheAIzRQ=;
 b=UVu9q5Lk52zqg7f1epFlA/PvhViXPjVbJy2rRHiOlfWau10Y+uiOFCHXjL2ZFsdAd9
 2RFvhQsl4RS+kWDgcVDQFXvXK2ppiIPL8hD/w/jDxeOMgMR864iZZsG6ebVoKppewW4V
 YNeVpDZ50YY1rQZfrrlyNtTfIQvDErAYajfuNZYjS7KMYzApYgKbUxN/T8eNZqqIugbi
 fPQ+Gdsplf0T2pVhCLph2S6O8+HJnvC4jHEUTA7C6/YZhKw2OZIS7lhH5PTR/dwGvJS2
 XLQlfIZHl0+Z4LGfNQX51FwekFeFDo8QwxpbxstgPwyXPc1jp6irvzQCwczVjcZG7vv8
 fcSg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpBbHNvIGRyb3Ag
dXNlIG9mIGRybV9vc19saW51eC5oIGFzIGl0IGlzIGRlcHJlY2F0ZWQgdG9vLAphbmQgd2FzIHB1
bGxlZCBpbiB2aWEgZHJtUC5oCgpCdWlsZCB0ZXN0ZWQgd2l0aCBhbGxtb2Rjb25maWcsIGFsbHll
c2NvbmZpZyBvbgp2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpTYW0gUmF2bmJvcmcgKDQpOgogICAgICBkcm0vbWdh
OiBkcm9wIGRlcGVuZGVuY3kgb24gZHJtX29zX2xpbnV4LmgKICAgICAgZHJtL21nYTogbWFrZSBo
ZWFkZXIgZmlsZSBzZWxmIGNvbnRhaW5lZAogICAgICBkcm0vbWdhOiBkcm9wIHVzZSBvZiBkcm1Q
LmgKICAgICAgZHJtL21nYWcyMDA6IGRyb3AgdXNlIG9mIGRybVAuaAoKIGRyaXZlcnMvZ3B1L2Ry
bS9tZ2EvbWdhX2RtYS5jICAgICAgICAgICAgfCAxNCArKysrKysrKy0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL21nYS9tZ2FfZHJ2LmMgICAgICAgICAgICB8ICA3ICsrKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZ2EvbWdhX2Rydi5oICAgICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKyst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pb2MzMi5jICAgICAgICAgIHwgIDMgKy0tCiBk
cml2ZXJzL2dwdS9kcm0vbWdhL21nYV9pcnEuYyAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyAgICAgICAgICB8ICA4ICsrKy0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbWdhL21nYV93YXJwLmMgICAgICAgICAgIHwgIDQgKy0tLQogZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYyB8ICAzICsrLQogZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAgICB8IDEwICsrKysrKystLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggICAgfCAgOCArKystLS0tLQogZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9mYi5jICAgICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX21haW4uYyAgIHwgIDQgKysrLQogZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF90dG0uYyAgICB8ICAzICsrLQogMTUgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygr
KSwgNDcgZGVsZXRpb25zKC0pCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
