Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9F28CF02
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 15:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640CA6E328;
	Tue, 13 Oct 2020 13:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574FB6E8E5;
 Tue, 13 Oct 2020 13:16:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f21so20865357wml.3;
 Tue, 13 Oct 2020 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9lW4dFaX7zENb53L/tQnCRjjQKB77rHKz+r8ZW7p+KU=;
 b=jRefv6wAPkcjLEUrg0lsNRz9xZOtlpZDjYV+z3w6hlJEqA1Q7SlQci9S23IZDlN4g9
 YYKyAYrbFJeNahTRsWVlqLuzAg/ijzeiNIzS48rkdpij1Mr2HQ6Eml0/tVlzAgT75FJm
 yl535TpmDxaFlxWTsZ43ezYar43gYHtTS6n4d7Eya86vLdRMJQqsD8+pHEaWqmeZjOvH
 gG3OaRmNLazhAIcYmuOkCdyrSSjDTvdpa7+yYxZ7I/r/pFZDTOI9DeA1B6GP7qCEH7Ou
 AAFTpHdHdB4waig/dVUS5GU1XaNl+Z3jb+Y3jSwEp0V3XB+SMQt2QwfsjpD4a+WmQ0fJ
 1lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9lW4dFaX7zENb53L/tQnCRjjQKB77rHKz+r8ZW7p+KU=;
 b=Fwf8v0pg7BnDly1UJ3VdRRjus5mdyNEx5oDzuq3mCcq250ZXHriqCzGqMUJb3Cp562
 6RdBuB5MySrvgMLeRJDv48hWvt3M2g0LNQeEC5qrJ9p0VSUpQlcOzDa46elEcJd3Tj6F
 TvqQK/eUYpxzXr03tO2EkpcuUbYFr783XTqIFC8yVjkSnlym544X4+xFb7XdfqGcOH6L
 d6PxAS4BZLxFpnHwPa5Is+N0iZFUSjEL7d57+dEYs+Lx8AP0pM0OVUS/+ucD2y92UoeQ
 8Cskuc4CIV8FRQWZ5Q95akk+FTkl6x8HRgGjIMjQNppT8heTO/IvIJ4fuxAPqd0O6EA+
 80xw==
X-Gm-Message-State: AOAM531yhKmpzlanYiwNS4giG7rkpoOGPky1RbWKKLva2tExhFo2r2Ko
 3c6bTYfY+MPadKJ1YLeDzxYUUyy/rAyf02IUIOenqJ4y
X-Google-Smtp-Source: ABdhPJyF/ftciBqzh4ch1CG+SWuyn6xuAXkHcUCbsiHDWmq1tOGg12CynfIElRQkbmq/7l1KZq6D6ByKciowJMl1XDo=
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr8363338wmd.79.1602594975661; 
 Tue, 13 Oct 2020 06:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <5698741522f375b5687860b597ecb786e14dfc82.1602589096.git.mchehab+huawei@kernel.org>
In-Reply-To: <5698741522f375b5687860b597ecb786e14dfc82.1602589096.git.mchehab+huawei@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Oct 2020 09:16:03 -0400
Message-ID: <CADnq5_NCgoqbBc5LG2QANh9n14h7RO1A5eZ8Dn95EkHCiRfWsA@mail.gmail.com>
Subject: Re: [PATCH v6 72/80] drm/amd/display: kernel-doc: document
 force_timing_sync
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Oct 13, 2020 at 7:54 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As warned when running "make htmldocs":
>
>         ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:345: warning: Function parameter or member 'force_timing_sync' not described in 'amdgpu_display_manager'
>
> This new struct member was not documented at kernel-doc markup.
>
> Fixes: 3d4e52d0cf24 ("drm/amd/display: Add debugfs for forcing stream timing sync")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index dd1559c743c2..fc7e3e9fd719 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -149,6 +149,8 @@ struct amdgpu_dm_backlight_caps {
>   * @cached_state: Caches device atomic state for suspend/resume
>   * @cached_dc_state: Cached state of content streams
>   * @compressor: Frame buffer compression buffer. See &struct dm_comressor_info
> + * @force_timing_sync: set via debugfs. When set, indicates that all connected
> + *                    displays will be forced to synchronize.
>   */
>  struct amdgpu_display_manager {
>
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
