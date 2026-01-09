Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE02D0AFCD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1101410E26D;
	Fri,  9 Jan 2026 15:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fuw/Inje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A9F10E26D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:42:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so29893475ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767973350; x=1768578150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=58MxdAEukzz3tcCKwY2uhNwKGEe7x7GO6iWELKF4OGs=;
 b=Fuw/InjepU7B1HzTdznsWujE52KPYR2SQMhTagg9LpjMA4qbG7ENecqhbAUUgei1rE
 NDS4MsvpjjkTP4LKzwyheceby5PkNXL1M+1h0mBBlCFN5+OME3OT2sQyb7nGBCnAa8oa
 e6H6lOr4Wbsr3VwV805cmaunIvTAGDZ2xGrwWQWsNBKdAkv8q4bbBHGa7jeqIz4VhRLw
 UhYuVNUOZksnwE9vXkooYZJlvQQfJZ5hQHMIcGWZejMHq2JsUVP/R45KZaNTZv/VhdBV
 zH821YEjYPfP1xw6e6SGZ9l7+M4BV7+OPsiu9Z1CgX0BbYsyiTFD6hAxMLX9buWnw7a8
 bNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973350; x=1768578150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58MxdAEukzz3tcCKwY2uhNwKGEe7x7GO6iWELKF4OGs=;
 b=tjCjaeAg6dzFQSimMzIDXbRdIEW84we4ePPsIK8OQSH5P7uv4xmKd65EUrVnfZNdGW
 0iLx8K09Xdmg0oEiILRhGtZ8HX45siMREAXGh+Uii6c1BbgzlJGiu+d4jwsxsIcFJTZH
 5USd80nSW2v+7bSErHR3jZHnTLWxnxMtycCqnuB8LVJYO6KgK+RcdDLgBC7UzOKCmFDz
 cQUGLfRt8S1RqleVCZnk48Gj0XBBqS+orarcMGDtlEwwJkcdtbTyVtLkvJjqWbscaFHP
 0crRU4GMdn3FvxAnWhVb4VAaSx5HaXmkLKgFsA+kMqWtkNqMkKAaW5etDtWpvAFsJCs3
 S9yg==
X-Gm-Message-State: AOJu0YwPCiCAZF2RY3E064AHdMrD1ldbGHGsEuqVm1rPe3hBWMaQ2tqM
 +dEKCAjfXjAW/6QyMENTkVePNCxD1MlFMrL0nExhkwzfSh8sovvoqDeUajAfKyJG
X-Gm-Gg: AY/fxX4j4cr+guilfbiN1SUzRMrVoOfbeD6lSF1LaWKKcdrDU8/1TY4ufx06jDlZx2M
 85sSVR/4wBHvqKjM6p8NYLD3C3P1riyNt4JtYsP9jX8C5poJSoSqmzYhIYUWmzian7SLcZPs2j8
 7kqvHN0C2QNHvlvp1Pl4s2NVoe39iUh/7oR3dTXI52zua07mWtElEO7iWETeUTLngqOL+h5FKUE
 VVWfd1VSeDQ3T5lr3UhyIKEt9QPc/bPxmE6tmRxreXa5DphNwZP5G3miLrXq1rGhfDNCI5IV8/e
 /1VO2TqG6M48dlEkZAzflUxxZx61TUTQtuTDr8BznM3CeKEsBoobqajJP8KiscBK7DwaodHceRz
 cEXrRUGPxv8kGLdIdZXxG6SdVojkxbTOoFu5zT3G/TQY1VN5y9pK/moQNSBXGSk2XRPAJ6b4FzL
 Qb8VgYH6sU9vkux2PU7meZx3VuC5vCUbZS5G/pf0D/Mxo=
X-Google-Smtp-Source: AGHT+IHpEvcD+sjSbQCzRLymstlY+pYVlBnYbO2r3H/yHBb/JM4Kib2c1VazYKB3MKNaRUM15ohTKA==
X-Received: by 2002:a17:903:2a8e:b0:29e:c2dd:85ea with SMTP id
 d9443c01a7336-2a3ee41d0f5mr95240725ad.11.1767973349973; 
 Fri, 09 Jan 2026 07:42:29 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:1613:9777:a803:43fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3ba03f9sm108166395ad.0.2026.01.09.07.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:42:29 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v2 0/2] drm/panel: panasonic-vvx10f034n00: transition to
 mipi_dsi wrapped functions
Date: Fri,  9 Jan 2026 21:11:55 +0530
Message-ID: <20260109154157.33592-1-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
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

This is a task from https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi-functions

This patchset add the multi varient for mipi_dsi_shutdown_peripheral() function
and update panasonic-vvx10f034n00 panel to use the wrapped functions.

Avinal Kumar (2):
  drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
  drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi wrapped
    functions

 drivers/gpu/drm/drm_mipi_dsi.c                | 28 +++++++++++++++++++
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 14 ++++++++--
 include/drm/drm_mipi_dsi.h                    |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.52.0

