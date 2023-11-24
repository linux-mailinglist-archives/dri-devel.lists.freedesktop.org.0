Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1A7F71B7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B1510E1A9;
	Fri, 24 Nov 2023 10:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6B410E1A9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E55E62135;
 Fri, 24 Nov 2023 10:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0480C433C7;
 Fri, 24 Nov 2023 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822428;
 bh=y+1TDiBAnMt4VxdCKGR5QS2biqH47tvAiQJ9i4yez2Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=p/qa+RJdm7WokbrVvywi9obaB050hb9y0zng38ZwWloP45PRz9232CjxOYzodFL8L
 gRibElH+QG/dcvyBOrWEQED3vZjkhgtvRO5jbcTTOzHXl8kJR/SHt51HgicJgDeK6t
 FnC5SWQYnR15tJhpZFgGipbCieJveCjAfpWuZzbnyF8RPh5dDt99LCC65nIFbYNSp6
 FiGYFMdrKwQ+xpUTiO5gbQVwNBlfKEcl39Y3h01GRO/KwBKd71tFV3ohenFQK4m8d0
 RyxAnwN1W8Rv+7n6JjcXMwcWRNcuP1XBOes1rA1hxsvmlCZYCapgbcKHVP/vT17+SO
 ojiNCUBS7DoLg==
Message-ID: <74226af80ecee1c3544c1bcf66565514.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:40:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 05/26] drm/shmem-helper: Remove obsoleted is_iomem test
In-Reply-To: <20231029230205.93277-6-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-6-dmitry.osipenko@collabora.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Melissa Wen <mwen@igalia.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Gerd
 Hoffmann <kraxel@redhat.com>, kernel@collabora.com, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 02:01:44 +0300, Dmitry Osipenko wrote:
> Everything that uses the mapped buffer should be agnostic to is_iomem.
> The only reason for the is_iomem test is that we're setting shmem->vaddr
> to the returned map->vaddr. Now that the shmem->vaddr code is gone, remove
> the obsoleted is_iomem test to clean up the code.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
