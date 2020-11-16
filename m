Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F072B4DBC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105FD6EA06;
	Mon, 16 Nov 2020 17:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43E86EA00
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so40046wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WLjHfl3orvIQYtFk8cWNm313KtEs9zxT+XRuqJ/3Ug=;
 b=UH/wzcYnQ6WNXlSacFEkhr/x34dgeTAKoOhIqiDcF2gN7ADQZlojGwVxCXvNJzJ42n
 mEQUdOT9UgO5o4h34H82pfTeRaIrEkywNTJgrSa/CdLTGZu//7j7iPIl+hayhj+5dDKJ
 O/VU/eKmM/U8XRLw8IM2Nzx1xzDE1NmeG3fuB6IN//4Vf9pEUsJfzqj89AxWNxMMdK4Q
 JfMfDxyvXpHlaBfEqDFP/hLaWM9pSDU+BzrUELdP8wKXEIwx7ZsCPR6IMvoZL8rmLtjT
 68FMnR0IcHE6U8XN/RPfrb3VeIOVUGFC/Al/ooOp2IcPJMYQEL79xQ0mesjsfcUZdRC3
 Wxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WLjHfl3orvIQYtFk8cWNm313KtEs9zxT+XRuqJ/3Ug=;
 b=fUjNN73NfwTp7FpFSx8nOFKj0nEIAontIfYXpGe4ioHh2ND4zDyYtzBe8EJxGmX6P6
 ru0EWGlgaqNxZQt7wNvzYJv3PQ7aq8+6em7Rfd3T/HDiZe7/d1Gxc4AboxfWeJMS+O3O
 XIxdNJrfxqTvs3tlV6RjHhYWCJsj0I+ry0xhnMXUoAir9yN36DLz+KJ1OchyTVQQbnMy
 R5glVW+hUGmWTgJ9v94PkLzcXiE4KzuVaO8r5lSW5voP+x+fMIwMAQnLkknj5/By2i+z
 zjTeajImq9AHsqxR5xzOirXkzO3obqYbBr/zmROPJlbnlO04QnVCEcHvLDu4IUtbpszQ
 EJAg==
X-Gm-Message-State: AOAM531RM2+gXfh9BavEyp+fFC+9BTVDR4Y0FxF9nHw6aWEA3a1ZacMj
 qW6a15ry7E0ojN9Savi/F5u+UoP3MbVFVFVu
X-Google-Smtp-Source: ABdhPJzJ++oU+QXxqvf2YFvLPeBzaQUSNwRBGkprWJuB8Ho9MuTxldYpIomk2Fd55/9oIMXIYP7drg==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr49655wme.8.1605548517471;
 Mon, 16 Nov 2020 09:41:57 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/42] drm/rockchip/rockchip_lvds: Fix struct document
 formatting
Date: Mon, 16 Nov 2020 17:40:56 +0000
Message-Id: <20201116174112.1833368-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
