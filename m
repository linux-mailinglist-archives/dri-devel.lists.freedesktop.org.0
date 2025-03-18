Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F16BA676B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E7C10E4A0;
	Tue, 18 Mar 2025 14:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="Gokot2pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99C210E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2BF724107B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1742309012; bh=+EhGNEpSFKvod8JfD5aHgJIBk5oICr0X9rPl5M67D/4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Gokot2pnDJ3QNNtVXcwq1iNq9GhQQiqc3WDlJ7WLjF/INXzD0t8QM7ZMdrgXsCmgs
 /lX9TIKOSMZJ1XUWHHZ+Gwi7WVoTtN3sZXtpFaU1g/NT3EhVUfXNQSeNcZnxe3N5rv
 gZAyNge2EKyIZU4RBsD9X+nP1srKlKjDaaU/ubbb5CqFEHWjH5N1+JYv3e7o5y1xz9
 ysEtO3yNETqHqmAzU0TXDuZG/n7nyvbdKs6xH8Y2efUxorYL1Y15BKRTRaMW4wZM3E
 aOmbVpqO8Fsp/xqghVQa9y5TlK6Sbpho6YklTjhmbd84Ku87AqHJbzkG2dC+Pw03n4
 m2JuWsQDsMQEQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 2BF724107B;
 Tue, 18 Mar 2025 14:43:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH] Documentation: vgaarbiter: Fix grammar
In-Reply-To: <20250318041249.20786-2-bagasdotme@gmail.com>
References: <20250318041249.20786-2-bagasdotme@gmail.com>
Date: Tue, 18 Mar 2025 08:43:31 -0600
Message-ID: <87a59icsbw.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> From: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> Correct grammar issues:
>
> - Fix "co-exist" subject-verb agreement
> - Correct plural form of "server" in context of more than one legacy
>   devices
> - Use passive mood for intro sentence of libpciaccess section
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Link: https://lore.kernel.org/r/20250220164946.18007-1-pranav.tyagi03@gmail.com
> [Bagas: massage commit message]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>
> I have to carry the original patch [1] because DRM maintainers doesn't seem
> to apply that AFAIK. Jon, would you like to apply this patch before the
> merge window in case DRM people don't apply this either?

The DRM folks manage their own docs.  I'm certainly not going to
circumvent them during -rc7 for a patch like this.

jon
