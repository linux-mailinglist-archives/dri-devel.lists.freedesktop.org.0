Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA962FAC9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9202D10E77B;
	Fri, 18 Nov 2022 16:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042110E77B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:50:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so5138240pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vDeF35wdLYG1P15QPsioTjibeocs7bxGmPk/YQhsj6s=;
 b=nEwUH22V3Px2AJ0nfhnVjJM1rBPM9FKR685a6v3VuuhfgW52O+PKMaplMTwyxfiFA8
 nKs9/aTXQQ4zPvNHj+eAYhJdYMektFDaVSFAFfKBnKtL8Coa1PcYz3r4Giub0PhK9aJ+
 xNxRIaTXBnko1GceMEjnoroVYL6UshpQX/9c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDeF35wdLYG1P15QPsioTjibeocs7bxGmPk/YQhsj6s=;
 b=zY+Vv/Hxu+V0RujE7cULagCX7re+CZpDxkadD5I47hBqsxeK4wI6yObNr3Afe39oGB
 yx5yOZnYAJE3MRi3ywEjFGTBEmMwyEMsst6Lmu8tdib32+uGn8n6CQ1B9VtmTEhX7C+r
 DpC7pTH3REaotWHldS6OD86BVYUICrvBhYd1g+SmGpsv5Pn/SIlfg8vPdxazr6ORUNzm
 pMPUSWwA0exQT4BYhXnVq1FHLtLaRig8tsp7ckcZSiMQl4jt3UAJcr4/SALQU4ZP9lp3
 tCMDjiaQXDavu7Gda/rd1KXB2bDvKoSPN6vF2weoyYLC4bmilestcqTimXEXOPGPcaGg
 zmGQ==
X-Gm-Message-State: ANoB5plls5EfWhuAkqqAMOxVlerUu88guMLiyJUiO5wDkX9VTBw9kgc/
 dzArEU4zllnUDFfD4Vtg1/m3BQ==
X-Google-Smtp-Source: AA0mqf5nc7sx9BVUy4AHRDyHuAxCzDSQw3UQYN4kbHosvvppGk9Ks17mBJFq8EiYAnsMiKkMdrSZ7A==
X-Received: by 2002:a17:90a:3e47:b0:213:1a9f:8d72 with SMTP id
 t7-20020a17090a3e4700b002131a9f8d72mr14862628pjm.155.1668790236086; 
 Fri, 18 Nov 2022 08:50:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b00176dd41320dsm3992706plx.119.2022.11.18.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 08:50:35 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Fri, 18 Nov 2022 08:50:35 -0800
To: Lyude Paul <lyude@redhat.com>
Subject: Coverity: pre_compute_mst_dsc_configs_for_state(): Uninitialized
 variables
Message-ID: <202211180850.560AD5A74@keescook>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, Roman Li <roman.li@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 #v5.6+@kernel, Daniel Wheeler <daniel.wheeler@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-next@vger.kernel.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221118 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Nov 17 00:18:25 2022 -0500
    7cce4cd628be ("drm/amdgpu/mst: Stop ignoring error codes and deadlocking")

Coverity reported the following:

*** CID 1527373:  Uninitialized variables  (UNINIT)
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c:1227 in pre_compute_mst_dsc_configs_for_state()
1221     		for (j = 0; j < dc_state->stream_count; j++) {
1222     			if (dc_state->streams[j]->link == stream->link)
1223     				computed_streams[j] = true;
1224     		}
1225     	}
1226
vvv     CID 1527373:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "ret".
1227     	return ret;
1228     }
1229
1230     static int find_crtc_index_in_state_by_stream(struct drm_atomic_state *state,
1231     					      struct dc_stream_state *stream)
1232     {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527373 ("Uninitialized variables")
Fixes: 7cce4cd628be ("drm/amdgpu/mst: Stop ignoring error codes and deadlocking")

If dc_state->stream_count is 0, "ret" is undefined. Perhaps initialize
it as -EINVAL?

Thanks for your attention!

-- 
Coverity-bot
