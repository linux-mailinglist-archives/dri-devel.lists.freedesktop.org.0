Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA926686DC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200DB10E93E;
	Thu, 12 Jan 2023 22:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5366310E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:24:36 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id k19so14831715pfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIHU3yvE0AEyf97Few65TN6W0VeSVha7m422Ft94+7A=;
 b=CbA4pTm2SHhAMNA1b6IXOEtNp1xFz0u0mzMKo9bqUTONN3HQbnPTKBKrLsogLpNjSa
 0ZNtxD3nvVpAux+j70KuFPBNjUf8wylSfZANYsIlgMlRAIbmw5JG17Tr947Su/sT89cO
 hWADWSOoopeu4L7R3sXZpD7hVv4uFgRkcQ0m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MIHU3yvE0AEyf97Few65TN6W0VeSVha7m422Ft94+7A=;
 b=Q6T/Dmk6M/YmaJoNzStwRPezYrROaMk8f3AqT860Jfq49Q6as86EwZBuK89bJAYKET
 1emx9hWbJENlJn6Knew8F3eCp1f6ib9PPdUw+TqNiF70eG3YqVtNxdARtPNoczj+RMVf
 Mt/V4to+/rF9nx7x0+QIOCD3uHlGvIgjh1gfTHI24qvet7GR0icSPEKhb3Xt6NAKQ3oy
 gf+O+HnB+KIWoVmxZfVSIWGgwyBa+NnuqKyfVk/XbsMK2p1O8A9j8TltWGTyos0GUebC
 4ZPIneZxyiYw/KlpE5MzFJUXTmudR74EFpNem9T9BoltK1hoz4/m+oU91HsubJ+hMTQV
 4qcw==
X-Gm-Message-State: AFqh2krFJppHBYlf3c6C5PfcFiJJzm3ohckKs1YX6bbs2Chie3cnbAY7
 obibLfi+4dzdrFiJdXxV/kiKnw==
X-Google-Smtp-Source: AMrXdXuKAy66qRsaguoO7dg6xnQ3vgZ5z1AK7rX4p+jat7ZwYy/A+VHwQzvqc14DEcs75u/ulmALZA==
X-Received: by 2002:a05:6a00:3311:b0:582:6732:ee03 with SMTP id
 cq17-20020a056a00331100b005826732ee03mr8164704pfb.9.1673562275935; 
 Thu, 12 Jan 2023 14:24:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 q20-20020aa79834000000b0058134d2df41sm11375879pfl.146.2023.01.12.14.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:24:35 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 12 Jan 2023 14:24:34 -0800
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Coverity: gfx_v9_0_init_cp_compute_microcode(): Control flow issues
Message-ID: <202301121424.5FA0483AB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Tao Zhou <tao.zhou1@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-next@vger.kernel.org, yipechai <YiPeng.Chai@amd.com>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20230111 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Jan 9 17:02:18 2023 -0500
    ec787deb2ddf ("drm/amd: Use `amdgpu_ucode_*` helpers for GFX9")

Coverity reported the following:

*** CID 1530548:  Control flow issues  (DEADCODE)
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:1374 in gfx_v9_0_init_cp_compute_microcode()
1368     		adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
1369     	}
1370
1371     	gfx_v9_0_check_if_need_gfxoff(adev);
1372     	gfx_v9_0_check_fw_write_wait(adev);
1373     	if (err) {
vvv     CID 1530548:  Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "amdgpu_ucode_release(&adev-...".
1374     		amdgpu_ucode_release(&adev->gfx.mec_fw);
1375     		amdgpu_ucode_release(&adev->gfx.mec2_fw);
1376     	}
1377     	return err;
1378     }
1379

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1530548 ("Control flow issues")
Fixes: ec787deb2ddf ("drm/amd: Use `amdgpu_ucode_*` helpers for GFX9")

Thanks for your attention!

-- 
Coverity-bot
