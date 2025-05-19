Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EDDABB769
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508FE10E233;
	Mon, 19 May 2025 08:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fS1FVU2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56510E233
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:38:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D04644C5A;
 Mon, 19 May 2025 08:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EB9C4CEE4;
 Mon, 19 May 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747643900;
 bh=2IsWKQAwKOCR7PFthlqk1dlpSS9+LEI+zhI50buMEn0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fS1FVU2UK6je3qeLzUHnyYgFWWQvqTC0nW3p/wGESAZ0FZed8UVitWgo4rfc8QNbL
 dtsoEs2mCkK0phl1M4aMtrfhdzGm5oyntnIYP8fc+z/xxxFcV+kAgZQk5q88SQC4wb
 LDsqPVxe9WeB3x57LFlGsMLX9+4FIKGQafQ33cNwULr8GfqRgrGp/OBrvGPwyiZkvT
 iOJ9jlemMHeEjhIqaw65wrGnqIexHx/rCD5uqmYiUafp542llINkeBnB/MHtUFC0e3
 Arq8yqJZGcTA/MaIJxPI07VQfzd4kotYoMD4vL65/5M9cwDIDPw8ksj2FdfriGmcmH
 VNZxzD8bU+lCg==
Message-ID: <d2608056aadd6bf146cb5ffb2ff6668f@kernel.org>
Date: Mon, 19 May 2025 08:38:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 19/23] drm/tests: hdmi: Rename max TMDS rate fallback
 tests
In-Reply-To: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:10 +0300, Cristian Ciocaltea wrote:
> In preparation to extend the max TMDS rate fallback tests for covering
> YUV420 output, update the rather generic function names
> drm_test_check_max_tmds_rate_{bpc|format}_fallback() to properly
> indicate the intended test cases.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
