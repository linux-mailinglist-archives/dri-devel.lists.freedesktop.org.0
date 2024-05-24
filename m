Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C28CE64A
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8E10F31B;
	Fri, 24 May 2024 13:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BUGtP1dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F160510F2EA;
 Fri, 24 May 2024 13:44:53 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2bdeb6c32fdso1364124a91.2; 
 Fri, 24 May 2024 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716558293; x=1717163093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/zRPEK4vrpDADuLrDbT9ldxIUl5LtaBJ9hW8O0AF8E=;
 b=BUGtP1dCBgnED22gs+hjyzQzXaGkpgwXL+6hm+vbZ4biVeM5LvIKAwhFuz59KtFL11
 kwskXeYTROUCmXGAoy/TveBvd0A/dJk4dQpL60HAh8BbXhctuQw17o/tHVl5b84unyKa
 AMkL90ivVAlP5HI1t+HyEyxWq+/9AQVwVXgr5zToyTomvditQkSbSuQTVgjhoqn8Udyr
 7g5TRcv8LG64ulcekEsJPlNA5RxhM8dK3ipRyz5kXtqdyQw1Dr5garvWQasLjDliWoLV
 6/NFZp/QJJzS2xnIHf1h3FpQiwTZlQqQE/FyzGYa1yvg+PSCdxV5wmr/RJSYqXJWDtqI
 q7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716558293; x=1717163093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/zRPEK4vrpDADuLrDbT9ldxIUl5LtaBJ9hW8O0AF8E=;
 b=vRafzs2ig6C4gRKDl4Nm2HQjTewHqCCHp/6gb4wtqUOO7jt+dk5BpT6NSZbOnycBSy
 hbWXuPoDKQRezgOTpruIWYAfLA4srskroaOGt/xqff40AhuyJKFC759Ytmdb9XVvwSML
 /VdDMbl1o5j9+15LLBGwlKM2lQ2Xsvu8p0YaiK+3BoqHiJAg65GQRwSDaFsW7XmYcmrY
 HQQ89aRhAEQaFk6obKcPbyFk2gzmGQkT1qL8JTDMCmnLiHlzjqkFU+deelO37/TpG76D
 76YxGvIOFPXsgRy7EYd7loolIUMUayA7fbR8IPJIIW7FayQFJu1QWTXPcaoirKXhq3CQ
 NFJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBWpQ/nbdEbMUaOLiuoB8djdPL3OBqM5Z+Wj8/MA2JnDmCNm1XQDgnJ5TwaYDkXc+YUFssXD8EolEWrMRoLRHk00vIKE6NzlRc0gco2BLiRlpou6aQXm0UXNghw4a3usCKhryi5+PL0LFEFnDeKQ==
X-Gm-Message-State: AOJu0Yx7y2QzpU3xR6M6eFLGnBlSYpLj9vzBxoamgZt8HrF5lAiiBmM9
 mCaQjvWOIjyrGU90PTK0SUs4bNzItCdTZTWiQ1BzlvDYu6xUSYYExvqlHB4wJqvDrcCiM0pL4Xs
 FqedWVWv9Xu/M3xxlREFnNHz5Oow=
X-Google-Smtp-Source: AGHT+IH4zyIH6ONvvDrxtjrqQxGvSq6pvYG67jVQYsK3CkygUktTLOWiWqxCX0URSxq0sqp/vrHGUwVVh9lyOWZ7KEQ=
X-Received: by 2002:a17:90b:310f:b0:2b2:9a77:3371 with SMTP id
 98e67ed59e1d1-2bf5ee145a3mr2085056a91.12.1716558293449; Fri, 24 May 2024
 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240524021920.95328-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240524021920.95328-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:44:41 -0400
Message-ID: <CADnq5_NaTbS-3tJGUg1Tr5-uEmeRg5cqvyYGezqPLcbxmmCy-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
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

Applied.  Thanks!

On Thu, May 23, 2024 at 10:37=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:5200 dc_power_down_on_=
boot() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9166
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
> index 3a2101b052ea..4612c60edebd 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -5194,9 +5194,7 @@ void dc_power_down_on_boot(struct dc *dc)
>         }
>  }
>
> -void dc_set_power_state(
> -       struct dc *dc,
> -       enum dc_acpi_cm_power_state power_state)
> +void dc_set_power_state(struct dc *dc, enum dc_acpi_cm_power_state power=
_state)
>  {
>         if (!dc->current_state)
>                 return;
> --
> 2.20.1.7.g153144c
>
