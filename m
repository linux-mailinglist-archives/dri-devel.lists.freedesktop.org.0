Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756B3435EB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 01:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D1C89C1E;
	Mon, 22 Mar 2021 00:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F28389C1E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 00:17:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h10so17220850edt.13
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 17:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+N+7Ciagtr7IVQ3/iKqMDQJKQGscQk5dJiTJvc9J1ss=;
 b=jkBHW1BMRAO6K3maQ3h1tVFQgiw6CLJZPA5j8Q4u76B3HMv5+7WZ2nNwKXU+PAZjt5
 kcGclsq27PoO6vbUWl3FHeoOQ+F6s59d2XjscUcoG0ESfD1UuwNXJIen95x9jomdgYJW
 sdFeJ67GaHo8AJhCF1P5E6wZqmq0eF+c2t2zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+N+7Ciagtr7IVQ3/iKqMDQJKQGscQk5dJiTJvc9J1ss=;
 b=f8rx8V0MEDgpYugYo5f1PSk7KIhQ4zY3qa0oFlspYCCuaHw6v7M1K7khibIA3MnLJP
 eZlP0Tkh3oHiaUjSseJJcxnuXCQyZttnzGr1+ihq28NxoDLK8fCc8jwTpCuxxh7M2qm+
 dqDzNtTw2pk/OASDnwz72q3j5Ylp0UVfHU9WEMu89ldKTFx61GnH1cb30QerZxeGt7fE
 dXlweC8a6AWOPDv5IRb40sWvWLQpONftZG7Uzz3b4VcySy0UJnaZ465uveLYdhu3kLJH
 AQbjfSJKa/VZFXczp3dY8mwUmJb6uGC5CSUMTE7aeegKZq52STsk+BAnRrGhlGC+ucsG
 1UyQ==
X-Gm-Message-State: AOAM532+xhtF2YAV/Uf6yl6wOBEAhoqjewKy1Xf8eJzZF9Y+V18n01Hj
 NcI40q8nqgm9p4DQDZui7uCOHLke/F752g==
X-Google-Smtp-Source: ABdhPJwqErDkxrWdqVlW1B27BATSNYwTSS4B0Dsx4lAcCrccQG34ysEhayKaFqtz92+F7HIdL/RKDw==
X-Received: by 2002:aa7:c916:: with SMTP id b22mr23291041edt.299.1616372258658; 
 Sun, 21 Mar 2021 17:17:38 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45])
 by smtp.gmail.com with ESMTPSA id hy25sm8266692ejc.119.2021.03.21.17.17.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 17:17:38 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id h10so17220825edt.13
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 17:17:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3ba3:: with SMTP id
 g35mr7156536lfv.606.1616371949650; 
 Sun, 21 Mar 2021 17:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
 <CADnq5_OguuMsqT7MVC=ieNZm9mqyVUsGpQDHr59BWtBJJUvFoA@mail.gmail.com>
 <54fc883a-c149-3f43-fb79-3cbff13e7b6a@amd.com>
 <CAP8nV8rL6eYSDyQ1jyv267ER8_E+rMBQkza2ZYZvwvdE+=sd3Q@mail.gmail.com>
 <CADnq5_O5AOK7B-3AM-qpPXcWD1LgdpnfLMd8NBds0Jfd_tZCBQ@mail.gmail.com>
In-Reply-To: <CADnq5_O5AOK7B-3AM-qpPXcWD1LgdpnfLMd8NBds0Jfd_tZCBQ@mail.gmail.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Mon, 22 Mar 2021 11:12:03 +1100
X-Gmail-Original-Message-ID: <CAKz_xw0vKSojPqh7QsJPY5eQBLcnteFmL1AJimJTXJmzmQd9kA@mail.gmail.com>
Message-ID: <CAKz_xw0vKSojPqh7QsJPY5eQBLcnteFmL1AJimJTXJmzmQd9kA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
To: Alex Deucher <alexdeucher@gmail.com>
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
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Evan Benn <evanbenn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anand <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 20, 2021 at 8:36 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Mar 19, 2021 at 5:31 PM Evan Benn <evanbenn@gmail.com> wrote:
> >
> > On Sat, 20 Mar 2021 at 02:10, Harry Wentland <harry.wentland@amd.com> wrote:
> > > On 2021-03-19 10:22 a.m., Alex Deucher wrote:
> > > > On Fri, Mar 19, 2021 at 3:23 AM Evan Benn <evanbenn@chromium.org> wrote:
> > > >>
> > > >> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
> > > >> to ensure no display backlight will flicker at low user brightness
> > > >> settings. However this value is quite bright, so for devices that do not
> > > >> implement the ACPI ATIF
> > > >> ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
> > > >> functionality the user cannot set the brightness to a low level even if
> > > >> the display would support such a low PWM.
> > > >>
> > > >> This ATIF feature is not implemented on for example AMD grunt chromebooks.
> > > >>
> > > >> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > > >>
> > > >> ---
> > > >> I could not find a justification for the reason for the value. It has
> > > >> caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439>>>
> > > >> Maybe this can be either user controlled or userspace configured, but
> > > >> preventing users from turning their backlight dim seems wrong.
> > > >
> > > > My understanding is that some panels flicker if you set the min to a
> > > > value too low.  This was a safe minimum if the platform didn't specify
> > > > it's own safe minimum.  I think we'd just be trading one bug for
> > > > another (flickering vs not dim enough).  Maybe a whitelist or
> > > > blacklist would be a better solution?
> > > >
> > >
> > > Yeah, this is a NACK from me as-is for the reasons Alex described.
> >
> > Thanks Harry + Alex,
> >
> > I agree this solution is not the best.
> >
> > >
> > > I agree a whitelist approach might be best.
> >
> > Do you have any idea what an allowlist could be keyed on?
> > Is the flickering you observed here a function of the panel or the gpu
> > or some other component?
> > Maybe we could move the minimum level into the logic for that hardware.
> >
>
> Maybe the panel string from the EDID?  Either that or something from
> dmi data?  Harry would probably have a better idea.

One problem with keying from panel EDID is that for example the grunt chromebook
platform has more than 100 different panels already shipped. Add to that that
repair centers or people repairing their own device will use 'compatible'
panels. I'm sure the AMD windows laptops have even more variety!

>
> Alex
>
> > >
> > > Is this fix perhaps for OLED panels? If so we could use a different
> > > min-value for OLED panels that don't do PWM, but use 12 for everything else.
> >
> > All the chromebooks I have worked with LCD + LED backlight have been
> > fine with a backlight set to 0.
> > We do have OLED panels too, but I'm not aware of what they do.
> >
> > > Harry
> > >
> > > > Alex
> > > >
> > > >
> > > >>
> > > >> Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377>>>
> > > >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> > > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> index 573cf17262da..0129bd69b94e 100644
> > > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> @@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
> > > >>          return 0;
> > > >>   }
> > > >>
> > > >> -#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
> > > >> +#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
> > > >>   #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
> > > >>   #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
> > > >>
> > > >> --
> > > >> 2.31.0.291.g576ba9dcdaf-goog
> > > >>
> > > >> _______________________________________________
> > > >> dri-devel mailing list
> > > >> dri-devel@lists.freedesktop.org
> > > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel>> _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel>>
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
