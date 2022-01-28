Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A84A0072
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC86310E5CB;
	Fri, 28 Jan 2022 18:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7940110E5CB;
 Fri, 28 Jan 2022 18:53:12 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id y23so13953831oia.13;
 Fri, 28 Jan 2022 10:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pu4NSwnKcN2ktpCmENizSopNqGrtbHMNjwjQQEL3R9o=;
 b=FMrK316cn1uFMuGw08XpxR3ytnj/a+OHArDyn4WZuTbrMozATGItbEp0OF5NCLdAKs
 55wlAj/pLNbR3IY3wNMdQl3KC05xFW3ejCodXst/6aJbcvoC3IM/fFTHJDl7GsH7oQBy
 H7Y3Ytxd0Q7Nh+hczHmz4zi+PNfK8YcG3iLFzzRqksyG+JcZJSXzEJxqF74+FoHNlcYC
 jUiQfgStsVfpTNx84W9cfYSSasVqiH0lk2vQqJwoQslYryCMj7ob7TyO/VVc3uORYddv
 Uau/3O3gWAWmqTVLpvUZ8Mj7cCmj+u/piSuDb5t6UzbGAFPwQzXC7a8fCCwnlP0dK3eC
 CvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pu4NSwnKcN2ktpCmENizSopNqGrtbHMNjwjQQEL3R9o=;
 b=c7lb9LP3eD7f21R0RvJHL8izwkAK4LTTgCdGk5zxv6+J69Ak2Q/kdRTBFD/5tAWesR
 GuVkedOdl8ox1DCd5qjQA2aZ1O8qsfifBUeKaBI8fcMPXBM5RZ9AWJfYruwK3tsDWjSl
 WeMtgmJqXepkTElNuoBVhFPPJyvxBiuHf0+59kzVL6VwK8gIv3jeupccAxBRxeP0aHWx
 RsKU9ASnU6W2f8Wutbqc8s9cuOe4tSE4rmiaj7TjUaoDFyKTMDyjUO7tsG7htfji1TWw
 Ve4N2XJveeHJK6ddANovrzxftBHlqPHQa609cEcuuy+6vxbbjF2IvrnsKcUUHrh4YmFY
 QFHw==
X-Gm-Message-State: AOAM531t75clnN+YWl5SmgXnQDskfcGJPWNitofqZOVoB82n+v3dnd2x
 R+tdVdbDqJCI6H95Yz0c2aa29exZQF14uSk98Wo=
X-Google-Smtp-Source: ABdhPJwKCzD8Rt5qit1gwag3Yzd6XxPW5CpF0ZA2+xx+dEK0So5xF+3/9NNczU849tHElw52wJ2ouSprPSX7g2wTnww=
X-Received: by 2002:a05:6808:2189:: with SMTP id
 be9mr11097293oib.93.1643395991750; 
 Fri, 28 Jan 2022 10:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20220128173502.594099-1-colin.i.king@gmail.com>
 <6a5b1f8e-22a1-9c26-aea4-6bb38c4aa084@amd.com>
In-Reply-To: <6a5b1f8e-22a1-9c26-aea4-6bb38c4aa084@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 13:53:00 -0500
Message-ID: <CADnq5_PxSH6e-QgN7_srR4w47WCNdXTp6VGNZz0=sXp-ivw4Mg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake: synatpics ->
 synaptics
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 xinhui pan <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jan 28, 2022 at 12:59 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-01-28 12:35, Colin Ian King wrote:
> > There are quite a few spelling mistakes in various function names
> > and error messages. Fix these.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 32 +++++++++----------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 75b5299b3576..db4ab01267e4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -539,7 +539,7 @@ bool dm_helpers_submit_i2c(
> >  }
> >
> >  #if defined(CONFIG_DRM_AMD_DC_DCN)
> > -static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
> > +static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
> >               bool is_write_cmd,
> >               unsigned char cmd,
> >               unsigned int length,
> > @@ -578,7 +578,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
> >       ret = drm_dp_dpcd_write(aux, SYNAPTICS_RC_COMMAND, &rc_cmd, sizeof(rc_cmd));
> >
> >       if (ret < 0) {
> > -             DRM_ERROR("     execute_synatpics_rc_command - write cmd ..., err = %d\n", ret);
> > +             DRM_ERROR("     execute_synaptics_rc_command - write cmd ..., err = %d\n", ret);
> >               return false;
> >       }
> >
> > @@ -600,7 +600,7 @@ static bool execute_synatpics_rc_command(struct drm_dp_aux *aux,
> >               drm_dp_dpcd_read(aux, SYNAPTICS_RC_DATA, data, length);
> >       }
> >
> > -     DC_LOG_DC("     execute_synatpics_rc_command - success = %d\n", success);
> > +     DC_LOG_DC("     execute_synaptics_rc_command - success = %d\n", success);
> >
> >       return success;
> >  }
> > @@ -618,54 +618,54 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
> >       data[3] = 'U';
> >       data[4] = 'S';
> >
> > -     if (!execute_synatpics_rc_command(aux, true, 0x01, 5, 0, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x01, 5, 0, data))
> >               return;
> >
> >       // Step 3 and 4
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> >               return;
> >
> >       data[0] &= (~(1 << 1)); // set bit 1 to 0
> > -     if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> >               return;
> >
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> >               return;
> >
> >       data[0] &= (~(1 << 1)); // set bit 1 to 0
> > -     if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220D98, data))
> >               return;
> >
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> >               return;
> >
> >       data[0] &= (~(1 << 1)); // set bit 1 to 0
> > -     if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> >               return;
> >
> >       // Step 3 and 5
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220998, data))
> >               return;
> >
> >       data[0] |= (1 << 1); // set bit 1 to 1
> > -     if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x220998, data))
> >               return;
> >
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x220D98, data))
> >               return;
> >
> >       data[0] |= (1 << 1); // set bit 1 to 1
> >               return;
> >
> > -     if (!execute_synatpics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> > +     if (!execute_synaptics_rc_command(aux, false, 0x31, 4, 0x221198, data))
> >               return;
> >
> >       data[0] |= (1 << 1); // set bit 1 to 1
> > -     if (!execute_synatpics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x21, 4, 0x221198, data))
> >               return;
> >
> >       // Step 6
> > -     if (!execute_synatpics_rc_command(aux, true, 0x02, 0, 0, NULL))
> > +     if (!execute_synaptics_rc_command(aux, true, 0x02, 0, 0, NULL))
> >               return;
> >
> >       DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
>
