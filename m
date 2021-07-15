Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE43CA039
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 16:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8A36E864;
	Thu, 15 Jul 2021 14:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399996E864;
 Thu, 15 Jul 2021 14:07:30 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id h9so6735527oih.4;
 Thu, 15 Jul 2021 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wd27DEr1E/QgRt9+LAOHHXGHaGJPQeFul0EaBUCJi5E=;
 b=FXf0E7T8xJ07pqsOK2pr9Cfp1wMLErGzJV2wcLPmS7Vh7BinMGkG7jbvYdrfAr6rHa
 pcHmpmlfOH0PgE8yv62FegDUPsQDa5zWuxfsKFOG6Lm2v1H4UBClsOQ5Pj7gtYH1kIjK
 DWIi+ICNwgmBMsELTyogZ1VQx+3qqP+Sj0aBBbPSqFS/wUjlwfBSPedIqpDiCcQyyBLa
 5TjdB0bPdkg51I+tqQ6aOuBamCn11Q0e4MO0/hwj5w2uVfrLzc4b8qMoHEW8uOJICWKJ
 HyxPTMFTqM2rRsvwyEC7GSmg+nVYr6rX129ihdwxllkGkm01VylbZ7K/sIS7eLlAaz8X
 GDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wd27DEr1E/QgRt9+LAOHHXGHaGJPQeFul0EaBUCJi5E=;
 b=e8LnzYPmf0h6wj6JyfIm+KNrk9d6SW0lUM8Jc7rTHJD57PiVQBPyPJJgVspEStc1TO
 01PjalStUYOhv68lqdauLQfOaCnmQ9XyV6ctSM0jQBjx+Vcaiemzcra6VXsfYPC/Hm4x
 Fpb8Mvjg2GngTc6qqcS7Bict64TukSSm6SBf3qJVzsmdMNLRILy/sA1igFP4I7bslm1N
 8lcjWoMIlX/8vo/gEOu4XEpIO6vsBfuwG21WY1R5u4AWdj6q5bdm5PYJ6TpQXhOULjV0
 bstsrVG6uWyxWKJ8Lmn001SU0BguCSxpjy16KMZCv/lr3cbHMeb83VRUpM7m5pJYgQu1
 X76g==
X-Gm-Message-State: AOAM531cKN7Qy5eoh1ITvIUf2Gx57LATTA8FeMFYnCpnNKmAEcg05Lh3
 5PDLqY+dRlMdZ7VwJvvSdjG01HffUBLIFpPppj8=
X-Google-Smtp-Source: ABdhPJycQPIgA6Orp3hDXE6mb3cB+XnNHiJqRke4rwpt7C4aMqzEBwexz5AqgcAGz52swASEEf6jKcP7SQm0g+Ndhvg=
X-Received: by 2002:aca:3446:: with SMTP id b67mr3775753oia.120.1626358049509; 
 Thu, 15 Jul 2021 07:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210714220858.5553-1-alexander.deucher@amd.com>
 <YO+++Tj94RRjVqwV@ravnborg.org>
In-Reply-To: <YO+++Tj94RRjVqwV@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jul 2021 10:07:18 -0400
Message-ID: <CADnq5_Oj1Totqe=fGeF3AeQsodR9_6ki7EChs3CmJzC7txMu1A@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-5.14
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 12:52 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Alex,
>
> On Wed, Jul 14, 2021 at 06:08:58PM -0400, Alex Deucher wrote:
> > Hi Dave, Daniel,
> >
> > Fixes for 5.14.  The big change here is unifying the SMU13 code.  This was
> > new code added in 5.14 to support Yellow Carp, but we've since cleaned it
> > up and removed a lot of duplication, so better to merge it now to facilitate
> > any bug fixes in the future that need to go back to this kernel via stable.
> > Only affects Yellow Carp which is new for 5.14 anyway so not much chance for
> > regressions.  The rest is just standard bug fixes.
>
> This pull seems not to include any fixes for the W=1 warnings that
> has crept in again. It would be nice if the amdgpu could be warning free
> again, this would maybe motivate the others to fix theirs too so we
> could keep most/all of drivers/gpu/ free of W=1 warnings.

We haven't really been monitoring the W=1 stuff that closely.  I'll
see what we can do going forward.

Alex
