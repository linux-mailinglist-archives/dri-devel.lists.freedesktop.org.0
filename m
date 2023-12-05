Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CFA8044F5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1210E46D;
	Tue,  5 Dec 2023 02:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE1110E46C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ca0715f0faso19966341fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743647; x=1702348447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
 b=RgiIfa/FKBuL4pu/bviwweF1lT0nr/dIbnjUc/hnk4CHmU/EmRThorZz64+mnCpqwY
 lIMo5SUzvvyBw0fsA8ZDzUhGQSYsdNzdor97FE9Ayg5M82aLIPyWLayrXN5PAlaQ9NMz
 qsekAOqOTtNItdLsTPcEnq0NwW2peVc0cdJXeFngxIK0zbTMyJVPRQceD8YBkNGx3O6t
 Umk7ruZzbYKMXoLEm8asN8C0UvbD3crQDj3pBd1tFcg5qNeAPJE6p13kku7dsXcw0dAj
 WiT/UIgVyx/bYo4lNJjT8rnoQX5iuoXoAsu1ZqfAPlTu1MUEZQCF+1u/ySZwJqcojXdA
 zDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743647; x=1702348447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhRAfItPAzMnDYBgmUAMNh2g7r8OB05QNjxhfx4Zxeo=;
 b=RpfjXpw1HM2yfoQvfsEuA+hyMb/poRGIEZql0rGt/NmmpA84YNrAQWJsbrSZo/1ZSG
 FA9fcX4z4lWSg/IRUhF5KY3JivE9cEDLA0YX1bPXdtgX29EtBsKf5PhlViSdWP2RoW+t
 JBALI57ChBVp+4PItv35508B1huwN8hVhg5xhxP6cuCP39UJ6baPVt/OsnLD7b9cjBUf
 XqwtKbaofnqTqo10Qefrg0Q3DHo9HHaS0aTIOudI9OEVE0eggTGT6B43lVPcanmhxEP6
 18BtIZsrIBiTenPldOGmfMH4N/4kF133UKrBHM0GATmDR83G+x9IV0b5oqXKNaJS/rYR
 hl/w==
X-Gm-Message-State: AOJu0YzmXL1TtxuvnoVkyFkwiT3meExczUJr24WTWESVqQ57ufVvLwy4
 gjZRtu+8Uz3jiUGDNw5hnl7eSw==
X-Google-Smtp-Source: AGHT+IHIN9E/fHUtnZe09D2pmxsbjqYlprqqmhLcEbCwIYJTWISDKsi1X0saj2S5NUUNl461ONRdsw==
X-Received: by 2002:a19:434e:0:b0:50b:f478:a12c with SMTP id
 m14-20020a19434e000000b0050bf478a12cmr1209579lfj.2.1701743647480; 
 Mon, 04 Dec 2023 18:34:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/4] MDSS reg bus interconnect
Date: Tue,  5 Dec 2023 05:34:03 +0300
Message-Id: <170174354266.1582017.3052319983064321564.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 03 Dec 2023 01:42:43 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/mdss: switch mdss to use devm_of_icc_get()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ded61d7dc5a0
[2/4] drm/msm/mdss: Rename path references to mdp_path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fabaf176322d
[3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7323694e118a
[4/4] drm/msm/mdss: Handle the reg bus ICC path
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a55c8ff252d3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
