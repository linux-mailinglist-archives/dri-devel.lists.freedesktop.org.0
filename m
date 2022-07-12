Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9C5711D3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 07:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93D113231;
	Tue, 12 Jul 2022 05:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEA41131F3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 05:29:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i128-20020a1c3b86000000b003a2ce31b4f8so6096118wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 22:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Io6RTZE60SvPtzfl8Dwm+AesX4Q9CRLNrTuqz3l+qg0=;
 b=Qy2pxTIDUhMcsrUj9m9+hKPul6UxVB+rIB5xK1BX53iPqa4Kj/PE67MjJsTMNkepFs
 C3Hg07/0BMsdINcb+ODlseHtuCnrkWEnUAIzVa5/vjLkhOgjvcqTJcbNiaBNNVnBifB3
 70dBirHYnACWQ/iJuTGwU9BSTP9l+HheELEyKL8skCvIx5OGrsqQjCBZYTVVAz96SI6g
 KCE1eqBa2i4GLSOStPR80aBR1Rwkwtej10rTgAf05wH3i6g7z5rIM99Uzu4AXZ3ByqHT
 KwvUC99jMfOJOYSJGhpl4IQjG/tXUKoZ+tDn9D+fCBV5ngFDEpttivrImYgsYTU6JdiU
 0GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Io6RTZE60SvPtzfl8Dwm+AesX4Q9CRLNrTuqz3l+qg0=;
 b=3LFXv7p7p94me8/4am/6WNOSF2drZM1HnhzgdfM7O3xjLhzFoaRMhvLXyfo/L8rsY4
 YecH51aWoj4ss2DUI4IPe8bCpvuC49qtvUaM3gzdbgNp8Di3mAMNyMV2H8ML7TaAZ+Pf
 OGXonBj+KuJ+wpdVzfUSWCf6mKVnC7SRt7bDsnhCOdapqC08gjOoWbmLOHMEkLeJwcLT
 vFEinhvFWDT7VelIvzW0fVsF9EeiIlMx2YezHp61CDw91bg8AOXxyfqRt/JjlJmD52vx
 X+Dzzrg1UIvpGrMKN5zkLRiduCFsuWkxpB/HiF2oeYkxh3apcqPykVYVw3BFjT4YEQAT
 jhoA==
X-Gm-Message-State: AJIora/SjVRudWKzz3WBZNpoBxQimsPkszB+OVR1ZzyAmaiRDNWC57Ab
 hoBPwrWNngZJkSaBJp12LFtZfxuPpB1wG7MbiXMi
X-Google-Smtp-Source: AGRyM1uoa3h801J1LOR4UOkbUc3ab3I4GoLHFV24M189awXOGbaMINiGcQqFZ7RZGX/UyNDGs84MIhCLAx3C16hS9VU=
X-Received: by 2002:a7b:cb8e:0:b0:3a2:da0f:d8ae with SMTP id
 m14-20020a7bcb8e000000b003a2da0fd8aemr1847538wmi.23.1657603754324; Mon, 11
 Jul 2022 22:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
In-Reply-To: <20220712042258.293010-1-jstultz@google.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 11 Jul 2022 22:29:02 -0700
Message-ID: <CANDhNCrq16wedmvZbvyRzwVaLmc1STmAzv0nBLOcVnz-SRf4Bg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] drm: drm_syncobj: Add note in DOC about absolute
 timeout values
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 9:23 PM John Stultz <jstultz@google.com> wrote:
>
> After having to debug down through the kernel to figure out
> why my _WAIT calls were always timing out, I realized its
> an absolute timeout value instead of the more common relative
> timeouts.
>
> This detail should be called out in the documentation, as while
> the absolute value makes sense here, its not as common for timeout
> values.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Chunming Zhou <david1.zhou@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 7e48dcd1bee4..b84d842a1c21 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -136,6 +136,10 @@
>   * requirement is inherited from the wait-before-signal behavior require=
d by
>   * the Vulkan timeline semaphore API.
>   *
> + * It should be noted, that both &DRM_IOCTL_SYNCOBJ_WAIT and
> + * &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT takes an *absolute* CLOCK_MON=
OTONIC

Gah. That should be &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT. I must have
pasted in the wrong symbol.

Fixed in my tree and I'll share v2 in a few days so I can get
additional feedback.

thanks
-john
