Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF215E5F0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DDC6E145;
	Wed,  3 Jul 2019 14:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA596E145;
 Wed,  3 Jul 2019 14:01:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r6so2814140qkc.0;
 Wed, 03 Jul 2019 07:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pU+ulSQn+ZlhGldI6Scg4oHIBLfDs2QcuO3ZQ1cRwHY=;
 b=MBrG6utpfPvsrvxiig3MY3Bc68ArJuyZz+vdeFHcbOX9o99pwhfS95a3DQ56DJZRqX
 YNRurEOoTA3pDWM9jODQn3i77KpZ+TllXqt1SKSCPv872L80dy6sAD9mE5+4zPGosiUk
 QLhq5OQyqyZQPcHJ6mwg3NqnWkJ7M/4KlC42gabtShSVTJ6hmoRGkS0c4s0m3bezoQbq
 rAO5QzoxlOszrRiEUwdtzmmIJqOgnpmeLf9PjTguZBIFZcbHUSV/GBut5aKwtysGVWWY
 Uh2ay7b1WMZx2GvaavhjFxNNQopKIreYYSepUw+P5b/DuW+egc9/nXBmRCmy7JIGCkPi
 dZFg==
X-Gm-Message-State: APjAAAUIzxiov1ZAMgE2wVv30EuhqgUKF4UkURYHCij7U9a26WzDrOPY
 G6mHI7lGhzg8giQwYL3gk5fjEw3v5TMumQ==
X-Google-Smtp-Source: APXvYqw69wTmSRidwjuI0ULggx0yzPo/UQ16JgPUj0BHwSZYN571l1o3ZGv9uNg8v/sZRZ4QHk9J/g==
X-Received: by 2002:a37:8145:: with SMTP id c66mr29785590qkd.459.1562162463060; 
 Wed, 03 Jul 2019 07:01:03 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id e8sm917213qkn.95.2019.07.03.07.01.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 07:01:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
Date: Wed,  3 Jul 2019 07:00:35 -0700
Message-Id: <20190703140055.26300-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pU+ulSQn+ZlhGldI6Scg4oHIBLfDs2QcuO3ZQ1cRwHY=;
 b=Ihp86dKNA7MEEJHwjJvi6sNNYe4VASlt7jK8NWr/vk4IOoT+8oKo6jowwy0cc0wJOx
 dpP4SmOcGyG22A364buKMVtSvKeyOKhX9PAbMZFC6yJW/Eay1fb6r3bFdoGMP0cjsM4u
 ODtJdCD0sR/Sn3Zf1xm5JbXvMNMUozI81ZUvlJY+mDRm64MMCQJYATMBm2h76T2LI6Ib
 j0R0UmKn6W4rtZQuHN08YhrG3q37U/v0wK76fVgpidbgYnxiu+0yGbCy4+hb5T0w3TEm
 uN4A8NEDE3nkfFmwIIsyZq6aREPfxWq8u769pI2LuKI4UBtp6mU5sBEOPQLCGHO5dQCz
 VVlw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRm9yIHBsYXRmb3JtcyB0
aGF0IHJlcXVpcmUgdGhlICJ6YXAgc2hhZGVyIiB0byB0YWtlIHRoZSBHUFUgb3V0IG9mCnNlY3Vy
ZSBtb2RlIGF0IGJvb3QsIHdlIGFsc28gbmVlZCB0aGUgemFwIGZ3IHRvIGVuZCB1cCBpbiB0aGUg
aW5pdHJkLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2FkcmVub19kZXZpY2UuYwppbmRleCBkOWFjOGM0Y2Q4NjYuLmFhNjQ1MTRhZmQ1YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2RldmljZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwpAQCAtMTc0LDYg
KzE3NCwxMCBAQCBNT0RVTEVfRklSTVdBUkUoInFjb20vYTUzMF96YXAuYjAxIik7CiBNT0RVTEVf
RklSTVdBUkUoInFjb20vYTUzMF96YXAuYjAyIik7CiBNT0RVTEVfRklSTVdBUkUoInFjb20vYTYz
MF9zcWUuZnciKTsKIE1PRFVMRV9GSVJNV0FSRSgicWNvbS9hNjMwX2dtdS5iaW4iKTsKK01PRFVM
RV9GSVJNV0FSRSgicWNvbS9hNjMwX3phcC5tZHQiKTsKK01PRFVMRV9GSVJNV0FSRSgicWNvbS9h
NjMwX3phcC5iMDAiKTsKK01PRFVMRV9GSVJNV0FSRSgicWNvbS9hNjMwX3phcC5iMDEiKTsKK01P
RFVMRV9GSVJNV0FSRSgicWNvbS9hNjMwX3phcC5iMDIiKTsKIAogc3RhdGljIGlubGluZSBib29s
IF9yZXZfbWF0Y2godWludDhfdCBlbnRyeSwgdWludDhfdCBpZCkKIHsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
