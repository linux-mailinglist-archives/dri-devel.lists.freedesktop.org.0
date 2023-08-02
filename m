Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F2376C9F1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F01610E535;
	Wed,  2 Aug 2023 09:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A72810E52F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so6057988e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJMrjcr9jkge2euMTkVKQqYLJujx++pfTrs/hAuV4KA=;
 b=Si+SdWOVoxjzyjWsTNLd2wkWg+SneGUGPpFJXDry5EGZ71CvSAFsjShd7gi0pSd0w4
 Hssw+Ya5xNwlUH2pk796rdGVQhOLyP8+BHokymAjY8Wi8lKELrvQxbMHl6yvu2yisD5m
 Xm3SiG3ErDtf8Vl4b82H/KHYLP/xGx679fIHDGvarF3oUX3cb/LyKY/SvsGtuIs48KhG
 gKF5QC8hMLNHhrpd3+a7Q2AfyObKLo4S5XpnSSfB6IyawbJ1u/nYnHTp9bPkAt2R0b8H
 cTqZBdfOeaoSI/uDF0E7VToX5yq90XAoT2LqH6+MBHzC+lJ/NnR4MgXIBJTg4K8nC1mA
 gBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJMrjcr9jkge2euMTkVKQqYLJujx++pfTrs/hAuV4KA=;
 b=FOSsirZZTA56dCWUqVl5FJrB7l7tvCj6bO/unQ5PW42OFQLjtQaRfZE1ZXbjk16nuj
 rHEPC5/UpoZ0DU97FJGUKeosIZ8T8TeGTcsKeisZqNNTAJ976U6CeTbJtU3C0R0qzNM3
 WN3ty1U7i6PiJaLC2/ph+KukqyLD7oNFB1mRKGVlmuDgK2FlPEHEbKkEhEcSvsAYm0uG
 hnVhQhKI1DfbJW9Mb8j98fQm4O5tuLMVXpdfSYD/w2zozV0E6ePDA8qv3amMKf+2Ib1o
 pUjF2cYanDcES3YDC1veiDShmphnqpgE2K29QS5wS7aFd4ffroNjLSV0AYq0PnXpoQYk
 MJ4Q==
X-Gm-Message-State: ABy/qLYe4xU+FPx5LkoaEb9uq67VERGNUZt8V/hadadewVF22/Iy/7ev
 lk0i665Uf+Sk1uxyr13A46S7Yw==
X-Google-Smtp-Source: APBJJlEiprUvU7VvPCQFdVaf45lrlrgDbSbxANKym6XICGanWfSRc+sGRON3aEiXWBa00AOeRJTuQA==
X-Received: by 2002:a05:6512:6d1:b0:4fe:19ef:8791 with SMTP id
 u17-20020a05651206d100b004fe19ef8791mr5303425lff.38.1690970149856; 
 Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 00/10] drm/msm/dpu: cleanup dpu_core_perf module
Date: Wed,  2 Aug 2023 12:55:45 +0300
Message-Id: <169096995979.4183272.6636182589721297040.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 30 Jul 2023 04:00:52 +0300, Dmitry Baryshkov wrote:
> Apply several cleanups to the DPU's core_perf module.
> 
> Changes since v4:
> - Dropped the 'extract bandwidth aggregation function' (Abhinav)
> - Fixed commit message for the patch 9 (Abhinav)
> 
> Changes since v3:
> - Dropped avg_bw type change (Abhinav)
> - Removed core_perf from the commit cubject (Abhinav)
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f15de4f6245b
[02/10] drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there are no ICC paths
        https://gitlab.freedesktop.org/lumag/msm/-/commit/808c92df654a
[03/10] drm/msm/dpu: drop separate dpu_core_perf_tune overrides
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6a4bc73915af
[04/10] drm/msm/dpu: rework indentation in dpu_core_perf
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6239e65c801
[05/10] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
        https://gitlab.freedesktop.org/lumag/msm/-/commit/716f0d4cac0f
[06/10] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
        https://gitlab.freedesktop.org/lumag/msm/-/commit/779f336ed4b8
[07/10] drm/msm/dpu: remove unused fields from struct dpu_core_perf
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7a735940293d
[08/10] drm/msm/dpu: remove extra clk_round_rate() call
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d64d83806aa4
[09/10] drm/msm/dpu: move max clock decision to dpu_kms.
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4161ec7e93d1
[10/10] drm/msm/dpu: drop dpu_core_perf_destroy()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d5199a173d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
