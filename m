Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9093C934
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 21:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08A010E307;
	Thu, 25 Jul 2024 19:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXWz/QTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EF210E307;
 Thu, 25 Jul 2024 19:54:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1fd640a6454so12889375ad.3; 
 Thu, 25 Jul 2024 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721937294; x=1722542094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ2/3q/bfgdLQ2SKF+xPcpuZtJ5O3OCCf8lNzI6xqq0=;
 b=SXWz/QTSd1tNt1pWVk2B+zayx8eR6ZbPWwJ/+xsD75DCmYujpejzNNwiUglj8eLxI6
 R90OEVfGP7X7w34ejXfJY984VUslWQNX6eBPcNXhlQ2BXB/WGG4iQhaFgAi/q+pkJqYS
 TU41bHEObBDRGnWaJ2pO1a4J/csChet4+BX6JYS5JfjhjeZVaXh4JC+HAywTC1W8Xoui
 aRwzy6kNe+rFYzjJqPaUGPflt54ve0KJhD+d+jiXQEkATLgUiRcB7xz21UVm56nnRg9a
 Em6SgN91YsNJd0GoVZ9hMnoUH00n3FTiNrMfhsQPdV2NqB/VlrVCpDpWATzE5lnVI7A+
 0dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721937294; x=1722542094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ2/3q/bfgdLQ2SKF+xPcpuZtJ5O3OCCf8lNzI6xqq0=;
 b=Vwu5VFx1oAAzg8ofEAiOE5qNH8UvSH0oDE86flvH1K80gKdi1Au8s1kPZNWnmo3MiR
 k7rIP3MzSn9DVO253GLV1JZP9sJzWmgdQxHh1/chbUVbvZNV/TjEh2CrSoYj6LcFn7c2
 Cn8AyhDg7/BCEmQ+7R3MxEIDQJwBkut/EZ2UL+a940anaW6HnddLmyFI/8Txz39PaFT+
 STuZjSth3KG8T3KBlUUBUHpeE8ISQ9xS5wd0eHh5xUfAc4FawMUYvVZ7XueXlufqVzGX
 IeYnv5wa/jTcL98blDu2G7jCbCM2twpLHqQ1in+0TrTYEfIvlx8/UdCtcdDFHlnK0k7I
 KyPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw27oC0RSbeZMH3YHh+XiIzQJTrkITkUmmcv3OSmzwEtAND0rqA6G8sMQVBomyd5cCJFIkuKpP83nx85B7wZeZEw9iWf6G+SD6ADFlC3V4F4TN864v5GvnjFEsJpd0W+LFNhp8f63UkOHX6YCM+A==
X-Gm-Message-State: AOJu0Ywa+atJRSISBPc41QmpiNrIrjN1GqAxAhbQYZDxnrdUSqhdJ34k
 grQYjVyDvfXDeFiOogrkb9OO/Sl6RPH6l9jFTmx68pw42bjBYvYxTlHBorKJyothWOlYZjuV8SO
 bINNDGEVl4iYEDnkatkXuvsowLyVfM7iU
X-Google-Smtp-Source: AGHT+IGlHXz1aSbMBuuCXDUVMJbNQOTZlhgtwLY66bzlvs53OORi8u2Ewst7irO4S9i2tcQNqCkaFe1Pdt6xXP0DHFA=
X-Received: by 2002:a17:902:c945:b0:1fc:4bdc:d413 with SMTP id
 d9443c01a7336-1fed3af1d80mr43778135ad.60.1721937294112; Thu, 25 Jul 2024
 12:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240724175423.18075-1-abhishektamboli9@gmail.com>
 <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
In-Reply-To: <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2024 15:54:42 -0400
Message-ID: <CADnq5_MHtyUENJGk=f+i-3ODJpGiZc1QFpQuvAh=uaFc9x9-9A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
To: "Ricardo B. Marliere" <rbmarliere@gmail.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>, airlied@gmail.com,
 daniel@ffwll.ch, 
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 marcelomspessoto@gmail.com, aurabindo.pillai@amd.com, adnelson@amd.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is already fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/6e169c7e0f842c48c7bf683=
fb789dbf5a8b1dfd8

Alex

On Wed, Jul 24, 2024 at 3:55=E2=80=AFPM Ricardo B. Marliere
<rbmarliere@gmail.com> wrote:
>
> On 24 Jul 24 23:24, Abhishek Tamboli wrote:
> > Fix documentation compile warning by adding description
> > for program_3dlut_size function.
> >
> > Remove the following warning:
> > ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function p=
arameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'
> >
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/=
drm/amd/display/dc/inc/hw/mpc.h
> > index 40a9b3471208..615c69d966e7 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -1039,7 +1039,21 @@ struct mpc_funcs {
> >       */
> >       void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID i=
d, const enum MCM_LUT_XABLE xable,
> >                       bool lut_bank_a, int mpcc_id);
> > -     void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int=
 mpcc_id);
> > +     /**
> > +      * @program_3dlut_size:
> > +      *
> > +      * Program 3D LUT size.
> > +      *
> > +      * Parameters:
> > +      * - [in/out] mpc - MPC context.
> > +      * - [in] is_17x17x17 - Boolean Flag.
> > +      * - [in] mpcc_id - MPCC physical instance.
> > +      *
> > +      * Return:
> > +      *
> > +      * void
> > +      */
>
> Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
>
>
> > +      void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, in=
t mpcc_id);
> >  };
> >
> >  #endif
> > --
> > 2.34.1
> >
