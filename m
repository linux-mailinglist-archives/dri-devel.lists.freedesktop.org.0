Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C51BFC74D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8EB10E7C3;
	Wed, 22 Oct 2025 14:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4cyNBRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A99F10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso3889036f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142908; x=1761747708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=j4cyNBRkNw5pGf0snXsBLhvTL5DHVYuUttdLB7RDTEPrO/ZWLLDI0PPAhBbu/xIkNw
 UhAJE6Dtqn8mYQ7rquV5chjPCZTP6RHw9DHyflqN3qNyvcisA8EtrC9Kl1fY85wVr0ne
 yKEoL/Yk/6lf0yY90s+/LtRVPw33BEnfjIc8MKchomMipoxpnsjEdyIFG3zelMU+YeGI
 yV38OIr15YKqDC5IEeGZWWpar+14ImqSFa57pWR+jhAc7HSzD9nLOqNkNe4bFlXyKs2s
 4jjyF17n66BewG6HeMAqE2vbP5RumghJIZihCeLHI8hEko80BU0mF2YiG44+SJiZB/Nc
 3AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142908; x=1761747708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
 b=QT4RLue1EopbeB2y88yX479VbPsDovyQ6V6ccZbuOEcYBHofX1CFTu8tJH22lt6nJv
 vRsfKihkdrQMbxgaWhXqT01nBjkQWVej2vh6JZdK2uHY/Qa/+4y9lL8y3GEb1GsxOcsV
 hbxE5P2KBsgBu5/mhrFvwJssFylDtA6mqzF1JYXt2CtgsK5NdUMv4bF1wZvzCnPTKzdu
 52g0nblQZeUhnSUp/NX2EYiWyyRPwiJgtYjWbjfyUYOMjR7KrdxAb+zm9VKtlh3FSnFK
 R9HDONjozhQocr37MFvI0D7aDD5HdABtp4vitzyMKKA26prjbfH6xmpLzFWE6p2nz3WK
 RVzA==
X-Gm-Message-State: AOJu0Yw0dQc/ue22ekfirspWgxqs6Vt8REprYZO0dJ4DCZxFrbvcDXRM
 pxxVhhUQXILZ5OtzwEsciQ8HHhpjAVCDt8tvrnIx6kIz5ez3dTRWLmOQ
X-Gm-Gg: ASbGncskX5HEgK9EBV8psXHXeTncfO6Tze8RjpEnllLzW5pmTOfN8RkSwajnbHL8I7m
 O6z6Pokyi/hGkPVftrie8AA4jkpPQEmt7ifq151zYn6cAuhko+LsdCMFX8fSflz78j1rdo6BY3W
 qjrSJd2/xJ8KF9K+gig90n7UoBt7Mew04MmQ4UA/GaP/H8aqlT/muw1Thq2lfMnEOLYfmlJiQT2
 8pQlCgJY8toPzBu8vtqqcDiXPAd8vEdZy9AZCuJ2TFYR9raVrGq731t4IRv62G/X3VoMTPp/A/k
 pBbMmYLE1lqzZBEeJ7GVUJUgZD4XskLRhUgblYaN1I7ZZQd01hqiuUHhJ6o96na9HpjPzamjZ/j
 M/8EW8O1pbqDhDoLENNFzl9VUOUng3a/5eZMV56M5t42Tqci1/zfo+zyIShhJlmD4ZxrMUCrhev
 N/Vw==
X-Google-Smtp-Source: AGHT+IFq9V87Zw7qGeTmSRrPB3JwZR7jtskG/uf8ikZdxsnRyJSInvVy1UaH8yLg4G5ahmvQ9XgogQ==
X-Received: by 2002:a05:6000:186f:b0:3f9:6657:d05 with SMTP id
 ffacd0b85a97d-42704d7eb23mr14938377f8f.12.1761142908345; 
 Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 14/23] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Wed, 22 Oct 2025 17:20:42 +0300
Message-ID: <20251022142051.70400-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

