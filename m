Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF273BFEB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1F910E6B4;
	Fri, 23 Jun 2023 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0710E6B4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:34:43 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QnprL69P6zDqFM
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687552482; bh=NtqA4hn3D3Ss+cbk1nkcqgTOaPjaLOgaJxz0NZsJ7lA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FDPA4TiPFl3JMcD3RBy3q5LmWuI70E73F2R5RLsTVCKH3UHJQlpTn6ldWus+v+Hil
 U4TUlVVnIPH4jOuBrrlVxGgrNa36Zk+Kmp9PvKU0KUQLZZqEGNJPoMz4iXpOuybs6T
 xTpwcfMbZoMijkvQltLeA2tVlyfYSxAUh0kVmGQk=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QnprL0QlWz9s7P;
 Fri, 23 Jun 2023 20:34:42 +0000 (UTC)
X-Riseup-User-ID: CE042D7AD9C6D5E67CD25FC9C1F5B06E2072D41FD58266C7539BAEE205DEBCB8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Qnpr42SFTzJntR;
 Fri, 23 Jun 2023 20:34:28 +0000 (UTC)
Message-ID: <e12169be-a639-fec7-2c38-b2321f5a4a8c@riseup.net>
Date: Fri, 23 Jun 2023 17:34:26 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Fix swapped test parameter names
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
References: <20230623152518.8603-1-gcarlos@disroot.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
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
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mairacanal@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos!

Em 23/06/2023 12:25, Carlos Eduardo Gallo Filho escreveu:
> The "YVU420 DRM_MODE_FB_MODIFIERS set without modifier" test
> hadn't DRM_MODE_FB_MODIFIERS set, so that it was in fact testing
> another case, while the "YVU420 Normal sizes" test in turn was with
> DRM_MODE_FB_MODIFIERS set and without modifiers, what should be
> the case tested by the former, which also in turn fit in what
> "YVU320 Normal sizes" should be, meaning that they were swapped.
> 

I think the patch is simple enough to have a simple message, the diff 
itself tells a lot here. I would write something like this:

drm/tests: Swap drm_framebuffer tests parameter names

Swap tests parameters names so they actually reflect what is being tested.

> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Anyway, your version also works for me.

Reviewed-by: André Almeida <andrealmeid@igalia.com>

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
