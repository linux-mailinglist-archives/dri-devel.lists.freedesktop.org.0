Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7C802D75
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A63D10E0BD;
	Mon,  4 Dec 2023 08:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611C910E092;
 Mon,  4 Dec 2023 08:43:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0F0260F52;
 Mon,  4 Dec 2023 08:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3194AC433C7;
 Mon,  4 Dec 2023 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679427;
 bh=7hGwnvV/znPEpwiJjYANraB69RFrj7nI1Ml8VtCdtzk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RBYUMdw3ArodhkfMx8zay/IvAnAFif4xxhoS4zaNWoAYILdNfED141Z6aYyHO2uk4
 HWLIqNzpNXYt2E9Vz0+Xl3dPFT+fLDbTJbH5Ld9j+qtI8oh1LENwxmUuOkpW03XhbJ
 ns7H5dPeyn3TvQSUEqUZVyBVn6HQPUlBd7/tSmUkjL2GJkB3f6RoSLAnZLNN9e3iJ2
 AH842rmIvM8J2rYR+nKEw3IUTthhVg8dDxEmCHIbA76jRGa05f7jJ0AZzYeJx/mKlf
 75EgHvSzA/bVMYeE7SHCAUvok19GNpQ7kw5CLzLLXEIGX7aZbEp6V58Tm9NaNhcHXw
 qyKyoLrmZrlGg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
References: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH RESEND] drm/drv: propagate errors from
 drm_modeset_register_all()
Message-Id: <170167942469.3617818.5168906828473373855.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 09:43:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 03 Dec 2023 01:55:52 +0300, Dmitry Baryshkov wrote:
> In case the drm_modeset_register_all() function fails, its error code
> will be ignored. Instead make the drm_dev_register() bail out in case of
> such an error.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

