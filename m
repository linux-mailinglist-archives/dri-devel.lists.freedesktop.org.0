Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66487EC71E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3303810E05A;
	Wed, 15 Nov 2023 15:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA4C10E059
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:26:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ce2b6cb933so3918246a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700062012; x=1700666812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bXbmbRHnBcevx5RjJfA0BM5ZfkfpSJke3EDu7+/+YyQ=;
 b=VnX+hziMR4L917fLHRxCaAYx3pxKUN6gaY8Xj+QG29cgDtDNqyEGyTmHG8P2YelEKn
 3PCAFP7QlAtdpKQe+vbOsxK+azMlS8rXaIRH06WrcB/RUX4TRmg6kTQZg8FCZuJVx6Cv
 6M5d6MEKS7rVgn0My+YB+4aDifKLmdv+PQ43lD7hLAK+TPRPpRoRug1lYVNRR0ON5y6v
 eCRDKhGVf92dtB1iIPlfBijZIAibdAOqo5gIVerf/oXEOlCLxtkdj0UH7obLuj06Zihr
 odWc0l9XOOU6KcJ2j7YLUcJ6hmwlyaZlzvNUn+o9sIYmm0iuI9TA3HvvJtATXURDw5zF
 bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700062012; x=1700666812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bXbmbRHnBcevx5RjJfA0BM5ZfkfpSJke3EDu7+/+YyQ=;
 b=WtsafzZdrQRGE1CXg3NMHVDgg7vOE5bYPiSotEz1VF8In3kOhB12dWAlI8vt4NX4Hs
 UJTKNUnVaA1Vq11DrcF6rJ35KL432ZEmCK6WgxzgP5jonTmJq1qLLPoewmn0xjN7Qw6o
 +jJSF5FZfhr0gZGKv55F9cUFnWpEOfauqoGVxkhuQOkOLlPbP6TM0HB72bi7m8qKc75I
 uFKVlLbSX4FRzrYrxmEJBB7l2GJvevOV5VNW30kkYoJgNE/8Hpu+BruR3f0ZsX7pCabQ
 EDq8Uq3d/iZL8UWQwlc7ewwOPWQFFcaRxdvvdp2yB/GeGRYJOcG7eKCcgROZk0Ek9cZb
 WSUw==
X-Gm-Message-State: AOJu0Yz4kVv46mSnyKRMs7v2PRXsxtzxpPwbmmSdR+4rGf/QsiItr1Xg
 WIRKuRMJgOzpqInWK70z3oTISsmYMi8=
X-Google-Smtp-Source: AGHT+IGWmJpESFn/Gnup8P0IwP8A07FM6rqzd5p3SYOd9ebzrTKAXZPdeDsQa0atBMGNdzHlIMOXbA==
X-Received: by 2002:a05:6830:14d9:b0:6d6:43e7:b0bc with SMTP id
 t25-20020a05683014d900b006d643e7b0bcmr6061800otq.16.1700062012200; 
 Wed, 15 Nov 2023 07:26:52 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056830101200b006cdf9935af2sm398012otp.53.2023.11.15.07.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:26:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Elida KD35T133 Panel Improvements
Date: Wed, 15 Nov 2023 09:26:43 -0600
Message-Id: <20231115152647.2303283-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Fix a few bugs and clean up no longer needed code on the Elida KD35T133
DSI panel, as used in devices such as the Odroid Go Advance and the
Anbernic RG351M.

Chris Morgan (4):
  drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
  drm/panel-elida-kd35t133: hold panel in reset for unprepare
  drm/panel-elida-kd35t133: drop
    drm_connector_set_orientation_from_panel
  drm/panel-elida-kd35t133: Drop prepare/unprepare logic

 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 37 ++------------------
 1 file changed, 3 insertions(+), 34 deletions(-)

-- 
2.34.1

