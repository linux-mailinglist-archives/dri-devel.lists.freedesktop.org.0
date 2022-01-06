Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD948698B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9329310E7D0;
	Thu,  6 Jan 2022 18:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B99510E7D5;
 Thu,  6 Jan 2022 18:15:05 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id f8so3286749pgf.8;
 Thu, 06 Jan 2022 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPOLEXfdQzQQdTmG9MNU+kg5OfcKlLIQc8Wvo+ywGFg=;
 b=dVcl5oZbRlN9CXKs1WzqWZjjyIYlqPwIv+8Zd+7ZjQI1W4gX5Di+KBMAbW8NZQmGSr
 FcWDIFkpSCXS7SiUQns/ZBTJpBDL3RV54+4chi0JqwuCrhjkxJO7Mnj+4PYTGZjnUeMI
 7yqr1J+jKmdvnhzptaLLBB0UtrnrxcljEnzeWhdLuZOj3vrpMP7jUgst12+MTml7bX6f
 p9IdkPDqDQI5VuWjvHXsanYE7tTaeT33NXEcpNfMn6h7zaqmdKXCzrJJWuEeM2LUftTC
 gkPD1lUl05d89MYW9rQFeDHbNn9fmhrlbHMOIEagXzbsuealBPdSZF5G/mX48uUFLjlt
 mVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPOLEXfdQzQQdTmG9MNU+kg5OfcKlLIQc8Wvo+ywGFg=;
 b=1CuhKJHQaq+tmJwsMFyToHF3cFBoYOqiLUEZKxpFkb+bIXOtaiFHoNDH8yv/El3RYn
 8qHRW9nVd9w7iHWMjAY/BGafPrnOAlbGFw6eZZvkEIdWmjT7ODoo+n9HrUtSR7T5SHhv
 eecqzmvFm5/qN5xzaYssEbKxkiFWBGCBzj5sMAyFBc+jX257Lw9czrx1v1+2QffnXXRM
 CAWg0s2sZ45kpftjaJuVx+eZNNyawqy4crSRM8LrYAhL5oU8cfGYHWTQCHptsm4LKK9Y
 wZiP/ApFaSWOt/aTgE2qE3gpsR9j9FmXC4yUjnI08gIp1zIsTBBwt6+SqdLOiCE1XJWo
 UEuw==
X-Gm-Message-State: AOAM532uoIrDEFrRJlkzPYkZIawejjWTUp+VwZ+KaA/oouakM5ONQLTq
 Mo17svfV8N/9UXRs2frbtqalyNqIbj4=
X-Google-Smtp-Source: ABdhPJwGGsFV6PbXXGJkrzuiRrJR4ChU60O5/We5mhbGApzUnSXKi9JYqmb2ZJvzGlaYBbeJdU9EbQ==
X-Received: by 2002:a05:6a00:d6f:b0:4bc:df41:d0d4 with SMTP id
 n47-20020a056a000d6f00b004bcdf41d0d4mr8880838pfv.74.1641492904144; 
 Thu, 06 Jan 2022 10:15:04 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id g7sm3118015pfu.2.2022.01.06.10.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:15:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/gpu: System suspend fixes
Date: Thu,  6 Jan 2022 10:14:45 -0800
Message-Id: <20220106181449.696988-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Because system suspend uses pm_runtime_force_suspend() we can't rely
runpm refcnt's to protect us if the GPU is active, etc.  Fortunately
*usually* the GPU is idle when system suspend is triggered.  But that
isn't quite good enough.

The first patch attempts to block for a modest amount of time until GPU
is idle (and failing that, returns -EBUSY).  We could have taken a
slightly easier approach and just returned -EBUSY if GPU is not idle,
but that would cause system suspend to fail.  And no one likes pulling
a hot laptop out of their backpack.

The second patch avoids getting devfreq callbacks after suspend, since
pm_runtime_force_suspend() breaks the pm_runtime_get_if_in_use() tricks
used to deal with devfreq callbacks while suspended.

Rob Clark (2):
  drm/msm/gpu: Wait for idle before suspending
  drm/msm/gpu: Cancel idle/boost work on suspend

 drivers/gpu/drm/msm/adreno/adreno_device.c |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.c              |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h              |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      | 21 +++++++++++++++++++--
 4 files changed, 34 insertions(+), 2 deletions(-)

-- 
2.33.1

