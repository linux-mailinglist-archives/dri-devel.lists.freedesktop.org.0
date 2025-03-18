Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3380A66F44
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9F410E372;
	Tue, 18 Mar 2025 09:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UhtjsBNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D73610E372
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C74C65C572B;
 Tue, 18 Mar 2025 09:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194C1C4CEDD;
 Tue, 18 Mar 2025 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742288777;
 bh=MEbMt30gtbDW29ZsyHH0TxtnC6VxqGi8GZrrw0ikjR0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=UhtjsBNy+l6eFX+9Xjkck/otCYCinjjW4SYdOdH9fdpA2q9LcxlQsqYNsC/u00YIR
 zeWMPJmv5rUdmK/A6xncB4DEqgVlh5qnYlipkEFO5/9Rqss5FB/daspzL093bgTteG
 AAyoHnwo781YS0O1CUjQzRXU+FcwwSELsqI4pg9LJUbX9yjxs/nBzdzaxXGN4L9WDp
 mtJFYZglA00043Q3rM83Jv4jVo4gfGaC1N8zBe96X1FY8968tcmx42Xf2iCrf+2FFk
 o0TpP+CEYmatqERQkvtLkc60t1NUuYJ7SwQBldHzlTYew7rZ0rV5RabF4HHjhl+/Lt
 rr3xlZNrOhvlw==
Message-ID: <231da63e5d9b570aad31e524ee22784c@kernel.org>
Date: Tue, 18 Mar 2025 09:06:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "David Turner" <david.turner@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] drm/display: Update comment on hdmi hotplug helper
In-Reply-To: <20250317-vc4_hotplug-v4-1-2af625629186@raspberrypi.com>
References: <20250317-vc4_hotplug-v4-1-2af625629186@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Mon, 17 Mar 2025 17:12:22 +0000, David Turner wrote:
> Update the comment on drm_atomic_helper_connector_hdmi_hotplug() to
> clarify that it must be called for all status updates.
> 
> Signed-off-by: David Turner <david.turner@raspberrypi.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
