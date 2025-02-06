Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A37A2ABC5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B68910E879;
	Thu,  6 Feb 2025 14:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5chCnGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667D610E879
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 14:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 865B95C5B2C;
 Thu,  6 Feb 2025 14:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC1C4CEDD;
 Thu,  6 Feb 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738853117;
 bh=U/0f7l0blhQk7R6zoO3mEGN0Y4xGTK4wN7+DsiJxa24=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=P5chCnGs2h7gJ/Gfl4hSd6dbM4OBnsTK8CsBOVgjIC4vdQxO33Skf7JPwvZGgOFmO
 UIRYV0X28rPwci+PCWqxce/JKXmUalWM8nRknMraUqCtqBuWIgX8dQg7ziCEhFuT3g
 Y0GqeYnFAFZ15G7pO2w8DGSpKYqPMvvUFUOo7glMNY2iC101k2/kxryKmB0KD204EJ
 ah1V9pEeOXzoEE4FE3nK+Y6P05Z2UMr3QCMAzamnzUJPMy69Zge/qPZwgEhBZ3kmzW
 FIHBeBlEN2e+dw+Ruv4dbTrfEmaN+Qy7QiGDSUqkxCWDvWfI2/TRgrMLFt1ZmQA2vm
 MKKDXuYPxISvg==
Message-ID: <2310c2c4c9670a776090ebc81ea2aaff@kernel.org>
Date: Thu, 06 Feb 2025 14:45:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: oushixiong1025@163.com
Subject: Re: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
In-Reply-To: <20250206071713.180471-1-oushixiong1025@163.com>
References: <20250206071713.180471-1-oushixiong1025@163.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Shixiong Ou" <oushixiong@kylinos.cn>, "Simona
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

On Thu, 6 Feb 2025 15:17:13 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> convert to use devm_platform_ioremap_resource().
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
