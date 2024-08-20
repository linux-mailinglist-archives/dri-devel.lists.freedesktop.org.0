Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B09581D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80710E584;
	Tue, 20 Aug 2024 09:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iPvfDxnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E935D10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:16:03 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3db18c4927bso2999708b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724145363; x=1724750163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rEzsuAyxIJQ2n0K0P315etHjhvAYDi+x+2AtvQWPcYQ=;
 b=iPvfDxnWzyg/g0aWvaIx0MB9YSlz+evvrms+7C5q9euwo5OL6m6e+P1cSBcfQARrGA
 +FNv6zPa0MqndUKfPzIhGxk1cCLZhF+kLbWQhYL4cJ918c3koh+aEQDMeZBaUcNrol51
 Aup5vPfebwkbeGjq74yrRnh/EdMLoezSdVYocB8RZT89wJe2U5C9hU2lESgITpDBUdXm
 r3nBOSGPMZEJIkZ05J8Q9FSqyybwg3rf3epNPuVMCOchCpO62QbRU3BdeOVOxC528g0l
 SiSVmW9CgOhGRoNkUfmeU9SjYk8dpS0aBkEtibCCOMoITnxfhG4xafDC6RlLg0bnpiM5
 x6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724145363; x=1724750163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rEzsuAyxIJQ2n0K0P315etHjhvAYDi+x+2AtvQWPcYQ=;
 b=JYQJKKFYiGZWpzB9yKbWpOjs5SfQkwwACyBqYBL5PmgaEt1oSxNjxl/0YmBPdPPbvC
 2WjRdU4X8L6DXh44Cq4CvKsLmOI+tFtPY0grBoy/aY4EoWMVWoPHxOazeyRw6GpXj40E
 MxUCCCZ82kToZYcOqOu3Ht1hzTIlo/7xOCcSBVONITfWmpU1U2pD2l0Sb5FW7I+Mpd6z
 8SKeXP8ckO/iTIk76DSSXCiLz7epvA/ROwz0shSUi+fbMe/za6OIZHSpl95Irnsxv2gf
 CJkbLJCLXgD/Fpz/CoJcXWTkTdEvnVwjygrb5ckNsuzKXnNohyf1+XVaM+I9d6ATNQqJ
 zB7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpj2nlIDEhZ+q/JkSqF8dCF/BVgg4+m6v6vRFrJSuI4Hw44k8kRHSr/M7qavMc/wCNTr9lLtgO3SwWRqgVWaq0ZZlOgvjudOZh2v31u/yP
X-Gm-Message-State: AOJu0YySSjMyGGAK1VLABNa8hT8nTK/yFZBnKsLRMzSiGb2KusIxSRUv
 VTMb9oqA9RSKy8j1RH2c57ElVqw7Q8kPOVIq0u63NEptabTd9o7S
X-Google-Smtp-Source: AGHT+IH5K7IcdwKnFaD0T7b4kkiNPFD/N1qEOXmHqQcQDA9rgegaxQpq3arNpu62aADXtOOwqoqmWQ==
X-Received: by 2002:a05:6870:c113:b0:260:ff2f:9d24 with SMTP id
 586e51a60fabf-2701c522a26mr14798077fac.33.1724145362725; 
 Tue, 20 Aug 2024 02:16:02 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61c6f12sm8998575a12.35.2024.08.20.02.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:16:02 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: agx@sigxcpu.org,
	kernel@puri.sm,
	neil.armstrong@linaro.org
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 0/2] convert mantix-mlaf057we51 to use multi style
 functions and cleanup
Date: Tue, 20 Aug 2024 14:45:52 +0530
Message-ID: <20240820091556.1032726-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Uses mipi_dsi_*_multi function in the mantix-mlaf057we51 panel and
converting uppercase hex to lowercase hex for cleanup.
---
Changes in v2:
    - Split cleanup changes into separate patch

v1: https://lore.kernel.org/all/20240818072356.870465-1-tejasvipin76@gmail.com/
---
Tejas Vipin (2):
  drm/panel: mantix-mlaf057we51: transition to mipi_dsi wrapped
    functions
  drm/panel: mantix-mlaf057we51: write hex in lowercase

 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
 1 file changed, 27 insertions(+), 52 deletions(-)

-- 
2.46.0

