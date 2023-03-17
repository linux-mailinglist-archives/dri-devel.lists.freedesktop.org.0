Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059886BF2E0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8310EFA0;
	Fri, 17 Mar 2023 20:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B7210E40C;
 Fri, 17 Mar 2023 20:42:37 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s41so4694318oiw.13;
 Fri, 17 Mar 2023 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUJVaBXdObXA4ldog+BJEDwTdtw7N3EL0ShGrYOtj+I=;
 b=d/Cc12ya7XgJy0UnQCXADw7lsc+9NlNtrM1BdzJttoDTV4DsJ/Hu30bLEwOWupPnFK
 mPpEK2LqAdLkSPWT4a7PyKoFB/6n2ly4RkjEzhSQh9fUuMAdMdmv8ZZdndsHa94dXk6A
 HOcrlxPXlLELD9V/Ytjquor/IOn4QbW0kCRz18zo9axdfd913zhqz4E07Dl+vm+riahi
 XAPJP4L9uRUCyi1XGjCgf60xQY/6JOD6X8w1dQ0Daub/Qs6Me+cr7vTCl5TzhXeHC5Cm
 3bQnRjECsMEDVQ6oJ+1YZ0trL7Yphsutondl12rye5268ojfXS8bKLk5SmwHfAwCmqzp
 hqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUJVaBXdObXA4ldog+BJEDwTdtw7N3EL0ShGrYOtj+I=;
 b=5F3SSmv1hJdlTxYn+eslPdRud8V5yksIcZzyilX6WF8TFcdWD5LVi00HEN9Z9utmSp
 1cQMP672GrlwlJzS+Zd/XQkhlexsYbMZhDTSmkIN8DlbEfkej0V+2WdvESrjHmh1F4WF
 KcJixqNQ7d1uhkH39aBkqzu6FYSTw3knbl7D/nJWwM1kKYWIYMDdzDLC/L4etJkOD52T
 +Fa+Wj+FxxEjFZ7gkBcyZPyp7HaUXWibSnbSs2DUrqz5vWL9+uIgQ8lVACEqWLVp4YDW
 jGiuBYEbFbxgEudUSBJdB7Rgc64cERJ8L2wwZr5YeZhp2Jc4m+YuBe5H+Y7D/P/6vIw8
 NRqQ==
X-Gm-Message-State: AO0yUKV2Ap9jCncF+nZ1QrUoW32U/vVSaEesUgwBs1TXvqPPsy2jxyie
 +Rda7n9vw+EUiEdDCBFKcbrKCqqSanfrxkgarbw=
X-Google-Smtp-Source: AK7set+ACaGdTsAK0eKk5mEFKIx3vKcncQ7us/VLfZCAiBPmqInVi2czONG/xoFan8fDz51JfcdvYzU5b6P9dXYqLCk=
X-Received: by 2002:a54:449a:0:b0:384:692c:56c9 with SMTP id
 v26-20020a54449a000000b00384692c56c9mr3627797oiv.3.1679085756498; Fri, 17 Mar
 2023 13:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-34-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-34-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:42:24 -0400
Message-ID: <CADnq5_NgE=QOyFGnomRhBg1-7iJrzyTJt+rOTgjHpKvuC8bJ=w@mail.gmail.com>
Subject: Re: [PATCH 33/37]
 drm/amd/display/dc/link/protocols/link_dp_capability:
 Demote non-compliant kerneldoc
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabili=
ty.c:2190: warning: Function parameter or member 'link' not described in 'd=
c_link_is_dp_sink_present'
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 51427f5081642..2a2443535b676 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -2177,7 +2177,7 @@ bool dp_verify_link_cap_with_retries(
>         return success;
>  }
>
> -/**
> +/*
>   * Check if there is a native DP or passive DP-HDMI dongle connected
>   */
>  bool dp_is_sink_present(struct dc_link *link)
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
