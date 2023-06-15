Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B27316A2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B611310E4D1;
	Thu, 15 Jun 2023 11:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03C510E183
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b1ac373c9eso25530341fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828689; x=1689420689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
 b=NC8aQtqVZ0za+j3+jkuyqg7gpl2clA4y9LK7dbY9kjM+DyapLMNII2U32RFEHfDJ/X
 kko7WS/r5bTt0pxMKt9WLMGrdPCalB50BLQqNxmcqzofAF9idKkzwTKhsdrrSOtVqoMO
 wJpcYXOp/Ix4mqZaX2OXQmFuKj++2wCHcMBxHNP3f9eHMhDcb4Ie/ZlzukLUgT8lNZAe
 LXPGGpemSWQp2GaiN3Gxk0GIk6oXWgfMt3lNSGXDJyiD2E+YHWlNFc4QjGE6Q0YMs5YE
 TXHjDGDBDZT/o+0pjo85pgikbNPsFeCEOvly1cqIgVqbgDQ7p2umYTCekkXbvsD+j7Hn
 XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828689; x=1689420689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
 b=BWYwRVygGWgpTJcw93mic9LPNWNINkp6AWkyggzuW7giVzg+nlLdFtXlOeMJd8QW8H
 vgGS2AFfyQAq2GEnvLdFhWP/hPoPGsVYwVOoZuE5Z+87mPFz/FQ4HfeqGykRkWqNL0BX
 8OJO4oBQik3xxJq2pOMPddR7laj2EUYANEvt/0uMClr3gxlZQMkK7q3ZbaIFGvGUgT/p
 8bbPOcv5CFxSWFvGyssYCHzj+0Q+Kht79ZWwiR3lCvJPxpUauSomzR2PfTFcif9d3rOG
 3w9HlCzkOO4TbEO9E1byj+xfZL1Tpg84GDanGx32CWJm4ghCj60Q8eqs8cGqx3+uoPUv
 TwyA==
X-Gm-Message-State: AC+VfDzJIStPYpIpbMy7k2VhhSY0GINsG+hgnZFh41jYD3CE6VGLu8oW
 M+VyOYw5/uS6TcZGqM0MeeoEMQ==
X-Google-Smtp-Source: ACHHUZ5VYzmsikxsafYP0OLAIPuaP+UraK9xdVPdzYUjKg3TB7t20IZE8MTlcxjTp6aoA7d4uljNAA==
X-Received: by 2002:a2e:8ec8:0:b0:2b3:4acd:8477 with SMTP id
 e8-20020a2e8ec8000000b002b34acd8477mr3465408ljl.10.1686828689510; 
 Thu, 15 Jun 2023 04:31:29 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused clocks
Date: Thu, 15 Jun 2023 14:31:19 +0300
Message-Id: <168682860382.384026.8056760292129315346.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
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


On Thu, 15 Jun 2023 01:44:01 +0300, Dmitry Baryshkov wrote:
> Several source clocks are not used anymore, so stop handling them.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: dsi_host: drop unused clocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2d1ae9a5ae51
[2/2] drm/msm/dsi: split dsi_ctrl_config() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/518269541298

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
