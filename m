Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BB6686E2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116510E93F;
	Thu, 12 Jan 2023 22:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208510E941
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:25:22 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c6so21635733pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bj8YNZYj773EODRUgqHFXApSaiD9KuR4jPUiwE8KcAo=;
 b=oL0l6AyEgEXf+sREiti4ml1oEbzpS6BUwIZVV1G63ij1HTMvCtqAu0LaknGOkfMsGH
 p/UviPcDu2CY4MdRx/VKTKArEYyiHa0vD6NvNJSk92L/L25OeCB3PrdqYpgwro0SHwhv
 +AJvCee9Q7DU6/iL9PyTpgzmxCgdJmDiuD5uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bj8YNZYj773EODRUgqHFXApSaiD9KuR4jPUiwE8KcAo=;
 b=wpZSTPONoAXg+AAZ7YbBG89gTvZBLPBNnesO145MRlfHRDaNAl+s2yC48YHn51GBga
 +JglsXC4HLWbet11DbCWPwssdN16WuqKaSkxp9ub9H+akc9IJzGuXwcIH7aLCECzcIk0
 pOwMUeer+GoQRYiofoGrhzbFme+7k9UM8CaZpwUc8BXRdk8pvVSQ+GFxlE15jrvfv8D0
 YTqNSBQl0Kl4kkikuMTd4xajQ6se2cxu8CIYWpoMoTbijhaQ3NZBBQQ1fmUnrxhsM16p
 Hy+DklqajIZ01MU9w+Bo/LOY6oyfPZLGCCQoygk29m5xo8SWRlfUK5wBuip3h9VCd4i2
 Vn8Q==
X-Gm-Message-State: AFqh2koB/9whimiF3Ml2qUmRlFMFwUG2ZOBa3f+qhr5JNmCnnin0wndd
 Xs6xwuteZC/Fs9/AQIYNO6iBdQ==
X-Google-Smtp-Source: AMrXdXtfGsX9cI/jSo6TyoHbQX+mIPNPV0+cKVX+LPemtsSZtxnLciLhyi8qD5itmK1Hq/uY8ur9Ug==
X-Received: by 2002:a17:902:978f:b0:189:6f76:9b61 with SMTP id
 q15-20020a170902978f00b001896f769b61mr15951500plp.39.1673562322119; 
 Thu, 12 Jan 2023 14:25:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b00189ac5a2340sm12710681plh.124.2023.01.12.14.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:25:21 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 12 Jan 2023 14:25:21 -0800
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Coverity: dm_dmub_sw_init(): Incorrect expression
Message-ID: <202301121425.FB249B61B4@keescook>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Leo Li <sunpeng.li@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 linux-next@vger.kernel.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20230111 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Jan 10 14:32:57 2023 -0500
    a7ab345149b8 ("drm/amd/display: Load DMUB microcode during early_init")

Coverity reported the following:

*** CID 1530544:  Incorrect expression  (IDENTICAL_BRANCHES)
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1951 in dm_dmub_sw_init()
1945
1946     	switch (adev->ip_versions[DCE_HWIP][0]) {
1947     	case IP_VERSION(2, 1, 0):
1948     		dmub_asic = DMUB_ASIC_DCN21;
1949     		break;
1950     	case IP_VERSION(3, 0, 0):
vvv     CID 1530544:  Incorrect expression  (IDENTICAL_BRANCHES)
vvv     The same code is executed regardless of whether "adev->ip_versions[GC_HWIP][0] == 656128U" is true, because the 'then' and 'else' branches are identical. Should one of the branches be modified, or the entire 'if' statement replaced?
1951     		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
1952     			dmub_asic = DMUB_ASIC_DCN30;
1953     		else
1954     			dmub_asic = DMUB_ASIC_DCN30;
1955     		break;
1956     	case IP_VERSION(3, 0, 1):

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1530544 ("Incorrect expression")
Fixes: a7ab345149b8 ("drm/amd/display: Load DMUB microcode during early_init")

Thanks for your attention!

-- 
Coverity-bot
