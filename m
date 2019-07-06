Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0D612F2
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 22:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87689B7B;
	Sat,  6 Jul 2019 20:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31D89B7B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 20:31:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id k10so6815691qtq.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 13:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTdDNTekunAUgyaGQ3/RJxJLYyFWDwZXUg6Q2Wj8Aqc=;
 b=OxloDv6/B0WZ2BlzVpoL8g3Pe3DtNMZavSWx5lth32pD3Socaupyc+8y0j/t+bpJkQ
 ekgtfwoarrVdNR9/6f6TUH/j3+2HbWb8586JcyC3WDH7drdMqfmR1Rqlyrif98+zrWE7
 v6nrxuKNnghdB3q1ixtwQA8Lgjm/vkVfIOBL+6pOSel3o+YwXrr/xzB1V2tB6fLAVtGZ
 jfq5LoaJikmA/UUmM0lUFXjIMrzTiZr8YeM2kIjt1VcYgxD3IatL5M67PZNr6IUl4Yjd
 E2/d6dMtik4t+3WZFLDSdKyNaWmWGy855OXjbIIVUPgm9SZbNS2WefOHDOrVU10olptO
 JUqQ==
X-Gm-Message-State: APjAAAUCz58PWCiDUkzwM6d4vwx/rVrLtzxPe982FRihZYarhRwQ1uwD
 hLOKB9LPjaqUmXDNk7z9tv4axPqVyK0=
X-Google-Smtp-Source: APXvYqxLv1LQbz6LycfXjpzAR167HsHiq08tHengu2WXsBxNFIWXpbY+Fe7YNPGA7DHT97SWJu2JBQ==
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr7513436qtp.325.1562445078775; 
 Sat, 06 Jul 2019 13:31:18 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:fe2e:a8ba:927f:edd9])
 by smtp.gmail.com with ESMTPSA id x20sm4770818qtr.72.2019.07.06.13.31.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 13:31:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Date: Sat,  6 Jul 2019 13:31:02 -0700
Message-Id: <20190706203105.7810-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTdDNTekunAUgyaGQ3/RJxJLYyFWDwZXUg6Q2Wj8Aqc=;
 b=cRFQgRmvTZBqx1Do7XLHfkgnGFACGebj//05Gx/ZyVFgynRoeEbYGqAszY5FPBuP/i
 wdOyGTGwCQIzBH90QM1qW4L/buGk+4a5jwHdX/o29RyvZ+XHd4UhD4P+p/oegjBLKVql
 5T3zkhPosT6nnmgtycmM3KtapPYe2MzQRpkzJSPqdvz2RhznuXC7t17Vpw7ZTkMN0oaM
 LatQtCQY3pTeaVLGZOMmQKBF7/keE9OxfskkpYQ/M7Kl8ZYla4e5JQGWyis5tYzLL1YY
 ukpm76IK6dyRKxUlfzereOjE7B5LpcI1rOOW/7jb510TVSs9YwTVoYP8HYnPhwNtrHUo
 95cw==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyBzaG91bGQgYmUg
bW9yZSBmdXR1cmUtcHJvb2YgaWYgd2UgZXZlciBlbmNvdW50ZXIgYSBkZXZpY2Ugd2l0aCB0d28K
b2YgdGhlc2UgYnJpZGdlcy4KClN1Z2dlc3RlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1
ZHNpODYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCmluZGV4IGM4ZmI0NWU3YjA2
ZC4uOWY0ZmY4OGQ0YTEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNu
NjVkc2k4Ni5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKQEAg
LTIwNCw3ICsyMDQsNyBAQCBERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RhdHVzKTsKIAogc3RhdGlj
IHZvaWQgdGlfc25fZGVidWdmc19pbml0KHN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhKQogewot
CXBkYXRhLT5kZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKCJ0aV9zbjY1ZHNpODYiLCBOVUxM
KTsKKwlwZGF0YS0+ZGVidWdmcyA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShwZGF0YS0+
ZGV2KSwgTlVMTCk7CiAKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJzdGF0dXMiLCAwNjAwLCBwZGF0
YS0+ZGVidWdmcywgcGRhdGEsCiAJCQkmc3RhdHVzX2ZvcHMpOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
