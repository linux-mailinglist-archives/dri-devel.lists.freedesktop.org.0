Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916BD8106C1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546510E6AC;
	Wed, 13 Dec 2023 00:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221C410E226
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso8404824e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427859; x=1703032659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kQL2rxxtU6ZqGF3kkJ7FtuWnnVIqW0dOtdXf68LvUo=;
 b=rzphwpKWg9cIWimbP/h4HH2nU+ZHSvxu/IdTWu+Xb/GSF0coMVZEq1qDt2BHS/mNXI
 MGIxnAaitIUFyZLbfQdcto5jtJYn/MIYeRFwTAp2nK46PA6cLexVFamJuCFcNGQfkpV3
 wL0iM8FqWalx1Yn6uxuI58TCKxNI0gv7zqJDAC+ooPXq4/iKGGmsxxZlk1JLfDW2iYdY
 SZ3W41+2YXrARz00CNTQfHHAQv93q464dP/+MGSbdKEOTBKHmn+ItllYlBtjd0rC9Mt+
 HLDAg5VqWTnCfkQgnQiFJPRMxMI0Va6o/OMPeixKqb8E+SibSvIq/6fS/yNeaxBJy9Kg
 ZQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427859; x=1703032659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kQL2rxxtU6ZqGF3kkJ7FtuWnnVIqW0dOtdXf68LvUo=;
 b=n7zQTFYRtIFiG4hWC9f+XCG597n5dm7nlfqKLgWQUMTSyFXZMwwXxD8JEzKU7ujz+X
 QlnvJ1YaePdO9WbEd4jnIvm/Ou0DPkCBDQeM8e6R0r/Hat9mtaSnaSanzSe12Ty0VTSy
 kQ/JZZfUJDd84A+zvqbQZKHIgaarpMGZgT/KY5NHVYvB+AqVu6hMK7/B0MByDcn2pVox
 vl7ETK0ihz1J6dVmgZxKXdW+GN+KrDGvma5e/d4VtBCeVgpk5EdZSCKAo8WmJkw8+vYE
 ZN0QK5W/IUB5eCyppeOQjPwttM3pGuQjE0IQ8RVD3j05wVAMR3dDDBClASPYJp7O8UmY
 Gm1Q==
X-Gm-Message-State: AOJu0YygigDZpWCmioE4zXkFfta2gperltvPz7ffd9JViOsMxLjLe2jF
 Qy8sJ/DDbQiWV0TrN+cO1Cj8Wg==
X-Google-Smtp-Source: AGHT+IGXPoA41I0BeZ+J6HEbmKKD0z5ZIW1yCJgAG2OvV1WTkG8SWE/38T/y7FpHusfK3EzYJTbQWQ==
X-Received: by 2002:ac2:5629:0:b0:50b:e8d5:b0c5 with SMTP id
 b9-20020ac25629000000b0050be8d5b0c5mr3123443lff.56.1702427859254; 
 Tue, 12 Dec 2023 16:37:39 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 00/15] Add CDM support for MSM writeback
Date: Wed, 13 Dec 2023 02:37:32 +0200
Message-Id: <170242755503.12964.7542283136658448015.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 12 Dec 2023 12:52:38 -0800, Abhinav Kumar wrote:
> Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
> which among other things has a CSC block that can convert RGB input
> from the DPU to YUV data.
> 
> This block can be used with either HDMI, DP or writeback interface.
> 
> In this series, lets first add the support for CDM block to be used
> with writeback and then follow-up with support for other interfaces such
> as DP.
> 
> [...]

Applied, thanks!

[01/15] drm/msm/dpu: add formats check for writeback encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/100a72bdb03f
[02/15] drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its functionality
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e1e59787d7c8
[03/15] drm/msm/dpu: fix writeback programming for YUV cases
        https://gitlab.freedesktop.org/lumag/msm/-/commit/545979247e5d
[04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
        https://gitlab.freedesktop.org/lumag/msm/-/commit/636d1d4dfb24
[05/15] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f8bc2bc3a673
[06/15] drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9b61ea803a9a
[07/15] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
        https://gitlab.freedesktop.org/lumag/msm/-/commit/faa729ee2e48
[08/15] drm/msm/dpu: add cdm blocks to RM
        https://gitlab.freedesktop.org/lumag/msm/-/commit/059bffe7a88d
[09/15] drm/msm/dpu: add support to allocate CDM from RM
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a324c046bb7d
[10/15] drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d7a329684b77
[11/15] drm/msm/dpu: add an API to setup the CDM block for writeback
        https://gitlab.freedesktop.org/lumag/msm/-/commit/055376f936e8
[12/15] drm/msm/dpu: plug-in the cdm related bits to writeback setup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1364a52a9a77
[13/15] drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8142ee18e902
[14/15] drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a074ca909811
[15/15] drm/msm/dpu: add cdm blocks to dpu snapshot
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c86495429c4a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
