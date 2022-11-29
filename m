Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50063C49F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74823890CE;
	Tue, 29 Nov 2022 16:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716E9890CE;
 Tue, 29 Nov 2022 16:05:41 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1432a5f6468so17548396fac.12; 
 Tue, 29 Nov 2022 08:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dNf6TkvS51dxu1kxTM36uob0jsWyAiwJA7/CSWsnRCE=;
 b=gufcSf5qihAu68M+xQWjMAI1uqs99uNjn6zAPeSuNPeFrKl83BJIwWYkFL84DSiGnA
 k+33jSyfWwG4JHvc0O/h4fDUFmMLKWE6NyE4kyPSj3roRmVAVSWQfxdxzq1iZWiqHRAF
 FhEpsbL6S3mZlck+553WhGnGDLEsPSVhOuTDWMbQyxLrmVz2oLaVk3oBLVskerwxs/Kv
 mgcnazFN9rjTkAHhBoPizQkEwi+DBsRbD9HqY3P4i1gFHysHLhYEWenKgUSktiI2WOkR
 vEKRNPQWia14yjqGlvWhW8dgyyetDq6Jezw7HY/bZu5YmNPEg1GLwftfnKA/FJhpEjQZ
 cKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNf6TkvS51dxu1kxTM36uob0jsWyAiwJA7/CSWsnRCE=;
 b=aGkaHWjKaMCPmvNMwSTaLA+rBR0kA4jjmW1IsEkPT2JkWEkHoRRK/a1FmeMc6TuSzv
 M327xSrkw4nvVomXR522Fe+fXMiuXiZ4kRdtJJpRgR5lRE8xXjehG2T+zU8McR5YnelQ
 T7a0y3bfRZyNlRWRbn3UZHTsITKEmjP98ngxam+KhNOJYnUS7m4vTTaxTIgBpQ2idplT
 YMU5w9umoe30lxSi1Dgyr+kciYlHkMd4YdhbCZkZzepirJJtwzc8FFmpQTVIl5j/0YXJ
 YTSwzq91+qbIqw90Y5H9loh2yjAvTJ6xGgwWfwX/zyVLatSi+nTwtcEQbgadrBBmIvqh
 JOjA==
X-Gm-Message-State: ANoB5pm5GqC08eNx/8VQdB7OKAj0taqB3+LHS4VEdxeKE6HJevx0l17b
 +mQiZW8S1aicwj2iuLm9Bvfw9IX/FTeISE/L1Zk=
X-Google-Smtp-Source: AA0mqf4d8tnUKNpVxZcsxAjHtSvqfkg5QhU/RRCiVgG8afexxxVhN3+z4vLDLGjAceJy7yPkL0wN23z83UfzRXXwYNY=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr22363269oab.46.1669737940482; Tue, 29
 Nov 2022 08:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
In-Reply-To: <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Nov 2022 11:05:28 -0500
Message-ID: <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
To: Mikhail Krylov <sqarert@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>
> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> > On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
> > >
> > > On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> > >
> > > >>> [excessive quoting removed]
> > >
> > > >> So, is there any progress on this issue? I do understand it's not a high
> > > >> priority one, and today I've checked it on 6.0 kernel, and
> > > >> unfortunately, it still persists...
> > > >>
> > > >> I'm considering writing a patch that will allow user to override
> > > >> need_dma32/dma_bits setting with a module parameter. I'll have some time
> > > >> after the New Year for that.
> > > >>
> > > >> Is it at all possible that such a patch will be merged into kernel?
> > > >>
> > > > On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> > > > Unless someone familiar with HIMEM can figure out what is going wrong
> > > > we should just revert the patch.
> > > >
> > > > Alex
> > >
> > >
> > > Okay, I was suggesting that mostly because
> > >
> > > a) it works for me with dma_bits = 40 (I understand that's what it is
> > > without the original patch applied);
> > >
> > > b) there's a hint of uncertainity on this line
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> > > saying that for AGP dma_bits = 32 is the safest option, so apparently there are
> > > setups, unlike mine, where dma_bits = 32 is better than 40.
> > >
> > > But I'm in no position to argue, just wanted to make myself clear.
> > > I'm okay with rebuilding the kernel for my machine until the original
> > > patch is reverted or any other fix is applied.
> >
> > What GPU do you have and is it AGP?  If it is AGP, does setting
> > radeon.agpmode=-1 also fix it?
> >
> > Alex
>
> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
> help, it just makes 3D acceleration in games such as OpenArena stop
> working.

Just to confirm, is the board AGP or PCIe?

Alex
