Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F571199430
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 12:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9766E7FE;
	Tue, 31 Mar 2020 10:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3213E6E7EF;
 Tue, 31 Mar 2020 10:55:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w26so24529114edu.7;
 Tue, 31 Mar 2020 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=lJ28otLGH/TA0UFRVyaAv3N2y3mbjSrHeAW7r1D9pqQ=;
 b=Ox/XyHODyaHFq5RQDXZmKlVHeUdUPDwHjUDHi8esLUsIw0rB3+3zGmrRd+Qy3P5G3L
 jryZy/jSRFidXNn4mnsqe/vAHuyNCdEpxIsrC0arPlsPOipvVXXsX5RDcCtJP9yoMZwx
 NIHLfam1/tknlph34PC3oWR+QUw5YxQoeTFHV5tJDwwJ2zgcVbiCD8S5FZq86S7cFsy/
 smiQMpxjVoXVxEJoGCcYQ/4w7zSTv8fSVhFQ8M0ae5gulBU8aHNOwbIzlJUKjZYJ0kMy
 zU5jVpZm3AStfZAYAzzJwOwgv4wBNuLbE5cyEpKvkgeWg7HyUeFLzZDz6Qzo+MRN7eo3
 5SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=lJ28otLGH/TA0UFRVyaAv3N2y3mbjSrHeAW7r1D9pqQ=;
 b=dus2QvHUMX8aGeFSsf+PpYRZ+OMZ8TiScVMIKLzvhVehtKgz3Q/kakXo15jiqjS4KS
 2D4l0poxkEV/C5pbiyG76elra21nSG32M1AL2B+1FrEJ0ywXwst3oOoEaVeFRy2GABuc
 5v3MKjakDZCyGRNSb8E1D5Ppj5WUP7GQqDG2+nQcm8KeuzWZ/JmZgC7Ey7XZPInyU2gJ
 kHwzVF1VFiIafewVC60ZhVWlUsvdf51iL6YfIeNsx0NXaZLJYiMka1SldmvPbkJ3wJYN
 CBw3ggPqSPMpjK3bNOtK4YEBUZUEepxFw0m40VCPuMG+/eyOmT6ZNmTA3h04S/qA+aHF
 RAMg==
X-Gm-Message-State: ANhLgQ1tVPFTdFNIxt9vYG+HGzwtJUBpg53R71GHM9gXbSdElPYGjgxH
 PfmnneHsDzqzP3rk3yrB5UU=
X-Google-Smtp-Source: ADFU+vuzYvhLkkf4P6xFXKXPnbxRp15lh/5fGfPH88RWrj0e6JgwXYjh+iwsAu82EDqgRUCBvDi1rw==
X-Received: by 2002:a50:ec08:: with SMTP id g8mr15100184edr.321.1585652108744; 
 Tue, 31 Mar 2020 03:55:08 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id pj22sm2144956ejb.79.2020.03.31.03.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 03:55:08 -0700 (PDT)
Date: Tue, 31 Mar 2020 07:55:00 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Rodrigo.Siqueira@amd.com
Subject: [PATCH 0/4] drm/amd/display: more code cleanup in the dc_link file
Message-ID: <cover.1585651869.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches address many code style issues on dc_link for readability
and cleaning up warnings. Change suggested by checkpatch.pl.
Some issues remain and need some minor code refactoring for proper handling. 

Melissa Wen (4):
  drm/amd/display: cleanup codestyle type BLOCK_COMMENT_STYLE on dc_link
  drm/amd/display: codestyle cleanup on dc_link file until detect_dp
    func
  drm/amd/display: code cleanup on dc_link from is_same_edid to
    get_ddc_line
  drm/amd/display: code cleanup of dc_link file on func
    dc_link_construct

 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 358 +++++++++---------
 1 file changed, 176 insertions(+), 182 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
