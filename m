Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3931322FE5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4A6EA0C;
	Tue, 23 Feb 2021 17:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59A36E995;
 Tue, 23 Feb 2021 17:46:35 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id f3so18440468oiw.13;
 Tue, 23 Feb 2021 09:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9qtbTXqXVuOZUhIlF4MKyuwiBZDXKc/e8EIy79NOn8I=;
 b=EhvqwC6fc0LXrtbfZcvMp82zCW+fmUD+W/RdQZzDPf5ii8MCce9Kg0h9jSdxiZ6TY2
 6Ede7G1Oe5TXUJ3UQdHVeaaTIRHhyHPrvQT1cI/9/UjvluArnBeFOfXOgwg3aiDd7oVo
 BPzLQC49p9d/NTqiWHbV12rcPk0tQAiysimtv65v0VFOrZZdWSeWyMnFkL4lMjy3yjGX
 tsqvfveHWiVeb6StipOF1KTmAVSuf8duOzmE+dKzDd8j+xBGy9MuS+olSE5+MDicjn9B
 QhBjTndDDkzbQdPV/YK79rwYS2pjZnAE9V8jlWHe0/law7EmsZwtFnmy0j3nsqN8kCk2
 l07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qtbTXqXVuOZUhIlF4MKyuwiBZDXKc/e8EIy79NOn8I=;
 b=cdhEU3WzBpnnCABlO6Afml6QKJxzd/m9fH2ZXWKaZl0cobSn3Z8IOQZXLNpB/a7Rzw
 q5CEcoYukybmrrirfVi8wMDICFd3MfLFIiqzC477zVvoJJe1VGc0Z83kcxOw32bHMFSH
 OhIW3oouoWTjP1F2qUrwVPbrF5KOuP+IaO3qESzFjURWMTlzFrv6P5kztzmS+jv1gGlI
 xrF5ttgYCMXCij0hCsNWad/l0PzU1aZ9/2Mwf8wzPFu/6w9kPWTUi9fDgfwwc5tgLAGs
 5/47LPPsZuLegK342qP6kxbSZOjBSFkPoO/ErNQloZzfokb/EiBWBFfG99/Ry9GV7kkp
 sloQ==
X-Gm-Message-State: AOAM530S9ZtMhRsXwdg8Scm88O6tdfXgUmuEUcfyXdCkbLIgXzP21Ix/
 1sBtrkCe211Y8dCFdhcABHroHnLSdcjjV+cukHk=
X-Google-Smtp-Source: ABdhPJxJtTCZXfTvedSSRvecwTcyGawl8EKQR0fPrCfuqwgApxHDv+38pdIua8+emj+ut1ZkhbTJ9xqi6YZvgmU+aGs=
X-Received: by 2002:aca:f485:: with SMTP id s127mr7316628oih.120.1614102395279; 
 Tue, 23 Feb 2021 09:46:35 -0800 (PST)
MIME-Version: 1.0
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Feb 2021 12:46:24 -0500
Message-ID: <CADnq5_PgZLo56d613xo=ofo9X=uq8bXKUu=khpUzVm0vTDVJqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 3:13 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
> >> warning: variable 'i' is uninitialized when used here
> >> [-Wuninitialized]
>                            timing  = &edid->detailed_timings[i];
>                                                              ^
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
> note: initialize the variable 'i' to silence this warning
>            int i;
>                 ^
>                  = 0
>    1 warning generated.
>
> Initialize the variable 'i'.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a22a53d..e96d3d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9717,7 +9717,7 @@ static bool parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>                                         struct edid *edid)
>  {
> -       int i;
> +       int i = 0;
>         struct detailed_timing *timing;
>         struct detailed_non_pixel *data;
>         struct detailed_data_monitor_range *range;
> --
> 1.9.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
