Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74A4F370E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1D210E2D1;
	Tue,  5 Apr 2022 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564E010E23E;
 Tue,  5 Apr 2022 14:13:45 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-deb9295679so14512717fac.6; 
 Tue, 05 Apr 2022 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WslZ7AK5I01+iCqGCO9Dgq1a0POGQx4Hd26LtRymjT4=;
 b=UtZC3Lh1EiUZkveR3j6MR50Yd7t9tZH7q/DolNQ5El24x/AyUl36y79DVPDbBVxQXH
 sXiGtjNk2H73Q548+2ulZoxFBMSPkGpPKOuZBVOKcWoKY2RrU3f0u960hNNbNnDyXtyP
 PwKMbU1zKe+0tM6t+kRplqWY6OUyHuapY4OjLzDtPJ9qdwglBIDCy2EH10zLsK3YA/2Y
 hlnWzsoe3YnIT1oqovWs1Dx03VZFwdIIJSU0cH+8uU96aBx99JBYuVGBsuCUkyinVh5v
 FXnrgrormDnb79kR0r62eCUfCUCdwanQ6S2jLsNuINDYaPPGGfLssy8z/JSPpsUXG4Vj
 u6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WslZ7AK5I01+iCqGCO9Dgq1a0POGQx4Hd26LtRymjT4=;
 b=Eg7a4nq49GeMC0fj7YgnHHLJ2NBag1qC7tIxF1xJc3bbp2fo2oYiaRK9j1t3yVAOGz
 URGF3hU0hc0StODJgt+JSc6+R4jaOEJxwcY34+iuEWCmGqZrV/yIvHLuy0EuNqtLlBga
 YUfI1M5m8daCHbScqoW4vuIdAuPzwKTnbKUP5RjQ5ZL3gJmXm+Ga+O4OKODk04HtzJna
 ZICGdAeT20+7+rrFrnIWH/QYGSmMwd3l4dAH3NThGYPqm25FsoE9kMrNpNH2CtT7OtxT
 gL70tqJ5usDhAILdF02DrWYchyVa99E/P+FiPkgiPzdsYl8iBDGNht8/cycpXcccbY1+
 yTBg==
X-Gm-Message-State: AOAM533riwlMif31nX/ATMcHUTUaUaNoxvUIYGaLZxb83h9+a1PKpRFj
 t0INcRMJgdeNutMXJhtYsdVoM2gzces/zW08Gd8=
X-Google-Smtp-Source: ABdhPJx7TwS1ffBZmSddKl1zAc8fP3jMcycw8Sby0yyiERayBba0c1hysOPCD2lRpIS5h6ULWEGH26nLqdoxDARZBJc=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1543246oaa.200.1649168024678; Tue, 05
 Apr 2022 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220404214255.11902-1-Philip.Yang@amd.com>
 <7a0e9d4c-257f-287e-9caf-f4161887ba39@molgen.mpg.de>
 <530f3735-9a82-54af-c090-cc8d5b1510cc@amd.com>
 <226a1c28-2516-7af4-dc19-7236f31128e9@molgen.mpg.de>
 <CADnq5_M2nX_TAth0aQbxRWSLQVnDKMGuBBxzhvrBv6ZA5SZe1w@mail.gmail.com>
 <02ebf0ff-32e5-6be5-b166-163efd95d5ad@molgen.mpg.de>
In-Reply-To: <02ebf0ff-32e5-6be5-b166-163efd95d5ad@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 10:13:32 -0400
Message-ID: <CADnq5_OAByMKOGysWqt8nfO4_8DSM57D8JOMRTL9mRoJSN7tMA@mail.gmail.com>
Subject: Re: Public patches but non-public development branch
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 10:03 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Alex,
>
>
> Am 05.04.22 um 15:14 schrieb Alex Deucher:
> > On Tue, Apr 5, 2022 at 3:02 AM Paul Menzel wrote:
>
> >> Am 05.04.22 um 08:54 schrieb Christian K=C3=B6nig:
> >>> Am 05.04.22 um 08:45 schrieb Paul Menzel:
> >>
> >>>> Am 04.04.22 um 23:42 schrieb Philip Yang:
> >>>>> bo_adev is NULL for system memory mapping to GPU.
> >>>>>
> >>>>> Fixes: 05fe8eeca92 (drm/amdgpu: fix TLB flushing during eviction)
> >>>>
> >>>> Sorry, where can I find that commit?
> >>>
> >>> Well that's expected, the development branch is not public.
> >>
> >> Well obviously, it was unexpected for me. How should I have known? Whe=
re
> >> is that documented? If the patches are publicly posted to the mailing
> >> list, why is that development branch not public?
> >>
> >> The current situation is really frustrating for non-AMD employees. How
> >> can the current situation be improved?
> >
> > Our development branch
> > (https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-n=
ext)
> > is available publicly.  There can be a day or so of lag depending on
> > when it gets mirrored (e.g., over the weekend).
>
> Thank you for the clarification. As can be seen at hand, it still causes
> confusion though.
>
>      commit 05fe8eeca927e29b81f3f2a799e9b9b88b0989a9
>      Author:     Christian K=C3=B6nig <christian.koenig@amd.com>
>      AuthorDate: Wed Mar 30 10:53:15 2022 +0200
>      Commit:     Christian K=C3=B6nig <christian.koenig@amd.com>
>      CommitDate: Fri Apr 1 11:05:51 2022 +0200
>
> Today is Tuesday, so it wasn=E2=80=99t mirrored yesterday, on Monday.
>
> To avoid this friction in the future, is there an automated way to
> mirror the branches? git hooks should allow that to be done on every
> push for example.

It's a bit more complicated than that since we have various CI systems
and IT security policies involved, but we can look into it.

Alex
