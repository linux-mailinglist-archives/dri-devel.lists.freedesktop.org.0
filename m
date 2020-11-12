Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F92B0D3C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD146E3E3;
	Thu, 12 Nov 2020 19:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1F6E3DA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so6195264wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WLjHfl3orvIQYtFk8cWNm313KtEs9zxT+XRuqJ/3Ug=;
 b=s4lVN2Hsx8GQ3TeqOoSE+KsBPJlUyYD142nagiXHMQJgIDfn1bY4BwRFQBD8Vbl9FQ
 O1+Z4SJSb0AKtr0z4NL7sqVeIdUmqJgfibxF7FcTPCDjxi72V/cgW+I45MyNR7hyQatY
 Qq6fLZTJliIXtLc70YQLXh9XCIkxcvBrW28WU+HTtjc9SLVqe0wfSak6HsnGU4+CHXD2
 TLxVHbtf1X+A4xTTQUaJmHS+quv06uqVKJCznn0DlN8LHoqBZKvJ05NZTDOTgolMzCmA
 p7dTjD0sVkTvS3CHvXQSUXtaP5QslSGjSxcJeX6go4uEcgyGTct/hmAMIrOA64HMzKE5
 4F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WLjHfl3orvIQYtFk8cWNm313KtEs9zxT+XRuqJ/3Ug=;
 b=RniRTQftJ9YOSkWeNnjhwMIR8o/wMFzXaFC/q1DbE6qIZZ/Eb49LC3Xh/LZQ22ZrUu
 Y9vE+EdpBKyutbHaaqVgEg2aKFP6QOc5v3yASCOpPoowYOWGCBijKIhpvyjYZR3u5I4v
 Px53c6Q4GhZww7xHObsACauluNJ61LgGfX1Jw62NCC1o2GowmxrU8RO+4KErNGPAoQ/h
 oEgkelQvBhky20elepTOI+Lk4wKYhGotK1dPi9gn+JrW81Hl+0hhJOntl3cPz0TWivue
 EWC+GzwuIi5HvmJVIqk0ShSvtihR3mqKkF0sw0s8LUHbCJCEjbW1j0jgHkQTqUXJtuQ5
 RV2g==
X-Gm-Message-State: AOAM533pevGp8TxUe6sHvHTCyjIxkAPP5FzguPD87qjFYFRstcbXLbiU
 uHWYcqZfjTFY/UAUj7bHUafQRg==
X-Google-Smtp-Source: ABdhPJxXaF3jZQ2mBJbDe3b1AG/65HW5oMGlPkeTd6SbS62ThvjaB4q1OUbAYzVP+iDACDMmHv8Kxw==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr999880wma.147.1605207703616; 
 Thu, 12 Nov 2020 11:01:43 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/30] drm/rockchip/rockchip_lvds: Fix struct document
 formatting
Date: Thu, 12 Nov 2020 19:00:34 +0000
Message-Id: <20201112190039.2785914-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TXVzdCBzdGFydCB3aXRoICJzdHJ1Y3QgPG5hbWU+IgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEg
a2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2x2ZHMuYzo0OTogd2FybmluZzogY2Fubm90IHVuZGVyc3RhbmQgZnVuY3Rpb24gcHJvdG90
eXBlOiAnc3RydWN0IHJvY2tjaGlwX2x2ZHNfc29jX2RhdGEgJwoKQ2M6IFNhbmR5IEh1YW5nIDxo
amNAcm9jay1jaGlwcy5jb20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXJrIFlhbyA8bWFyay55YW9Acm9jay1jaGlwcy5jb20+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfbHZkcy5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9sdmRzLmMKaW5kZXggZjI5MmM2YTZlMjBmYi4uODY1OGVmODJkOTM3YiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2x2ZHMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfbHZkcy5jCkBAIC00Miw3ICs0Miw3IEBA
IHN0cnVjdCByb2NrY2hpcF9sdmRzOwogCQljb250YWluZXJfb2YoYywgc3RydWN0IHJvY2tjaGlw
X2x2ZHMsIGVuY29kZXIpCiAKIC8qKgotICogcm9ja2NoaXBfbHZkc19zb2NfZGF0YSAtIHJvY2tj
aGlwIGx2ZHMgU29jIHByaXZhdGUgZGF0YQorICogc3RydWN0IHJvY2tjaGlwX2x2ZHNfc29jX2Rh
dGEgLSByb2NrY2hpcCBsdmRzIFNvYyBwcml2YXRlIGRhdGEKICAqIEBwcm9iZTogTFZEUyBwbGF0
Zm9ybSBwcm9iZSBmdW5jdGlvbgogICogQGhlbHBlcl9mdW5jczogTFZEUyBjb25uZWN0b3IgaGVs
cGVyIGZ1bmN0aW9ucwogICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
