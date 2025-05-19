Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECCEABB629
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C810E0B0;
	Mon, 19 May 2025 07:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8sHcEEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951010E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:30:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B28905C4C11;
 Mon, 19 May 2025 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F4C4CEE4;
 Mon, 19 May 2025 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639802;
 bh=qkdT8Cp5AKBfHPwo6RteW35DLD1bNOc5UzWP2dv3v5U=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=d8sHcEEUY17YxpnK+a47HTO7aNpbY+VR6WSbvkjZ7+QO8W3e55n94jR+QaFd7fm3A
 jd3IuWYcGp4fX+B4fABq8qWWV60DYZaNZgPFXIVtV39eWy/GO8V6ZBEOxZ9lRyrpQK
 Sz4//mMD4EWmJ6wp8ssO4qnPWKxgoTtHlS1rZMsXE26XDBtlhc/XJOPq4If4hj6xph
 7Tsr+g0m6O92YeGG+fNSoIgA0gjr0yNcW81O94gl4lKyxV8AHd1JJ/gxldrfGvwuyx
 pnd7aDSpJJr3N+hamDcSm/2I8QWCjJUKfi5ZKEfRoOYf30Dhw4Ju7y4JzU/UuIEMBx
 o1HMMGLybgz9A==
Message-ID: <4a2a48aba8e080225659851c1cf4ee48@kernel.org>
Date: Mon, 19 May 2025 07:29:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 03/10] drm/connector: add CEC-related fields
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Sat, 17 May 2025 04:59:39 +0300, Dmitry Baryshkov wrote:
> As a preparation to adding HDMI CEC helper code, add CEC-related fields
> to the struct drm_connector. The callbacks abstract CEC infrastructure
> in order to support CEC adapters and CEC notifiers in a universal way.
> 
> CEC data is a void pointer as it allows us to make CEC data
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
