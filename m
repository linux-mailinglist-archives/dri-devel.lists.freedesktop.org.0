Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A39A8293E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715610E92D;
	Wed,  9 Apr 2025 15:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A2mEN0nX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BDE10E92D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4E865A49A24;
 Wed,  9 Apr 2025 14:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CD3C4CEE7;
 Wed,  9 Apr 2025 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744211050;
 bh=ON0n4JmEub+ePDDDrF2PA+G7p7S6y4i8ovbZ+Cx9KNI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=A2mEN0nX4ouML/QJwmNwynpbX/oNLBaIhxmqqmd+sc7qfdOQ1zt5kVW0/K1ZWg1Bc
 xMn6pregIoF33OunYfNY2XihIfHSxvaDgPLfVtqXFMJluCV6fdLzX+jm4yWiTcMFhr
 WpKbwhyaaUeOyjB7Jc1sI3KIg5tO7NhSmZ/4ZLvTzpkB4+w8RgzOLpY6d5l9la1R9l
 4QSbizHli01IaVyGzqv/9RGhZFqml+YyjUiOySEcxu1nD+WzebIzKNLsqEyHBuKR5x
 le8kY9LR9592K0ZgyVDdMhRQxLmbzlAhWF6WhbX5JoyyG2/UO9wVU2X4ZrZKHPkOnO
 +ftQF0ot7RHmg==
Message-ID: <0e79a4c685a9e383303f35911a80d28b@kernel.org>
Date: Wed, 09 Apr 2025 15:04:08 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 02/15] drm/connector: hdmi: Add support for YUV420
 format verification
In-Reply-To: <20250326-hdmi-conn-yuv-v3-2-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-2-294d3ebbb4b2@collabora.com>
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

On Wed, 26 Mar 2025 12:19:51 +0200, Cristian Ciocaltea wrote:
> Provide the necessary constraints verification in
> sink_supports_format_bpc() in order to support handling of YUV420
> output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
