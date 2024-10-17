Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850B9A22A6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 14:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15D10E324;
	Thu, 17 Oct 2024 12:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MT38eNw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E710E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729169081;
 bh=xod92abkKPjsuq2xCVMjFOc7B3vn3PWges1C+7+ZYEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MT38eNw/HsuRcTAnrwWxXJImzpQGmpdUEiSzcjpgCgWjrps5+rzZ3zSSr3oXSZfSo
 tOpk6sf3U+6/G3qv81iw5lwcxULnV+1a4oi9kluJJCE1Ocbk9oV3gMfEYMqD+OeSNi
 SJWTg4sizGCCSuaKzLk7LpTy9qd+oAyxMGro/QOmWVgVbcMofRkmC4RVbVVejkG/a8
 UBErYLUSP2aAP/3nbv9uRMZzaR9J/wCVysjF7A1VLAToOONyXVPHgKGbt21ej2I5Vm
 3j0gcYAVsErfcJmJ3pzCgXNwyUIoQBokyuT4PbFKOmj6WeIVv4c7PIe1Dr4C8hwNBX
 Y1IkjPBOslVuw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 01C6F17E35F5;
 Thu, 17 Oct 2024 14:44:40 +0200 (CEST)
Date: Thu, 17 Oct 2024 14:44:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] drm/panfrost: Replace DRM driver allocation method
 with newer one
Message-ID: <20241017144438.257aaa76@collabora.com>
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 15 Oct 2024 00:31:36 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Drop the deprecated DRM driver allocation method in favour of
> devm_drm_dev_alloc(). Overall just make it the same as in Panthor.
> Also discard now superfluous generic and platform device pointers inside
> the main panfrost device structure.
>=20
> Some ancient checkpatch issues unearthed as a result of these changes
> were also fixed, like lines too long or double assignment in one line.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

I didn't do a thorough review of the diff, but I'm assuming it's
correct if the driver compiles.

BTW, I don't see it done in this series, but it might be good to also
turn devm_ calls into drmm_ ones, and dev_<loglevel> into
drm_<loglevel>.
