Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D35A5635A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBAD10EA82;
	Fri,  7 Mar 2025 09:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k7jWzU4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314A010EA82
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:15:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-224191d92e4so23716695ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741338939; x=1741943739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sHBKKzshGSI6hL7EG6ZIvM89MIwiECzUbfWIxwk2NAc=;
 b=k7jWzU4s9C0wdAkkExuo5wafXNE9lDgDEldlFjyOJqftDyDmLcbvV/xYzxFQrM9Whw
 X6S+lSYlR/wwBQyUzpDT+stLePY/ra3YD0CSzEX9kwl6tU/84DcGGUy1wFX1BCG4fZ+s
 00ErE8vYSnn70jSsJHaox+JajFmGgtOEpzkL5SmK08wTXLWzNzxFfxNsJEZpzgpoHLFC
 L7Id3JBC1H4xX/cdX2NansLTlq0JbuzS3VR9vRCzRbg4/D8w/wtja9mSuTmUOM3MV9bP
 MUkpVNFZTpxvnI/oktpRHFZ5Mts+Gv2fZ9Ky/CuXhjjSvGUiFNr0V7k0jUwO739Dszqd
 yCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741338939; x=1741943739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHBKKzshGSI6hL7EG6ZIvM89MIwiECzUbfWIxwk2NAc=;
 b=KCHc0mJOgI/76FqlOTp4jAs/VcgmGUcZOO6AaasIGy0GxrMCzVt4APucF9p4sruJ9d
 MdgHgieMXWXi9tqvRsfnRF8SdHsYc7tsr4FpmrFjVQ0CzJ4ERLXlm4a08jdXF8WeWt0A
 rmaBUVL1ZZauMy2mufDgilWPWzNjrRS8+DAEGGzUWddCVUPgsu7TiAbaE9ECaNsJeF4p
 xdeqMDLRavaIPCblOFrXwJmX94VQdeDY0GMKl5Z5flJg4WCncLsUk3T8QrU9emKxTN/A
 YvRZABVfI6tKFrLSBTuQO+Pc1JZ5otguuLPjLHWzT25mFVFZX4Lz/0Ar5wM1dO2zeMKX
 8F2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfBhxCPqBz1+MrGWt5eP4IzVvypLF3ADHVQIjcPakrUpS97zJApGQiYLn4fSb50TTCYB3fJC1Cj0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWArtHsLfh25GCdcfJ8HrQZengFnmdHXckyF5SD226MgOIDDg0
 TGbvvcLgfZ+eJNt2uB6GuqNhab88aCCMgD0NWKsUE5PHii8w8huH
X-Gm-Gg: ASbGncvcZgOYTtipzoqAjbdfVVoEhTzGFRv2Sh7Y//HLZOAEC58V3f7D+0xLX9Fx2nN
 TDhRm4+qflqKEppYG+TAguzpHcEMLokwaHYjWrdi3vMYqnWeF/itaQozNW7ej+b/e44MPkS5p/p
 3x0yWrkilcrO8MsnydaEukaYi7F4FIw6CU/630KurnEP1uBa6fmmYy08fM865PVxlnCPxhpvzcl
 rnWBTy5g3hDABr9s8hIutzg6Q3bzy8+QKK9rkPnosQNK9jAG6smY+QRgOI7lYj6OsoY4gr4SVHM
 lsyS0RVM6EhbaBrwQjjWryYgksXMWvfhoxCIffmJ8DykLYxUhrnUqhILJrucX2U=
X-Google-Smtp-Source: AGHT+IEec9pMlf2KOix/XihNQ581VxoPi3BNtjWLThoyon10QS1gS+pBOn8m3CutqsgYTli9zMzUIA==
X-Received: by 2002:a17:902:d48c:b0:223:5de7:6c81 with SMTP id
 d9443c01a7336-22428aa193bmr42571825ad.27.1741338938941; 
 Fri, 07 Mar 2025 01:15:38 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109de11asm25563985ad.31.2025.03.07.01.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:15:38 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lujianhua000@gmail.com
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 0/2] Add mipi_dsi_dual_msleep and use multi functions in
 novatek-nt36523
Date: Fri,  7 Mar 2025 14:45:17 +0530
Message-ID: <20250307091519.245889-1-tejasvipin76@gmail.com>
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

Introduces mipi_dsi_dual_msleep to be used with double-DSI panels and
converts novatek-nt36523 to use multi style functions including
mipi_dsi_dual_msleep. In this process, minor changes to
novatek-nt36523's behavior are introduced.

Tejas Vipin (2):
  drm/mipi-dsi: Add mipi_dsi_dual_msleep
  drm/panel: novatek-nt36523: transition to mipi_dsi wrapped functions

 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1681 ++++++++---------
 include/drm/drm_mipi_dsi.h                    |    6 +
 2 files changed, 827 insertions(+), 860 deletions(-)

-- 
2.48.1

