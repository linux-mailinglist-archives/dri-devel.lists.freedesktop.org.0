Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5B9DAA8D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E4510EB14;
	Wed, 27 Nov 2024 15:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CyFymVck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983ED10EB14
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:15:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E3390A4390B;
 Wed, 27 Nov 2024 15:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19294C4CED2;
 Wed, 27 Nov 2024 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732720516;
 bh=q9teGyA29XahoUm0JRRZs5zNxg1eAovRNfq7t2IlIsI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=CyFymVckMiGKq7AzmYYum8+XYvhvxb+zOKwW9Et6ocHkvTDb6n2EOI2zCojcuHCgd
 V6ZDoLFzIYvmsjiIIgA2xWa9v5u8y8rQ6CZrbWsFFSx7YIe8AmjkYrj/r7h7ULBz5P
 kVmR3Wx9dSr2asgHlbKkzZUHF6R7QCMX3Lw2aMDUCbN4DSvwBW13nv8RkO43XSWOKf
 5WKJlZihdU21UDzvQsdoLUho19+HOFFiQArUpEZKIn0p3pHf6sitM7kaRdZcPHmJak
 BrCloGt3FANlxOUaa/qJ/kNXQre5iCP/NjJtZiZqvYcyB9x59yeekwKWN210tukuX8
 RcC/J2m4n/TwQ==
Message-ID: <8eee23ccb8763dda6a6731aee1813e1f@kernel.org>
Date: Wed, 27 Nov 2024 15:15:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 2/4] drm/vkms: Switch to dynamic allocation for encoder
In-Reply-To: <20241122-b4-vkms-allocated-v2-2-ff7bddbf0bfb@bootlin.com>
References: <20241122-b4-vkms-allocated-v2-2-ff7bddbf0bfb@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
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

On Fri, 22 Nov 2024 17:35:10 +0100, Louis Chauvet wrote:
> A specific allocation for the encoder is not strictly necessary  at this
> point, but in order to implement dynamic configuration of VKMS (configFS),
> it will be easier to have one allocation per encoder.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
