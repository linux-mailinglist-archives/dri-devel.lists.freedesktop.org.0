Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4639B099
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2E26F56A;
	Fri,  4 Jun 2021 02:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944956F56A;
 Fri,  4 Jun 2021 02:53:22 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 q20-20020a4a6c140000b029024915d1bd7cso242799ooc.12; 
 Thu, 03 Jun 2021 19:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59/o5WUFh0HgVtIfqnBcRLjnuCEyEPLe7i9E9Et2Nk0=;
 b=sDNdiWlwKUJ3hMjk3uR3Joh9gi0v3zzKJJfFKNTy3CHj55/JTgBm8Kvw21uS94yBjy
 uV7vur1Q8ATD4tgVEUUrxfHDsRTmTe9O9tXHa/VfLlY26kx2t0bNQGaNIZ0YR2G4Rb52
 aoh7/w4Ikj3MCbUGaXmr3VaIqN1kIRmXUouw3W43tA6lw9oX6RglpIqUFTdJMZ6jytw3
 ++EAlp4Et8/0xCpjau424k0LIe3eAV+PEDry2ayGkjhMgfm9WpxdLLNA5BxdsWeWy+HI
 fDi+Ph5SNXjSnD2asCgD4d1lZ//LjujV6/kImxH3CzxG5b0Duscd0pDFh4fZqgPFbHoB
 1kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59/o5WUFh0HgVtIfqnBcRLjnuCEyEPLe7i9E9Et2Nk0=;
 b=ZUn5BCGbcHefszBpJfCLznr3vGyUaf5xIXBAf6KcKMDikV3CxjTlSVP5grBt2Gd7Rc
 Tn0IIzdkvhlAijAycSYdISlNdavyKZQ09SqIqD2T/y3WDs2rbN8uiJ8TCuze+b6KwM1K
 9sczXwTIWiujXBXsADsINQE4VyxIiTn7KSnM5C5Y54Eyoia4JYzSffQy//WWjVv8rTNj
 6+w/G0DlRLJi9gbzUcGTWoiTGst+RLo+wpPHly6Nt11H7YvcIBhWSZ7p8TJevi8Oq+3Z
 b6AVqiB6EgZYOcts453YAuaiy35w/9S28UCAwuNRSXPqeIV8LCfrn/O/oPZFNu3txadx
 YXOA==
X-Gm-Message-State: AOAM531NBH83DN0F+/Zb1fAkyis22ld3Rlwk0K9bPe6bd1v6tWZ17yMy
 2c3/IArlHyAuxC9XreXjfJYNpE08XeTSXwPJEYA=
X-Google-Smtp-Source: ABdhPJytfvSP1Lg7K9HXPuiuhCUyS1i3M9tOa/IoW8cmSYko9U7xwaVmBK1twuGf2I7oa9uz5y8O8GsM9nKBQemjdZI=
X-Received: by 2002:a4a:d004:: with SMTP id h4mr1877872oor.90.1622775201900;
 Thu, 03 Jun 2021 19:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
 <CAPM=9tznFeKrL-La1RqCtAib4N+Stf=2epQYabrm=vYnds6LwQ@mail.gmail.com>
In-Reply-To: <CAPM=9tznFeKrL-La1RqCtAib4N+Stf=2epQYabrm=vYnds6LwQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 22:53:09 -0400
Message-ID: <CADnq5_OJt6YUixqhfkvVq6RKACNYtEHNKb8wY1h+7d6G1a3P3Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Dave Airlie <airlied@gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 9:37 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 4 Jun 2021 at 07:20, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Please open a gitlab MR for these.
> >
>
> I'd really prefer these tests all get migrated out of here into igt. I
> don't think libdrm_amdgpu really should have tests that test the
> kernel level infrastructure.
>

We are providing equivalent patches for IGT as well.  There are some
teams and customers that would prefer to stick with libdrm_amdgpu.

> I know some people at AMD had issues in the past with igt because the
> i might have stood for intel back in time, but at this point I think
> we should be moving past that.

I don't think that was ever an issue.  It's more that some teams built
a bunch of infrastructure that used libdrm tests and haven't had the
resources to switch to IGT yet.

Alex
