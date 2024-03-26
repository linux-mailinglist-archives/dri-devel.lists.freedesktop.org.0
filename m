Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAA88BF54
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF05B10E572;
	Tue, 26 Mar 2024 10:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XrWLZ/p0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0DF10E572
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711448798;
 bh=Ufkhyldei9lgWlSrdN5/bzS4q1PlmwydeMttBxm5jDA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XrWLZ/p0SL1vC9suePIteW3t0c+F0fS6QxscxFZySrI0BCE2wkRtVZb00LoK8NTKV
 x/IjwdcCvLuphTjU17aQD/x5srAduK2fSfXXZl9rGSGcqU/X5vBGCOLwOGVZss/bMc
 6r6zHqjb2CHlP5RSoKSOGll+vKlEd9v2LJfvGAYTyR8Rsuwwo5JOvOeBtutIqXD6DF
 O4sYKmF40T78E0KwAE+GkbBK6oI0ADXsaVMFCbWtf8aNX6oCS5LfeWj/k4Ru1mUc4D
 qqr/xN7C1LjNnIGX8psTRnL9pI/dKim4K5tgu0LypI81mVkaEgT4l/7s1rEmSC2mMf
 VOoA1bjlLu+Dw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 271D437813D7;
 Tue, 26 Mar 2024 10:26:38 +0000 (UTC)
Date: Tue, 26 Mar 2024 11:26:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/panthor: Fix spelling mistake "readyness" ->
 "readiness"
Message-ID: <20240326112635.110302e1@collabora.com>
In-Reply-To: <ZgKgDZrUakS_pwBS@e110455-lin.cambridge.arm.com>
References: <20240326100219.43989-1-colin.i.king@gmail.com>
 <ZgKgDZrUakS_pwBS@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 26 Mar 2024 10:14:37 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Tue, Mar 26, 2024 at 10:02:19AM +0000, Colin Ian King wrote:
> > There is a spelling mistake in a drm_err message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>  
> 
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Boris, can you also pick this one up when you're pushing your kernel doc fix?

Sure, I will.
