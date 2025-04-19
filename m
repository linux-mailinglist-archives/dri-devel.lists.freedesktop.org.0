Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3834A94188
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 06:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE91610E0AA;
	Sat, 19 Apr 2025 04:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GUSyKArZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98FB10E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 04:12:40 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2279915e06eso27535525ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745035960; x=1745640760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZvnVk9w6yGuNWt59s2Db1Arxy5v2qXsVKEQIIzTYpU=;
 b=GUSyKArZou5QAlJTXDdhfSQ/UzvyV9Fp5MW5srCHZNzCXhUvYbjS3mJvZ2WS9s6e7R
 ONjGaNK15TX4D3Lp4deUMhe7QD0t8/wawWNq12/E2iOmVj5q24d/k6Ac2YLleDYANd/7
 ySBRQBEKlrjbGU3D3I5fK909Qi9BuYZ6qVZgxo33Nu6uf2JzRt+TWAqP17KPkfoXKT3C
 4+/mgvAR623zClexpfKStiT2IrI0r2fa6nfUyhyfCl9XyoY/Dw2cWvy4IBDLwx/ypwlU
 49UGBpM9Fm1XiEHpgv4wSuw5Qco7GqzmWUJ2IFu/1GvdwsMFs417KbppWIOdgQpEMMEg
 Duag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745035960; x=1745640760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZvnVk9w6yGuNWt59s2Db1Arxy5v2qXsVKEQIIzTYpU=;
 b=UPksgr5H/J/NcyVfyrEGSSoYyThHqicrT4jggQMkj6M5vdoLrwKfFS+f7CfIt7NXny
 S6r1f/pVYjsUoP2QhGoBAmS2VPZCVbxjAxlsstUMy07vA90Jrhhyet27p62c/Mey8p6V
 eSM3lZ4/cBWf5caGNswxBL/TMSLLsceAE/GUOaXIs/Z7HtTtvj+9kAN7jtR3hahkkctO
 2IRg4Bb9GRFYUa7yuGLYQH1V7OD4QQ0QUBOUPH63q5yGreF1QLmzV596QKX/KWLsToce
 GmauOcBXjSLPFVj2OO3mEGvPh93KCGyjhNeE9Psq9PXaF3XAXmVrjxOXsNK8K/28h9PB
 mG0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI0GD3WEd/+lBjqzT8hLIasLYzTV662GfapJkKncKclrqeU0X4zu3an40t2c8e2WQ6iOfeKS3lvYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGPCPhObMr9Hu3YuZO9O2q1GkKRaru0alkXyG+6ix5ou1f2e4Z
 K9v2azL5sM/qVz3u1TIDJCi/xRiW0bjAcKCHYM0fzJk9++RibHUm
X-Gm-Gg: ASbGncuAYbPX+jRZvu7FlqYq4OcflrJqbSUUcS9KqgTqDm8pYwq0XqKPVqdiNfLiODV
 9r955ZSIQi9LEckiIEAu4DjuUAajd9Iqlas58ymGVgBrcQcQIGqH10qbmXOoOISNQ78UCXMiIj/
 RZPntTay5GuRt++iErakvNPA6fLrxZWz65HF0/bE17LrLUoEFJhb5kkDSuA4RdLaW2B26ynHRN7
 Hh0q0121zwJQ7P/uSHZ5YGHx5D0LrPFRzonr5oIXCEoLsJrMAM4KljRh7vCGXI7ZCsytrYKzrK2
 7UKmiZwgFkcbnwT97BJV3hYn43+6qrj4xpDPAumdCld3Efsz9GB0AK7tpOJfCz2FnuOKCA==
X-Google-Smtp-Source: AGHT+IGwMo4ReNpXdTE8WKn1QspdsWtTHSomuqPi0h8tFrfjU98YYuC87TGC37M9S6wAFSx9zae/KQ==
X-Received: by 2002:a17:903:22d0:b0:223:66bc:f1de with SMTP id
 d9443c01a7336-22c5359e919mr76202315ad.21.1745035960131; 
 Fri, 18 Apr 2025 21:12:40 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 21:12:39 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] Transition remaining mipi_dsi_dcs_write_seq commands and
 remove it
Date: Sat, 19 Apr 2025 09:42:08 +0530
Message-ID: <20250419041210.515517-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

panel-samsung-sofef00 is the last remaining user of
mipi_dsi_dcs_write_seq, so mipi_dsi_dcs_write_seq can be removed after
the panel has been changed to use mipi_dsi_*_multi functions.

Tejas Vipin (2):
  drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped
    functions
  drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq

 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
 include/drm/drm_mipi_dsi.h                    | 22 ------
 2 files changed, 21 insertions(+), 71 deletions(-)

-- 
2.49.0

