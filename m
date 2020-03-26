Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9301941D0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 15:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C6D6E8D5;
	Thu, 26 Mar 2020 14:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77ED6E8D5;
 Thu, 26 Mar 2020 14:45:49 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id t17so5410514qtn.12;
 Thu, 26 Mar 2020 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXZU/0NAcyymoUbnXRfBGXTWfKCZGAtnL8yvWCsuKLA=;
 b=PeEMUlrUS0awD10qPsEDtQH7xB1MvUgULj5fqYR8WEhkzdzbYEqc+6FbmosIpNsvrF
 PUV9pfGuL7QT2su0K8Wc7eo5BbAsfWgTbwaEt+SVPTHDEjMS441tpZKgOKjKBet4xd+k
 nHJavQFqqU68F15wacmlLBA3IED5G95BQUSsOp+CrqDpzT2ftlyJQB0qbHV9fQwlGEwJ
 HBAxs3br4fjr36LFmwVtSS4C/oO7iriB/9ow/ctsaEpqlVPFcWNjT90MrYcXCW2FbUwU
 nX0bfBmzL1E1kysrfosAZqa6ORyP5S5UCTBD4tBf5qj60n4vixgGOwiYHzotiOfbS/0U
 lBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXZU/0NAcyymoUbnXRfBGXTWfKCZGAtnL8yvWCsuKLA=;
 b=lv0QGjQ9F9v6O3+xNfi/+8garwYVg4PIiaF6MV6+6gKsu0VNfIkocNuWoqK9K7Ajdj
 svcMruvOvUooElT4ViBjwcAPbmhnMOVhaAPyT0Gd2lu1icq34i5Rn9qbAsWp9l4/RNMD
 6K06m7dzkP51DFb+M+QYK219+Axi+QhX6eYd8vvGkwPPUTLX/+OMIEuCZFhdIeXaFXlW
 Z53wzYvFGX+0WSPbjxIBqmCWpCMuEqW/6rCPtT8QA1fSDOBDLWG7iy+ZLd9/LJ+sH6FK
 TU2Jpv4OY0hHQNs2EYEs1lCOtscg8srENGywRlip2/9d5Iy67xaPVkGzUDt6Z4QMhWdK
 3oAg==
X-Gm-Message-State: ANhLgQ0EBHAz90llq8YNgMikR47Aq+BAoP3T+TURRe8QKG3a5IM+x632
 9nnin3SxuU1egbMaLCfE102PAyPp
X-Google-Smtp-Source: ADFU+vsAdbEl9P4HoFhT797hhSwQeSqtupi0H5hMlEZm0DuOHnugiekLAKstl3E5XfQiBpiYI6Jcug==
X-Received: by 2002:aed:3225:: with SMTP id y34mr8514316qtd.19.1585233948469; 
 Thu, 26 Mar 2020 07:45:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.40.23])
 by smtp.gmail.com with ESMTPSA id r40sm1739817qtc.39.2020.03.26.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 07:45:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] gpu scheduler 5.6 fixes
Date: Thu, 26 Mar 2020 10:45:38 -0400
Message-Id: <20200326144538.3937-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Just one small fix for the scheduler.

The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.6-2020-03-26

for you to fetch changes up to 3c0fdf3302cb4f186c871684eac5c407a107e480:

  drm/scheduler: fix rare NULL ptr race (2020-03-26 10:22:36 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.6-2020-03-26:

Scheduler:
- Fix a race condition that could result in a segfault

----------------------------------------------------------------
Yintian Tao (1):
      drm/scheduler: fix rare NULL ptr race

 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
