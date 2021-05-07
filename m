Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D179376BA5
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82EA6EE7F;
	Fri,  7 May 2021 21:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F646EE84
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:25:07 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id q2so8742404pfh.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
 b=ReDI50O4p6XG7KYhP06LRbAWuvZbFoPiydm8iaQ0lbFendfkj5D12q3t4o8Tjq3+XQ
 45Sn3Xz3HB+4fOLjk25u0rJcdrmMMw3B5OOy77dyA72ufIy0vXm1BWyyIVy/kto58mO+
 9byAgPEYPR1V4rWSn2F3s39QJYpw6TrbM5SZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
 b=OC3ZRQzSu4i0p8u8o+oFecj2DH4UQJaBZrxxdllSUYWWfUt7O25yPK81Bju3QgDQ3B
 5wpttXWWystheT/cJKOuRNIOS5niOhnpYg8xEhACGKhQdSty+cgPKGdYuLNPJA1lKSDr
 hS/jcta1S+RGEY+Z7p6/xc3YPTnLSGckLYOVNQBOckV5GqRwizu5ZEE5DNGdZB/FC9IZ
 VqupCF/rnNFndgBNrJ+DGW+UVCuvBAI6WDNF4kjyBf5/fKly6FCGyXml9/U1TtKFnpWz
 L+/L9zbb9ypoYhAMPPb9VUTrlKZqeqBdjdm1NoX/Tp53hFZl4TUDDb3C8zuuS6uJ6wJa
 aAjQ==
X-Gm-Message-State: AOAM533wZSMwyZVV07hIst64zOM2urRK5THo3T3R+SdiaEizNIBqCCPZ
 zDDxgwhZlW1zymB/ujNSToLpJA==
X-Google-Smtp-Source: ABdhPJxXqi4S16zzZRUDmrs4PpXoCn4oLa/reeq8qjeKTY4CE/QCv/tBLRMZb5MLVWo20hYp/3coDQ==
X-Received: by 2002:aa7:8e85:0:b029:28f:2620:957e with SMTP id
 a5-20020aa78e850000b029028f2620957emr12473932pfr.40.1620422707177; 
 Fri, 07 May 2021 14:25:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:06 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/3] drm/msm/dp: Simplify aux code
Date: Fri,  7 May 2021 14:25:02 -0700
Message-Id: <20210507212505.1224111-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's a few patches that simplify the aux handling code and bubble up
timeouts and nacks to the upper DRM layers. The goal is to get DRM to
know that the other side isn't there or that there's been a timeout,
instead of saying that everything is fine and putting some error message
into the logs.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>

Stephen Boyd (3):
  drm/msm/dp: Simplify aux irq handling code
  drm/msm/dp: Shrink locking area of dp_aux_transfer()
  drm/msm/dp: Handle aux timeouts, nacks, defers

 drivers/gpu/drm/msm/dp/dp_aux.c     | 181 ++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
 drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 4 files changed, 80 insertions(+), 113 deletions(-)


base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
-- 
https://chromeos.dev

