Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEA7F7194
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2710E199;
	Fri, 24 Nov 2023 10:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7481010E199
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:35:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D172E62123;
 Fri, 24 Nov 2023 10:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F3BC433C7;
 Fri, 24 Nov 2023 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822102;
 bh=bTOxPls9oEkOieAEKp1Eghoi+o3SdE6s04+l2qTLwmI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=F9d7m5tbfY6gNbZF9XgVO1y+R9k+ex3AqCRXvGShoG0t+9OreKJiWv3QNy9GnkyGk
 NGDNHUrOaTe4rDjTw4xY9KM1GlAVOLSn3tlsbIMr3QxYU3lhENxdFuqoLxREuNN97u
 zk65Ks5GpriKZOU+xFmBGVIZEhGeJ6HKo6gx1Ter+4tybGidopeB7aTm3vEnMtBu1N
 QTbztPv2jARzk6e74b4e3ElK4nzgl2V6CKJBuUNxAZyvEav1wQhYmmm3F/LqyVqL9a
 r/x9otF9P46BK96skhK4aQ96UVfbSoKBNUxOf7Y1zTB48LehKDNtDnCXCvcAS0aslF
 gniFuG49No6MQ==
Message-ID: <18807000ad1d33a0925c5470faf20fca.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:34:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 01/26] drm/gem: Change locked/unlocked postfix of
 drm_gem_v/unmap() function names
In-Reply-To: <20231029230205.93277-2-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-2-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:01:40 +0300, Dmitry Osipenko wrote:
> Make drm/gem API function names consistent by having locked function
> use the _locked postfix in the name, while the unlocked variants don't
> use the _unlocked postfix. Rename drm_gem_v/unmap() function names to
> make them consistent with the rest of the API functions.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
