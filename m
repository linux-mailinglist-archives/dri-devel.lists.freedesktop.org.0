Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B4A33A5A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 09:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39E710EA2C;
	Thu, 13 Feb 2025 08:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="biJit9VP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216D10EA2B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:56:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E2735C4E46;
 Thu, 13 Feb 2025 08:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F87CC4CED1;
 Thu, 13 Feb 2025 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739436998;
 bh=hih5Xq5n29taXspoRbFPy3YyVqsgUHNuM39mgdxlVLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=biJit9VPtK/lzJuwXn0fR+gnxx4p8ETeD7fcXHEVBOnPrKRYkMVFIsSMILWuvFMSS
 +5ZbhHyZQJ8bVvZzjYVPXQHcuhElifdzPG1Y5tHmw7lr63HNORzduL4MvAyfT/9GgO
 RwPHj48xrfNPa32X99b69FNP3aV6c9EF/pvWKdA7znQ7j3V1eNjma61UOL2NHYcRJY
 J9G9eBjKxumdTxZ0lopeo6xqpYcwnNkUPs0w9EUcvIKzpuJcemA7rUQC63f2Xz3WFY
 UWCQcarJufGbF4anGr3bGnIno3J+d32ZB+sNOa0wAUmk+FHGBoQk4K+G61+zH2TLqV
 NsXcQEXMdzb3A==
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/tests: Fix a test in
 drm_test_check_valid_clones()
Date: Thu, 13 Feb 2025 09:56:32 +0100
Message-ID: <173943698484.1868200.4955901862780721349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <c50f11c7-932c-47dc-b40f-4ada8b9b6679@stanley.mountain>
References: <c50f11c7-932c-47dc-b40f-4ada8b9b6679@stanley.mountain>
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

On Wed, 12 Feb 2025 18:24:09 +0300, Dan Carpenter wrote:
> The drm_atomic_get_crtc_state() function returns error pointers and not
> NULL.  Update the check to check for error pointers as well as NULL.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
