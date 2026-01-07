Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145BACFF7E8
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC8910E650;
	Wed,  7 Jan 2026 18:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQFw7jGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656A10E64F;
 Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 272F660018;
 Wed,  7 Jan 2026 18:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC5EC19424;
 Wed,  7 Jan 2026 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767811112;
 bh=oHrbReaf1HeVn8B+9mxlpHHQuipBO6k8H6//aRo1H0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aQFw7jGMhxJkzKM2gGRr//xnmvizt205SAVQ8vHz1LX3G5lsD9oBHUqoqztYLp2B0
 lLEyws8HA68dQwFCf0wNwTTngYQ23uMzoXVc5QzzGyQbvVsEWFTkM30Ai61WdYb97G
 qHK4PeNlsVeL9i6xZ/9hQmOek977ta08BeSFBwc+wO0ax4qImqIfDKTtcO8s+JXL+U
 a4ygXJvIrPoKWgB/PojdHqQeBAR5jQnOiPJeniRgazfFnzoph7qG99123KSIeYrB2m
 SJj8JzhAUkrGo9ByII0oyT55v38737VoDxcy65JfxRRwiD7+pjH2APeHXF4KrqvyEE
 Zo40e7bQFbaiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>,
 Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Date: Wed,  7 Jan 2026 12:38:20 -0600
Message-ID: <176781109953.3262943.6850960519948721977.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Jan 2026 12:44:43 +0100, Petr Hodina wrote:
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sdm845: Enable parents for pixel clocks
      commit: 17f1ae4148fa50f43b3afbd4fdd7b500928c9605

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
