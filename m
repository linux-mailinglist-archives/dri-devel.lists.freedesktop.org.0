Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51160341F3D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D256EA0F;
	Fri, 19 Mar 2021 14:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18DA6EA0F;
 Fri, 19 Mar 2021 14:22:23 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so8678317ote.6; 
 Fri, 19 Mar 2021 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+QTRu6EnHIJRSAxr0xqfxOd0QJj6B0MWLRcdPTUx6E=;
 b=QG1GJGF09eRn2BJfugyVxbdtWB3kouSc28Ve52z65D2tx7ZZUD23R8f8ty6P8w4Jdu
 bmIWlZYjsZg1VFL2IRknwtEbZIJNJIXG7bn+1d1EgM8d0yA9JML5LxOaH6bFGIAzbeum
 HPKyoPLxbF2Rn69l5wDiL0GSFof3fOcjPNCCT9inw0JuJU9dDBybwr2r2F8KvbB0uVPB
 TruKdtbUgTGS8ItSjHQlj/jwaGap03lCPx4S7uk6Qo4qdtQh8wuhORDslhcRytR46Gbv
 fEO0BSJQFB41G0D1lwL21P9TIm8UWdR4tHnfvnEp9ITLXPCD6VwAf0hq1me2dwns5iHy
 kejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+QTRu6EnHIJRSAxr0xqfxOd0QJj6B0MWLRcdPTUx6E=;
 b=agSatfIGhrSeAGd+ySR06pIp2+AbixOyN0zaWk7ZI2caxSmcDZTnmVVl0FDUjSz/0e
 sD+f73GmXHxIoaWY5Qsja+C4nR6fZkxVRfuUTh2ijz1Y3350i3r/i6ASquCgLddyRUyH
 TjW8s4krBYUnjjVCWGl7dY8su47rKnxugbzU+6MiUH2EPA906Dh6e1aDeVaWEnK6FdHn
 mV3hzIoLUetEZlVtdGUb4J9SIcrOh4fiH+GOaUSn++Dj3PQ53q3cXBmpEJD9yKmWn3Nw
 Gy6hj6WgFYpCyBo0wqeARZcJ9bIX4mSxr1Gp//PmQUwBWizd44uBZsq6o0ZXT6HG7Jgt
 fCDg==
X-Gm-Message-State: AOAM530xXGFuW10Ozly8QsWG5K+QnzLDPmBebDJc4ii8yXiX4jgdWJUi
 kMjCjqpDD9wBh0ewAXsASbJjeFEuUcgJ7kD6/9Y=
X-Google-Smtp-Source: ABdhPJxEwCWLzjFqAl2UnlrCHKPEGOjU2eg3HPVKAh9/P4eC++ZobzBV++X87wSuhhZv/hfDB3hKOLAzVdyEkhvo7Wk=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr1432261ott.132.1616163743185; 
 Fri, 19 Mar 2021 07:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
In-Reply-To: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Mar 2021 10:22:12 -0400
Message-ID: <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
To: Evan Benn <evanbenn@chromium.org>
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
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anand <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 3:23 AM Evan Benn <evanbenn@chromium.org> wrote:
>
> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
> to ensure no display backlight will flicker at low user brightness
> settings. However this value is quite bright, so for devices that do not
> implement the ACPI ATIF
> ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
> functionality the user cannot set the brightness to a low level even if
> the display would support such a low PWM.
>
> This ATIF feature is not implemented on for example AMD grunt chromebooks.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
>
> ---
> I could not find a justification for the reason for the value. It has
> caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439
>
> Maybe this can be either user controlled or userspace configured, but
> preventing users from turning their backlight dim seems wrong.

My understanding is that some panels flicker if you set the min to a
value too low.  This was a safe minimum if the platform didn't specify
it's own safe minimum.  I think we'd just be trading one bug for
another (flickering vs not dim enough).  Maybe a whitelist or
blacklist would be a better solution?

Alex


>
> Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 573cf17262da..0129bd69b94e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>         return 0;
>  }
>
> -#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
> +#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
>  #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
>  #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
>
> --
> 2.31.0.291.g576ba9dcdaf-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
