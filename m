Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2711ABB67E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8C110E3E8;
	Mon, 19 May 2025 07:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XEx1JWHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7410E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:57:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 915CA4A8F9;
 Mon, 19 May 2025 07:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DE5C4CEED;
 Mon, 19 May 2025 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747641450;
 bh=6jEukY665h7yREmNG3UGbrdCx0ti2EK1VaLCfuhZWIg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=XEx1JWHI5ZE2eGJOd8r6HyNbrcaSqE42hELy1SHfxn5S9fraG6npi00Sq4BPwqWtd
 1VCsiSxMHKTOgsTZrLjw8DYHg1iNksKb56GroOpmmweGL7lkC6BLFkffeCDcjrGj/L
 6dIMwLj/ESN7+7oxRzIK8nJQ0mD28lt1YmOTDvPliiK4xm3Ppn/qzXg146CplVe08+
 anMQTt9LCqwzEKiT6GRxmD0y+GxEcp+AaaI3Yq+4pz/F4wRt9qf4JOt2ziBaSi+itD
 Ks9hVTyjlwhS5YcxndJQ+oQwBwvQ+v4wV7w6OAGFTUjRfeiF3PP2XEg4oNaUl0A/BS
 KOPRJ3w/7/pHQ==
Message-ID: <c3d962eb46e2f217f8b2efe5dd7fbefb@kernel.org>
Date: Mon, 19 May 2025 07:57:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 17/23] drm/tests: hdmi: Provide EDID supporting
 4K@30Hz with YUV420 only
In-Reply-To: <20250425-hdmi-conn-yuv-v4-17-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-17-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:08 +0300, Cristian Ciocaltea wrote:
> Create a test EDID advertising the following capabilities:
> 
> Max resolution:
> - 1920x1080@60Hz with RGB, YUV444, YUV422
> - 3840x2160@30Hz with YUV420 only
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
