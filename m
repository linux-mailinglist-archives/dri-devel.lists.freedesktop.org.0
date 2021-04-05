Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA2354CDF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610716E5D4;
	Tue,  6 Apr 2021 06:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ECA89D44
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 18:15:07 +0000 (UTC)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lTTkf-0004np-FW
 for dri-devel@lists.freedesktop.org; Mon, 05 Apr 2021 18:15:05 +0000
Received: by mail-wr1-f70.google.com with SMTP id e9so8674728wrg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Apr 2021 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7CUk/iAsFieG2zHKAIGqtut7zOrbBM0NXHpnT3k1Fp8=;
 b=R4LiXlsfbC7tRNHnzhyd854BKuqxAd6hWHmzG8bHGyVVa8WmlyarmxzB9Bpxc7eLig
 A/bfCPu+xoyhLrDGPYgtXizJQL5kXBBWSGCObdlGe8dMKJXx2v5C/ttOJHodQaJY8TE0
 1cuSsL9FwSWMocRwUb30EwlbbdYKr51XnXpLsa+iSuIaiwnI1XDflHtAS4sW6gfK5Enn
 mh0wGEgfTWLfaos7twXwoKiL/2kqbwqJ01d5YxYkpGg+1qNEq0/iuO/ynzIBOVCqBMMr
 ZjBhexuQdTilwtZcg5wjFhoEQo8DCoh/iP8ROe5fzWCH975cWKSzysx8/pkOu7B80fW4
 YFlQ==
X-Gm-Message-State: AOAM53123RCHIdR73j4Ea++4i9ejGIlc0n4psvckCPO7/gbqbrByur4v
 4PhsJfJKlLyovJLv/f+suxEkMQA98KxNWXHP8kOTeLuz7tEKgaXNn5OXZEk8Q43hzQacBb7Zldd
 5t7oJyVcfEW932Xz0rSv6ayhcnK9pCpIbt906sCxyP/vmGQ==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr29937623wrv.329.1617646505271; 
 Mon, 05 Apr 2021 11:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcySNNIL5pxzASqJNBtYeVlH+A1mUzX3rBltnRY1vbBomaDpZYGOwBWGOL7Dx+fWCYM1AvYw==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr29937613wrv.329.1617646505165; 
 Mon, 05 Apr 2021 11:15:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id 64sm336695wmz.7.2021.04.05.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 11:15:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: ld9040: reference spi_device_id table
Date: Mon,  5 Apr 2021 20:15:02 +0200
Message-Id: <20210405181502.52291-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVmZXJlbmNlIHRoZSBzcGlfZGV2aWNlX2lkIHRhYmxlIHRvIHNpbGVuY2UgVz0xIHdhcm5pbmc6
CgogIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLWxkOTA0MC5jOjM3NzozNToK
ICAgIHdhcm5pbmc6IOKAmGxkOTA0MF9pZHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KClRoaXMgYWxzbyB3b3VsZCBiZSBuZWVkZWQgZm9yIG1hdGNo
aW5nIHRoZSBkcml2ZXIgaWYgYm9vdGVkIHdpdGhvdXQKQ09ORklHX09GIChhbHRob3VnaCBpdCdz
IG5vdCBuZWNlc3NhcmlseSByZWFsIGNhc2UpLgoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLWxkOTA0MC5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2Ftc3VuZy1sZDkwNDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5n
LWxkOTA0MC5jCmluZGV4IGY0ODQxNDdmYzNhNi4uYzRiMzg4ODUwYTEzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1sZDkwNDAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1sZDkwNDAuYwpAQCAtMzgzLDYgKzM4Myw3IEBA
IE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBsZDkwNDBfaWRzKTsKIHN0YXRpYyBzdHJ1Y3Qgc3Bp
X2RyaXZlciBsZDkwNDBfZHJpdmVyID0gewogCS5wcm9iZSA9IGxkOTA0MF9wcm9iZSwKIAkucmVt
b3ZlID0gbGQ5MDQwX3JlbW92ZSwKKwkuaWRfdGFibGUgPSBsZDkwNDBfaWRzLAogCS5kcml2ZXIg
PSB7CiAJCS5uYW1lID0gInBhbmVsLXNhbXN1bmctbGQ5MDQwIiwKIAkJLm9mX21hdGNoX3RhYmxl
ID0gbGQ5MDQwX29mX21hdGNoLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
