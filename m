Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87A996EA0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855AF10E761;
	Wed,  9 Oct 2024 14:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ln+jJczU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33EC10E761
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:51:16 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e25d57072dcso6091482276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728485475; x=1729090275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnK4Qd0NK2VWISWf+NMyMxuUrE/d5YGupiOlwkYiync=;
 b=Ln+jJczU6bbomzFwEhUvIa5lplLHY/jb4gYC8Ynj1lahp44XoNMco3RhUOTXZsT4dA
 7p9jNE+49mZcNk9Ptp2FfKMNXM/nGL8GGZcenXqwuuy9BCL6ZEyM89mgwoRx743qam9K
 kkuZvmsqIVuOxUtn9M15vBBmNmyDl+nx2D41lv03rCySMT0U+qlBdl8i33uHl3M+Qop9
 5OmvBvQWiBM5RZYJJZXCLbbgtFMpEKQ0RncGdsO7VE1dZRP443g2hivPR/Yu01/7hcAq
 ifxxtIeXT/gY7/zy0VxTxmjRln3PvAsbM0WOKlQL2pzKG2oG5h0plwBWqo4srciMiupz
 IIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728485475; x=1729090275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NnK4Qd0NK2VWISWf+NMyMxuUrE/d5YGupiOlwkYiync=;
 b=Tb8QtctE6pLNYZnmx2pEDp20i6kFtbdqidd1D7R59B/CfBVA4raUjisE5f/zpqXshv
 8tivY5qcutf4m1DgETTMA1KZ1HLCSovnO0LIzL1a2D291+tOUuOofM2Qm5tUbQPqyB1w
 ECdUugx37ga8niGjejakpR6wVEfFBWAcON++5HxbKYLsOmpy2HuvqJ23iSXxUgpvQoDu
 tV9dRRLObgLrerAEhn6dhtJ4QMH6EbP34WqKlGhBokgEBprj3ZS5SIrxW9AT2g61PSAI
 ox+OXPFxiqq9L0MiOuUVMzaJckQG8rrXK83QKHDr/ugZO1CINl6ZmV4sIFLktULEX66E
 X17w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS/e9GKZ01gJgIrVzPfQRTpE0S8pdkvUpHplIEMogwcLKvWs39eteVdkuOI1yONLA3aTuID93ALE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4vdsW2NcWoKOC6STqmUQs79LRHFJtfxYsER2SpWOT3aiKlwXN
 UKNXv3GdT5QVRUEoJWH46JsRt2OugOBOHFGweAAg4IjhfeLd3PxOQ1SqEJb+kXFb54hMNW8RFL9
 skWB1cu05Prljpmd3iRY5eeQdJTO7T6LznauA7Q==
X-Google-Smtp-Source: AGHT+IHWR+l9TVLhwKI81YJZwQ4FdUGwlkUvH9zdhDLYQHfXq7nF6gQAGRoLeBekaJQJ1tJoG5t+e9hdUFmtqeHGoMs=
X-Received: by 2002:a05:6902:15c5:b0:e28:e470:5236 with SMTP id
 3f1490d57ef6-e28fe44a48fmr2606499276.15.1728485475507; Wed, 09 Oct 2024
 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241009141240.1948482-1-mcanal@igalia.com>
In-Reply-To: <20241009141240.1948482-1-mcanal@igalia.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 15:50:59 +0100
Message-ID: <CAPY8ntCsGuR5VHx33Hfo_LKRuFwON3ruYFO3z6GCYOdPzRRaVQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1=2F2=5D_MAINTAINERS=3A_Add_Ma=C3=ADra_to_VC4_revie?=
 =?UTF-8?Q?wers?=
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Oct 2024 at 15:12, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Although I don't hold expertise on the display side of VC4, I'd like to
> help reviewing patches that are related to the 3D side of the VC4 driver.
> As V3D maintainer, I hold some expertise with Broadcom GPUs and I'm
> constantly testing kernels on RPi 3-5.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 365fb0ce5117..a740b73e4ecf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7799,6 +7799,7 @@ F:        include/uapi/drm/v3d_drm.h
>  DRM DRIVERS FOR VC4
>  M:     Maxime Ripard <mripard@kernel.org>
>  M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +R:     Ma=C3=ADra Canal <mcanal@igalia.com>
>  R:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>  S:     Supported
>  T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
> --
> 2.46.2
>
