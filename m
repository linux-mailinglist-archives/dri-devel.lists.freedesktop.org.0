Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE631736D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 23:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AF66ED1B;
	Wed, 10 Feb 2021 22:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37976ED1B;
 Wed, 10 Feb 2021 22:35:20 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id a1so1687204qvd.13;
 Wed, 10 Feb 2021 14:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWma55o1GzNRR1DeoqdVLMIMWEZSb25ckGS7uqe/9v0=;
 b=OdUsQ7FQRfvvVUbl7Dsv7T6ojtQOHz0wjpglw3NLMRZ6RFJJxODgTK6rvVGB7w4O6Z
 F+WFPlbBwEMbBWqVkROMJItH7/6BEKUI+Fn3Ekz1SIuPmLdhU4eNFeMg8SP5hew01hap
 dGifMRflUT3a/Qw+RRs73vK79T2J9ZFluuPHcwHm3aDjL8CmDaIASXIafuWB7WX2U02a
 AH8kLepLT0dDcrZX2Q+jPrqR/kC9lFVJ5luaHOd+MmXra8uFBC/M+SUdhTEz32DdOGZ5
 LGVpqsT+h4JJSr5zQx1ck83TPbYEeU/5ifDoyN3C3wyfC0Dxk9uYQHDlQAnTCXcBMBkO
 HQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWma55o1GzNRR1DeoqdVLMIMWEZSb25ckGS7uqe/9v0=;
 b=CK7bbEUGlJLCYgZJXuJovTMMIajTOZGXVF/Rduk8NZg/81/+rUkgqExheCfFNNNvvx
 cFcZf225UsJIxRQ7Tuzhn560brEEt78v6A0wMNTxoI9OptZeXKqS7J2IkZNyNnTC7Iy4
 AROrXA+wzTWdHbT+lmkUv1ygC6dS7haJwrYGO9w5YSYcwOfCkvhJ/7fuQQoSpGwfvCN9
 zSx2LPa0nA0VxT59BOqZDN5ME6c5wZv4fVYBwhF4OxCcv+zlSPEERRqqcgjB+cm0VUr0
 ef58zzRRE+uNmqRqzRHYSQIK9ZGfyDqgBbVT/9AAA/ORbmNJ2R/FUvWLHGA7rCghntDQ
 jAIQ==
X-Gm-Message-State: AOAM5300VQB4GpgpxqzWG3zfNmY6oAR2D8gVSbHjR84h/lASB68I2yLh
 2TdsulbAyqBu+JK7DxPMjS0cov+mK/o=
X-Google-Smtp-Source: ABdhPJxSoNIt3BJEdgPYKboxvc7PXSTmj+FTfI8Is9NwDf/m7vYcyQ2sqDa7EIakkyLixoQ/TBQJOw==
X-Received: by 2002:ad4:5bae:: with SMTP id 14mr4907374qvq.24.1612996519780;
 Wed, 10 Feb 2021 14:35:19 -0800 (PST)
Received: from localhost.localdomain ([192.161.79.229])
 by smtp.gmail.com with ESMTPSA id t4sm2170366qto.62.2021.02.10.14.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:35:19 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.11
Date: Wed, 10 Feb 2021 17:35:08 -0500
Message-Id: <20210210223508.4428-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

Just a single revert to fix a blank screen.

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-02-10

for you to fetch changes up to cf050f96e0970a557601953ed7269d07a7885078:

  Revert "drm/amd/display: Update NV1x SR latency values" (2021-02-09 23:23:18 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.11-2021-02-10:

amdgpu:
- Blank screen fix

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/display: Update NV1x SR latency values"

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
