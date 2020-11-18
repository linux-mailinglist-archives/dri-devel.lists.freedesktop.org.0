Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF642B86D3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6389B55;
	Wed, 18 Nov 2020 21:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F411B89B55;
 Wed, 18 Nov 2020 21:36:56 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v143so3433329qkb.2;
 Wed, 18 Nov 2020 13:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gT5luODuZgq4DrRgke2+oV+rvsqG6cSyB8hGvW9ce4=;
 b=o9Lq0BzFmG7GZaqmOxTtE29m4SLTuWTog0TJLqdPhPlQxPs5kw6MuzmGNPDiIXusyr
 acq51/edp1sA/+CScUwXySe8kjiI41cgUU4gjPeud7UMIQAFvOGdnijQoNVCDLySwCMI
 fKTToeJmDhN9ls4Ou8gzgoFFQyLLT3UXwyywebXJHagXK+b3gw3Z/Szo+H20en8A7bEi
 JigVbvo5c0ANFgXfKQ7Tsh2wcB6YXdMcCbi2nEoyUGYZJMGou3BcczSmO9dXv3mH6uMG
 0WP/tiEhdxlaTXAGNp7LOomyWUwgB/aa0oBRQ/eGJ0FdhHDspcAqc8AwaPvPJr+jjGS9
 wPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gT5luODuZgq4DrRgke2+oV+rvsqG6cSyB8hGvW9ce4=;
 b=H0egY67fvyyC3wUn+FisXgMjG7fnTog8+yOMeWlL2RXgmF1CWRGPRuawCO07F+MKaG
 jGuRV8irOfrNLU/XJ3Fssc+a15lU0fbvnSSYG3sZso/rdLQLt29lWlQbuyQGhQscEfxk
 o5q02dddPowO92RxkVcIHt5X/BViNKvQ95nr99/H10SHWSqhk2YKBZV48omCeJkLXKjE
 Xqc5I94kJ/Q+GeVmBGlcdDsRzEpF5WZypiT2BE04R1N5bRDFdG8Pxf8MSPoX5eiAkfI1
 NOwnuvGxsAJY6wvPZwoZnNLSOh8TO5VhVLpCFKaLB4ICfrIAilxCvM6VEXegwIXRqLzU
 RGKA==
X-Gm-Message-State: AOAM5331DoFotXHvpIymZxG4wZ5DleyQfUibvbFyBt17WDDery+h0M+/
 4s0i4PgO2n/eVImsPNIhk5W5K9GtxpE=
X-Google-Smtp-Source: ABdhPJwXOHOjq0Smk+/eI8Zl771PNJ1IOYOe+MI+0pNpJyFfUI+dNthn747Kf3ul4dORe1GAPku18w==
X-Received: by 2002:a37:bc04:: with SMTP id m4mr7165669qkf.419.1605735415789; 
 Wed, 18 Nov 2020 13:36:55 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id j17sm1631585qtn.2.2020.11.18.13.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:36:55 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.10
Date: Wed, 18 Nov 2020 16:36:46 -0500
Message-Id: <20201118213646.4015-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

Fixes for 5.10.

The following changes since commit 8f598d15ee6577a56d6617d9e4151591db34d8fa:

  Merge branch 'linux-5.10' of git://github.com/skeggsb/linux into drm-fixes (2020-11-16 06:36:31 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.10-2020-11-18

for you to fetch changes up to 2b3af2705645c87eee0f386e075871886fd429b3:

  drm/amd/display: Always get CRTC updated constant values inside commit tail (2020-11-18 15:12:22 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.10-2020-11-18:

amdgpu:
- Pageflip fix for navi1x with 5 or 6 displays
- Remove experimental flag for Arcturus
- Fix regression in atomic commit tail rework

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: Add missing pflip irq for dcn2.0
      drm/amdgpu: remove experimental flag from arcturus

Rodrigo Siqueira (1):
      drm/amd/display: Always get CRTC updated constant values inside commit tail

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                      | 8 ++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c            | 3 ++-
 drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
