Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB317F71C1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39C10E1AF;
	Fri, 24 Nov 2023 10:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665BD10E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:41:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 69798B8165B;
 Fri, 24 Nov 2023 10:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DADEC433C8;
 Fri, 24 Nov 2023 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822468;
 bh=B9wGFKlvp/YZEopRaAvdU1A2HubEm3DJLIXAlfjLLZA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=L69sDpmu9gMgz1zrB8/1oyyUf/W8N4ry1cjMHW049czR5sJm4eG5fugpYRBBKZuv4
 W88Pn8p+EOJyPbq8U3moFuVR220+C6w/WiP+epLu7J+0iNf7PDI0lwF2DcW3NIw39D
 oSuL+Rnu1jyCxKR9e8SbLyIpSdpje4k2huqZftU98Q51+pi9Y4JzU/DSGgcPO+RS0J
 oV+SH4b3cmrABZlj9GcxMMSueE17XDXq0dpYHnUQdXAXR3l2CjBuGCwc5DUEm2Arh1
 jc8FmE9NPKOLuuCHWVN5ectENAGY+uVpxn2/AWtRT/wbYAGkOC1qb4Wny7CPDFF+TH
 lHPyI9A+eZ8wA==
Message-ID: <5b594d30e08b4acaf7aaf9b7a4419d2a.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:41:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 06/26] drm/shmem-helper: Add and use pages_pin_count
In-Reply-To: <20231029230205.93277-7-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-7-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:01:45 +0300, Dmitry Osipenko wrote:
> Add separate pages_pin_count for tracking of whether drm-shmem pages are
> moveable or not. With the addition of memory shrinker support to drm-shme=
m,
> the pages_use_count will no longer determine whether pages are hard-pinned
> in memory, but whether pages exist and are soft-pinned (and could be swap=
ped
> out). The pages_pin_count > 1 will hard-pin pages in memory.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
