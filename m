Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D667965219
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE2810E715;
	Thu, 29 Aug 2024 21:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AmS+Tpe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8AA10E715;
 Thu, 29 Aug 2024 21:37:35 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7cd94fb88cbso121777a12.2; 
 Thu, 29 Aug 2024 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724967455; x=1725572255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqDs1AXQAfVToI31sahYYzMYjpkf0HNQiurR5mfvYPc=;
 b=AmS+Tpe7lgtajc92+5cWvWVbwvghx/yU0d4f8RjPa/utdfnYKcmTwZ3MAdhYLsJbWd
 2CkaY8t9EiF+VIQaGBebwLBn0c0KWiIMekUuONmV2aA/maac2F9OPqcE4g7AfU6neUO3
 omBfsO9ylsaeF4zvL7EJ1LHHldPNGUn5oSahCsle2OjNQtSAnScfEBMTRTr5cTXoKZYs
 rsSpbZCKaW7O7SYEEiagUOI77/FP4OWQFIjE2+Q1/zDyao3TSGdlJM4Xg4Tz4lStSGNn
 7sqQEmwH/sug6R8KzHZFHGir7oxkDOvcIQ8TjMtNxKKNxsK4YA+O3f8aqhKwk0l77riq
 hGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724967455; x=1725572255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqDs1AXQAfVToI31sahYYzMYjpkf0HNQiurR5mfvYPc=;
 b=j6G5MMIMR7wwradPTG6ys07ZFyscS/NW191lC+l02SbD9EO/DuV29iZjvaFkSnp6c5
 8f7EqJMT37pnmlMAsN2/nIsKK2XxiGJ4AUH3vEvPRkx4gIc4sEJjwf9rbxmDBffaKqBu
 tjMIBgAaYnGiG1O3JcEJSwJiFRW9Ve/iCCD4L31WF3ntihqpw0OxCWJPiO5yBpUmd6F+
 8+bb8ohSJ344HxLsXGUGQq2JIBwTVup1jb0V8j9IgxEFhG68FILxE7bvme0rQuBp7wl0
 cxL1sqRjV/Dd2P+rl8GheA8kRRT9MguwbbKK9KfS8w6MJD7JcltBnSVPNX2L8a0Wdm77
 L7+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/gCIgSa7egVccca1HPOYgFcHEx42q0RGhCff26MLrud+jRY/Vv7VASxQiDhHDVg7Ro/0lD8im@lists.freedesktop.org,
 AJvYcCWTdew1lFI8SKtMD2NQ5wZ4Lud8JeITeggC9N2CvJo734Z8vOoeOmIhmN+YR0DzNAdh7LbwvlFCrdTh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoACq6JMMOBc0oAX9RM+5g2MqHJM2ueM/Csaxsg1oU5f/Iqgtc
 oiSrO9e6Z3VuaRx8Y2RUg/f3+JKwqpa+6V+NCyJwkXi3n1T91ShsfgWf+/hUSvYdDPu5ctdgZG9
 uPysUrMzta3fqPclczclDijIT/yI=
X-Google-Smtp-Source: AGHT+IF7TMIVRf+RSqmC2FIwf/+gi6PfP2SWSDN8W2wiDyjbh+vA/0OZKN9uQcvOoNzVjzrsTwMTmzexHIry8tIu54k=
X-Received: by 2002:a17:902:c409:b0:204:e4c9:ce9b with SMTP id
 d9443c01a7336-20527300e77mr1308605ad.2.1724967454478; Thu, 29 Aug 2024
 14:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240829023654.20884-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240829023654.20884-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Aug 2024 17:37:22 -0400
Message-ID: <CADnq5_Na=-KTEOJT6y8EzQdk_wewFBGs5Or1j5bfVA1wO0PTCA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove the redundant else if
 branch in the function amdgpu_dm_init()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Wed, Aug 28, 2024 at 10:37=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The assignment of the else and if else branches is the same, so we
> remove it and add comments here to make the code easier to understand.

I think the code is clearer as is.  If you force IPS on, you want to
make sure it's enabled, regardless of what the default ends up being
in the else case.

Alex

>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1871:6-8: WARNING: po=
ssible condition with no effect (if =3D=3D else).
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9829
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e14c0c060e1b..71624917c475 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1868,9 +1868,7 @@ static int amdgpu_dm_init(struct amdgpu_device *ade=
v)
>                 init_data.flags.disable_ips =3D DMUB_IPS_DISABLE_DYNAMIC;
>         else if (amdgpu_dc_debug_mask & DC_DISABLE_IPS2_DYNAMIC)
>                 init_data.flags.disable_ips =3D DMUB_IPS_RCG_IN_ACTIVE_IP=
S2_IN_OFF;
> -       else if (amdgpu_dc_debug_mask & DC_FORCE_IPS_ENABLE)
> -               init_data.flags.disable_ips =3D DMUB_IPS_ENABLE;
> -       else
> +       else /* The branch cover "else if (amdgpu_dc_debug_mask & DC_FORC=
E_IPS_ENABLE)" */
>                 init_data.flags.disable_ips =3D DMUB_IPS_ENABLE;
>
>         init_data.flags.disable_ips_in_vpb =3D 0;
> --
> 2.32.0.3.g01195cf9f
>
