Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B649F4636
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFEB10E41F;
	Tue, 17 Dec 2024 08:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5arzDkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6410E41F;
 Tue, 17 Dec 2024 08:41:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 310E4A41E25;
 Tue, 17 Dec 2024 08:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954BCC4CED6;
 Tue, 17 Dec 2024 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734424902;
 bh=D+wSx9Afy4rDKFVT4VamMlGTvUye5qQYDZIaMP5OHiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h5arzDkPatzr3nbQxyJVcP8TNxxt35kvCrZbY5fFam3pzk3ciAeeIxxRHZSnW/DFX
 WgwkjnmHMSApjAJ9Qss9sSgiOkFred1lfuPjyAyn3zaTgTdR/0/wSJ+mXk6CICWPGz
 Q2QEPb2+OrTPgrocfvWrD2/3ZKaB0Ft0p4krZYj3tikdTdl0e3+epGbGnWW2BIR165
 /DEZ6mcOGRWRMfJwnX5xilHzIHS8ixTft9K2wI9I2qY9j0NIoVy+kA9VlEplk2Juh5
 /FkUonRr5ic9mqHkRSeYp+b5vhe1IfOXTSOqd3GFCv+q8aS8+ymf76n+W7o/fILjrN
 Z8tS0kwnrjf1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tNT9E-000000006GN-2TkS;
 Tue, 17 Dec 2024 09:41:44 +0100
Date: Tue, 17 Dec 2024 09:41:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Message-ID: <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
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

On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Please say something about why you're doing this and what the expected
outcome of doing so is.

There is currently no way for a third party (e.g. stable or distro
maintainer) to determine what this patch does, if it needs to be
backported or if it's essentially just a clean up like Abhinav indicated
in one of his replies.

> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Johan
