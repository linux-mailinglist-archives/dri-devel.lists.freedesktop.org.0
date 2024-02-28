Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100186B752
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3C210E46B;
	Wed, 28 Feb 2024 18:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Er4etOa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA76610E46B;
 Wed, 28 Feb 2024 18:41:30 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5661b7b1f51so181197a12.2; 
 Wed, 28 Feb 2024 10:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709145689; x=1709750489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=95wFx2aCsFcmw8X3YJUhwgxK0Zm3iU4v5YjwKuQWRT0=;
 b=Er4etOa56SX/8V0bDBzqJeVI28yOIeaowLBfUhWWUpBeY0fV9pNO8ZlDqNzP0aOzIS
 FjTi2Si/jDyCx9f4mgPa2h+BT0l+BCzFVrhuGtih5XYIjVrNjGtX05kU0XbGsgwpI0wB
 S1dJe2est2AryA+lF4X/UQNg/vtRW7EQ5QpXWVxsIS5Q3tQDGy5MkPjQEeMELTLQod7u
 AMV0gwwyB7shtvMuWqvva0vmFoqjyUIaYif9oe7P9BqAXinbyjkf3MmdjkCFYCWmtnpJ
 AWCpgGra4tdgmGb5GXfopgolKr45zSLg7Y5GlwShWbq/XwGdB87UPFXrt/9VktbmHisr
 uuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709145689; x=1709750489;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95wFx2aCsFcmw8X3YJUhwgxK0Zm3iU4v5YjwKuQWRT0=;
 b=INOlQa4eD3DPdTAtei4G295o2w8Gidgrtq/k+iShwILkbSW2X2BN8fGbe0WwoF6c1y
 QO+mWaBYY32bumdBD3ivqEBRc6AI0eh++OimsGpdyk89sHh4nRz9zxcUaE3y/WEDV+kc
 2Cql99OKdXIa0t2KPl+6vk9rPz1ghRssElLiL16Gr7T1NUUbN/CRSbuFNvt8SGPwk4hA
 JoBYr+SN7SWS9pwp6qk6Nh13oEn1m3RdyfMlyZrtoksUKKTm0xw4FKFChs+JHYu710+2
 BTb0I9vNK3zAdSmuDbYlDRh15p+A2PU5QGzchm2Zne2zi+yEOUz80l0jH0mbUSK2fOUp
 W6zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvJN2pDyswYsOpL25JUxW3I15K7lbtYGGU3NeD+yxSrU804jR0QJbOREMVB6DQ/K5sbg93UuEQz8z2wtYaM4HiZjqh4ypzfh2DbBMHkBBF
X-Gm-Message-State: AOJu0Yy/7sroDcXU7BDuxkINEev5V3GuWt8CvNOEXl0n7c87Rba9PfIr
 G3BwyJuOewp6VBuvgzWj/PxsZMwUNwLgfpiygR7vSw375VAvfxphSSQDnuIbG5VmJr35V/W+pDu
 sVmcX3BcIY9lSwZEghwCYUIgNPzAcnxHM6N0=
X-Google-Smtp-Source: AGHT+IEa4/vZnJzDBE36BxmCOOtWA7C9UykVSL4tVjlLlSy8+V/RsmB/GdG30jwh0G2AiZ3gyhpAF9Z1Td38YY6WgNw=
X-Received: by 2002:aa7:cfd1:0:b0:566:44b4:ea58 with SMTP id
 r17-20020aa7cfd1000000b0056644b4ea58mr172224edy.38.1709145688531; Wed, 28 Feb
 2024 10:41:28 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Feb 2024 10:41:16 -0800
Message-ID: <CAF6AEGvhWvHiPGQ1pRD2XPAQoHEM2M35kjhrsSAEtzh8AMSRvg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-28 for v6.8-rc7
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A late revert to address a displayport hpd regression.

The following changes since commit 8c7bfd8262319fd3f127a5380f593ea76f1b88a2:

  drm/msm: Wire up tlb ops (2024-02-15 08:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-28

for you to fetch changes up to 664bad6af3cbe01d6804b7264bee674b3e7dae7e:

  Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status
changes" (2024-02-28 15:32:29 +0200)

----------------------------------------------------------------
Fixes for v6.8-rc7

DP:
- Revert a change which was causing a HDP regression

----------------------------------------------------------------
Dmitry Baryshkov (1):
      Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD
status changes"

 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
