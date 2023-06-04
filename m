Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36B72144F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964A710E1D6;
	Sun,  4 Jun 2023 03:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF94410E18E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:49 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1a6a8e851so38240321fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcGhYz/GqIb+yFcR8B4hKzr5pr9rXSrjVBD4SlqsnrE=;
 b=Zv3/BBsGcwLukJLZO3LSHweFQZYg9cTsPw8LRuk+ZqfobsgDqWyaucYc8/f8EbwSOL
 VSrX4AiADBJlZMaokz4kMujfcJ4tF5yleTCJI92hcwvQlm9uWA8rxEZ3Vth1AZc69QtP
 nz94QMnnpnEo35e8Lz3C9H/OyKamd6nm1BmRdtN25tjbNr4oQ8x4vK49d74lnDAEB63e
 Pw6z5UTiiUnml0TePZZ2juCuEA356+MtriTXFz0XqCMsFap4rKrAdzzSPKIgTGTQm3xq
 vU1UAkhju54i7xmq/gbI56MiGbb6s6/olIRqO0GvlPYyjnz3SF+OJuMRtS4j95jNjTHT
 fvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcGhYz/GqIb+yFcR8B4hKzr5pr9rXSrjVBD4SlqsnrE=;
 b=erH57rOQ7oLeuRaTuYcv5JUr+JKlTE3LsFL6Ed+J6DjGnahxxbmIjcliLZapoGyxnb
 xVh59v9ygXVDR7GLR47goaMMKY9CgRlntYNf9JOv9fkm012rhePwDN726xlBlMi+HLDI
 Nawb31Yf5LbGNnNP9UvlIgtMxUF9UYRDSClsd0K3qOLf33S0w989YIf9N9PxqAg/OTJY
 ULcWavLzM/HJYtgPhH+zzv8Ma2nCKIPPjUwXdV0eR88FxAkvL6Y6LpP3zNlpfmnppsCP
 xyzDVp5g9am1JucO2I7sRKalUCN61x2BYZu+5EcLplQx8oUSwhIZlAgkyrNrdJ2yfdw0
 TfVA==
X-Gm-Message-State: AC+VfDyZ8g/rwsoTtlx8vbzzB2oVuFo8lGJyFHuszDFHmSbRageWp00N
 9JiUGOABQGcwQxtxUyyEc+kCWEW/OV5PO1qkYPI=
X-Google-Smtp-Source: ACHHUZ4SfNbgTZKyGk6FqAa9TvMRjdCgeW4TsPTcouRfvtyz4sTlPpSd7yDPXdHm/dYZ1usaVDJfow==
X-Received: by 2002:a2e:88ca:0:b0:2a7:98b2:923b with SMTP id
 a10-20020a2e88ca000000b002a798b2923bmr2133995ljk.0.1685847707856; 
 Sat, 03 Jun 2023 20:01:47 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v14 00/10] add DSC 1.2 dpu supports
Date: Sun,  4 Jun 2023 06:01:36 +0300
Message-Id: <168584750429.890410.6494391603289067266.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 25 May 2023 10:40:48 -0700, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
        https://gitlab.freedesktop.org/lumag/msm/-/commit/12cef323c903
[03/10] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c20c44403e11
[04/10] drm/msm/dpu: Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit
        https://gitlab.freedesktop.org/lumag/msm/-/commit/108ff1417795
[05/10] drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d45be1ccd330
[07/10] drm/msm/dpu: always clear every individual pending flush mask
        https://gitlab.freedesktop.org/lumag/msm/-/commit/625cbb077007
[08/10] drm/msm/dpu: separate DSC flush update out of interface
        https://gitlab.freedesktop.org/lumag/msm/-/commit/761c629d1860
[10/10] drm/msm/dpu: Tear down DSC datapath on encoder cleanup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/997ed53dd693

(Omitted patches 02/10, 06/10, 09/10)

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
