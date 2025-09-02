Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C3B47801
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2983510E3F2;
	Sat,  6 Sep 2025 22:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzXi49fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04C10E323
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:19:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24457f581aeso48310155ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756811966; x=1757416766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
 b=dzXi49fch6XcrLiJrelviP2LHCmvbl/s7ty6ZHya54a5VKu6TxJtzm/vVxJr632FDT
 z+HRB8OdoHqGAJDaAo7tvFLmqueCSRjuk/INGNRSvsGnRBIbe9ukFTz2yf2D8tiU62OT
 l/x1EgLOc5CrzD/r0cXATB1JHhAqcUnWywu/zxctUE48iX2UO9J2PK2zc9vxy9yivyn9
 pOAYBO9waeu24EiLUWGDqL694OmiswUGe1pZRpj9UE8XTvJROHKPymKa0rB70+MXXkOU
 Li5OnTEP4qKbEJZfEaHyW5uycFl6na3rQI1zCMZwZ66bnYpgmHK3wxHvZESiTU21EwYX
 p0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756811966; x=1757416766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
 b=YC7/nSVBjF4Nax0moK5+BojM2Vgr7BXCEmo9F+PnO7XlEsTiAIjbw01tzL7xqZ+Gmu
 ZnpaZcKJX6fa5GaTkdBwx9850RO4cHh/kq7h/ON/SpEcFEEeNGfLWj6ZNJhGfTdHd2Tx
 fKxJod/lhGNzUJr9bFcxaECv3qFww0405IAVcqXbyD6mY/uTuWNo/TuCR/8I2QxA/kkg
 rTL9dt9KQSSNVwJBPr0w1NjfHj6+3E+eSdhBMaijGhg7ylikQXUtQzLJKUIR/7J6/WEp
 EzMD3lHnwCGILQnkyg0iksS2Yj9Vzca0voqei3/z80aYW0BJFskrTZmZmY/bgFTcTA/E
 7nag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqpta1zrOyN/9rHqC5cxAU23MAupRYQ4ew21UDNy0ukE5hvZ7iGp0YjI/OfYtwSUMpvCDS1zvILgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkEEXKE1RD0+wvSx8XBJ2tTHYTltaUnXycKeIASP5SfCYYudn2
 Nokj97fZlcGf50us4KKbCzyOtOtiaW67gahxrrFPAf6XxjdU6LFCljp1
X-Gm-Gg: ASbGncuuQXJSQJ+TypxoyzKxOOrBZKvHHbU276CkG9cvLkdT+oXbDI3u09j6U/d6s9n
 tPqDFRsYrx/UNIY10pnqGvcOYzrV3HQXNQzvwqz1tyeEJuggzefMWToShm1uHT2hUUz8k/K+81l
 Bn+18/xpbZj9exEPWc/RRTiuzm6NES6NB1WsthZODXjL3oYq33otMlUOX5uMBl+FsKqHzxaMLvf
 jx/i6S9xmtbWVnDlQWN1zvsbtHcIagrcJKoIuaxVNkFjASQoYfVA9ei1CNOiBbuESpqUC6TRptv
 5JSmRJi4zr/OgsdMs6wFG5/pVw8BoN1Vm1UlgQGU/UAA2d754eOuTUXxkCNVM6wErGPSdpwrpnK
 jdPM+54mRrEUq4fOtmc9iR8784DaODRaoENdnriBeplGFlaiyaw==
X-Google-Smtp-Source: AGHT+IGxnHS6Z8WCWgDFUeDJb6KIIEv4c0pLQBKyRBYltrfE2IaLwrI592U+lXunhDHTgiqlRjBU3w==
X-Received: by 2002:a17:903:ac8:b0:248:93f4:fe14 with SMTP id
 d9443c01a7336-24944b1b1f2mr128729525ad.33.1756811966169; 
 Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24903705be3sm131325835ad.18.2025.09.02.04.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:19:25 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: krzk@kernel.org, alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Tue,  2 Sep 2025 20:19:16 +0900
Message-Id: <20250902111919.3524799-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:44:18 +0000
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

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 64 insertions(+), 11 deletions(-)
