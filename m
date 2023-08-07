Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81267772B4F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3C889065;
	Mon,  7 Aug 2023 16:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E853B89065;
 Mon,  7 Aug 2023 16:42:41 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5607cdb0959so2445451eaf.2; 
 Mon, 07 Aug 2023 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426561; x=1692031361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ra/F8bxJt2uHIFJpeC0EOCovKfShoRIUredcDAUE+ZI=;
 b=Gun2NGjjwowkJ026ZgXPE+fYKi6Lu7M5wpQIvnaaU+IBKVqjxfNcoHyi6WcUSgq1cE
 Cze9o7vM05EXgghmDqBtbX7cBtkpynu5AwuqBlRHTMUZKQf1OVKO2lMaZ3hmbRSFzWQc
 EKG6kpgFlu4FXJCxPqMR60JRneZMfzEI87WH4m9/XMU/yEbyX4feWet3bDZVzcr6ZLqH
 TdMcJ5dVZzEs/35p9mI0oJ8MfNSnncpthS1bSh2d836Yl1ObA7aIMr/TM2eANH1rrX2f
 eWoPe/KyJQ5HmypqPncLeWw3AuPvZ1KSrCh5YUQk6/yuNRJ6ZOPIJ8S/tPAqEM9xHEP7
 IJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426561; x=1692031361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ra/F8bxJt2uHIFJpeC0EOCovKfShoRIUredcDAUE+ZI=;
 b=JwXe46P1WnJwH6qevMEETp3tz2GiiaLA/w3DU/7WIW4jBj7KDBRumm0cmk4rJEa7Vc
 ExqATgTTlA5jR9La2WFYhtQ6wAMg7MU9E6oIn6fB3UqoUrrJjVSLzInBw4efFDa0cTtt
 5rn6RIZASFACC6sEYJvgr2lGtYjphYN5oFZ/le2BoDyIsyIk+tEYf30wtET/QH7UXrPI
 FARprjC6iKk0fHWZrpjNvZmNKxs2EscWUcsSshXiB9hihnGS4axXRks23QVqfwoR9kyt
 PslnqWIf6SDZHwSy/H0D5LWvzEO503M9GfF9VzzERlp/YLJp3KSG5U/L4NlwsOyG4FLs
 /gTQ==
X-Gm-Message-State: AOJu0YybvpnQxgDc7fNqnFv1e1LaEeA0h5/I6v56o0I1FMlDk9uRSpWE
 0NQavwtnzok7+EJLz2EVOWjHGinm8CupU1ubwE6Iri2N
X-Google-Smtp-Source: AGHT+IF5F8ATbbx0BFgLWbu0SNtonAC9iGdpaFGrRGFiubeRgOfSTci8+hQyXwbBuqSz6lm6uWcncHGGh7lZO0PhQEQ=
X-Received: by 2002:a05:6870:c21f:b0:19e:fa1f:fc2f with SMTP id
 z31-20020a056870c21f00b0019efa1ffc2fmr9661638oae.38.1691426561171; Mon, 07
 Aug 2023 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230801080246.6556-1-sunran001@208suo.com>
 <DM6PR12MB26192EB1ADCC6973C37B6E2AE40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26192EB1ADCC6973C37B6E2AE40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:42:30 -0400
Message-ID: <CADnq5_NDGOUVTNFsQvxAmZMgOBDF64hQ89WXhq8gy2hZctzmHg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Ran Sun <sunran001@208suo.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:25=E2=80=AFAM Quan, Evan <Evan.Quan@amd.com> wrote=
:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ran
> > Sun
> > Sent: Tuesday, August 1, 2023 4:03 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; airlied@gmail.com;
> > daniel@ffwll.ch
> > Cc: Ran Sun <sunran001@208suo.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
> >
> > Fix the following errors reported by checkpatch:
> >
> > ERROR: that open brace { should be on the previous line
> > ERROR: space required before the open parenthesis '('
> >
> > Signed-off-by: Ran Sun <sunran001@208suo.com>
> > ---
> >  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> > b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> > index 8d99c7a5abf8..994c0d374bfa 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> > @@ -31,8 +31,7 @@
> >
> >  #include "amdgpu_ras.h"
> >
> > -static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D -{
> > +static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D {
> >       {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_6), 0,
> > 0, 0, 0},
> >       {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_7), 0,
> > 0, 0, 0},  }; @@ -90,11 +89,11 @@ int vega20_baco_set_state(struct
> > pp_hwmgr *hwmgr, enum BACO_STATE state)
> >                       data |=3D 0x80000000;
> >                       WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL,
> > data);
> >
> > -                     if(smum_send_msg_to_smc_with_parameter(hwmgr,
> > +                     if
> > (smum_send_msg_to_smc_with_parameter(hwmgr,
> >                                       PPSMC_MSG_EnterBaco, 0, NULL))
> >                               return -EINVAL;
> >               } else {
> > -                     if(smum_send_msg_to_smc_with_parameter(hwmgr,
> > +                     if
> > (smum_send_msg_to_smc_with_parameter(hwmgr,
> >                                       PPSMC_MSG_EnterBaco, 1, NULL))
> >                               return -EINVAL;
> >               }
> > --
> > 2.17.1
>
