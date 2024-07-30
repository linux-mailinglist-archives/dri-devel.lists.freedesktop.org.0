Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E25940814
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FFA10E399;
	Tue, 30 Jul 2024 06:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JmoICKQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071E310E399
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:07:15 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70d1a74a43bso2758654b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 23:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722319634; x=1722924434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JaL7FYBtATcRvs5LgUdqFH1RdIwqFz0K1+6W3wtHTYY=;
 b=JmoICKQZAR9Lqjtt+4oX6ze1X1BVpxLSQxHiirKLACCz33/N8fo6GY2RJp5LgF0Voo
 yFZAS7K03OPzJXqqQWHR6XUjw7USnU9PBzFqaxNzFWQMouQ0FsOZn9lULcdzEF7LRV+b
 BQAg0+r6muYMHJ9jJL5AaEzz3xbsG6Q4e5e1jCaXHM17e4t1Q3T8ozrBvA14uLMj9/Ey
 32eXu7re2nJSnOfUuaYyWS+iDWaxGRzrC+FqtapX4xxDRL29koQpW/24uT+z+DbeUTft
 zOJscIGBkjYOyTbnEoSWiS0xW8y9X+KOab0MnGU8yLsphrISr+Cqpw5hIfaKMJo0XSHl
 sVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722319634; x=1722924434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JaL7FYBtATcRvs5LgUdqFH1RdIwqFz0K1+6W3wtHTYY=;
 b=aGMbxfX7kMGz5135i1BksxhIUVolFmYDsXztlAMadf0hFcOsxKYGg1ACBgiQg73xs/
 90hg5knpg4/a8tFYt5GJ3yajFC9bTDGzbWXFOwiXuglVqLolV/77J3VeiZa+rqX/OjEJ
 2Qr7xKVQo0vaGtGR3L3crZeUrXO9xzErpQwf3q3jjXYs/OLEGhjxHXRX4cEjZgMlhHwV
 H2Yf17zPXUVl9O336szpT7r7G+6NW5lGOQ1IwQT4seyyFJiBUzYnwxVzKU8ZTfl6VWNI
 cPHNSS7DtL9mnFmxosEiKgPY14YCUj2s0fEO6GX9qU23dm1T2zx6G2FTS7mw5cn9Vhur
 P+xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfhSyYmrT3TxNA/x/a8e7y76Nj35UKKUDMlMp5b+NzKHZttEZIPJxlhcWgUZL58EBut92IrZw8mldY5H7VPEuys0rI058bI+Bm0mtSxauV
X-Gm-Message-State: AOJu0YwXmfMsVvi72kbmi8bUL0YoOW7nAkJF3vlDiF/Dpkfus1YKRtCk
 PkS6vFrng+8ZB/JI9kQPbvHAinsjg/zcoUDsgHatzQCXALX4jT48
X-Google-Smtp-Source: AGHT+IHp1ixJxVULvC/EjTzN36eJCUG/wCIgrvEOGwgtOAcQ6vK1PryRB68wQtoNU8MJGCpNv2KE5Q==
X-Received: by 2002:a05:6a20:6a10:b0:1c2:8d33:af69 with SMTP id
 adf61e73a8af0-1c4a13afd31mr8807135637.41.1722319634443; 
 Mon, 29 Jul 2024 23:07:14 -0700 (PDT)
Received: from distilledx.localdomain
 ([2401:4900:6320:5c5f:a09c:1e46:e58e:e6c6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7eef4f0sm93589375ad.178.2024.07.29.23.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 23:07:14 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 0/2] add more multi functions to streamline error handling
Date: Tue, 30 Jul 2024 11:36:57 +0530
Message-ID: <20240730060659.455953-1-tejasvipin76@gmail.com>
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
startek-kd070fhfid015 panel. Additionally it marks the older functions
as deprecated.
---
Changes in v2:
    - Improved formatting
    - Rewrote hex as lowercase
    - Marked old functions as deprecated
    - Added more functions to transition
---
Tejas Vipin (2):
  drm/mipi-dsi: add more multi functions for better error handling
  drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped
    functions

 drivers/gpu/drm/drm_mipi_dsi.c                | 226 ++++++++++++++++++
 .../drm/panel/panel-startek-kd070fhfid015.c   | 123 +++-------
 include/drm/drm_mipi_dsi.h                    |  12 +
 3 files changed, 277 insertions(+), 84 deletions(-)

-- 
2.45.2

