Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79C9F794B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129410E47E;
	Thu, 19 Dec 2024 10:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l+5u/pRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7210E2BB;
 Thu, 19 Dec 2024 10:14:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7EAC5A4200A;
 Thu, 19 Dec 2024 10:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBF2C4CECE;
 Thu, 19 Dec 2024 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734603259;
 bh=41LpMb62D3EpqckyjmkYsBIfTP+Hk6XNyWVa6ZEbiys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l+5u/pRy82YXfAkLjmmEojOkPElis9GSEoF6cikqIAzgS3v/RSgP1Bg2qZNLsDncG
 C6hJKhGZMSdgpXMSTKYhoLz57JSzDTgrrDJvriWuGA2F7nFnvQREuAmMqUnaxEnIrt
 qvX8Ya8YTW3D7H1SoesBWLH61aHDEFpAQTdFf6T0nGXGFpg8u2uWsq2qSPo3YDYpmv
 ozuRv+LMGWsnvxPLbguxDHzBC2JNaQQfBV0MbCJqerTH1g0C0LwVLwBNvuMf3SeEiu
 0YwoyVloSe/jawLsKBF/slX3sHYcjJgHbIuPwo93+Hwtl3fFnrC5zibC17iT/yaPGL
 GZBEzBHJyZOzg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tODY0-000000001C0-23L8;
 Thu, 19 Dec 2024 11:14:24 +0100
Date: Thu, 19 Dec 2024 11:14:24 +0100
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
Message-ID: <Z2PyANZAL1PkNWc4@hovoldconsulting.com>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
 <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
 <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
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

On Tue, Dec 17, 2024 at 12:38:17PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 09:41:44AM +0100, Johan Hovold wrote:
> > On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> > > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> > 
> > Please say something about why you're doing this and what the expected
> > outcome of doing so is.
> > 
> > There is currently no way for a third party (e.g. stable or distro
> > maintainer) to determine what this patch does, if it needs to be
> > backported or if it's essentially just a clean up like Abhinav indicated
> > in one of his replies.
> 
> These patches allow using colour transformation matrix (aka night mode)
> with more outputs at the same time. I think at this point only CrOS
> compositor actually uses CTM, so these changes do not need to be
> backported.

Ok, thanks for clarifying. Can you put something like this in the commit
messages so that we have a record of it?

> However they are not cleanups, it was a feedback for the
> SM6150 patch for the reasons expressed in the Abhinav's email.

I don't see any SM6150 patch in the thread. Do you have a pointer?

Johan
