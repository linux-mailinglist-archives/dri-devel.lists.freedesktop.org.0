Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93A376AE0
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 21:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FB86E175;
	Fri,  7 May 2021 19:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5586E175;
 Fri,  7 May 2021 19:55:50 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso8909954otm.4; 
 Fri, 07 May 2021 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQnyWX8UpAFeWLBPcl0wEiusAg79AJ6iCjS7XN+qQUM=;
 b=O5HPILdivS0YKoqsFW5OAMccSfukgoFEyl8T8sxZ8qj4bfkEpHHl5xDocVhjtlKa/h
 KsmUB1DuEpCrO/tSrnyXV/6Dglcw9GYIoKGsbHmB1BVHAE7+08kotid/6awVvg2KMcLP
 OgJN3XzHyoWPbAGypOHIurPHF9JhVWJaE05OCMq28h2SBibVWcUrJTrDOVjDoN2ktJqH
 hrHWUvUXr4Zl90u3mOepyMvg6WFXF1FhjSSMN/UWyXUzr3YKNx29U1CUHg3p5WnQcjge
 WbRs0n0b6ywU9WJy4EGJsdc12xiRjZJondmU2lAWvgX717bAFdUw9cm8E2c4kelZO79s
 ASxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQnyWX8UpAFeWLBPcl0wEiusAg79AJ6iCjS7XN+qQUM=;
 b=NvN76UY+rm4a8Cqq7dJua2BEbLDciFZNTfNnRcJpE1uHBZwi8B5mwT1/MwQjjWl7Y1
 ySsFa5kPHvk6RtMmr1kA23AQvKpltfuTBF+szCVEq9WUSCx1P06qdIoXOLNirZssaxXn
 D4tNRNodwui7Mj+R7itkFsEKnTi4+QEKS+5k80Y+gpHp/hSFATGBRHJqBeL+NoNFBnBZ
 3Uuys4AAIQ7dUrVR6B1glIznlwkGm9JFnkEOPIX6X8gHhEAdztAT8VkTXPAsNVLOcir9
 P0Z0BLlewxxjw5k4OPA3tUzYOsDyR/utyhpUe+9MaYzQqZOPKQAAyeADYXYCRsGRqcjf
 RAqQ==
X-Gm-Message-State: AOAM532akWGUhCpnGwDzl9Bwgy+UPeoAjYvitBJr22pVLSZZwVsZqsFq
 PHsQI8BnMtCxOhNEqbXNfGg0eNT1QTOoFknkZMo=
X-Google-Smtp-Source: ABdhPJxSN3/17xHdFjhSCghcx/8s/LWHl/NuI+//RSo2pAWsPuDQlJpfn0/5Rjl3B/LGJlLffIe5AbmBEavYIDEc+bk=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr3297673oth.311.1620417349972; 
 Fri, 07 May 2021 12:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local> <YJWWByISHSPqF+aN@slm.duckdns.org>
In-Reply-To: <YJWWByISHSPqF+aN@slm.duckdns.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 May 2021 15:55:39 -0400
Message-ID: <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Tejun Heo <tj@kernel.org>
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Brian Welty <brian.welty@intel.com>,
 John Fastabend <john.fastabend@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Kenny Ho <y2kenny@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, KP Singh <kpsingh@chromium.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Kenny Ho <Kenny.Ho@amd.com>, Network Development <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 3:33 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, May 07, 2021 at 06:54:13PM +0200, Daniel Vetter wrote:
> > All I meant is that for the container/cgroups world starting out with
> > time-sharing feels like the best fit, least because your SRIOV designers
> > also seem to think that's the best first cut for cloud-y computing.
> > Whether it's virtualized or containerized is a distinction that's getting
> > ever more blurry, with virtualization become a lot more dynamic and
> > container runtimes als possibly using hw virtualization underneath.
>
> FWIW, I'm completely on the same boat. There are two fundamental issues with
> hardware-mask based control - control granularity and work conservation.
> Combined, they make it a significantly more difficult interface to use which
> requires hardware-specific tuning rather than simply being able to say "I
> wanna prioritize this job twice over that one".
>
> My knoweldge of gpus is really limited but my understanding is also that the
> gpu cores and threads aren't as homogeneous as the CPU counterparts across
> the vendors, product generations and possibly even within a single chip,
> which makes the problem even worse.
>
> Given that GPUs are time-shareable to begin with, the most universal
> solution seems pretty clear.

The problem is temporal partitioning on GPUs is much harder to enforce
unless you have a special case like SR-IOV.  Spatial partitioning, on
AMD GPUs at least, is widely available and easily enforced.  What is
the point of implementing temporal style cgroups if no one can enforce
it effectively?

Alex

>
> Thanks.
>
> --
> tejun
