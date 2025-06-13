Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81BAD944E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A4210E29D;
	Fri, 13 Jun 2025 18:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="okt96YJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EC510E29D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5vY2kkJX2niFeYfhdXyuGdj8HrH8jVTbOhtgn+Wv6/g=; b=okt96YJufFKz1XVluffH/JbJpr
 uhkWOkC4jeUzeKyZeAA/otQSm6h92RID8nOq8qSBWroEc3fr9HvAgnA9pSu6h+0Kkhd7p+IEeodnI
 93pEN2S0e75kUpfjqUZZn1O1TZ8ajtZlPxvejZXI/uy/1UWAzJWAlAsOFrU4WEUPrk5iBWlPWzC3O
 jCXj96UynJsSOQshvlFJx6MxmWHujkGbLzna14m1bRrovsVVDDqo6dNlHFRyEvKYHfoblQVSL/n3X
 Io4B5cqpO4+xONkAjvynBmhcVeHdon3tPzkrRJU5F0FWDsXKNfKZLEucwpBndILe210j3am/ffhZe
 gaPY8PfQ==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uQ8zz-0039nT-CX; Fri, 13 Jun 2025 20:19:31 +0200
Message-ID: <11d5ca25-0fb5-4a37-8bd2-ec3eff117a16@igalia.com>
Date: Fri, 13 Jun 2025 15:19:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: Fix includes of <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org,
 simona.vetter@ffwll.ch, maarten.lankhorst@linux.intel.com, airlied@gmail.com
References: <20250612121633.229222-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Thomas,

Em 12/06/2025 09:09, Thomas Zimmermann escreveu:
> Some source files in DRM do not include <linux/export.h> properly;
> others do when they don't have to. The build scripts now warn about
> these cases.
> 
> This series fixes DRM core and helpers. There are a few more warnings
> in drivers.
> 
> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
> <linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
> check missing #include <linux/export.h> when W=1") added these new
> warnings in v6.16-rc1.
> 
> Thomas Zimmermann (9):
>    drm: Do not include <linux/export.h>
>    drm: Include <linux/export.h>
>    drm/bridge: Include <linux/export.h>
>    drm/client: Include <linux/export.h>
>    drm/display: Include <linux/export.h>
>    drm/gem: Include <linux/export.h>
>    drm/panel: Include <linux/export.h>
>    drm/scheduler: Include <linux/export.h>
>    drm/ttm: Include <linux/export.h>
> 

This series is:

	Reviewed-by: André Almeida <andrealmeid@igalia.com>

