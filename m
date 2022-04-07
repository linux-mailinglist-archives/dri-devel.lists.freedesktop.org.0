Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E724F860E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CECD10E23D;
	Thu,  7 Apr 2022 17:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7510E23D;
 Thu,  7 Apr 2022 17:28:45 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so7127846fac.1; 
 Thu, 07 Apr 2022 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1N3e7+zBRerbyIy8I0yBbprV6Ezo9J/qMAppeug0poA=;
 b=iJFfJWlP1IpPeuhNJIFwGsz63887gCyYlNl+4Ef0qLDWZtU/raTSE+MNYheRNV+JnY
 yimrBpVOYAIdG0Xbch/hnOqiwt+0iS99NPllE69BKl/YTW1JMVZ4zYmx4fQmX/hEsUyF
 EeUFpDdJaH4Zl1ZMa5kFnP5iMnbbzLIX2H30k5WRkYKowowr0gk5+xCeSoeg7ykvxNta
 I2T4pNXiJc+bhsmqkp3DUvtelKbR7olrNeP6evMKB1C23Mkr8DQJfr0eWmpP03MFJgAW
 We+3HBF38Vg2n2CUdXWKEOrn6PsavngN3sPxHI5z6w2tjw4CGOZpX+OuR8Vtpmp7NiNU
 v1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1N3e7+zBRerbyIy8I0yBbprV6Ezo9J/qMAppeug0poA=;
 b=TVAm+Tv7gHd5fW2+fFQpLYozKZWtIz58YUhDSpLQUfZJ5RdAbjZgNM3d7CCWeooswj
 ly2U3Z8Nb2QiSakEOwPM0/vE8w/wlN9jjm6G030I/j3EkIJtfvMi0mDL2HBSftAjaM4u
 8OmohtQde9D2Nz4O1naF6mEvQ5olZ/OGzUnSSoQ73q8BmaHAKu2R+iI+rQldtcjqVBPQ
 kCiR/OF/YMYcDF2hZct21FZ0PJRsPcEN9XrgQndwc1IZstXQ1Cqi2VyCI6xRiDit85vW
 Um1ItxjNkb6akC9xsuauQlm0a72qjJrCI42hY/+auuJgkGSYxtzzZomqJjSx7l/lLxfR
 RxMg==
X-Gm-Message-State: AOAM531S39HPAH08Jlef/EPC7QYwsNVKNKHPmfsBQ4O/MmQ9qHwDxjwp
 61doboqqqwNu4c/YNiGnJmFBWvchB+8bHkYxH9o=
X-Google-Smtp-Source: ABdhPJyNOD2ht5NWllAPCYxZmV9hr+8sW6q+V63TMLZza8JlhP09NPnm4xKNqRiUAZvY9SMwAPgw7pfu4DkTPQSvsdk=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr7056265oap.253.1649352524685; Thu, 07
 Apr 2022 10:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220403142137.2234322-1-trix@redhat.com>
 <513a5993-2cc5-54fa-2d6c-f4162d76ab0e@amd.com>
 <462e2f2a-0cc8-2e2e-93b6-504cc12aa768@redhat.com>
 <e0397927-06fc-933e-f73a-794e0629e0fd@amd.com>
In-Reply-To: <e0397927-06fc-933e-f73a-794e0629e0fd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 13:28:33 -0400
Message-ID: <CADnq5_P90qk9Daw3jdmap0QZPWdFxjKMPkUWq4xf1eX35CHhsw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: cleanup extern usage in function
 definition
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Kees Cook <keescook@chromium.org>,
 Yu-ting.Shen@amd.com, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wenjing Liu <wenjing.liu@amd.com>, Dave Airlie <airlied@linux.ie>,
 waynelin@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Apr 4, 2022 at 11:57 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-04-04 11:43, Tom Rix wrote:
> >
> > On 4/4/22 8:22 AM, Harry Wentland wrote:
> >>
> >> On 2022-04-03 10:21, Tom Rix wrote:
> >>> Smatch reports this issue
> >>> hdcp1_execution.c:500:29: warning: function
> >>>    'mod_hdcp_hdcp1_dp_execution' with external linkage
> >>>    has definition
> >>>
> >> Which branch are you using?
> >
> > linux-next from 4/1
> >
>
> Apologies. I was looking at the wrong function.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > Tom
> >
> >>
> >> I don't see the 'extern' on
> >> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c>>>
> >> Harry
> >>
> >>
> >>> The storage-class-specifier extern is not needed in a
> >>> definition, so remove it.
> >>>
> >>> Signed-off-by: Tom Rix <trix@redhat.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 +++---
> >>>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> >>> index 6ec918af3bff..1ddb4f5eac8e 100644
> >>> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> >>> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> >>> @@ -497,9 +497,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
> >>>       return status;
> >>>   }
> >>>   -extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
> >>> -        struct mod_hdcp_event_context *event_ctx,
> >>> -        struct mod_hdcp_transition_input_hdcp1 *input)
> >>> +enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
> >>> +                         struct mod_hdcp_event_context *event_ctx,
> >>> +                         struct mod_hdcp_transition_input_hdcp1 *input)
> >>>   {
> >>>       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
> >>>
> >
>
