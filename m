Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACCA67D501
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613D410E987;
	Thu, 26 Jan 2023 19:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3C10E98D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h16so2731677wrz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vGWHx37zinCDKu9NC9wgR73rrVcUbMz6uogy6JTfQQ=;
 b=g3cA3KzWngJBTIKkh8Tchnm74ND1daBcbl93/SnsDa4+ZO9RBTjUIL8auE/xvQhSfV
 1ZtGisCGGvsWchTLKEc5QWYq7a4ge3bWvhoP89nqSiYuXh8saouCG5hZXMyMfJ5QGzvA
 0sArQcwKMzUefdCFBqnxv4xUXB/hcD75TQsPkm3r+TnGzbDQFAsRF+BZzUtKKZZsRTKN
 q7lDMoEDBLyB3q5U9X+cIarzHE2iJ1YiWi/4mgY3Ubc0hLe0AYbXYacMZ027VBi9aKV3
 iRxstRlH/2Hw06DrFGax8WD6GOieakSAk+yzHlzq14FxuoP34bxBskU+MenAh/6ZvEjk
 GREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vGWHx37zinCDKu9NC9wgR73rrVcUbMz6uogy6JTfQQ=;
 b=stg6yyAZplcCmlGUgTBSjmyCm40aC+Dv3Rui3K2oJjvcVAV0TvEbsV7J34n8cbodvQ
 nwgGKMQ9WBp7DSdgpnMfrNCheSFf14GgEhm1MiDNtSTFUGVFMNBKIT/hcVuwLkHRVR1A
 UOlRTRIM9m2DtZPf/ZSDOO750lTyPKhg4dFIKuwSPZd3hhS20xHCD3Lo0Edg8OMbDv+K
 pZdqpHJ/OM7QynXjFOKUd6FO+T3J+jjtaRUMYiv5Fk51+U78vwigjflGBgcxXi+CYj7V
 5Hg03vKWNvMmgUiJGY8I1ToYZKxWe7aLq0TK8/obRX+RBtWL6p6teI0N9NBf6xUvUsyO
 bjdg==
X-Gm-Message-State: AFqh2kpvVUv8BMAycJ2/HXpjJj4CI4+jVZ6tROQjuu3eyZTgg8zk3SkV
 Qjhq+Il39I6znnA4pDk1MNsZDGTNHbtc6dfz
X-Google-Smtp-Source: AMrXdXsub2bhIciA9sIaWr1SDq7Xp+VsKNNpw01yUOHvFW+tAfdJi89lnPxipV/wux8vqehGY34kjw==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id
 sd42-20020a1709076e2a00b00871e9a0eba7mr114189013ejc.57.1674759683172; 
 Thu, 26 Jan 2023 11:01:23 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Add DSC hardware blocks to register
 snapshot
Date: Thu, 26 Jan 2023 21:01:05 +0200
Message-Id: <167475959089.3954305.3603655147941540549.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125101412.216924-1-marijn.suijten@somainline.org>
References: <20230125101412.216924-1-marijn.suijten@somainline.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Liu Shixin <liushixin2@huawei.com>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 25 Jan 2023 11:14:11 +0100, Marijn Suijten wrote:
> Add missing DSC hardware block register ranges to the snapshot utility
> to include them in dmesg (on MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) and the
> kms debugfs file.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add DSC hardware blocks to register snapshot
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a7efe60e36b9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
