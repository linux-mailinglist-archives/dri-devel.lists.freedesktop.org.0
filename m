Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C3932648
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C445F10E697;
	Tue, 16 Jul 2024 12:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="il3wv3Gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F360410E697
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:11:22 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70b1207bc22so4566978b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721131882; x=1721736682; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWy3QUylzw0ayHlV7QU3L87cEvQwTf+7VJ7LitrTlLg=;
 b=il3wv3GqBUGf7Jl5PrvBKU9mUXh6xwGHfXvWDyI08yQFA+EZWQSrdKJrdt56/o/Y44
 uvsr1JBQVABh3kIwnfSkwk8hybkx5SrJhEwNbykm7GiJ9kIXRYYjjc3vwmv5oUw03G2A
 9jm9pq6a/G6O6GXXdesZEPb4IHTVNy9D82+4fUx2Hg3EtJ5061gUeuUF9dUKYgsf7sGD
 CdW6G2TGQripPrqPum7mmEPlPATi3AcB25gsGzylCfavoOYl/kYI/zXSFXenHL9YjHiC
 ixLGMKyZirlSVbvRKGL2AyOh8FnSzooJsQALPxIvI8DViHJbMN6Zb0vJvj/2Hq8OkW6S
 Zxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721131882; x=1721736682;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWy3QUylzw0ayHlV7QU3L87cEvQwTf+7VJ7LitrTlLg=;
 b=gwi60NeCCplz3cvRTFx1oD4FYTwaKlpDiKkbP5dHrZN6EfAFFuCCRAhR8kEhToczbu
 T2u3XZm43vv6eHWDJsbHLh1SrtAo53HlPiU4ZQVRDtAC8x29Ga2RRlGr/14UhN2Olf7s
 vT3D1qGbEgUSIcoJTESp4xkcNyKSNzosrTvsvmDMURn4wZ6qM4X26xSRtIRpONW5YA7M
 SepPjnSZoVW5UMklHriPEusSw4Ogf65S6XK5voC9pmxOXz8pgfdYXOXWI5yPnlp0PhJX
 mwuNwJB+8WdfqpAL1QNVd0Vt4tRAgg2Gk9Ehe2KXr2C/5Uz15wvFNY5tErqMXIhm3UP/
 ynZw==
X-Gm-Message-State: AOJu0YzaIspDkQUMh1yaaugef7CGVwBh2BhIoIloX+ACI2iwwDRf4Bsi
 2lsqeVrhvznt2jIsbusspPhsL11q/WL+bj6/qYSG22WI4mU1nPn3fakdNdcxkJY=
X-Google-Smtp-Source: AGHT+IF3q060DbGSBRTI8U3NNaLmQh66o0p//PgKITkDQ8npkjIZNbEwzf5dS0d5vcSWygTQX79NKQ==
X-Received: by 2002:a05:6a00:4b42:b0:706:6248:949 with SMTP id
 d2e1a72fcca58-70c1fbe181emr2435528b3a.17.1721131882394; 
 Tue, 16 Jul 2024 05:11:22 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eccc48bsm6114065b3a.203.2024.07.16.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:11:21 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@chromium.org, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] Modify the method of obtaining porch parameters
Date: Tue, 16 Jul 2024 20:11:10 +0800
Message-Id: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Also switch to the drm_connector_helper_get_modes_fixed() function 
to get the porch parameters.

Changes between V2 and V1:
- PATCH 1/2: No changes.
- PATCH 2/2: Switch to the drm_connector_helper_get_modes_fixed().
- Link to v1: https://lore.kernel.org/all/20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
  drm/panel: boe-th101mb31ig002 : using
    drm_connector_helper_get_modes_fixed()

 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 29 ++-----------------
 1 file changed, 3 insertions(+), 26 deletions(-)

-- 
2.17.1

