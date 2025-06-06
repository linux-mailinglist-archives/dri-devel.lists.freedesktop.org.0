Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBFAD14CA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09D310ED6A;
	Sun,  8 Jun 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G53ZvWQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2EB10E306
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 11:46:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so1819875f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749210406; x=1749815206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PjAcWe70JY96dBY0oozKYeEaxt/7BhJ8i+mA680ELKA=;
 b=G53ZvWQXTqXXSovCW2/EYtEUWSQZTEe9eEgtkemC9aJqAEDW/i5BdhJsUWAD2teNlZ
 e85G+OqUcNhQ3xZSKzciUz1gJWG5ZflvHCQL401h3Za0xk2XssFf+IpokPdvaDPXSE6u
 aJNVk7F3TlcKA45NQ9gyuBhKiVZWaCw58q812Bwq7VSf8o8YKLkwcjCkKrSUQmY2e/3v
 zKVcusO8myQBG7LIlk6Rctk14FqM43gW5wBMfCpK8M+/ctmCHWKzbdreVE/Knqbi42D8
 pBJ8toHVT6jEaqEuNPgv5Pb8TcJmEq1DkCmrCU85Soh7UtXNVoMhS4N8219vuj9PcZFU
 gk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749210406; x=1749815206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjAcWe70JY96dBY0oozKYeEaxt/7BhJ8i+mA680ELKA=;
 b=k4kbjeAkVY0ezzVYr2CjaSBtiYsCeagugwS3/1A7wAdJcMJAoHMzfsb1ehyXRq+sql
 SylisTiAr3/z4AwGkMbyKoVMISuxO/ANlJbYnGNRF0sFW/TJUm9Q4lZRk9o0SndVkvD1
 ibnOVHjRpXcG9o2XHsdR0EMUznIxAT1KCRmhBIhzPsKbhjVpnkrodTyWeLITuh9hq92h
 NUiSH7vFTG4rWLErrlJ+yWZ+9rJmYC1n0UUdFpLTFaDLvX9WXx6vZjgNsFMBr9d0/55c
 bsDRgc3GZSFo8gEiax81irEjo+oCbEiK3pVC2cT8FWM97viTB5d+FQTVQEtEe0jqbGM0
 dxbA==
X-Gm-Message-State: AOJu0YxABfSYFrZbIqf0hrCTNsotY50grDvVK4g4k/h0IDIrsBzL6Vni
 iQ19cHLZrp6Ytsbs5XLOpqkByQGc86ERuA5tT+DbAQ7cnM74O0y2XsUS
X-Gm-Gg: ASbGncua9HzC0cbjBYDFh097osrPv6cnqECuECeDTuoWqK0HWTy08wj4P+HhYvdZ+yY
 JWhFFbiO9bxtv6YWxxtdWdMV0/bnB7OUaHDQiKzoXtEbk/x85g6xyduHHDYLX5zekZq0OrT0KE9
 fXzqArlSuxt0URtjrEFvpvVZBWaDJUzBtVIEhdEKLc50u40/IZI81QkuOTJHaj321vc159FRLwM
 t/AtqEBNQFlV9jPbp9BEEQUOLkL/feYU3mFoJQlVGhKCp1Rg79mWRJlZAbz0rtwpc+kN0w0Prrh
 tEpjFRyoQNhtapX7rJlsXswr4hCJQjAsadd6cRcAooBO4ry7x5tO3ZjQECvTGqXTXZiOLqLv0rr
 nwQ==
X-Google-Smtp-Source: AGHT+IEh6fjC39UFkQxSRQZMudiWztOA2853bVG1ipDO9BfHLRZsNiFrRvJ/D0vBh0AbPo0EXQmGBA==
X-Received: by 2002:a05:6000:2c10:b0:3a5:2875:f985 with SMTP id
 ffacd0b85a97d-3a531cb60a6mr2563628f8f.59.1749210405982; 
 Fri, 06 Jun 2025 04:46:45 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 04:46:45 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add Winstar wf40eswaa6mnn0 panel support
Date: Fri,  6 Jun 2025 13:45:49 +0200
Message-ID: <20250606114644.105371-1-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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

This patch series adds support for the Winstar wf40eswaa6mnn0 panel. The
datasheet including the init sequence was taken from here:
https://www.winstar.com.tw/d/308/WF40ESWAA6MNN0.pdf

Stefan Eichenberger (2):
  drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
  dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel

 .../display/panel/sitronix,st7701.yaml        |   1 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)

-- 
2.48.1

