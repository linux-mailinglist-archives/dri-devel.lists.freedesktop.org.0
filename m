Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EF99AC8D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25EA10E1A2;
	Fri, 11 Oct 2024 19:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaYTcT9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737A210E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:22:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4311ae6426aso12986245e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728674543; x=1729279343; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EYgQWgt/qKmfdHG9VXiGCkrR3Ne5T90ztqEtcBQu9CI=;
 b=HaYTcT9b38mOhEFft22jEqbmvxsy6A6rF9rCb2GVz1NZ3UPpPb1rb+ZgxGbHYP2E1g
 gwk0QI3v6T6gF+m5AixoEDIey5wyU6jMvsqEeB3N+I7kMPZA3k0M1sQlrXIlZE+stz5M
 3rtdUWZlMSnvao1Eo4+x/iM0mLJwoo0x1kHUybVV1VO1a3/M7TFt6CnTy7ANMGJrF6WG
 9jpFGQzVTHVdJwXD0DMEau39GGAD86XSHOX4fz9fk7F7FdZZ2olZUfyc5Hd9cdX+2nkV
 KHQzzy7T5KrtSzPwTVoywvAsLRv5sazsbDJ02+pF/P+fF6lMT4BOMOGkkQW6Rqy/hCfk
 y8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728674543; x=1729279343;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EYgQWgt/qKmfdHG9VXiGCkrR3Ne5T90ztqEtcBQu9CI=;
 b=SSUUy/MB7Woi6PEKR5EX2Z0Nei5hQQ9acwba145LA2MEV7gv8CRNXIOnkKs4je1LLR
 ZFhiOrFa5PQ56tiu6v4EfOXVBUWrcIr70Bc8EGmc6SS3ERbb25K0HjgCubSym4ftcn3v
 tzzfEGHoGc6GqGTOjwPKhKXRbr3gIGD6BM8V/2iVSJUY0US3mnsHcLz4JxMblVavUpS/
 H2wIUdbwq2gJiRqNYGsz3mFDVb7H6I5D5aX9Al/mwOooRrLx0xds7PHlXe8QnxXwpr4k
 HsojklehLpWv/rijoHSn3zfJ4naM6m8+B/5cjV+YtXOg/F1daMJWBhndgPFpiW3O2hmo
 tjNA==
X-Gm-Message-State: AOJu0YyVgWuo/MQjjZVei5r3rLqcxvylEOX7glG5bd8iXxJAB7DDyKJf
 jdmrYfyzBGRXOToxaJXIE63F4zMyLSVfnLPvJx0tDJpZ8dUwzLGj
X-Google-Smtp-Source: AGHT+IHDrJkqntC5hbJBHUdbeUAjDp6V1K7XShBIFjrWbQhxHt6e86dahsDJxOy2EMtrhVQ1CrDX1w==
X-Received: by 2002:a05:600c:1d26:b0:426:8884:2c58 with SMTP id
 5b1f17b1804b1-4311deba2a8mr23732905e9.4.1728674542675; 
 Fri, 11 Oct 2024 12:22:22 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 12:22:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] drm/mediatek: Fix child node refcount handling and use
 scoped macro
Date: Fri, 11 Oct 2024 21:21:50 +0200
Message-Id: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM56CWcC/x2M0QpAMBhGX0X/tZVfVvIqktg+/DG0SWp5d8vFu
 TgX50QK8IJATRbJ45Ygx56E84zMMuwzlNjkVBZlxQWzctfaW+8Sd+/gNgyr0qjHGpWGZUOpPD0
 mef5r273vB8+vyTdlAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=800;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=CUgnykuigeyvSk+12QRyPfcuP3wIVJxY7aInDCemjsU=;
 b=VS2IFCGJyJpyQN++hbNfW+QHI8VE09TUL+q0ILjUhG8LFSsaeXapxeE08GCY6WIEkfxFiYrvq
 3o6Dsm8HPgzAHTM2Gzm1+GZnOiqBBIM/R5LsZ4CcxFrH8NtRwbJSivg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a wrong handling of the child node within the
for_each_child_of_node() by adding the missing call to of_node_put() to
make it compatible with stable kernels that don't provide the scoped
variant of the macro, which is more secure and was introduced early this
year.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      drm/mediatek: Fix child node refcount handling in early exit
      drm/mediatek: Switch to for_each_child_of_node_scoped()

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241011-mtk_drm_drv_memleak-5e8b8e45ed1c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

