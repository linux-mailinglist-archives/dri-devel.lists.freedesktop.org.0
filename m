Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6507376815
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BED6E0DF;
	Fri,  7 May 2021 15:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6B26E0DF;
 Fri,  7 May 2021 15:33:59 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id w15so12066644ljo.10;
 Fri, 07 May 2021 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XItf2h9hovNafxela2Mfpgx6zd0s5dzNeA3YTSrq32g=;
 b=Jx5khNbbvbtn/U6yoK/8cw0ezIGuOk20VXL3g5Xc+1PO4u0/c7u9JdhS4Sh0A/238X
 qJDK3CmCrhsUw3kxgGmtVLKOVBpamJ+mgC++QhBm/huNDdpJjfnji8KQgSRdH6dR/6qw
 gnnCzv+ZkzfWEd8q02n4o5Q1u7vF1VZJ4e7OS4bTosSeDlXkdzxCU2dg/3t0bFiexOvm
 +Fns9n/UTIMVSeDR8FrwK2UMk0Co9GksoDN716frVRknDfq407ihSlg/RkoHgqcpmhWB
 9MxoWewWjLjGhCFj5Iy5vQfpMUzUk5ghM0z3CRFvwHCE5bR6RTjPI1mbzhQOqVqQKwNY
 QLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XItf2h9hovNafxela2Mfpgx6zd0s5dzNeA3YTSrq32g=;
 b=BvgU28tONVdMm79KITsAzt3IXJ4x15zduuEldGtxHRcKLp7QM2ZQwn6HJbGrtdGHtR
 ajSi2ESCHFU9YN69I7X+nzYIu+Re5eVcqsFJt4lWbDyjQETb3ggwgc8XLT4Ky/Y6bgkH
 gRrDMQD3a0qKlaajLOew/70qYT+oNtStz06bukI6sDmP7Gfm4PwzJ9XOjNFyrHQ8VBpJ
 +NaaP4rz3pYq9OTGg210C6iuWLoQg40EXa8jlblhXNwfR1D5ZpItmkIcNButfzJuAkhP
 cn+X76Z8Y8Z1NhtHp4uKuICgB7t7r2bD7ajS/Lc4xHS6v0KCkFSq+USJQ09Ll8y5Hzec
 Y+fA==
X-Gm-Message-State: AOAM532Hmuiai/dbxhAeDkfsX8UbUt4YzFU1JHaGk1bPnc7KfkrYMWm7
 VVp9+B8ycUhWwLOrNAUlyyd94/XkmvQNhO8eOB4=
X-Google-Smtp-Source: ABdhPJx/cIdx8NpTK9Kf5ak04J3JS36S0jqI9UthXLBwNn3zr8xJh29JWdymKYR7PnpZPh/rQLr7Hj7zbOpXNv/R8KY=
X-Received: by 2002:a2e:bf1f:: with SMTP id c31mr8218857ljr.30.1620401638215; 
 Fri, 07 May 2021 08:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOWid-czZphRz6Y-H3OcObKCH=bLLC3=bOZaSB-6YBE56+Qzrg@mail.gmail.com>
 <20201103210418.q7hddyl7rvdplike@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-djQ_NRfCbOTnZQ-A8Pr7jMP7KuZEJDSsvzWkdw7qc=yA@mail.gmail.com>
 <20201103232805.6uq4zg3gdvw2iiki@ast-mbp.dhcp.thefacebook.com>
 <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
 <CAOWid-eXMqcNpjFxbcuUDU7Y-CCYJRNT_9mzqFYm1jeCPdADGQ@mail.gmail.com>
 <YBqEbHyIjUjgk+es@phenom.ffwll.local>
 <CAOWid-c4Nk717xUah19B=z=2DtztbtU=_4=fQdfhqpfNJYN2gw@mail.gmail.com>
 <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
In-Reply-To: <YJUBer3wWKSAeXe7@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 7 May 2021 11:33:46 -0400
Message-ID: <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Martin KaFai Lau <kafai@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 4:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Hm I missed that. I feel like time-sliced-of-a-whole gpu is the easier gpu
> cgroups controler to get started, since it's much closer to other cgroups
> that control bandwidth of some kind. Whether it's i/o bandwidth or compute
> bandwidht is kinda a wash.
sriov/time-sliced-of-a-whole gpu does not really need a cgroup
interface since each slice appears as a stand alone device.  This is
already in production (not using cgroup) with users.  The cgroup
proposal has always been parallel to that in many sense: 1) spatial
partitioning as an independent but equally valid use case as time
sharing, 2) sub-device resource control as opposed to full device
control motivated by the workload characterization paper.  It was
never about time vs space in terms of use cases but having new API for
users to be able to do spatial subdevice partitioning.

> CU mask feels a lot more like an isolation/guaranteed forward progress
> kind of thing, and I suspect that's always going to be a lot more gpu hw
> specific than anything we can reasonably put into a general cgroups
> controller.
The first half is correct but I disagree with the conclusion.  The
analogy I would use is multi-core CPU.  The capability of individual
CPU cores, core count and core arrangement may be hw specific but
there are general interfaces to support selection of these cores.  CU
mask may be hw specific but spatial partitioning as an idea is not.
Most gpu vendors have the concept of sub-device compute units (EU, SE,
etc.); OpenCL has the concept of subdevice in the language.  I don't
see any obstacle for vendors to implement spatial partitioning just
like many CPU vendors support the idea of multi-core.

> Also for the time slice cgroups thing, can you pls give me pointers to
> these old patches that had it, and how it's done? I very obviously missed
> that part.
I think you misunderstood what I wrote earlier.  The original proposal
was about spatial partitioning of subdevice resources not time sharing
using cgroup (since time sharing is already supported elsewhere.)

Kenny
