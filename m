Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3F3427E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897B6EAD7;
	Fri, 19 Mar 2021 21:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025376EAD7;
 Fri, 19 Mar 2021 21:36:06 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id f9so6279961oiw.5;
 Fri, 19 Mar 2021 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gd8/LS9G/arRtGpvSNTnyt+X8KIH+uan5nzLifBdm54=;
 b=llXCL9/c8u+lPuPiYaXG3P6ezw9Xx6uGG7S+O4ZtL8gIcFQGCrOOCDj5RUpO/xuCpu
 iGrcysjj1ps8KVwpcku9vLv6dQTkLk4Lq9JxPxpuoTgrZRQW4X5dWeWipeEeP/DKVbEX
 H/VBrceoqc59JQnVhZvsJDFy0mYkdM7NMnP15TUNCvG6n1/jXBH0+nHxmmfbAzRjMUWc
 5gEVpKEd1TvNT+ZCcXHntTIbMAgLinN2LslONFFh2aPaoR8f1fecoUJfZbiA3XU5HZpI
 n6/dx4JQoTEHug8AvQwiFCuhJBKLl/EHS2TlDa/Tghr0p1RC7OXMv6tPCPwC6m0DBgKg
 NIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gd8/LS9G/arRtGpvSNTnyt+X8KIH+uan5nzLifBdm54=;
 b=oHVauv0V0AkU39K6yr4qO/2DL9/AU1sIloB4kuMfQV4pRguOuorep54AsE09x0XVNG
 DIT1sbIttrqznrq1z8Vx+8pAaMcXy+B8LJ+P5h6GfWLdlEXQpWXvGJ4t4GY65QOLTN62
 +/6bsb2XRQ0MwBJ5YJUnxubZ/nvB7U8ph0wWhDQSwEIr6sY+XnDjrn4d8StxSJH70q0F
 PQIKI9HFNQQtRxcIupG0uZdKu4GYDm7v57Vp52JkaPZThPSwg4PXcc+aVoVzPGTxI3I+
 24ZPPEFWzgX7uH/r8MCCEy1myEgsAL00Sk/fKJuDepgmvKHH/HjOdq2oQlvhZjGLT6R+
 iQcg==
X-Gm-Message-State: AOAM533Ag8MaQ1HoNzwhJOjpYFe5AiIKluH02na22+o3578z/7e73D5p
 1qKHPIureqzT6RfLxENzmUI5Q8S+PKCp8qs2CVc=
X-Google-Smtp-Source: ABdhPJw1aufG+kZg8BweLNMDZwZcwQT/Rj4rIr1Z2VE+Qg+T+1hZHQroIxBcW2e/AAzj4sICZPIxY7Z57VTL1hL6er4=
X-Received: by 2002:aca:af10:: with SMTP id y16mr2440946oie.120.1616189766078; 
 Fri, 19 Mar 2021 14:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
 <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
 <54fc883a-c149-3f43-fb79-3cbff13e7b6a@amd.com>
 <CAP8nV8rL6eYSDyQ1jyv267ER8_E+rMBQkza2ZYZvwvdE+=sd3Q@mail.gmail.com>
In-Reply-To: <CAP8nV8rL6eYSDyQ1jyv267ER8_E+rMBQkza2ZYZvwvdE+=sd3Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Mar 2021 17:35:55 -0400
Message-ID: <CADnq5_O5AOK7B-3AM-qpPXcWD1LgdpnfLMd8NBds0Jfd_tZCBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
To: Evan Benn <evanbenn@gmail.com>
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
 David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Evan Benn <evanbenn@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anand <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 5:31 PM Evan Benn <evanbenn@gmail.com> wrote:
>
> On Sat, 20 Mar 2021 at 02:10, Harry Wentland <harry.wentland@amd.com> wrote:
> > On 2021-03-19 10:22 a.m., Alex Deucher wrote:
> > > On Fri, Mar 19, 2021 at 3:23 AM Evan Benn <evanbenn@chromium.org> wrote:
> > >>
> > >> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
> > >> to ensure no display backlight will flicker at low user brightness
> > >> settings. However this value is quite bright, so for devices that do not
> > >> implement the ACPI ATIF
> > >> ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
> > >> functionality the user cannot set the brightness to a low level even if
> > >> the display would support such a low PWM.
> > >>
> > >> This ATIF feature is not implemented on for example AMD grunt chromebooks.
> > >>
> > >> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > >>
> > >> ---
> > >> I could not find a justification for the reason for the value. It has
> > >> caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439>>>
> > >> Maybe this can be either user controlled or userspace configured, but
> > >> preventing users from turning their backlight dim seems wrong.
> > >
> > > My understanding is that some panels flicker if you set the min to a
> > > value too low.  This was a safe minimum if the platform didn't specify
> > > it's own safe minimum.  I think we'd just be trading one bug for
> > > another (flickering vs not dim enough).  Maybe a whitelist or
> > > blacklist would be a better solution?
> > >
> >
> > Yeah, this is a NACK from me as-is for the reasons Alex described.
>
> Thanks Harry + Alex,
>
> I agree this solution is not the best.
>
> >
> > I agree a whitelist approach might be best.
>
> Do you have any idea what an allowlist could be keyed on?
> Is the flickering you observed here a function of the panel or the gpu
> or some other component?
> Maybe we could move the minimum level into the logic for that hardware.
>

Maybe the panel string from the EDID?  Either that or something from
dmi data?  Harry would probably have a better idea.

Alex

> >
> > Is this fix perhaps for OLED panels? If so we could use a different
> > min-value for OLED panels that don't do PWM, but use 12 for everything else.
>
> All the chromebooks I have worked with LCD + LED backlight have been
> fine with a backlight set to 0.
> We do have OLED panels too, but I'm not aware of what they do.
>
> > Harry
> >
> > > Alex
> > >
> > >
> > >>
> > >> Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377>>>
> > >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> index 573cf17262da..0129bd69b94e 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> @@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
> > >>          return 0;
> > >>   }
> > >>
> > >> -#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
> > >> +#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
> > >>   #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
> > >>   #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
> > >>
> > >> --
> > >> 2.31.0.291.g576ba9dcdaf-goog
> > >>
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel>> _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel>>
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
