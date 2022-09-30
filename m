Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C4D5F15FA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 00:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A585010EDDA;
	Fri, 30 Sep 2022 22:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641F110EDD7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 22:19:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dv25so11722129ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ZavGJHJYFMAsec19Cc9RdLsMfmbDootkZBj5HKsaVSs=;
 b=aUj9EM6tATBQJx39c7lW+QqBrCyami+HdAC632LZHReQUVBp7ht1jjb6PDdhLVRLig
 Z2qtL2dmgTMjkDgQ8TovpBsgGw7FHV1PDZcLSOS5cMZDVQXYlTDndVK0jju91wLQkTJw
 OAyN2ovxTD95OXqR+SJXnaU5vEk3ZAxTbLeUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ZavGJHJYFMAsec19Cc9RdLsMfmbDootkZBj5HKsaVSs=;
 b=m25kOOtLWKGo4y86m0FJZKUnRjQ19jO8RjfSvFZ7NcbpASR+GAvWxG3+Amj52mDmtt
 Aed4RLKxsLot1+oev1Tpp2eTc3CVZIGU5raTmJXIx2f9LMiIndgBeLUE4pF+o95mWst4
 5gQsRk1KTU/Hd/Fu9rPhFcvQSrF7ljRAI9YQuSWLrzPWtocdCMfhyjwKd0YOdAzOE3Aj
 86sTJqurJPZtF6JZ4CT0MhJUWGGH95RaM3IQtbKx84U+PNelHY1SNH726njRDCtoMgGO
 DY2Y8KCCi30ndwq9cSClGfuZAgbNrljH2OiSmNsUo21YjmhljLTpQH0NfJRR6QUpBOfO
 meXw==
X-Gm-Message-State: ACrzQf29vx7NrKUCArvUkVR2G3BoEouNNhU77+aZpMSz95CodhG1PH9t
 TvesoEmIjrvK3ExTujTnF0KycA==
X-Google-Smtp-Source: AMsMyM7KOYwA7uXdv010xMUtk7T113BsV2k3hny0lM/eV9hTizxLOQI5ojARF+I4NKcTDIUv+YoaGA==
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr7960867eje.292.1664576370916; 
 Fri, 30 Sep 2022 15:19:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 rk14-20020a170907214e00b0078238c1c182sm1701561ejb.222.2022.09.30.15.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:19:30 -0700 (PDT)
Date: Sat, 1 Oct 2022 00:19:28 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes
Message-ID: <YzdrcM2YAK4qyePP@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

As Alex mentioned already, here's some last minute amd fixes that would be
nice to also include in the final release.

drm-fixes-2022-10-01:
amdgpu:

- VCN 4.x and GC 11.x fixes, mostly around fw

Cheers, Daniel

The following changes since commit 6643b3836f3908c4f77883b2fae72451e85cf3ca:

  Merge tag 'drm-intel-fixes-2022-09-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-30 09:28:58 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-01

for you to fetch changes up to 414208e48963fdb136240d7f59c15e627832d288:

  Merge tag 'amd-drm-fixes-6.0-2022-09-30-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-09-30 23:10:55 +0200)

----------------------------------------------------------------
amdgpu:

- VCN 4.x and GC 11.x fixes, mostly around fw

----------------------------------------------------------------
Daniel Vetter (1):
      Merge tag 'amd-drm-fixes-6.0-2022-09-30-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Hawking Zhang (8):
      drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
      drm/amdgpu: add helper to init rlc fw in header v2_0
      drm/amdgpu: add helper to init rlc fw in header v2_1
      drm/amdgpu: add helper to init rlc fw in header v2_2
      drm/amdgpu: add helper to init rlc fw in header v2_3
      drm/amdgpu: add helper to init rlc fw in header v2_4
      drm/amdgpu: add helper to init rlc firmware
      drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode

Sonny Jiang (2):
      drm/amdgpu: Enable VCN DPG for GC11_0_1
      drm/amdgpu: Enable sram on vcn_4_0_2

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c   | 264 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 151 +----------------
 drivers/gpu/drm/amd/amdgpu/soc21.c        |   1 +
 7 files changed, 281 insertions(+), 149 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
