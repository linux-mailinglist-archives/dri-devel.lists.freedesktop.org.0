Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CAA342B4B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 08:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4026EB3E;
	Sat, 20 Mar 2021 07:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635776EAD6;
 Fri, 19 Mar 2021 21:31:21 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id v8so3547170plz.10;
 Fri, 19 Mar 2021 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mnFDnOo5yMcbPHmmE8oPg7EbW76+eTt1IMrohfUZyIU=;
 b=CJ3MnOxIBAsmOakTHx0+zvI0rXduBbhZ7YLV8Ktwu73XjOqRzmIUURiCNYJh6EWFJG
 Ih11/v3vXng0DqFy+jj4A8CeRxxNsW2UiTDSeMk+jnC4p7CBnhcKL5VlArkkD/1qLDU+
 X+61sa7x9SnHpn1bngpKkN1qYeb7QdNZn1503IAOpNGSIG70tZzjD52NFdNf/2Jda3FU
 69N9fZcbO8/f6tipHQpg1yaq5YgkKLXCyTsyyOFVsQeJ0RskOByPW92cIfpPWHpfdDW1
 w+JFPMQ//OdGDOiIrgsCg14rmvXhL1v6MJV0+ZafQoIzusbK8CSzCt4d9Xc5Qtg9xuyp
 BUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnFDnOo5yMcbPHmmE8oPg7EbW76+eTt1IMrohfUZyIU=;
 b=hbBZP8XJkswqjQXmLQaQjSzOosb8E4eHg18Iz3Ny6CNGbIE1SyodVfuwlAcv13bs70
 FOLHu3MONafiWtz6Tj2XZDslSj8OYJmvXFoI6oauiBhmn1INWDiIDNdpoJ4a3nIIhL8d
 hOZXN1RAJ0TQ6qAofdhhMifnjic0IjcxE58250AXOX9nCsAM4j2DcI7MtAYqjBfUU/LE
 t8PHt946gFDE0d18Z+ALIiun2tG0534fqdZ+bU7z68TUj/vmJQewMMOEuYr/zIxGbrTb
 4ZQu3zSDAiRG1z/X9eybXRRwS/goEPWx58PcmtSEX3Gyl7vM8GENatDax2jS0MogurA3
 e9Bg==
X-Gm-Message-State: AOAM532KPd/R3fLO3ZKJb1Sw9Vz0Z24pXVEAJFJMHxClKzF4y4LHAUYt
 wtPB4cz46NVKhtJIoQI+yohFHuJeLtC2UeXQ0ok=
X-Google-Smtp-Source: ABdhPJwySHB77Q/khXyIKMIzIn7+emBzb5cl5ocYqucU8diX9waIP0/B0/P/fhwCRpsAIsNDoOs+9ubSmUjjfR2f99M=
X-Received: by 2002:a17:902:c154:b029:e5:e7cf:9627 with SMTP id
 20-20020a170902c154b02900e5e7cf9627mr15689833plj.68.1616189480887; Fri, 19
 Mar 2021 14:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
 <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
 <54fc883a-c149-3f43-fb79-3cbff13e7b6a@amd.com>
In-Reply-To: <54fc883a-c149-3f43-fb79-3cbff13e7b6a@amd.com>
From: Evan Benn <evanbenn@gmail.com>
Date: Sat, 20 Mar 2021 08:31:09 +1100
Message-ID: <CAP8nV8rL6eYSDyQ1jyv267ER8_E+rMBQkza2ZYZvwvdE+=sd3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
To: Harry Wentland <harry.wentland@amd.com>
X-Mailman-Approved-At: Sat, 20 Mar 2021 07:52:38 +0000
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Evan Benn <evanbenn@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anand <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 20 Mar 2021 at 02:10, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2021-03-19 10:22 a.m., Alex Deucher wrote:
> > On Fri, Mar 19, 2021 at 3:23 AM Evan Benn <evanbenn@chromium.org> wrote:
> >>
> >> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
> >> to ensure no display backlight will flicker at low user brightness
> >> settings. However this value is quite bright, so for devices that do not
> >> implement the ACPI ATIF
> >> ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
> >> functionality the user cannot set the brightness to a low level even if
> >> the display would support such a low PWM.
> >>
> >> This ATIF feature is not implemented on for example AMD grunt chromebooks.
> >>
> >> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> >>
> >> ---
> >> I could not find a justification for the reason for the value. It has
> >> caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439>>>
> >> Maybe this can be either user controlled or userspace configured, but
> >> preventing users from turning their backlight dim seems wrong.
> >
> > My understanding is that some panels flicker if you set the min to a
> > value too low.  This was a safe minimum if the platform didn't specify
> > it's own safe minimum.  I think we'd just be trading one bug for
> > another (flickering vs not dim enough).  Maybe a whitelist or
> > blacklist would be a better solution?
> >
>
> Yeah, this is a NACK from me as-is for the reasons Alex described.

Thanks Harry + Alex,

I agree this solution is not the best.

>
> I agree a whitelist approach might be best.

Do you have any idea what an allowlist could be keyed on?
Is the flickering you observed here a function of the panel or the gpu
or some other component?
Maybe we could move the minimum level into the logic for that hardware.

>
> Is this fix perhaps for OLED panels? If so we could use a different
> min-value for OLED panels that don't do PWM, but use 12 for everything else.

All the chromebooks I have worked with LCD + LED backlight have been
fine with a backlight set to 0.
We do have OLED panels too, but I'm not aware of what they do.

> Harry
>
> > Alex
> >
> >
> >>
> >> Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377>>>
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 573cf17262da..0129bd69b94e 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
> >>          return 0;
> >>   }
> >>
> >> -#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
> >> +#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
> >>   #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
> >>   #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
> >>
> >> --
> >> 2.31.0.291.g576ba9dcdaf-goog
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel>> _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel>>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
