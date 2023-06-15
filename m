Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C077316AB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3755010E4DE;
	Thu, 15 Jun 2023 11:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0CC10E4D1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b1acd41ad2so25735661fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828696; x=1689420696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
 b=codcU07VH/1l08yBIe8moRDqekQ+qa9MA24meplrjB/GfjiERlvYVyBtjKgqtGTcSm
 VINdEP3TNkQnD9GbpHjYkEiITOCr/EbeGdP2Mm+wassaHN5acrruRQFAVkMF4I0qmwBD
 d2PFSC7IRgnox6FKWApbOQbFYetb9QuMYt1jHgXN4OOVtppIAsyyefh0YgWDekvLngVY
 UUX0o7ZHBzhMqIod1PN5WmAYwr0XlzjJss1yLK71gHsSORVvLD3fMB3w8okLT9PL7+pS
 KOHDWis+GoihcNcIdSKhnpM3k8odHTEvpJ9GzwOkCNH7GCMIMQAYGBCEWQw/PaCFpkOh
 F6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828696; x=1689420696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
 b=cTb6vdbVvdx+Saf72TOsLJf9YMVawFqUGc6jMAdv9CebhMzXGXJ2Ve/2cuFokxC2y8
 o/DNEPHXzycbZIzEH32XpBi8hVNOTpui3MBW/awwxjzZSVM+kjIPwGygZFhEgdMYFNHm
 ghbTIpyGltpm7TehzIJZRasNgEhg4n+1fj6JAovy3Fq8OJH2WSrit0YVDqdwj2KeqrIz
 JlhklZpcOnD0S1FxH7F9KTBn5hmq/jGC0jYStPcavlfEDkKgogPBFMNNovJ7whGWG0jC
 Vek8U/GSJ1/gGqgJ4SMePaW3LQ4GLowwN2hudzAsXnmlShdAJTjzvzDWb6Di2cN9RfqW
 dMbw==
X-Gm-Message-State: AC+VfDzTSIr5lV69i147uKZIjWzwIn/FUalRu9YKovzmLRsP4k+5QLTP
 1lil4fEMTkWY11mpGt7lxjaLPQ==
X-Google-Smtp-Source: ACHHUZ7SSADcaAPRP5KYn2CMl2Rq1NcPT9lS6upii8Us8pO9C2lbr1tZ4cZdHrkss8uyf21GnV3qJQ==
X-Received: by 2002:a2e:95d2:0:b0:2b1:daca:676f with SMTP id
 y18-20020a2e95d2000000b002b1daca676fmr8191322ljh.36.1686828695949; 
 Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v14 0/9] Introduce MSM-specific DSC helpers
Date: Thu, 15 Jun 2023 14:31:25 +0300
Message-Id: <168682860388.384026.1953512234094498484.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 24 May 2023 10:45:13 -0700, Jessica Zhang wrote:
> There are some overlap in calculations for MSM-specific DSC variables
> between DP and DSI. In addition, the calculations for initial_scale_value
> and det_thresh_flatness that are defined within the DSC 1.2 specifications,
> but aren't yet included in drm_dsc_helper.c.
> 
> This series moves these calculations to a shared msm_dsc_helper.c file and
> defines drm_dsc_helper methods for initial_scale_value and
> det_thresh_flatness.
> 
> [...]

Applied, thanks!

[1/9] drm/display/dsc: Add flatness and initial scale value calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7df1ed6ddf3d
[2/9] drm/display/dsc: add helper to set semi-const parameters
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e871a70d8ccd
[3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/688583281241
[4/9] drm/msm/dsi: use DRM DSC helpers for DSC setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49fd30a7153b
[5/9] drm/msm: Add MSM-specific DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50f06f83e0e
[6/9] drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44346191a210
[7/9] drm/msm/dpu: Fix slice_last_group_size calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c223059e6f83
[8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed1498f77419
[9/9] drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/149419396a92

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
