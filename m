Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D0ACAB1D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9433610E4D2;
	Mon,  2 Jun 2025 09:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RSxLqWR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC810E4D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 09:05:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 313AEA4FEE6;
 Mon,  2 Jun 2025 09:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A56C4CEF1;
 Mon,  2 Jun 2025 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748855120;
 bh=Uf1WNjJF38/Gl/qOZlM8Xtt9ZN9OemNHzI04tFgW14k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RSxLqWR/uyOmiyASifCcWPAuLRcv8cTBhK/6hTXPKBA574kCzYvTWiqy5krX3zHfc
 GFwEDhrUlUQEw2lPszPQaOQLXd/TTXpWjvCZNBbpPg5SQP+ZrEKpRXTfo2EyD8Mjk/
 ZvfjHRcBhzlF8ZctWTXqfqsG3hIFjt5Q8qniRanTi2W6LzuivccMf8NXexQqYMD8J2
 CTcqMg/docRrfzoE040y7vBjcjemAHsAPZEDy8iMh7e6q6QrJCRvMZ3n0YU1+XVLrm
 eP7GkdJ3BpvMnEV1R/d5k6gW/uk0lrkFadNy3fuRRGRRyXzGADfjypIUBHQbpM83gR
 rJOHpwb4/VoiQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 00/19] drm/connector: hdmi: Allow using the YUV420
 output format
Date: Mon,  2 Jun 2025 11:05:16 +0200
Message-ID: <174885511345.447765.15117962049678380491.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
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

On Tue, 27 May 2025 15:11:08 +0300, Cristian Ciocaltea wrote:
> Provide the basic support to enable using YUV420 as an RGB fallback when
> computing the best output format and color depth.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
