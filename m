Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523625A61C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E5D6E910;
	Wed,  2 Sep 2020 07:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDFB6E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 21:59:44 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so1254972pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 14:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
 b=RXPbcL+/x/0/MCRLgV/vAAejfDzweAhJZwltTuPOwujDYS6sVTZv6LcDC0toDGfsR5
 27pTZsYznoxtJo9BWxj3FqS06iQt+BCkzz4EzmAtE+kXFe26jaN7/pwok/7gmxRtKHfG
 Pu6xK0H/CaFc3L4FSKt022kwlnRYfZVf6g/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
 b=X3UUR9Kq3dl5cy23905XhEDs0z9H/Z3+NUGRtX8RXLee7S6es+ZvBwOz/Akry/xAqK
 0k1f/v7Pn8Tq3oJ9gO2YITLKI87k3YsyOqKJW0PxSkn8A+m++Ti3uDHS/w4c7GSqDfPO
 RzrhlFdLH2tHtz+NJDEKpyw4YpWCoDhbp0dPHas/JNqHLuNc9Vyq4ePagwBtwlDbS3KZ
 95kRQ1efcwKEqQ0RZmUzozjMMwgmzd2TYAYl/zxZI29JxHKW7Qms1h4pOJ0gv3umO5y9
 sVLIhsRP9snyMBkIyXwpNXl4juRh7G7j7mo38FnAmrUbX9y32IgOlq6HdbO/lxfcFii9
 Qvhg==
X-Gm-Message-State: AOAM530mUDKtE71vX14DRxEHpdO0oGQs7noUlXnVeIa2lM+TySdgBLdf
 A2QfBetmdXOtgZOICcPYHMo6ZA==
X-Google-Smtp-Source: ABdhPJz9RPfwEsuY9az8y012sHdT37924RbixUIVrrwiv3YuNEPc599qRWWZD3WwDHJJOHxIT49HpA==
X-Received: by 2002:a17:902:7b8a:: with SMTP id
 w10mr3245995pll.145.1598997583989; 
 Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/2] A couple drm/msm fixes
Date: Tue,  1 Sep 2020 14:59:40 -0700
Message-Id: <20200901215942.2559119-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small fixes for an UBSAN warning and to make debugging a little
easier.

Stephen Boyd (2):
  drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
  drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
