Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C467D504
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7410E994;
	Thu, 26 Jan 2023 19:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA8A10E982
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id tz11so7853700ejc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
 b=Pyqcgbo++qOcEMsc2AqRFKZRy8mbM4wk+UJh84lwLvV0BOXx3hmDDJQbI7heDfJWlN
 ZDgx3cSv0s22d/aAmjoYGF0ZNkWWAIljso1fpU2kAHj3bfEWfA7hH67kyEag3j7KDltr
 LAGW/0FTrS4trMXGfRUk2o+vTZpgw8LiPS3yI4z7DKLnC+yKptCczDRSjh3+oGzlG0Pe
 lvjWeWKpkx+GB+xMbGTswnKRTM1wujz6Y08lJqb2rQQ/Ipwo/3sD3CQ7evLtMJBcvbB/
 tc3DBtY35vosiHT/FoZ+U0f1Zm/nB/7shnmBycwEYuFnlsdpqaW31BIx0M4k3gKML0Z9
 7Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
 b=xP+tYOfuUgLwi43e69td6BCDQ8Bd1X9KtPTO/35gg7VMFOkgYLhzP2ZqxFb/SgfgNw
 mVqoWfTxAp8AK6gL8Np29ZR7AqXP3AjaRPuVaugiy/ftTZoDEzjwPkRaq3a0SrnM8Wwo
 5J0qaNapLeX6JRlv3NZjFkFMorLCPuBIjNXQIeQ/FBY7aC7QUgp9hTctAXqRTgiFSGRj
 qk3MESt82HTUeVSxHgiQ2XQaR2PvK0EDKq6ha+wexqyAqE2qsUjExUkVHJUphuqayEnc
 B2ZZqgAfSPOAsmzHuLjsMlT/bI0ciS4VmzUHbHWHodo1ipYJb25pgr/3e01Pn/53rBTM
 SFlA==
X-Gm-Message-State: AFqh2koQBegarexx33lfJ9BcfYJWP7UB3IM9Ha7uz6YeshbVGhMZKikp
 TqL25+9mKE/6MiHBfUvCQCBWzg==
X-Google-Smtp-Source: AMrXdXs45m9oAj8817Rp0dU4ASHvwKG2QDpOUBnK9orIJUBMDotXFa/sVcaJfjsWE5S/LLwMAqtDiw==
X-Received: by 2002:a17:906:ecb9:b0:874:9ac1:40e with SMTP id
 qh25-20020a170906ecb900b008749ac1040emr36694894ejb.19.1674759674894; 
 Thu, 26 Jan 2023 11:01:14 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: sc7180: add missing WB2 clock control
Date: Thu, 26 Jan 2023 21:00:58 +0200
Message-Id: <167475959092.3954305.17650572108076539649.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
References: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
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


On Mon, 16 Jan 2023 12:30:55 +0200, Dmitry Baryshkov wrote:
> Add missing DPU_CLK_CTRL_WB2 to sc7180_mdp clocks array.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: sc7180: add missing WB2 clock control
      https://gitlab.freedesktop.org/lumag/msm/-/commit/255f056181ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
