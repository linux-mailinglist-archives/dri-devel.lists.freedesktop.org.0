Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B3B261B6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D9010E832;
	Thu, 14 Aug 2025 10:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="EeSaIcX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFE410E832
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:03:15 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-32326e20aadso984026a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 03:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755165795; x=1755770595;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qEOB2W90rXksOFaGu/9jDWwkFfwmR8WI4O4PlmDtgps=;
 b=EeSaIcX8G7LD1wxugCayfpSUfLECkrkKL8ntIasMuusxw5AsD1xKXFctM9AL8bPbZ7
 BnsHu5VN+eZdT1dz3kr0SJ7BuHeXpNWFxbaI1Eq1klGu/aTrNJiIrEN4tzIxNrYVUYsQ
 nwQlo3lI+g61F/y2CktkqCKvz2sG8omC3ASskB1rtf06kwKMryNYzm3zlmtGz1MEWemB
 eQwFHMdFCaXVgk6MrMZUbDdstUOClX5GZjUK5mT6JikurcxsfF5xTxNM3EfTmx4L/lXf
 WtAZTjm28DKldAyGDjmB29Hs66qnNs2LQ5d0ZkuHCh5z/Z4Lf/sNkhXUx1/RSfKPZCT9
 XlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755165795; x=1755770595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEOB2W90rXksOFaGu/9jDWwkFfwmR8WI4O4PlmDtgps=;
 b=ElIJZrbPwufPm77nyCdUMiI/CGmiWMLp5ycx9F2plk34mv4tjbNQuwIXRLSDcGHUt6
 Xv91bsVN8xOM07VNJ3DK5apeknCR8X7RCcemREJEJAWrF1aLZyjwggz3nHCV1apQhz27
 2h8NhIq19Cd9G63D57EOTx1VqWn8seW5Xp/C9YGSWtR3sD7V3BrUAkXX1sGSUlx+ZcCc
 r46zyc/uAAGr/i+Yuf1ADgYgCPf8kJbVZbkduJRY5Av9six8LPHvUSJsiaccV3it3pp+
 67csN12RYyFj41yuHUN45yXzCj6ckEB4gTiNrYAD2uAs6y8lGNAVAkXGlhiTPgK+01IT
 VFwA==
X-Gm-Message-State: AOJu0Yzaj6c+tZQbDJ7wqDOgkyKprD0YxdbwZ4AHTtj5MgL5EDkKPtH/
 SsSH4dCYsUoct+lDAOOPhI/r8YYDQsX/Z04RpSbnApl8XHZuqlaq6bUQz/DcZOwGpRdcRT1a9fC
 mEnzvg7Zvn64/BpRQCaRWwqEhJY78/W8h0Cb7cG0yPw==
X-Gm-Gg: ASbGncsiceixGlh6EHE8wN+BeGECDN/g11p49mQsOeLNZuWY8NtMEWvH3FbsqOWxPv4
 rhNAccxrmS3OjbERJqWZOPSS8dYFnlseB898D6sTRy0qTN8bqQBWogZxHzO6u+nkj4H5dVsIrHZ
 ACfd0vVKwPbOZLeNsTAgN/2p8v7zOqhq+7sQvnMXk8tEmVeEOP5M3N8Ez/M7ILiQNsvDKwyZLmk
 XnIE3YRMBY6Lt6KzfNBOXPY+eSSIocLvqXQijNKXw==
X-Google-Smtp-Source: AGHT+IGq0iuvcuowtm8ET/jccUdzqV8iUXS1Y+csgeAsvZbTW155MIoBUP1CH9wGRBQrA3BJhu6/kGlkau3DMPsPGiE=
X-Received: by 2002:a17:90b:3a45:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-32327a86d2cmr3842904a91.23.1755165795078; Thu, 14 Aug 2025
 03:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-4-robert.mader@collabora.com>
In-Reply-To: <20250813170542.331206-4-robert.mader@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 Aug 2025 11:03:03 +0100
X-Gm-Features: Ac12FXzEgVA847APuGOktkZDcoOuwiYpoTqv6OSV89crcPR0hpZMSr51I0IF-TE
Message-ID: <CAPj87rNUg6m70Na_6NCuJ2kY4ofUaS10gZWr-vmmPQwKj68SbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/vkms: Add WRITEBACK_COLOR_ENCODING and
 WRITEBACK_COLOR_RANGE properties
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>, 
 Maira Canal <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

Hi Rob,

On Wed, 13 Aug 2025 at 18:06, Robert Mader <robert.mader@collabora.com> wrote:
> @@ -60,6 +71,21 @@ static int vkms_wb_atomic_check(struct drm_connector *connector,
>         if (ret < 0)
>                 return ret;
>
> +       if (conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT601 &&
> +           conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT709 &&
> +           conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT2020) {
> +               DRM_DEBUG_KMS("Invalid color encoding %u\n",
> +                             conn_state->writeback_color_encoding);
> +               return -EINVAL;
> +       }
> +
> +       if (conn_state->writeback_color_range != DRM_COLOR_YCBCR_LIMITED_RANGE &&
> +           conn_state->writeback_color_range != DRM_COLOR_YCBCR_FULL_RANGE) {
> +               DRM_DEBUG_KMS("Invalid color range %u\n",
> +                             conn_state->writeback_color_range);
> +               return -EINVAL;
> +       }

I didn't think you needed this check, as the core property code should
already disallow setting an enum not in the supported list?

As this only takes effect on YUV, I suspect you might be better off
adding a PASSTHROUGH or NOOP or similar value, which would be required
to be used for RGB framebuffers, with it being required to specify the
range and primaries for YUV formats.

That being said, I don't think these are specific to YUV, as RGB can
also have the same 16-235 squash applied to it. So maybe it is better
off being generic?

Cheers,
Daniel
