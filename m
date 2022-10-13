Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9105FE5A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 00:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB9A10E9B9;
	Thu, 13 Oct 2022 22:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CA410E9B4;
 Thu, 13 Oct 2022 22:55:12 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d10so3265335pfh.6;
 Thu, 13 Oct 2022 15:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3mIhMnGoIlAKBRI/Lq6fsfZ+LtCgVnYV3UGZC28tNso=;
 b=paHg6qwWqBLQ5noiDCzwYHUpJLZ7es1HEAUGwJugYi/CxbiOs7YkC0rGO1cU/y+3Bl
 foWUZYr4kJjhbkD1tHtpB4EcAKb/ott4/yu5bxqoYnIuEOpaMJJIjF0OqnQpA00cCwEk
 Jyu0qHTLeVvVDJqrGj8l3mfwGTDpnXAoOCoe16xzs8c+VmOdcrRv/v0dVSlGBG3NUjU1
 H+gUjvBuDB/HIYPZZQ+p8bS7jVx48J6e8CY2BU5BRYSm5hbj5+XQTty5dzqT/N6+Ytwa
 2VltE5F4M2cf6hvFf394fcNJKL4GmXQCBxTZboqkuc3Qfr5dKQkn35IJBfcgZohi5/we
 fwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3mIhMnGoIlAKBRI/Lq6fsfZ+LtCgVnYV3UGZC28tNso=;
 b=3NiERK9UPK7d4lCXV6ng60T6vfpbcUFnYXGSTrJHCa1TW7kaWhEbJREaXioAbfVJHU
 hVeY6CDwIAve3b+LyTcWCotiVx1PT7G0qLfy6aPRGnRnZYATr5VBCyRjvX+9FRc/PnjM
 DeF4B8/eIa6OVcTzbQ2AbZAqYGr441zdmEakkjUbGlpLv8SYYrzvkK3J8QPieR3MF4MU
 b6UGw/ySCIpiABwSGA37Mry+6w+v/PCVaFEcOc8VoEjF3CILx2opiJoqhATfOEGT22iD
 oMkQanCRaWh3XeHvIp6zz2A9JpUEuxxZQc0uykoMjK5y1a/4WePobAIKOloQrZrpd25h
 /4WA==
X-Gm-Message-State: ACrzQf0gTA1WXB+3QNeQCdTypi05y0d6SqbgFG1i9TDAwCT/bXnEOaSO
 ThyH3UnxvmS6AQCxmJ4ts/eis9Jns5U=
X-Google-Smtp-Source: AMsMyM7SuFGVIsozC9eBZ2vZFWzV3HmleEVAV4yaykXpE0yjaBLytU8NySHH2qRaB+L31oLUIFoOQw==
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id
 s16-20020a056a0008d000b0053b2cbdfab6mr1890998pfu.3.1665701711666; 
 Thu, 13 Oct 2022 15:55:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a62870f000000b00562adeac326sm213368pfe.102.2022.10.13.15.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 15:55:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/a6xx: devcore dump fixes
Date: Thu, 13 Oct 2022 15:55:12 -0700
Message-Id: <20221013225520.371226-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

First patch fixes a recently introduced memory corruption, the remaining
two are cleanups.

Rob Clark (3):
  drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
  drm/msm/a6xx: Skip snapshotting unused GMU buffers
  drm/msm/a6xx: Remove state objects from list before freeing

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 18 ++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  7 ++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.37.3

