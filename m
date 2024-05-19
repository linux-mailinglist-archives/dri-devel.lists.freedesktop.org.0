Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03438C96B6
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877510E108;
	Sun, 19 May 2024 21:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YM2zFwmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296F10E108
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:16:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso693640866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716153382; x=1716758182; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v7DSWcjLrtFO5GaTtTI45y7FSFiCS2MtpG3NKa8KpWg=;
 b=YM2zFwmXTETGlgbgJmqWo1gaRljl51ICdiS6acb+ZKsrNaqfC4umx+mg7EyQDXyOWi
 0g3mzKQDUbmNDp0M6/UKQwr3YbC7LZnpZyV+GW13n0HCIUB0n2Ho8AOtA2vpl51YpewI
 XB2da5YINC9+Xxw2wkCTE79F0Xorr9tfKGht4gdrUWToqtUaLGgD68tRDRfcerPm2qQg
 yKHqlemVXBKv5xtdBd5h4fXj0+iyp35zmKxRWvH8zK88mitmSxN0bINOpDE8PzAFsF3K
 KjYGCGjZh/S8gY+8XIyPP12sFMAxDB5fqTmpRA7SWlhyyagVIhd6ERWqF/OWEjEBP6uw
 qqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716153382; x=1716758182;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v7DSWcjLrtFO5GaTtTI45y7FSFiCS2MtpG3NKa8KpWg=;
 b=PKMSRy+6UTiqEfK248hYUNcbL3CO7Qe0+dA992jtt6Jl+aNXXVjt1a1pzeFsiN40/r
 5rjmuy+GlBM4YjTTSq+/K+fiJCYAlGTxiU09mEPS4VeIuneivm0xpXsechXt9pXxiTTk
 Sy0DKLFnY2c/UPKcsu6vPmOS5EoA22o/jVMuSeN/FS+zmD7spRzu+ykbpuLYx1YAPFT6
 dTDgMWldslILzb5cOTlaneJfjgX6Cpbid3te2pvgV2qz5Qs9AqFHCNkHrLkoCM2IrCm7
 cs1cBCS6hQSI7fjwEMc6Sy5QShZ83/BrFA0hb9kEyBqJvcS4UMoAlYXWVHKq/fofq6kT
 jnRA==
X-Gm-Message-State: AOJu0YxnU0FiZQOBR1bAzv0XUpRUv/5ZAmbniMQe1MJmAeCpiDf3YHM5
 niJWJF3t4abaxocTK2b0bUaLPDcP/YwTKjUCDr/t/DngXECMYrB31YKnEHiEHAI63uU41q6zy9P
 4gm1nD06J3rm2xG8pEg5pu8bh+34+VWzv
X-Google-Smtp-Source: AGHT+IGuI2HtaaXoYABFhKsKa/QdCI2JIMBqKO9jADIxtOZB0QSLq9dUhtdgXyRuAhHB8YW8btddDi4pgiz/tSgGOQs=
X-Received: by 2002:a17:907:1b0b:b0:a59:a3ef:21eb with SMTP id
 a640c23a62f3a-a5a2d675b19mr2315813566b.73.1716153382117; Sun, 19 May 2024
 14:16:22 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 20 May 2024 07:16:10 +1000
Message-ID: <CAPM=9twvbtHFZ9O_-yXGSgnN5p8e2cHPcr1LzNDc_7w+VEAmAQ@mail.gmail.com>
Subject: [git pull] drm urgent (part 2) for 6.10-rc1
To: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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

Here is Arunpravin's second fix for the buddy allocator warnings you
have been seeing, hopefully this is the end of that, and thanks for
your patience.

Regards,
Dave.

drm-next-2024-05-20:
drm urgent (the 2nd) for 6.10-rc1

buddy:
- fix WARN_ONs during force merge
The following changes since commit 431c590c3ab0469dfedad3a832fe73556396ee52:

  drm/tests: Add a unit test for range bias allocation (2024-05-16
12:50:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-20

for you to fetch changes up to 5a5a10d9db77939a22e1d65fc0a4ba6b5d8f4fce:

  drm/buddy: Fix the warn on's during force merge (2024-05-20 06:42:12 +1000)

----------------------------------------------------------------
drm urgent (the 2nd) for 6.10-rc1

buddy:
- fix WARN_ONs during force merge

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/buddy: Fix the warn on's during force merge

 drivers/gpu/drm/drm_buddy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
