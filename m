Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6F809898
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9710E9BF;
	Fri,  8 Dec 2023 01:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56010E248
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:25:22 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9fe0b5b28so19472791fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701998721; x=1702603521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cB1OKrbRDLzBqraa4AEj/IskXYNJ0qKZbmReSLdVQ8g=;
 b=vdIaI9qBDtNwsmIs3Kp8Za3ZFOmcIMroTxPNVsHYskLYEtwurY9Yt9yxz/ByDe6MAP
 MWVVsIz71GfgeHk1RSMI9ylqHjutu8/lboOo0F/Vqtbt38fBW9Wpj+YbViQR/ajlpPHJ
 5cP74+UWtNsOse8H6DXW8cxv9oVRdPpiKadc5Og8rbQOFGhGykx2YnLLOARg783Afdu7
 WouZui6NnwV13OUXDAaXJrhZYMuAC1x6pGMcXCupE9jm/a0Z/1Q04F/IxI5+09fbGoGN
 OUsWMRIoJVHgkvk8czjytuR4qlGYsE6gK7Qx+95CYk+vfNrjZRos3NoI/qFUTak8LCRU
 Jcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701998721; x=1702603521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cB1OKrbRDLzBqraa4AEj/IskXYNJ0qKZbmReSLdVQ8g=;
 b=xJ4kvzLyXqg4sKiTDe9WEZW+tCpbQTmProo3EB+4AA8Uynaequc8iC/Rl3Yjd0SxHQ
 27YeTE1ghCi+WSMlpjr8vh4Np0pSqXlClQTRZIYiE8NBLWyPp13iypXtW6addOPe+Jni
 F86WGms8qkzEV8+UfGIXxfKvQjG+0PYGscyFomY1SrSFldXuBOpA7eWHY0VhIh1XdU2G
 R2EWgLHMhRz7VFR6lHcI+LStmWIPetMrvISqGMiMsb0zfXHqAK8gI/VwdZ4DwF5qUbmX
 v70GboNb0ux++FxhjAfsOyZtCE9Za7CL0sCKCOqz5PPKbnx6I8ppjkEM+CKCRK+Ss3DW
 rB3A==
X-Gm-Message-State: AOJu0YxVVQkSKU//HD8C9Mq5fT1Pk1hMMDQsu6l2oVjmEPKRnAWG1F9z
 Uy5ebD+lqK4EJVZTG2PYfZKQ5g==
X-Google-Smtp-Source: AGHT+IEG32ibemvnVqzQR03JIJcqGTySxu7bxTXGMkWfda4JV4s8UhuVGuCzkuvEh1tmv0A6UKKcwg==
X-Received: by 2002:a2e:7410:0:b0:2c9:fb42:cd28 with SMTP id
 p16-20020a2e7410000000b002c9fb42cd28mr2201824ljc.6.1701998720821; 
 Thu, 07 Dec 2023 17:25:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:25:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
Date: Fri,  8 Dec 2023 04:25:18 +0300
Message-Id: <170199868359.3399536.11819408317863820491.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
References: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
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


On Wed, 04 Oct 2023 06:19:03 +0300, Dmitry Baryshkov wrote:
> There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
> together with the corresponding wait_for_vblank callback.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: drop MSM_ENC_VBLANK support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d4c74a150cce

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
