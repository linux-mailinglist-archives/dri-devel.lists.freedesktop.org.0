Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FF415358
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 00:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9E6E05D;
	Wed, 22 Sep 2021 22:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94B16E05C;
 Wed, 22 Sep 2021 22:26:04 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id l6so2719304plh.9;
 Wed, 22 Sep 2021 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1Se0bIv+AZshTnNE9EXhZho8yO0a4lB3cun5QpGO0Q=;
 b=AMOdyqDsI3sfVqMy3qg8nuHbTL6w3lfG8gnPtR1OtuZBPCgWgVij+0H6Cv1w4e3fPr
 Ni/kOR6QjMBnux+XtxdvKzMxBWetD3eI+SRnpqUTd6YKwW2kJU9qIzJ4k84+akfKdu89
 UcUIoX0aZSlmUQxt6F83PCTKXnj8c+M3ykpcRD3SKbLSUBAQo+gLz1b3TdgMGPel3Gic
 qymi1EeqRnYzoFhU4iHTbipF9p2QT6scT4VQLY463NFpI/2HJa6Vs9ZZlRzUkAZ+wwzl
 l3+/+1XBXvsVb5+0tMm2xp7/MhjJB43pJUW+D+AaTNkFKn78WzlpJnzFzQ9wax+EIdUi
 y0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d1Se0bIv+AZshTnNE9EXhZho8yO0a4lB3cun5QpGO0Q=;
 b=5zyVnMXEUbxhcomC5zZXMqCvrKiXc/KbT6enoKwh7hEuwyH9a87LkMh1I8u3E7ib3T
 eASQSAAUVsz8olR5IZHcuJ/hW8smFDh9rY7vOXdD7QkZoujIQVO7UNiEJ9FXG6gUCHSJ
 8qy6H1Lv1P9PKHBYaWF/eZEl2X4uUqdOeMBjjnJrriV1QC0BjKHlI+phDNKt/HAJFRUP
 Wgcm1Z0Xmka8hqgIyRdRzIzezBbp3J+g/rUKRNsbyR76+vOmCtNH84oAMkVxy3JKqewO
 aq+LWIgQ5A3sd5RlgGUL8RMGrRW0JiFyOAZMGAjrJRmnoNTEZWWwujIop3pn5H78xd46
 b+9w==
X-Gm-Message-State: AOAM530uk5BG1Ake6QXXqLclYGoDXCwoGY3uKQ3mqJVVtS8U/i598QpU
 SS9y9OG4Pz5jMLnB8UQ2p5ClnMFlCmyhXw==
X-Google-Smtp-Source: ABdhPJwX2anKJfJb319odBXPr+/Q/RO097FlrwVWHxAunhfrjJfsuUIcGPPvyO4DfF50oI+6k0xD6g==
X-Received: by 2002:a17:903:1d0:b0:13d:aaea:a35d with SMTP id
 e16-20020a17090301d000b0013daaeaa35dmr1282793plh.78.1632349563520; 
 Wed, 22 Sep 2021 15:26:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 fy11sm319278pjb.32.2021.09.22.15.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:26:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Dave Airlie <airlied@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
 Joerg Roedel <jroedel@suse.de>, Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 Robin Murphy <robin.murphy@arm.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH 0/3] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Wed, 22 Sep 2021 15:30:20 -0700
Message-Id: <20210922223029.495772-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

From: Rob Clark <robdclark@chromium.org>

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

The motivation is tracking down an obscure iova fault triggered crash on
the address of the IB1 cmdstream.  This is one of the few places where
the GPU address written into the cmdstream is soley under control of the
kernel mode driver, so I don't think it can be a userspace bug.  The
logged cmdstream from the devcore's I've looked at look correct, and the
TTBR0 read back from arm-smmu agrees with the kernel emitted cmdstream.
Unfortunately it happens infrequently enough (something like once per
1000hrs of usage, from what I can tell from our telemetry) that actually
reproducing it with an instrumented debug kernel is not an option.  So
further spiffying out the devcore dumps and hoping we can spot a clue is
the plan I'm shooting for.

See https://gitlab.freedesktop.org/drm/msm/-/issues/8 for more info on
the issue I'm trying to debug.

Rob Clark (3):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Show all smmu info for iova fault devcore dumps
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 35 +++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c           | 10 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++-
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 drivers/iommu/io-pgtable-arm.c          | 40 ++++++++++++++++++++-----
 include/linux/io-pgtable.h              |  9 ++++++
 8 files changed, 107 insertions(+), 18 deletions(-)

-- 
2.31.1

