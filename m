Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B7731696
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632E610E183;
	Thu, 15 Jun 2023 11:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B7410E183
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b44200367bso11850261fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828688; x=1689420688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e40W025fGlyFZ6vbS7Ked1F1cVNFU/7QwbFD14aLFE0=;
 b=aZ1dgoWOAzw6+ndlGgXRJr5Q2d6b+HaXXL3amtujOQVHYUMr4kZX/ftwKA2h7pS/nS
 YjHq3QBSXgO3uw2TEjznxl9r+vNBiGNuv0P2g7Ll7MBjjH6lzaCQJ9FVj9fQLvTrWg7S
 TnF0kL89hFtuV9JqHaJJcKfhn4lJ64z5W24YFG+4cpVr30qvyXLpUB6frTp4pqqKn/yT
 wPCV+VrppV9bMN9Gt3d3cxICGyHMqRplbxUvwzgWwmWRJkCY//K71MDFxa8nqdZ1oWzg
 FVmL6avzf4qJH3WxTgIpstb96I0YnVU0oelEjIu7Gk/1WLrPx/YHJigQhW8EqW0efvva
 miHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828688; x=1689420688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e40W025fGlyFZ6vbS7Ked1F1cVNFU/7QwbFD14aLFE0=;
 b=U6dt47vF8s2u6qyUzdCEVjaNSIAx/cj7os8YQYnj/clGYhuC4xo9Dc0wOZhXUYYpg5
 I3bYLII7K5SMUrpPrNangzse7Xn0EHvoGH/QbuVfxgwcft0p/dO6rm5LNX+c9BIUzPPz
 6BoIFH6EKsAhwp9CPFRZzryehibPJP+Tw+Igcoz/xOQv91L03pt/wT0hHCX9U1PBTeH7
 ftxFg6kI7DBk28UkPsDXqQuUZRZNan3JsvqSaUkkNCavtBZdKjoJvQHp1RNPdJkpSK9i
 2L/drDnFp+DOLSremTmShNMyPA69rUCIkgGRP5GFnQbc4WRQ81t1GrBc9aWA0dEyooP7
 1//A==
X-Gm-Message-State: AC+VfDxpvqXEFOgmNcpZpaY46pxkfF5zd4xoOhtVUS+JvN+QqdAQ6bKt
 VXIbR90/FBWNFwFPX6OImQMiOg==
X-Google-Smtp-Source: ACHHUZ4+CoEubc9a0pwP+plqW87Gnde1h5kz7Nyk8WNw40KCefSourZBUvGxIorUMAuqTSez5dAtjA==
X-Received: by 2002:a2e:9942:0:b0:2b1:b7bc:c64a with SMTP id
 r2-20020a2e9942000000b002b1b7bcc64amr8672970ljj.41.1686828688425; 
 Thu, 15 Jun 2023 04:31:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs
 are not available
Date: Thu, 15 Jun 2023 14:31:18 +0300
Message-Id: <168682860388.384026.128437075326886928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Yongqin Liu <yongqin.liu@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 12 Jun 2023 21:25:33 +0300, Dmitry Baryshkov wrote:
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: do not enable color-management if DSPPs are not available
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3bcfc7b90465
[2/2] drm/msm/dpu/catalog: define DSPP blocks found on sdm845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c72375172194

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
