Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB469ACAAF9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DAB10E1D1;
	Mon,  2 Jun 2025 08:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="upXKpJiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7941F10E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:59:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5149049B00;
 Mon,  2 Jun 2025 08:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CB4C4CEEB;
 Mon,  2 Jun 2025 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748854743;
 bh=hCLzZJlR7F87Tw5TSuj9Wz5Oj9sb8/8omKIuRiWZMG0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=upXKpJiq7r90SESNoWtXc1uZhoTPk1z+ES2iEGRBDHqG9GERoeVsINyi2Yr5o4HU4
 LI/I2VAuUBVlCKxbzi+6P/if735SVT/n1Yyuxy0CZyJ+R7t2rkPP8/zSqJhxKIt2IU
 NoNQnQyWcW677/4sKVaJ1TSPh5Iv7Uy0k/ogNbS5Y9Edv8StEDctaGUcQTkF64Ze+j
 FhDeI85lXQoiuB5FpdjYL6NIBslwTtSDzDCPKq6/LrZgIurJ99204c//zPn1DFkBUg
 sHS28bvPUHyCnZ1RnDDndkV3nH+V2zbLz5QxjN50WdDoUGyzwsPl8BqNN4A/gLxuiU
 D7wh4eTs8B7eA==
Message-ID: <56432a7b04a40699d749723b68385c8f@kernel.org>
Date: Mon, 02 Jun 2025 08:59:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 07/19] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
In-Reply-To: <20250527-hdmi-conn-yuv-v5-7-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-7-74c9c4a8ac0c@collabora.com>
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

On Tue, 27 May 2025 15:11:15 +0300, Cristian Ciocaltea wrote:
> Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
> the two occurrences of '[_]MHz' substring with 'mhz'.
> 
> As a bonus, this also helps getting rid of checkpatch.pl complaint:
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
