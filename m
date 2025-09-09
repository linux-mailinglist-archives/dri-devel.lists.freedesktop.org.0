Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830CB4A231
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437E410E620;
	Tue,  9 Sep 2025 06:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r4q9qLO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C5910E620
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:26:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F354F6014D;
 Tue,  9 Sep 2025 06:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC86C4CEF4;
 Tue,  9 Sep 2025 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757399177;
 bh=YbWIp1etHAL++R3wubMIbRxn6cnxljb60DrA25TQIDc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=r4q9qLO31+rP6suBIU22lSvAgG0X1922JQYw0cn6Grt7BYx4yOFfyvdMzwyWjoX5t
 gqSsp4O/qw/2FPyPGBgCm1giFGvWydAlt/4IrX2SnzEGDIW7mLJURqnWLN1LACDDzY
 YsoXlOnz/NwBQNhaVBbjF6i6cfyQ6Z1leN7cS6bz/2dHDEuxFXQj4tEGr8iJPZfWaf
 s/9pCvXKssRrDQm1GXkbykOgFRsFFz6BJ8wPejWQz1Whil6ymH/RE2NARGVbR7T8ps
 7wHcRsgJ7hIHgmy672ujl6VtKMgjcYeHfDTZS8m3wEiJKpobJFsiox4w4mJut0ikes
 zJiUY87zlpC7w==
Message-ID: <7b1a1a8848e7b0e3a596335715b2fb0e@kernel.org>
Date: Tue, 09 Sep 2025 06:26:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] drm/bridge: write full Audio InfoFrame
In-Reply-To: <20250903-adv7511-audio-infoframe-v1-2-05b24459b9a4@oss.qualcomm.com>
References: <20250903-adv7511-audio-infoframe-v1-2-05b24459b9a4@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
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

On Wed, 3 Sep 2025 19:21:29 +0300, Dmitry Baryshkov wrote:
> Instead of writing the first byte of the infoframe (and hoping that the
> rest is default / zeroes), hook Audio InfoFrame support into the
> write_infoframe / clear_infoframes callbacks and use
> drm_atomic_helper_connector_hdmi_update_audio_infoframe() to write the
> frame.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
