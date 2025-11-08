Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1CC435A9
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 23:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2000D10E140;
	Sat,  8 Nov 2025 22:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAb1keFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2940E10E140
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 22:44:53 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-8823e39c581so7502296d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762641892; x=1763246692; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GV/WAzTybILabaHuaT+4GIBGUdc55tmfITVCk5miAsM=;
 b=GAb1keFHaKL7bdxs/KqPbxdTElXi6Lu2FO8joEo/14tXEsDqi6vPu96MShWxf9nFSg
 Ty42sJkAHUuD6VOqgJuRDQLi4b+eL+auw6mWhhZpQnHHPNosBEoAaA5yKolliksBhYtX
 RKcEl0LnMvSCgKm4tKy/7eJlkiiUfqvr4QjI0VJ7TzD2jiZoiQunP7UZb+nwze9t4Dgl
 Qu0DqX1hOcxEv5Fy6Yy0FG1qN4ucJ1kDyzz+lGJHMDE5BgP3cPF2o3VkkAgdg/RdvKfv
 hmCxy3QYsOzcwUGZ5QzwvqJczieZBITh/BsGJwgDd6fNLhCTRaVWKoTk08vllD13CBj4
 lArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762641892; x=1763246692;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GV/WAzTybILabaHuaT+4GIBGUdc55tmfITVCk5miAsM=;
 b=rgr01Kfd10O097o2jYW+HXf28sq077qi8ABgPMVmeKrxIVcIWn/+nnbtQdinGYyL/I
 okKHNQTvx7h0JFV821MLTMq6ALxPwBd4TorPzjAbV+xu7z7Cb8Pv9cf1l5CeKMbf+nST
 uM75a37xtdsdRnHHEpK26BUpBeACwIAnL+on0pPlHgyh4anUrkLwg5U/uJcWihbwMobd
 j6bJNdRclBkzvcP3xwqdDqid0LC76zw8BxO0HMzlNRY6YS7shuq1mlBHBOSrs8fG6Bn/
 ZvfMgo2qpNy1CHcluRLnak25ZwZuegEvSguOXjLAj9cnsjLEs1FhtYZ13k/fAOrfj7OU
 mKLw==
X-Gm-Message-State: AOJu0YysOmXz4iyqcHrH5W9ECiN13Fh4q6KpDIP2WBHHokvItHc3SBKD
 r03VTosUK/MYX3egdB9jMbF8mZwW5MmYXhFoc1bp5xskxMUalQLjkN1DaV/zRMQumRO4W1/9OWz
 FdcbSGq3/ZSNKRKIaT7/PYGLu63YFK9c=
X-Gm-Gg: ASbGncuwabfCeMkR5xcAjku5EopBPwHXPSvu2pvUZzpo27zitHBRmsdHIUNQpi5v8I9
 2l9qYn356wUWZgtEM7eMsXLV2BZKnT4X+oqpvcdRAmw2x1bB2SN5rfJokZ9gjW6Rf7ymrVBd6eD
 jHGDVERdcVlaP6u+mrxXUurD0cztCI3KueguqTnmOybz4eX7DME5XAFeKMqlRZVAMrxQm2/VBv1
 KW3dWnGMr3uZFB5bX9l/jVF6HuhUpBi5e1zrz7QIL1ud6WVWeZ94uCjlE7Vv19sqpVlwkhimxOg
 UfpyyY8JQ/w5qATnsg==
X-Google-Smtp-Source: AGHT+IGPsvmDTNCHsgzpvFyVnNsDJSgqb5Rk5vl4nogKFc7EwQjtyzkLdkEtPVMlSxZLE1CKog/LJBj/gYxbLA/Y0ms=
X-Received: by 2002:a05:6214:238e:b0:7a1:781d:8557 with SMTP id
 6a1803df08f44-882386335b5mr46603256d6.24.1762641892141; Sat, 08 Nov 2025
 14:44:52 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 9 Nov 2025 08:44:40 +1000
X-Gm-Features: AWmQ_bk86ixqj5JkTDnu0HKph_AOhWOY4hwf0cv-MhJ8e1G1cXHmRZeDwl0HmTk
Message-ID: <CAPM=9twWJuOWLGVoMNdQhpu_5-diyLuHw+QhENenW_wGxu6GOQ@mail.gmail.com>
Subject: [git pull] drm fixes urgent for 6.18-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Timur Tabi <ttabi@nvidia.com>
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

Hi Linus,

Brown paper bag, the dma mask fix which I applied and actually looked
through for bad things, actually broke newer GPUs, there might be some
latent part in the boot path that is assuming 32-bit still, but we
will figure that out elsewhere.

Dave.

drm-fixes-2025-11-09:
drm urgent fixes for 6.18-rc5

nouveau:
- revert DMA mask change
The following changes since commit d439acbbfb9a982f152c5f806b4592431a80c4fd:

  Merge tag 'drm-xe-fixes-2025-11-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-11-08 07:39:54 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-09

for you to fetch changes up to 411336159064c5e89e8b89d30c6855db4bb92814:

  Revert "drm/nouveau: set DMA mask before creating the flush page"
(2025-11-08 19:41:09 +1000)

----------------------------------------------------------------
drm urgent fixes for 6.18-rc5

nouveau:
- revert DMA mask change

----------------------------------------------------------------
Dave Airlie (1):
      Revert "drm/nouveau: set DMA mask before creating the flush page"

 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)
