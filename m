Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A235F68A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 15:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB910E2C2;
	Thu,  6 Oct 2022 13:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BF310E2C2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 13:56:44 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so1437422oop.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/tGLue9QFBddVGPG1fUu/Vm6K4t9pa+6ym9D6yr+ZRI=;
 b=CJxfJ6xRFvFe0xRGHXb7hO+RqzLhVdFEA3eJcGFTiAeLFAGNotEztpUo78DXDaglEU
 iTwHL2Vj4qZZhRBZ/4fip4PYYNzGxdn5MF5FXTJ2zoOwF2DT4G4xiAYC8d+gGWMwnff5
 0+FV+xCihxnquE3kJZbBcPZLSWgxyPxHg1DoSRDWo/L2JCexXjSpeJ5SmBr0M1h0wC8z
 SoIhDyv6A7R45rCVGfOYcN3fcNHqaSuEeb7C8ALy30+aVVNwgjiqkLQhDJTaPZw0Nmaj
 cqJyZ1cRljeRrAy7ayEZNV/GZ2OW/wJ7WmwSuvtY7D1wj8BgSwqc2pC/+6vzJGKaHV1s
 YprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tGLue9QFBddVGPG1fUu/Vm6K4t9pa+6ym9D6yr+ZRI=;
 b=284KLSGpnG+gJrN7hhXVNI1N0WH7Wl73DX5FzykAjdIPKoBMXrx9isQJwr4YdtT8oN
 WqlW7aRrtWrOcnq1ujOFD8F8ztPcEA/KExXUOS3FZvIbtz9dIJhkTo+IwiHNUcZo/Ju7
 CWojfOI59YRlmpP/qBOCohTRmgtU/j076hr7MH3YufMaBXzc6cdWoVYKLwXeQTuMrux4
 e9odd+boq8pJtMSdwOF79VofyFG6P89TbH2x23m99EoDnLDlEI3A+M+BUKv1lyuNajcP
 sCa0mB7upSmGAMCyMgoMKu5BuTTs1cjrzHEQR1AD6IV7LC+6Mf42RurFmIaspbPsWcxT
 zHsQ==
X-Gm-Message-State: ACrzQf3wLVziBt00vmgut0Z2ZCCvjjsTB8eBshJgoRGc2LzVUr9BKnz3
 aK+oebxEzudovU4qSGhSC6BQj6cdKx6Pzyd+b24=
X-Google-Smtp-Source: AMsMyM7JEhRZLznaTVpUQ/ANn7XeGLOBPX/p97js8u3mIR8qd0bxqegHsBBzxRIQ4nttfAXKtUHNfSMd4v28DjD5t5U=
X-Received: by 2002:a9d:6215:0:b0:660:f41e:513a with SMTP id
 g21-20020a9d6215000000b00660f41e513amr1490380otj.123.1665064603933; Thu, 06
 Oct 2022 06:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au> <YzwbW4YQwQPsRPYw@sirena.org.uk>
 <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
 <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
 <20221006092810.0c3a2238@canb.auug.org.au>
 <20221006191245.11bb0e2c@canb.auug.org.au>
In-Reply-To: <20221006191245.11bb0e2c@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Oct 2022 09:56:32 -0400
Message-ID: <CADnq5_N1cZiG39KzUzdHCtLRRCipMMNXjaNuAvoQs8=VTjtGCA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This looks good to me.  Care to add you s-o-b?

Alex

On Thu, Oct 6, 2022 at 4:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 6 Oct 2022 09:28:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I have applied the following hack for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 6 Oct 2022 09:14:26 +1100
> > Subject: [PATCH] fix up for drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > index ae13887756bf..a5da787b7876 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> > @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
> >       }
> >
> >       /* remove writeback info for disabled writeback pipes from stream */
> > -     for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
> > +     for (i = 0, j = 0; i < stream->num_wb_info && i < MAX_DWB_PIPES; i++) {
> >               if (stream->writeback_info[i].wb_enabled) {
> > -                     if (i != j)
> > +                     if ((j >= 0) && (j < i))
> >                               /* trim the array */
> >                               stream->writeback_info[j] = stream->writeback_info[i];
> >                       j++;
>
> This works as well, and (in my opinion) is better:
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index ae13887756bf..fb6222d4c430 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -499,7 +499,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
>                 struct dc_stream_state *stream,
>                 uint32_t dwb_pipe_inst)
>  {
> -       int i = 0, j = 0;
> +       unsigned int i, j;
>         if (stream == NULL) {
>                 dm_error("DC: dc_stream is NULL!\n");
>                 return false;
> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>         }
>
>         /* remove writeback info for disabled writeback pipes from stream */
> -       for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
> +       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>                 if (stream->writeback_info[i].wb_enabled) {
> -                       if (i != j)
> +                       if (j < i)
>                                 /* trim the array */
>                                 stream->writeback_info[j] = stream->writeback_info[i];
>                         j++;
>
> --
> Cheers,
> Stephen Rothwell
