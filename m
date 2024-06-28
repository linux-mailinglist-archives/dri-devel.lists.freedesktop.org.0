Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F291C59C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92510ECF9;
	Fri, 28 Jun 2024 18:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JaIUkeHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDCC10ECF9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:25:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f9ffd24262so6160205ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719599113; x=1720203913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YL3jtrmeePtQurERmfNixNvqVrYT9nKGr4ecJGhPs+w=;
 b=JaIUkeHn/SuN0R3c6wEbJ7GSe4g1cscu7pZsyzoNhdt4c0RSj6scsYTY2bh8SCrzVM
 kOThiGChEtbmObP6HA4YbO5fhwIRU4V0vL8sRn1eixjfDFjih7UTEEfQ0tNZ1wczw2AW
 NEs72miEokSMvYG4j69sCTvZYGqhl2p1IslSfczySAwIfW7Avmbf/0LhJE/dprzIWSKy
 YD/mvCJPLUnpLZP93i/NOSkNzGtGvz9hxKatnnLlki/w/blsNQpueVV8ohy0s5Lfr5g1
 INMfqEnsVKF6FMeQtqbzqce99mN0dIPjQ4nCuj5UvU8PEGYly3LucW1YRxJfnZ3GvihZ
 tVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719599113; x=1720203913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YL3jtrmeePtQurERmfNixNvqVrYT9nKGr4ecJGhPs+w=;
 b=Bdt2Ux/2aWHkAlPtDlHIwfYtmMYeA/oYhvavleL4GHRqjNtp/wtlKn+I6qaFd/boR7
 U1LhOgKUJVQGm8G+haLNv0lT+FQdGSNjf1r89MvcVbZjuz+fQJirx5hTb5i3Bc0mgWyY
 H3w6DamHFMFuQbLd0z/EV8XIOBwT+fz0MNoetoLMsBQIHD32nULYk3EJpG6apdbLfBVT
 /8yV4VioH15SSeFqXQ/4OSGGE2iQU2bNpxXtK1urYTzSL4G1UU0i3Fg7HVJs1rTi63d7
 sWJNxTb3cX+zPxT0RAxIXLTwq3MczKIJ70jm+uoDJRDOIexYe/DNvQwkPgEsV4EI1KzM
 ICug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlk9GSCn+hiVRGKvgNkH0W1rFxQKqzL8lYnOEZXXjf7KqFjA6idn1WRrp2C7xfiYd73+L5oxPmJh1duZLodmrkdeeDjeQIjxvhAVvdMhaY
X-Gm-Message-State: AOJu0YxZ8O5f4p1f7VNspWVXYsOOXL37Xv7O7QQRXYoaY/03b3A45mLt
 rF9olKZAoukuLYYvlC3gl/ePzlmBaBpBu7VXM132mzZyAaT5jy6f
X-Google-Smtp-Source: AGHT+IHWul+W3Ya7cO2sLkkSA2kaNbIJ89loGgMX/KHG9nxnMJyolOoM+Ke9Mgmu9U6OA6i46Ih68Q==
X-Received: by 2002:a17:902:ec86:b0:1fa:aa62:8b5c with SMTP id
 d9443c01a7336-1faaa628da2mr54278565ad.29.1719599112544; 
 Fri, 28 Jun 2024 11:25:12 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.84.231])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e21aesm18557465ad.64.2024.06.28.11.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:25:12 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] add more multi functions to streamline error handling 
Date: Fri, 28 Jun 2024 23:54:26 +0530
Message-ID: <20240628182428.171031-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
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

This series adds more multi style functions and uses them in the 
startek-kd070fhfid015 panel effectively.

Tejas Vipin (2):
  drm/mipi-dsi: add more multi functions for better error handling
  drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped
    functions

 drivers/gpu/drm/drm_mipi_dsi.c                | 164 ++++++++++++++++++
 .../drm/panel/panel-startek-kd070fhfid015.c   | 107 ++++--------
 include/drm/drm_mipi_dsi.h                    |  10 ++
 3 files changed, 209 insertions(+), 72 deletions(-)

-- 
2.45.2

