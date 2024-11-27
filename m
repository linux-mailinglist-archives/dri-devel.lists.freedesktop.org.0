Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB529DAA86
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F9D10E16A;
	Wed, 27 Nov 2024 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cTk/mCsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E2810E16A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8DFAA438F0;
 Wed, 27 Nov 2024 15:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D35C4CECC;
 Wed, 27 Nov 2024 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732720498;
 bh=xDyB2V7nzgRl1i5zIG6QEKNFLXMrQcIRwvofnEFitV4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=cTk/mCsLbWxjjhej3XQVyuLxzO52Dvq+TMbf0O+PQIf2aAMj8b4ud6WP+trMLVSXZ
 BcebhQBa7I0gdnaz4j8CMZKHJcv0sUALZMx10forB2sjeVu0m2EmudOTV3JXucqXiQ
 jzYpoK1C5ja6E/QRlmdYivH78r2QgpXd8uTO/Fa3VKwhCaJq9GIkU9WHreqCYXAEYD
 /MihforS6gJ3DCHfe5Yyezy6TNK6v1fvdvYhBhTzFd41MdvBsPy8AzbZgfjGYTCEQa
 GjRKvSjhyENRkRlDmBrY3YVeXc/GANB9iusbqnSpv2IbgkY2r+5CCbAQHbhv7rRrOn
 meSo8my2QP2fg==
Message-ID: <0fdc00c3d39563fa06cf8ac022e36d43@kernel.org>
Date: Wed, 27 Nov 2024 15:14:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/vkms: Switch to dynamic allocation for
 connector
In-Reply-To: <20241122-b4-vkms-allocated-v2-1-ff7bddbf0bfb@bootlin.com>
References: <20241122-b4-vkms-allocated-v2-1-ff7bddbf0bfb@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
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

On Fri, 22 Nov 2024 17:35:09 +0100, Louis Chauvet wrote:
> A specific allocation for the connector is not strictly necessary
> at this point, but in order to implement dynamic configuration of
> VKMS (configFS), it will be easier to have one allocation per
> connector.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
