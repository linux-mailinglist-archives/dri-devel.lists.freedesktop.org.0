Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34C96D105
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0468C10E746;
	Thu,  5 Sep 2024 07:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vExL71mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6A10E745;
 Thu,  5 Sep 2024 07:48:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7CDE5A4420F;
 Thu,  5 Sep 2024 07:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17337C4CEC6;
 Thu,  5 Sep 2024 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725522479;
 bh=k1A18bSItXyIZjz9DAyh4l9IJuamFYFuOFgUucR/180=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vExL71mTerT7I7xz/5v1SVflbH9olWp560pi+0+leE5p1zeFtilW/1CEsEiY1mCXr
 5d399itNVtNKNziG/70I46CgyQUHc22/VfaVcDubaodmlIDnSXyAyKQoj/naVwvDt3
 YE9qPUB0uoKDC/7X5/oSIIEOdEIfhNHEhSfFcZpZi9LbgQMu/u/6tabY+19gFQDtUP
 WM8auwPCk1kXVwCmuZAmzG7AxF1CJtiUJoS4KcqiKy0RE4TverJG52yCDG3MJK1Ssy
 DM0ItZ4aZ0iGLMrjAKHyT8H8ItFCfVFR4/rYruOXTA52UE02PTZ/jgBPrlUrIuGcqB
 ImBO+hCBhC5HQ==
From: Maxime Ripard <mripard@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
Date: Thu,  5 Sep 2024 09:47:55 +0200
Message-ID: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
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

On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> helpers") and were later reported by LKP.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
