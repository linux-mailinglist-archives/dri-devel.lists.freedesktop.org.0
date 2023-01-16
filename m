Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014EC66CDCD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC2B10E476;
	Mon, 16 Jan 2023 17:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C133310E475;
 Mon, 16 Jan 2023 17:41:28 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-142b72a728fso29523249fac.9; 
 Mon, 16 Jan 2023 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=32etmJGtnoqZs4BKYvAsZxgp4Z8S6ohTWuwi/XPlaIY=;
 b=PvRXv20O6DvvrQohvHLThOVursOGZoHGCN2kKLOUEBl+JlR++v8pM94Rsdy+06TzUD
 u3nljlp1FNHPwvXBcmTsJQwp5H1hGn8IPm856UZTRnbPtrFRl7W84tpUJXbZl1HzLC42
 eqWloiTobk3CJkGgEEIyOLOP+ig3gjISbbDWsltJJk4dOFlrjgn9rWUN7Py8pr2Qw3ct
 KKMwPo18GrWMGwi7ePfdIWFFhEKZo7AFWB8fi1obVJVVN0HXpg2T/0WKU0KzvEMCBPND
 1CxvpeA1K8zaqluCHxAwRBQsULmXXLB/zx0TCmeChCv8oPySCtsAbc6p6IUrW9xuzyDB
 5DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=32etmJGtnoqZs4BKYvAsZxgp4Z8S6ohTWuwi/XPlaIY=;
 b=CiJAsTotPZeteFQcvSlI1KTKiKFdKl7pQnFOTxrZ0Zz9+QTxpf+uGNQTHoKlTAI+NK
 qnKSNzBovutAJVCh6PkFYkCHu8XrOHVqKz+YVO2UyLBnVVVuYN0huXg5GodveKCKeMCW
 Do8GyjR1ntt5Uba5CZj4Mvyz8XbhxvbxDURP2LXhUKB7qey971hzFZ3SWiyMoIE1Rw+B
 iHoi4DYKFldefDsu5NqofBIEWWfIKJRsTQdNcu3U9KRXsTOkVqCxD+JJGFpFFdy3GHEz
 z4B/s1swtEauTlz06k/BP4D6bJ/YELiATlgzp4dwXCrrcBc7A7q/eOKtcaj1JSEFUCP4
 AmPA==
X-Gm-Message-State: AFqh2krOpWxs29Vt8YWUTIyk8flK8f0RdBH/+q4zlLpgwzXjZhqPlF5A
 jR3jyx0sZswp0oGkIIvFBltz8llLtj5JShnRc7E=
X-Google-Smtp-Source: AMrXdXv/fJdDosEVH5QdjcHknh+mizzHGjnQeD0B3IXf279r17ct66uUwAb+qk2pfx3Fq5drTaa1P/d+FtTgWTMAjOU=
X-Received: by 2002:a05:6870:9a9b:b0:13d:51fe:3404 with SMTP id
 hp27-20020a0568709a9b00b0013d51fe3404mr31029oab.183.1673890887961; Mon, 16
 Jan 2023 09:41:27 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Jan 2023 09:41:25 -0800
Message-ID: <CAF6AEGskguoVsz2wqAK2k+f32LwcVY5JC6+e2RwLqZswz3RY2Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-01-16 for v6.3-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A couple more fixes for the v6.3 cycle, which were meant to be part of
the previous fixes pull, but I fumbled at git when applying the tag.

The following changes since commit f4a75b5933c998e60fd812a7680e0971eb1c7cee:

  drm/msm/a6xx: Avoid gx gbit halt during rpm suspend (2023-01-05
15:13:16 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-01-16

for you to fetch changes up to a66f1efcf748febea7758c4c3c8b5bc5294949ef:

  drm/msm/gpu: Fix potential double-free (2023-01-11 09:00:14 -0800)

----------------------------------------------------------------
msm-fixes for v6.3-rc5

Two GPU fixes which were meant to be part of the previous pull request,
but I'd forgotten to fetch from gitlab after the MR was merged so that
git tag was applied to the wrong commit.

- kexec shutdown fix
- fix potential double free

----------------------------------------------------------------
Joel Fernandes (Google) (1):
      adreno: Shutdown the GPU properly

Rob Clark (1):
      drm/msm/gpu: Fix potential double-free

 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h              | 12 ++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)
