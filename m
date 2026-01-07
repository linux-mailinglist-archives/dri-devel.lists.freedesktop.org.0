Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC6CFBC25
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 03:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8256810E1A1;
	Wed,  7 Jan 2026 02:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kDzPTVZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0C710E1A1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 02:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2090C43E0B;
 Wed,  7 Jan 2026 02:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893E7C116C6;
 Wed,  7 Jan 2026 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767753649;
 bh=qP0pTeKUriG2/L9LxZppVuDsYebvRXZq6TKw7CjpZF4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=kDzPTVZUrtHErqpNoei13hdQ4Niojt0x4jHkZULcTw+Ft/TirZSnwhBx/kja6PyPt
 EfzXEbRforxo7D9wKh50PB+4iiMC1rLF22oUyzJ3kXT0w4sGH4a/Ppk1kwwd2RbzBs
 Zn9Mo2nq8xolQb0HUsCfqtaP4rkdowIuEudJ31ChG0mub9iIuWrJrdd+rZ4Deqs+Fl
 g2bF+xbqsfVLz2TBcP/AUfOdw57Jy+r8gDJTgcZSdnmjVcR/SeQ8MCtCZqv0VSOEVx
 oZhJCXdu/ammLyrpp/egOXpLY4l+Zd77V0v6bfSMWYz2yH5xVh1cq//ibuRgzagOEt
 gtJKTPAbr/9sg==
Message-ID: <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
Date: Tue, 6 Jan 2026 20:40:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <894581a9-2a30-428d-ab94-34697147d68e@kernel.org> <aV1xe09kYUwj4ocm@bywater>
 <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
Content-Language: en-US
In-Reply-To: <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

>> Yes, that's the idea. I am still searching a EFI-enabled platform I can
>> perform some proper tests on, as I'm not really familiar with EFI.
>> This version was tested with OVMF on QEMU, but without a real userspace.
> 
> Almost any modern x86 platform except for a chromebook uses EFI.
> 
> I'll add them to my local dev tree and test too and see if I can get you 
> some feedback if I run into any problems.
> 
 From my side when testing I hit this during kernel build:

ERROR: modpost: "bgrt_tab" [drivers/gpu/drm/clients/drm_client_lib.ko] 
undefined!
ERROR: modpost: "bgrt_image_size" 
[drivers/gpu/drm/clients/drm_client_lib.ko] undefined!
