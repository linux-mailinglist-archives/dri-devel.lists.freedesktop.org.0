Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704604ACB0B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 22:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2D10F909;
	Mon,  7 Feb 2022 21:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7ED10F909;
 Mon,  7 Feb 2022 21:15:56 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s24so10808683oic.6;
 Mon, 07 Feb 2022 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OobE6i7gIMfg4XFPq2mt3VscXgZfAtapsVYwcALM9Kc=;
 b=THD90P/x+7OXkXfQgKxZwvuLFl98w7iNmiBPjN4Ohbd8qVNuZsx8HWUnEr2oeRg0bM
 +ejAu/jNLP6+QxZwJXSaM6gcmUm8+Ys4VNJ1ag7fE8U6A7odgXO8TJR3SRg1uV+DqQLK
 fJ2RVbkVPIOW06tXisnEHU16QLILzSryYaZ93aLE1/PfSns7oLMi2pr3QWFEYH4+PD6X
 eIl4D+ULSOqcPo3uMG6aK7Pwc5sZGXxJgtLeNRl4d3sTNdoAQH6Vi2PJuV1p4BjAn2m9
 Bpry8EuRVjmMSq99PJdUzvItDNKdfhnDAZ7hV/Tzem/KMiOT793BLNxluAkpAulQBWlY
 vUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OobE6i7gIMfg4XFPq2mt3VscXgZfAtapsVYwcALM9Kc=;
 b=VQjKLChv5ki8YBy5nUp633C/ueqM1hpfMQ3Iv7ahdP/dXlrSRioGaWTbZUSZGySDTA
 +a+luUiYO7239tIxW6aogTfL1yv+vey4BvyWPxCJPjQvYwITmORvhFrqJTXq1z9wjwdz
 YneH5OVHWw+zfmPlor+/hbhmR+Z6GRHmlAC0h0S2t5KKy1FB6dorY41he/Ws6SJLtyV7
 6M2LVNfDpvUNBvZGyFVjUWNSiZClT8mXxVI1FITm7bJqswfK+b3l6mU/TY5QlohU5ocL
 Pii+OtFfGb33802N/upaOp46UFj4Vpz5Z/4xMIzNOvxuSF/CpSWaDM6iiUv9IMsOEhCm
 woww==
X-Gm-Message-State: AOAM531Hmq6PCG/2TBpRCptUuwB/E9pq5GvohWElvXiHGVWKu+AhVNTa
 m+EhbjmchDp7MD7Ee2Fm/KVxYrqz3e5hsukJ+Fg=
X-Google-Smtp-Source: ABdhPJy0bAxTrvw72wAxN/d14eYdF+KNvKxwijohy8ZvMiJBQd6GMzYwqRPpVLSh5YbT4tpNXPax1NgR3jIPFhxGNvk=
X-Received: by 2002:a05:6808:159e:: with SMTP id
 t30mr412394oiw.132.1644268555404; 
 Mon, 07 Feb 2022 13:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20220205150008.1968218-1-trix@redhat.com>
 <DM6PR12MB261982BB4DBCC90F70381121E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB261982BB4DBCC90F70381121E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Feb 2022 16:15:44 -0500
Message-ID: <CADnq5_Mx8kMjLMTxD+db_ssTX8O35MzSfAyeL2NaHDMay7+bzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix error handling
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "trix@redhat.com" <trix@redhat.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Powell,
 Darren" <Darren.Powell@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Feb 6, 2022 at 10:04 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: trix@redhat.com <trix@redhat.com>
> > Sent: Saturday, February 5, 2022 11:00 PM
> > To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > airlied@linux.ie; daniel@ffwll.ch; nathan@kernel.org;
> > ndesaulniers@google.com; Lazar, Lijo <Lijo.Lazar@amd.com>; Powell, Darren
> > <Darren.Powell@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>;
> > Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; llvm@lists.linux.dev; Tom Rix <trix@redhat.com>
> > Subject: [PATCH] drm/amd/pm: fix error handling
> >
> > From: Tom Rix <trix@redhat.com>
> >
> > clang static analysis reports this error
> > amdgpu_smu.c:2289:9: warning: Called function pointer
> >   is null (null dereference)
> >         return smu->ppt_funcs->emit_clk_levels(
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > There is a logic error in the earlier check of
> > emit_clk_levels.  The error value is set to
> > the ret variable but ret is never used.  Return
> > directly and remove the unneeded ret variable.
> >
> > Fixes: 5d64f9bbb628 ("amdgpu/pm: Implement new API function "emit" that
> > accepts buffer base and write offset")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > index af368aa1fd0ae..5f3b3745a9b7a 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > @@ -2274,7 +2274,6 @@ static int smu_emit_ppclk_levels(void *handle,
> > enum pp_clock_type type, char *bu
> >  {
> >       struct smu_context *smu = handle;
> >       enum smu_clk_type clk_type;
> > -     int ret = 0;
> >
> >       clk_type = smu_convert_to_smuclk(type);
> >       if (clk_type == SMU_CLK_COUNT)
> > @@ -2284,7 +2283,7 @@ static int smu_emit_ppclk_levels(void *handle,
> > enum pp_clock_type type, char *bu
> >               return -EOPNOTSUPP;
> >
> >       if (!smu->ppt_funcs->emit_clk_levels)
> > -             ret = -ENOENT;
> > +             return -ENOENT;
> >
> >       return smu->ppt_funcs->emit_clk_levels(smu, clk_type, buf, offset);
> >
> > --
> > 2.26.3
