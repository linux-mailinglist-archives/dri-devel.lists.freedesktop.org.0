Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F072FB5C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65F10E443;
	Wed, 14 Jun 2023 10:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F18C10E43F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 10:41:15 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F35693F5AD;
 Wed, 14 Jun 2023 12:41:13 +0200 (CEST)
Date: Wed, 14 Jun 2023 12:41:12 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <lggetg6sqj5imqcntisfor3tsa32iaaiz7q5imocjbxgcmttt7@j2bzshxrzls2>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <fihs3di7da5rnvx63n4ums65rer62nps2ber77rojrtwacrgih@3r3aeedfvdr2>
 <kb25ll3emyh6jymyewzpqjtzuw4jekfysruar5pvgxbp37glf2@wf2pqlnhh64m>
 <lsfofftdomumlm4w7nilkez26weckb3wd2rndrpqikwkxtfar4@ryjvbumfetlu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lsfofftdomumlm4w7nilkez26weckb3wd2rndrpqikwkxtfar4@ryjvbumfetlu>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-14 12:39:13, Marijn Suijten wrote:
<snip>
> > > > -	/* add register dump support */
> > > > -	dpu_debugfs_create_regset32("src_blk", 0400,
> > > > -			debugfs_root,
> > > > -			sblk->src_blk.base + cfg->base,
> > > > -			sblk->src_blk.len,
> > 
> > Note that this fails to apply on top of
> > https://lore.kernel.org/linux-arm-msm/20230429012353.2569481-2-dmitry.baryshkov@linaro.org/
> 
> Also noticing just now that this whole patch makes sblk unused:

... thanks to rebasing on top of [1], which is now applied.

[1]: https://lore.kernel.org/all/20230518222238.3815293-6-dmitry.baryshkov@linaro.org/

- Marijn

> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c: In function '_dpu_hw_sspp_init_debugfs':
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:620:41: warning: unused variable 'sblk' [-Wunused-variable]
>   620 |         const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>       |                                         ^~~~
> 
> - Marijn
