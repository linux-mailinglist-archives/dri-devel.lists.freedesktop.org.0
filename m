Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B618C20B492
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACA56ECB8;
	Fri, 26 Jun 2020 15:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EBF6ECB8;
 Fri, 26 Jun 2020 15:32:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s28so7225624edw.11;
 Fri, 26 Jun 2020 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sisD+mlHl7C8CYQosxE2yZqCg+4na6/akZrccMrgES8=;
 b=M9rOG1iqUTGJfLzsMRU+uKmHxbYt6WXxk/ygFmzH1wC1TriYfTuDdqJ7SVki63sOWu
 lsp6STtO0LgJWFyJC+3GHqWiq90oDclHc1sLZ+PuZanQNSTeFpg8T8k1yo5tyxkrGh1C
 xlJfLdus2IGu9qL19iCWlnh1x7so34u/cT+7mfGAGwCwQASVnS3UQq4B7waxzmvfwMhw
 LU7xJl85nYcLRKWYKzmC/4JM9wWjY+UsLpt4xpI35Pcnk7MySppPH+Mn5Nirw4wMDoX3
 uKrT9DojirIOzcEEBN5tG7sfaubVr0NYtFmZZB9lpWuwY4U9EDPyQ7ZXF8tCN/5UkdSU
 YA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sisD+mlHl7C8CYQosxE2yZqCg+4na6/akZrccMrgES8=;
 b=dXFvijLQcWAkAoxJ9QCZN7SIurQqMdjjPp0vXnDch9DS+CAFbeMLkSqnviOZpaTWa3
 lT4tCBnhiZXp12cikJ4eTHlQz90SwOPUJChGNsJ82tlQQil2/hjHziv/JhPx8eeN5mdQ
 doDKSKaBo/P3oMjkD2bRHeBLJ50HKzEFp7FJtF79UaoRG6345vxlYC373Y25PJVRK2oD
 5JzXrM7t6D2zHmnbr/Jk1XOMc0g17G3IQoFE2G12UKvDMZsq07+Sr6Uqcbx83isJyE+1
 d5CfaoQ6lX4SZBZQwLMilKYrIopgagWAgmc3tQZuqdWeZ7yQg/hjMNqtdfWu9LdPoV47
 2jvQ==
X-Gm-Message-State: AOAM5309keaPmHQFbprlp5b0jeFYI+FQcek6KqQAcoY9gCFl+zbygb+8
 geU9VdFmQ46mQVd4ZpW+Ok85tpXgztjhOKUcFNbBNdW9RVo=
X-Google-Smtp-Source: ABdhPJwT1TINnsmEQHyFt81RhldxZNYfXLU69wEptxxMIBuc4S3lt+KRGyfgPnzqlOmQWT3BolOB8DQQOuf4mXXYlc4=
X-Received: by 2002:a50:eb02:: with SMTP id y2mr1398536edp.281.1593185532634; 
 Fri, 26 Jun 2020 08:32:12 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Jun 2020 08:32:42 -0700
Message-ID: <CAF6AEGsYHgxo0+Nwr0Wq3A8W6LW69SmbpDN4ckpTqxPtAW3vww@mail.gmail.com>
Subject: 
To: Dave Airlie <airlied@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few fixes, mostly fallout from the address space refactor and dpu
color processing.


The following changes since commit 1cb2c4a2c89b2004a36399860c85a1af9b3fcba7:

  Revert "drm/msm/dpu: add support for clk and bw scaling for display"
(2020-06-01 20:56:18 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-06-25

for you to fetch changes up to 30480e6ed508e3ff7a3e03c975696aa5196ffe8a:

  drm/msm: Fix up the rest of the messed up address sizes (2020-06-22
12:12:29 -0700)

----------------------------------------------------------------
Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Eric Anholt (2):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (1):
      drm/msm/dpu: request for display color blocks based on hw catalog entry

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c    |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c    |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c       |  4 +++-
 9 files changed, 21 insertions(+), 15 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
