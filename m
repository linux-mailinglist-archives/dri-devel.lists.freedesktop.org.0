Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7DBA829BF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51B10E932;
	Wed,  9 Apr 2025 15:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdod68NQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0013A10E932
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:15:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99BE9A49A2A;
 Wed,  9 Apr 2025 15:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90164C4CEE2;
 Wed,  9 Apr 2025 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211737;
 bh=ijk8EHdNPCzS8fw2wIGDYZPPz5dns1bRD8VMGPY02Fk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tdod68NQ/Pl+STS253Nkxk/XgtltVIBAlgKbwgQK4q/1daELzmh9xDRMbPXXKRDHZ
 UnqYeXN1ljn+3DVA0GZxXrQqUdkTXSu5wajAYhmt63RalHKkTZQKt9wuE2xDXUUL9o
 s/HLFtDGuA+BYrPPJNtjpnqGS68N6BIGO/FnkNPiW0Q/dm552/5/CGdeV2/DnROySs
 aRe6CVQFHW5cvkP1hi+CFAlIhkzVKqO8E1VLwfEAk83aw3dqAX0OtF6vv+bSoiHMfG
 jVI9QgRvfyiRP9989PmeU9Wr18rB3h84vE1XP7SCt5rMiXtlsNhTSHGbcw1ZCSN/wi
 q9ZoToCKnjSLw==
Message-ID: <9281e95d084cfe6a3045bfad8413d9a1@kernel.org>
Date: Wed, 09 Apr 2025 15:15:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 12/15] drm/tests: hdmi: Setup ycbcr_420_allowed
 before initializing connector
In-Reply-To: <20250326-hdmi-conn-yuv-v3-12-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-12-294d3ebbb4b2@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Maarten
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

On Wed, 26 Mar 2025 12:20:01 +0200, Cristian Ciocaltea wrote:
> Initializing HDMI connector via drmm_connector_hdmi_init() requires its
> ->ycbcr_420_allowed flag to be adjusted according to the supported
> formats passed as function argument, prior to the actual invocation.
> 
> In order to allow providing test coverage for YUV420 modes, ensure the
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
