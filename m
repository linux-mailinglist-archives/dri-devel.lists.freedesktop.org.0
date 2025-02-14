Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44277A36499
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B9810E358;
	Fri, 14 Feb 2025 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YwMq5fm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0E410E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:30:25 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21f61b01630so55737405ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739554225; x=1740159025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkPPG8sQJ/dkzJo9ge0ZgjfZ0ePqc1wnth/y31xhuiY=;
 b=YwMq5fm57YFBdA2tuMLag8eZY7S5QIuuGLVWGYab4H4c3mMrV8FnL2b2xfr87V9kCa
 HiByxTPOWpMeXTD6qhTu/z6e6yf728+OE0H3/1FhV7TqzjBPKm+djRxWAaqIZA00bs0k
 x1+xAsFi3d++kaa1llpF+bIGc9PpUm7bbV2ZBLo5Ou7S6BWvuHA8WbRhMrigz9LPwsEt
 aY0eyD5E/A6vL1wPyIvsuMUg2UiSZ8CjQZQ0BXe5E6T0xknO0wkwfgeqvKcMCRzj9TzW
 2BRjbugmuvw0NoPqHF2Fj8JJv0/mkHURG/Noc/h1hKRqJxYGrFvO5173RqYxBM5Lkww0
 p/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739554225; x=1740159025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkPPG8sQJ/dkzJo9ge0ZgjfZ0ePqc1wnth/y31xhuiY=;
 b=c9aZErUk3duVHKE8bz92poHDqpXh/Y9kUkVoRWk5vk7dPotKyU646kncfTswQgHq4Z
 GpjfgaxnNBaBnCzRnLl0LrnPszYZRghTezPr82aI5Lpa4dqi+DTqcTWrhx9S1BkyzUc7
 qV7F5kPE38AUaYx7cMbMN+rBb2imodStHqpRefeL08xE/WiLYxH4IEYDezfSpUyRNUrN
 taklqTuNNUmb1jY73aRiZDMjEmtiRalkvbJZ8mo//zp6SNQRotEapXIT6p2/O6EEynsI
 5l+9fm6m5UgAiefbsL/wrsL15Kzg/G3uDcYkHmKGLVjWOcTMu1bQLS0+rLcjv6qRlFxg
 eBig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIbPC/t2W60Czv/m4jt5ialT88EQnx8V65Q0/QaDlduYVjcLUEZCnReVTqCaQRDLM90vkp6NgWANQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRcIa3MviR+xwB8X/vfMhkgZ0LBWfUYJH6T6bCE8kV9jL8kDJP
 NlbjqrKfRONwflWjrU6fKhpD5vXrm6AeiQQdceSgcL6Erq9gQ4fm
X-Gm-Gg: ASbGncuwM/Mdj8FDK590QdYPWiW0ST865js6n1HxyIzkfP0jqrGiVBmNk9Turlmgp+D
 hdHACCFxGm/rNezbfRjpfpURuc6SHzPL0Y5/7xxVUMVjj68oZe285UQfDdEbdmM0Rhuy1/m0JE8
 7S0723q0/utwT+TanIqKFrG572Oioj924UhODFcePBePokhsQWX+AYMyX15CGzv9WQeIytBtVH+
 cBqylu+ANkWPZvXX73QU3cTof1hFW1nvPT5e8ueIqeUZC4zKTt+RQkDKa7OK6nbmVyGg6fzGalI
 QdZt1EvY/0LKxj2KQz8qUs1/BxpmFZoAHg==
X-Google-Smtp-Source: AGHT+IHVigEZ77FLJCbcyafP1of8/GkjwCmumHLRWykHN6UYUvRjkWZraa1IjFh+vyNgXjtb3t2uiA==
X-Received: by 2002:a05:6a20:1587:b0:1e1:bd9b:40cf with SMTP id
 adf61e73a8af0-1ee6c61ac98mr12151993637.8.1739554225014; 
 Fri, 14 Feb 2025 09:30:25 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adcc6fb20f8sm1355138a12.37.2025.02.14.09.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 09:30:24 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] extend "multi" functions and use them in sony-td4353-jdi
Date: Fri, 14 Feb 2025 22:59:56 +0530
Message-ID: <20250214172958.81258-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.48.1
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

This patch removes mipi_dsi_dcs_set_tear_off and replaces it with a
multi version as after replacing it in sony-td4353-jdi, it doesn't
appear anywhere else. sony-td4353-jdi is converted to use multi style
functions, including mipi_dsi_dcs_set_tear_off_multi.

Tejas Vipin (2):
  drm/mipi-dsi: Replace mipi_dsi_dcs_set_tear_off with its multi version
  drm/panel: sony-td4353-jdi: transition to mipi_dsi wrapped functions

 drivers/gpu/drm/drm_mipi_dsi.c                |  42 +++----
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
 include/drm/drm_mipi_dsi.h                    |   2 +-
 3 files changed, 47 insertions(+), 104 deletions(-)

-- 
2.48.1

