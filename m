Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447857316B0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2A910E4CD;
	Thu, 15 Jun 2023 11:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCFA10E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:39 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b344476595so26463381fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828697; x=1689420697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
 b=C1G5NDiXspEzy5EQjsjez+uLoXWTbf1yhJfnfn5dw2nFfd7vBXpmy74ehzhi2gVWO0
 98BA54WhJ6FJm5DDQ0XhB8jkpmXBh0ABSt+sBLjEnLVb88t7lkoqn0ZycBe3DOXs8TBc
 Ezyff4QbewIrBte/SFLoA9fKc7m2p/X8k9i/KE/caEz9NN4kDvxahKkiybJN+8ZangzP
 VkFJNg0xUKAhA2ZEva6jLrkemxDXhe0a4IPVV0jIXYbZKFvSGnJk+O0fwTG3NuOC5m0p
 XjZFWWLSO8+d6tmRyNIzvOhN04zCvgRxHd8UDT3B8XakDsB3WR1xO57QE5JmQLIxnZa7
 RL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828697; x=1689420697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
 b=ASgzlQblT+tNYRgfMo4HpphU9ymSr8DtUMoJdjDbBTkhhwwTmK1KbEGPVyQVHb4J24
 +/uGu8n/W4p0AK/s8ly6Qzl7413kZqJR01R1kgJ6WoKkfdo42KXRxSHm8sdhleYBxaDL
 DA80GrdCdLL/hHtyT/ei51eC+OfXFuTeikTPC+Xd1eZGWZhpQmY1n5i1G2zONNXxf+5P
 OuE5CLeJPsOQvSASWb8JgnTyK/8ov/Nsk3eW87p7mW+7h4LcmfLet6VYmS0p3KnB3dNV
 r2Inxvr7JSarUNl1BzsVpT7Ts2t3oVusg95/M/ReuQspLapVrzeVl3uf3QRkHRxv6ylr
 TNuA==
X-Gm-Message-State: AC+VfDztCYuZemFuDSJGGJA4LfwY4jqzVgOtom1ZOKH8cYcK5QZ8H7KV
 U5ixj931nBvgvDXsEbSRc50R+Q==
X-Google-Smtp-Source: ACHHUZ4Y0HPzWzh+M9sKVmQVFCAQ3f0hHOdfTS1SY7SsZK1b1Ui9Pb4I1jOd1s4VTLjtxaN/by9/4Q==
X-Received: by 2002:a2e:9e86:0:b0:2b3:2f9b:7c9d with SMTP id
 f6-20020a2e9e86000000b002b32f9b7c9dmr6606616ljk.28.1686828697221; 
 Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v6 0/6] Add DSC v1.2 Support for DSI
Date: Thu, 15 Jun 2023 14:31:26 +0300
Message-Id: <168682860387.384026.9115594076193676039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 09 Jun 2023 15:57:12 -0700, Jessica Zhang wrote:
> This is a series of changes for DSI to enable command mode support
> for DSC v1.2.
> 
> This includes:
> 
> 1) Rounding up `hdisplay / 3` in dsc_timing_setup()
> 2) Adjusting pclk_rate to account for compression
> 3) Fixing incorrect uses of slice_count in DSI DSC calculations
> 4) Setting the DATA_COMPRESS bit when DSC is enabled
> 
> [...]

Applied, thanks!

[1/6] msm/drm/dsi: Round up DSC hdisplay calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21bf617110ba
[2/6] drm/msm/dsi: Reduce pclk rate for compression
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7c9e4a554d4a
[3/6] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22598cfc94bb
[4/6] drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1642b5803473
[5/6] drm/msm/dsi: Remove incorrect references to slice_count
      https://gitlab.freedesktop.org/lumag/msm/-/commit/155fa3a91d64

Note, patch 6 is skipped for now

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
