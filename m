Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B87260C8C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BBE6E059;
	Tue,  8 Sep 2020 07:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB16E059
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:54:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w2so16291941wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 00:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyuP55k/txQU8Qavag22Z7+e0rUydKfwB7MhziBkWA=;
 b=IlKLM/V4WVAAF5C6UBwIZKBIE1WSziNp6P465eu0YCqj+PNnmuZbxxVhsmyBd6cNUj
 59ZYQBae1qOET3I8/xl5AGZZfHhN2Ej3aRPCrK4Yx8hvozgLjAfKMOpm6sDYPkx390zA
 fIw0Qco5ymgedDcLO2EXv7D5DI6mkaucPTDs2/EBwprlcv5SieAKUg/MKBnCwIILiz5P
 DejpAcCYm3bCdcqLqz9+gJ+WZUGigRshU/TchCBG2i7ZBQZke93uo/ECMY8bPaqYNZDZ
 p5hXe8xG/2dj6g99vR8C3pphhOUjcA8MsJc2SQ3GYSUYYdwAN3mFNqvBCqe76a8lPEGN
 z0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXyuP55k/txQU8Qavag22Z7+e0rUydKfwB7MhziBkWA=;
 b=qP+AQ8BrA6gW4Norg3bjso2H9QZBC25jKOqBPeo1hpDVjefzJPzXgxOuO98BAOOECm
 NmvUYkLOcvRh9Swa97/o1TTLiL/JrpY5I6uMrwwgrQyCjlSILCwEeIj5KYYiitw4rT+Z
 EAtFcq+Niw2NTb0JX3jVaAr8v3LB74bKnyZ6e71a1bA7iPweJZfN4juYTJaMEYlETLWC
 6B/P/prV6kPo1U/Lv/X+W5vmA6UAttAcs1ymUlMVfh6Iz4h92kBVfpOUGYpz94XKgHvU
 4Lps8bJ9DgeT+rRB+0b4Z2XnWJnWRENnM5rthW/niaCg3tOBRH822nS9cAC2Xviu5XYb
 40Iw==
X-Gm-Message-State: AOAM533dQ3DcG+OfX2nBEIXZjOVaHVgvGr625cmWdoVU0XZ1i3IZcXz8
 WTPzQY1bXnj4X1Lz8TAZ5e+arQ==
X-Google-Smtp-Source: ABdhPJwDh1eoKWZjAIC9Lu2S/bF0Q1t8OpRqNst9tAsHP3ivthW9uML4FgowbJDYclYeWq08p24mYA==
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr3009443wmj.36.1599551666927;
 Tue, 08 Sep 2020 00:54:26 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH v3 0/4] drm: panel: add support for TDO tl070wsh30 panel
Date: Tue,  8 Sep 2020 09:54:17 +0200
Message-Id: <20200908075421.17344-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHN1cHBvcnQgYmluZGluZ3MgYW5kIHN1cHBvcnQgZm9yIHRoZSBURE8gVEwwNzBX
U0gzMCBURlQtTENEIHBhbmVsCm1vZHVsZSBzaGlwcGVkIHdpdGggdGhlIEFtbG9naWMgUzQwMCBE
ZXZlbG9wbWVudCBLaXQuClRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQg
dXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KSXQgcHJvdmlkZXMgYSBNSVBJIERTSSBpbnRlcmZh
Y2UgdG8gdGhlIGhvc3QsIGEgYnVpbHQtaW4gTEVEIGJhY2tsaWdodAphbmQgdG91Y2ggY29udHJv
bGxlci4KCkNoYW5nZXMgc2luY2UgdjIgYXQgWzJdOgotIGFkZGVkIHJlc2V0IGdwaW8gdG8gcGFu
ZWwtc2ltcGxlLWRzaSBiaW5kaW5ncwotIG1vdmVkIGJpbmRpbmdzIHRvIHBhbmVsLXNpbXBsZQot
IHJlLW9yZGVyZWQgcHJlcGFyZS91bnByZXBhcmUKLSBhZGRlZCBiYWNrIHJlZnJlc2ggcHJpbnQK
LSBtb3ZlZCByZWd1bGF0b3IvcmVzZXQgaGFuZGxpbmcgaW4gcHJlcGFyZS91bnByZXBhcmUKLSBh
bGlnbmVkIHJlbW92ZS9zaHV0ZG93biB3aXRoIHBhbmVsLXNpbXBsZQotIGFkZGVkIHNlbnRpbmVs
IGNvbW1lbnQgaW50byBkdCBtYXRjaCB0YWJsZQoKQ2hhbmdlcyBzaW5jZSB2MSBhdCBbMV06Ci0g
YWRkZWQgbWlzc2luZyB2ZW5kb3ItcHJlZml4ZXMgcGF0Y2gKLSByZW1vdmVkIHZyZWZyZXNoCi0g
Zml4ZWQgd2FybmluZyBvbiBhZGRfcGFuZWwgcmV0dXJuCi0gcmVtb3ZlZCBEUk0gbG9nZ2luZwoK
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODEzNzYvI3JldjEK
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODEzNzYvI3JldjIK
Ck5laWwgQXJtc3Ryb25nICg0KToKICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQg
U2hhbmdoYWkgVG9wIERpc3BsYXkKICAgIE9wdG9sZWxlY3Ryb25pY3MgdmVuZG9yIHByZWZpeAog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbC1zaW1wbGUtZHNpOiBhZGQgb3B0aW9uYWwgcmVz
ZXQgZ3BpbwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbC1zaW1wbGUtZHNpOiBhZGQgVERP
IFRMMDcwV1NIMzAgRFNJIHBhbmVsCiAgICBiaW5kaW5ncwogIGRybTogcGFuZWw6IGFkZCBURE8g
dGwwNzB3c2gzMCBwYW5lbCBkcml2ZXIKCiAuLi4vZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUt
ZHNpLnlhbWwgICAgICAgfCAgIDMgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXBy
ZWZpeGVzLnlhbWwgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdz
aDMwLmMgIHwgMjUwICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyNjcgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10ZG8tdGwwNzB3c2gzMC5jCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
