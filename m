Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CAA5E307
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873B710E330;
	Wed, 12 Mar 2025 17:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jVvZvqd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3780B10E7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:47:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3116FA4166D;
 Wed, 12 Mar 2025 17:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6654C4CEDD;
 Wed, 12 Mar 2025 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741801629;
 bh=zmQQxNDH4Fds7Lcdf3Pm1gb9moqE2cmfjzhZ+FDb8SM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVvZvqd2xiTRKWSk6B5HnnmfMPfllsLcFKQ3KQjJDQDPiuDAIaFsYRRt9ZTc049TS
 Qb32a+zt+4FtuVxg6+5Ru9tTE/oP7+9XLwr3ehmfFQZ7/tc9tpxVMdZPE6LNEd7rZd
 5F7aVHsryiWrjFBCdht2ypdgmJvBKnHANHfUn2HhaZIT/0+jfIHohpsy91r2kPmuGF
 jKf56PZIS27Es5uN28dlvssqrXeRdYN8x2k6SPV3kuZb/+cV8bH6HQ4jMWNTO2agbX
 sxflb5Qc5cmqhU8JcVKhhiWwvYg1tgF3aTKoOMxiQ2WcAdb7EgqsJD/zCnPKx9S5m0
 ZEbhSXIPn1/yQ==
Date: Wed, 12 Mar 2025 19:47:05 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/display: hdmi: Create documentation section
Message-ID: <nntv5x5niu33zjxpdlx4zr3zbdvl6mugx34btgejbdgusw3j5i@oakkwqs5mtm2>
References: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
 <20250312-drm-hdmi-state-docs-v2-1-6352a5d68d5b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-drm-hdmi-state-docs-v2-1-6352a5d68d5b@kernel.org>
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

On Wed, Mar 12, 2025 at 02:39:16PM +0100, Maxime Ripard wrote:
> We have had documentation for the public functions in the HDMI helpers,
> but those were never referenced anywhere and thus not compiled as part
> of the doc.
> 
> Let's add a section.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/drm-kms-helpers.rst           | 15 +++++++++++++++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 +++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry
