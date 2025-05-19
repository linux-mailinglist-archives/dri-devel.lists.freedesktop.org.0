Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3006ABB680
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667410E3E4;
	Mon, 19 May 2025 07:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="by2iCWmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27510E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:57:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0400FA48755;
 Mon, 19 May 2025 07:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511ACC4CEE4;
 Mon, 19 May 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747641465;
 bh=7e9NChurz7rY3oirADLtp0CoVANmOBcPDXCDai+k1KY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=by2iCWmHwR+NLH4lc1gHYtbMo4rrQNh+Y/Q7Mj428EUYVPs9tFquaCnlaeinH4LZF
 EwTcX+ggLHRVModdg0j7VCpmaFlgk+TbBhsiEzreKeqmkMmkpwvxXwwf6WGHSWlP9I
 H+F6vtLfYg/YN21F/yVa5feMZpkorwKbc6d6dKquuT2ErLC/F0YdVGFw6fNkcr9PlU
 +cxFcmdNaIT+5ZkzyP9ezAqYTttkcfuQX4hOG/+Z7IYFCYfoCiuACvU74zIBB6zQc6
 +g3loBQIEIHTSoQ9n//hpW0MboXTVT4vdW/4dkKB6H7jA7kNKg8jhSYO3WWDvWBlJA
 TxTho3pCRgpwA==
Message-ID: <f29b6348ec26850eaa4cfe2ee1c650bc@kernel.org>
Date: Mon, 19 May 2025 07:57:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 20/23] drm/tests: hdmi: Provide EDID supporting
 4K@30Hz with RGB/YUV
In-Reply-To: <20250425-hdmi-conn-yuv-v4-20-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-20-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 25 Apr 2025 13:27:11 +0300, Cristian Ciocaltea wrote:
> Create a test EDID advertising the following capabilities:
> 
> Max resolution: 3840x2160@30Hz with RGB, YUV444, YUV422, YUV420
> Max BPC:        16 for all modes
> Max TMDS clock: 340 MHz
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
