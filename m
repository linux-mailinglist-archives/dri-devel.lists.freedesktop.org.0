Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D6A244A4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 22:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2214A10E20A;
	Fri, 31 Jan 2025 21:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YtzshWKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C3010E211
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 21:31:21 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so408439166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 13:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738359079; x=1738963879; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8sMFgyKuIAH8ly7F91V8rApj+AxzQFEz+0kCLCxW1So=;
 b=YtzshWKiW6Ay99/eHq2VLVtVoiDP6vOkaW6UF+L7yPuJa3EP+B0eMLX/1EBbjgB199
 5/PMq9Q3iCkJ44YJZsS0+1Nnwz2/Jdt00mPyTkfwPIzZwAqXrsHLD4ZFEUndESnC8HJB
 YporCTKulpMcGxbFUp9r9KOY8fr7CN5jRnAFQx6TDsCxXGlUhaQoODZjpzy5285loI1r
 se8zP3B03CnYRw1Tk9QE9LhSqd3Iz3BKBObjGyKKbmE7ZHPIyMrH7VgCZlH2DV4VtneZ
 vi/xu1mqf22+qSnMa+eBRbBBR/Z9HnCxltQW2DnCfC8ChT7BnwgcAjuVSxEiCm8JDFyc
 4WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738359079; x=1738963879;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8sMFgyKuIAH8ly7F91V8rApj+AxzQFEz+0kCLCxW1So=;
 b=IB3gwbUJtEaJZI4zbxrFS4AKWcMHLwepmtkGhGlgU+UnnGh0sZNJ8UPsuh/4gPqU2h
 ts5eF/TUyhy4sdxou1UKN20tuv3wviPq15cMD9WEMMQyWL7A2sL05KyBNos7A4USd5bk
 c/KnOJBo1XCF0ilhRzxLO8IWZJmH2OBa9rcvyDsgVtKqgvj1gngj02AvU18DiI6prl2a
 77V6rXMqjJQ6kjYXgMEm11VAocozApSjJES3yRYRMBDqXsIkbM7QB/StK4eG1kckZN/e
 G0k//EhZi0rnTtuKcXNnl3Y5mBJgZLyW6DqRR7VvH9oyxcuzKRj7xAwez4OrHyqdi85b
 kV7w==
X-Gm-Message-State: AOJu0Yw3+5X2alWTmrwNkwjEaah+lD6trloeeuFanuGfRGocgSNgRvCs
 2SjmeEsfQexrVlpOyUfOYfwIvbwK4wEXCofY21WGFrrEOMF9HoOr8dNlHCgLTxn+2kqlf3z8q64
 hWRasvjQuO675OKYx5wQmLPG70F9jhKrf
X-Gm-Gg: ASbGnctpb9spnwk7bIhszVTzAVWFpQApw8DfiOIJxN0dq4DCjFVYX+EuaF5jsKiWnrw
 EevOpEcx3O6JTgjFnQ4PyRCOsw7nhL2S9zDLrFG92RwdswbpTyO87IpzLbf+B80AOb+xh+s0=
X-Google-Smtp-Source: AGHT+IFCxjq7JVele5N0WAD/aWKOorY7Nl8XoPCWOwHdyUa4tKW4l5lQYN8VH9vBW8jEWSjHSdhpLpI8ipXmD1wj+v0=
X-Received: by 2002:a17:907:9452:b0:ab6:fe30:f495 with SMTP id
 a640c23a62f3a-ab6fe31018emr545918366b.35.1738359079237; Fri, 31 Jan 2025
 13:31:19 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 1 Feb 2025 07:31:07 +1000
X-Gm-Features: AWEUYZmar993kBa1Sp93Oc8tcUnpCbu80RjXzUnUNE47h24wGe57ZiO58684Qes
Message-ID: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Back from travel, thanks to Sima for taking care of things, only one
MR left for me to finish the merge window, this is only AMD fixes.

Dave.

drm-next-2025-02-01:
drm fixes for 6.14-rc1

amdgpu:
- GC 12 fix
- Aldebaran fix
- DCN 3.5 fix
- Freesync fix

amdkfd:
- Per queue reset fix
- MES fix
The following changes since commit 64179a1416e1420a34226ab3beb5f84710953d16:

  Merge tag 'drm-misc-next-fixes-2025-01-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-01-24 17:06:06 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-02-01

for you to fetch changes up to 8dcb26b493d3bab90851f93ae1c127af5cb2dbb5:

  Merge tag 'amd-drm-fixes-6.14-2025-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-01-31
09:41:25 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc1

amdgpu:
- GC 12 fix
- Aldebaran fix
- DCN 3.5 fix
- Freesync fix

amdkfd:
- Per queue reset fix
- MES fix

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'amd-drm-fixes-6.14-2025-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Jay Cornwall (1):
      drm/amdkfd: Block per-queue reset when halt_if_hws_hang=1

Kenneth Feng (1):
      drm/amd/amdgpu: change the config of cgcg on gfx12

Lijo Lazar (1):
      drm/amd/pm: Mark MM activity as unsupported

Melissa Wen (1):
      drm/amd/display: restore invalid MSA timing check for freesync

Prike Liang (1):
      drm/amdkfd: only flush the validate MES contex

loanchen (1):
      drm/amd/display: Correct register address in dcn35

 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c                       | 11 -----------
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c        |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c       |  7 +++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c            | 12 ++++++++----
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c           |  1 -
 6 files changed, 16 insertions(+), 21 deletions(-)
