Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC65580AB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1B10E47F;
	Thu, 23 Jun 2022 16:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C470F10E45D;
 Thu, 23 Jun 2022 16:53:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id cw10so18609890ejb.3;
 Thu, 23 Jun 2022 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dB/YUbV33gsASlwt43eLvtTGgD7GHgvcm51jFsSmolg=;
 b=OLTlxLjQoiKVo4r81x0/z/I7oucCUFZni1cb0k5NlrcBRvxKWxjqv9rTthbcj93dOg
 eba4VzI94/Fy0biC52sVeAeRaY6XNZPGlAdBXPVC30RP2SqMUFR7huF1rGoq5ERK28u1
 jED+gu01s/HrlMFrbgoZP+gPNRwmpU0+V9d50RqLdhncoLtz32NP7+g6+hia3lTtQBNJ
 ZajluoYSjGZb3B9f8pBh0/p6kMnzNn0rRW+/AD9yd/+a7qNEtYNotgXb5Sh3w5Grj2gm
 UlH5g/aqt5DEJkVEyN4nT5zfOxm53uWJT9qJ5JETF+P9Zbvq+j7gfgd3NnEDicxXH9fI
 9brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dB/YUbV33gsASlwt43eLvtTGgD7GHgvcm51jFsSmolg=;
 b=k86G48rCP6KDq60qbu4YoBU390YbbzW1+ieh2r3GfArbNGfR9yk3YWmrrGSAWoKiBR
 tj0NUc9hu1Y8wu4Iscwi7SQGRO4bwPQzbsRKUtAFn7ygGBCG7kc54ng03XQszrIcAVuS
 TxrnfE48nvSXGpNKPlqfVUam65zEG2+kr50CAcDM3UDvauT/1ohSJ7D7Q1OB2Lj5E+Db
 mpgJLPLp+S54JYaIoLv+iQ94RFsuDbBY5FsU56hZqiWo8TxKNen+VnLZBeZqcWDdwV6N
 Q1xjsTjgKc90r8p52vTixJhXueiBOMR3XjlOJXAoCaCHKXN+zgn7qjd1bBxrpGnc4Fcp
 sLgg==
X-Gm-Message-State: AJIora939sFCJ4PgGbPzbMe85c/OMA8eZs1TY8l4TVskIhFsHsD+/6qY
 An9OM3mYC6eunNNAsZ51gQEjTyadVcEXJdjueHE=
X-Google-Smtp-Source: AGRyM1v7UCi/dybJ7a8Hu2QcGEODPFGhdz3he6dGZwqW7M53CtDeoODvjoD1bZCwhJ+OPsCkP81b3cYZrPNQEbnMpX4=
X-Received: by 2002:a17:906:5253:b0:711:ee52:764e with SMTP id
 y19-20020a170906525300b00711ee52764emr8998144ejm.171.1656003189377; Thu, 23
 Jun 2022 09:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220623080946.19116-1-colin.i.king@gmail.com>
 <d3218391-de1f-d64d-bda7-0042473e9833@amd.com>
In-Reply-To: <d3218391-de1f-d64d-bda7-0042473e9833@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jun 2022 12:52:57 -0400
Message-ID: <CADnq5_MiZvJdR43Ook1F359CtfSUq+aBWvOOfyv+1EKLGwK9ug@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu/display: Fix spelling mistake
 "supporing" -> "supporting"
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

On Thu, Jun 23, 2022 at 10:20 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-06-23 04:09, Colin Ian King wrote:
> > There is a spelling mistake in a dml_print message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > index 7f144adb1e36..7d536c2f4477 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > @@ -1098,7 +1098,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
> >                               if (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required && v->ImmediateFlipSupportedForPipe[k] == false) {
> >                                       v->ImmediateFlipSupported = false;
> >  #ifdef __DML_VBA_DEBUG__
> > -                                     dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
> > +                                     dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
> >  #endif
> >                               }
> >                       }
>
