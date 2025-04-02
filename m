Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656DA7915F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5810E7E0;
	Wed,  2 Apr 2025 14:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NbD277jP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DBD10E7E0;
 Wed,  2 Apr 2025 14:40:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so1126509566b.1; 
 Wed, 02 Apr 2025 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743604850; x=1744209650; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XdHt/IUBJRf8eYl33LVdyil+49CKbWzVa9iDx/vEpmQ=;
 b=NbD277jPMdXi4Db7W8fFsFrRGZ7j1MGn1XbkedgVg3exhpbothHc9SCTGvCzHIzQEU
 9Avp4I5KSZG6AjmFjZbMEltBVpK/AYuBSZcxZqSFYCRTSRDGB3IICAopsQ7Er0lCsMqF
 Oa5T9poVk5k1+IKmaXjylXyvsnjE4wcTVZ5R0FL/BFrK6puRTAD+0aKNzIpjSsp8UjUs
 98j6S61iKtso09OKkNi3NNadL6gl9qTeub0rPmlH9EDKg7yHqSHpUudALjDAGfuAqDSa
 UUjuYWuGsT47hdXV94Ki1LENy5fV00Tl9YkdZtJgXsDJJTm5tdMOR3SsQpHdfhv0qQLh
 MZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604850; x=1744209650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XdHt/IUBJRf8eYl33LVdyil+49CKbWzVa9iDx/vEpmQ=;
 b=YZET6y6PTNDaSPTSVTkRF8CZDU+uuM/qBZ4bY6kBokMPsOamOPunioMPbSlACQNffp
 kzMeCQLEYAOdmypjtCTQQx1dQXmEPSf9zsfnnLwKsAvTC7Ckqs84HLoSlRzcxenAj3ox
 055lcu2ud0gRNt6MnbgNmwgmTSB4ITewXvDKuNl3xLZtZVrV+4LQjOnxb8CFYU+2ttP+
 uQ0cUFQw1BSecvC0HpDXZ27O3eowhpODh3mHnEe2BXYT5XmptX3EpkM19SVF8c9kKo0s
 uWaJeX/gKpcoUw6vQ6tRXL1ndyd1hCoZmn03I7abmvSdjokrx8dgUDAIJpNDqO0r0zOW
 sF+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWMf8mMC+HeBgVhRjjy7QFWNNSmTD4CcX2FkvwIiI7XI2VvreLQMPB47KDZ9rbMRjayIZxXY7Q8vv9@lists.freedesktop.org,
 AJvYcCWzJWjAQa9esrzzctEiAjmR/yMTITxIUeyuAX7UwLmUyrrvMOWgRnNcYhFhGaSkwoT9CutiYKp+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFk5C2tZplGPtkpbrbsdx3DJOyDZExl522l/gVD7kNTBfrAV0F
 9SEf6BKpSI/q3PKv6RF6Yc8oHdvKN8tovi+AEPqk0eOL9RuTVDpj9PV9/xKitpaYVlK5ThdePwi
 YR+Sp+/6S5Zu+6x/S/YtJgm6tX5g=
X-Gm-Gg: ASbGncsUV0J9KexBywr+1ir/3JyFDU6gvFNpt7adC/0AXhd+n63KNW6FMGRKVHiJlZl
 1IpThgbhFxUFhAysWrT0gUghJecRacdyw73OedP4iaNPU6VVFvz16PKqy55JpD041EQUUlu7jfO
 66gWZrY5PYJouew8Zo4eDS8Tf4syKWy6D/SOMfbMvoyoXkGv4UsxA=
X-Google-Smtp-Source: AGHT+IE0vkwx1hX/1OTjSflPZbThMYB6+8r0sqUR8j1ij3DKDFbTPc/JDMeDathxWVU4WV6O4plnQuRnHTgw4HD4hmU=
X-Received: by 2002:a17:907:9693:b0:ac3:45c0:6d08 with SMTP id
 a640c23a62f3a-ac7385b6095mr1595411066b.0.1743604850163; Wed, 02 Apr 2025
 07:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
In-Reply-To: <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 2 Apr 2025 17:40:39 +0300
X-Gm-Features: AQ5f1JpoH0lX5gFoAYCq8CN2F9yE_ggsFXrXdOVagMSfH3qOEL83a2b4hhyNzuk
Message-ID: <CALT56yPvDW1dLNdZK0kkn53kTa0HcVXgYXp9Gim4MH4YjgEncw@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
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

On Wed, 2 Apr 2025 at 17:35, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Dmitry,
>
> On Wed, 2025-04-02 at 16:36 +0300, Dmitry Baryshkov wrote:
> > > >
> > > > It works if I call
> > > > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > > > create_validate_stream_for_sink()
> > > > in amdgpu_dm_connector_mode_valid()
> > > >
> > > > or
> > > >
> > > > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > > > create_stream_for_sink()
> > > >
> > > > but a better fix than these can be imagined :)
> >
> > Would it help if you force recalculate_timings to be true if
> > (drm_mode->crtc_clock == 0)
> >
>
> Yes, it works with that one.
>
> But the code would start to become quite untraceable.
> duplicate mode in amdgpu_dm_connector_mode_valid()
> call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> duplicate mode in create_stream_for_sink()
> overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> if crtc_clock == 0 call drm_mode_set_crtcinfo() again in
> create_stream_for_sink()

Well... Unfortunately I don't know AMD driver details to comment on
this. The fix that you've posted below at least resolves a regression
without requiring us to revert r/o drm_mode argument patches.

>
> saved_mode is never used after this, so I can't add the condition here
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);

Agree

>
> This commit is related, I think:
> 1101185 ("drm/amd/display: fix the ability to use lower resolution
> modes on eDP")
>
> Regards,
> Gergo
>
> ---
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bae83a129b5f..83c8c81d4015 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6984,6 +6984,9 @@ create_stream_for_sink(struct drm_connector
> *connector,
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);
>
> +       if (mode.crtc_clock == 0)
> +               drm_mode_set_crtcinfo(&mode, 0);
> +

I'd say, please post this and let AMD maintainers act upon it.

>         /*
>          * If scaling is enabled and refresh rate didn't change
>          * we copy the vic and polarities of the old timings
> --



-- 
With best wishes
Dmitry
