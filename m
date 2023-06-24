Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6830973CC9F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 21:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDE10E0B4;
	Sat, 24 Jun 2023 19:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057F10E0B4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 19:45:46 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QpPjP5cY2zDqqn
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687635945; bh=V7WI92STsY+LFKBjtFVzb2X+LNKwK7Zq7YXhbqwLAxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DAtbcy3JidWBm6LoYyceLtyMGsPmXVcMyoLRfPstWrNBXp4nFit3I9y78sUfAmpvX
 AH9WjtKebdtQGvghcDWoLHPqhmNIdwnqiVSKkTROhP/Hl7lWvAoFUNClTABSs7Mcm4
 VJlzQbn6z1SyIcEzDFF/pk5t4Xy7TZyZTFJ6hUQo=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QpPjN5d24z9sY4;
 Sat, 24 Jun 2023 19:45:44 +0000 (UTC)
X-Riseup-User-ID: D86AE3EE2C3073DE270B12E6F65EE118745D8582CB16D7AF2B25CEEDCE117D9B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QpPjK50NlzFpkL;
 Sat, 24 Jun 2023 19:45:41 +0000 (UTC)
Message-ID: <1b6ca402-a931-612a-c22d-ac78ec42afc2@riseup.net>
Date: Sat, 24 Jun 2023 16:45:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Fix swapped test parameter names
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230623152518.8603-1-gcarlos@disroot.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623152518.8603-1-gcarlos@disroot.org>
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
Cc: michal.winiarski@intel.com, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

Great catch!

On 6/23/23 12:25, Carlos Eduardo Gallo Filho wrote:
> The "YVU420 DRM_MODE_FB_MODIFIERS set without modifier" test
> hadn't DRM_MODE_FB_MODIFIERS set, so that it was in fact testing
> another case, while the "YVU420 Normal sizes" test in turn was with
> DRM_MODE_FB_MODIFIERS set and without modifiers, what should be
> the case tested by the former, which also in turn fit in what
> "YVU320 Normal sizes" should be, meaning that they were swapped.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

With André's comment addressed,

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index df235b7fdaa5..f759d9f3b76e 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -178,13 +178,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
>   		 .handles = { 1, 1, 1 }, .pitches = { 600, 600, 600 },
>   	}
>   },
> -{ .buffer_created = 1, .name = "YVU420 Normal sizes",
> +{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
>   	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
>   		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
>   		 .pitches = { 600, 300, 300 },
>   	}
>   },
> -{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
> +{ .buffer_created = 1, .name = "YVU420 Normal sizes",
>   	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
>   		 .handles = { 1, 1, 1 }, .pitches = { 600, 300, 300 },
>   	}
