Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78087376D78
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 01:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3B6E5B6;
	Fri,  7 May 2021 23:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A783C6E5A5;
 Fri,  7 May 2021 23:45:36 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id c11so7789010qth.2;
 Fri, 07 May 2021 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rk5ZF5O3eDY1kMqyU3TfWHx2sPsSACItLLAgyKze1w4=;
 b=WRCthpiWBtHfvBKo/T251l8U1FYDhxXo7foPARg3JjejHTmSQOooowsVGhiLNOMcQq
 SEsxajIMgeAvkewvQIU3xgrOHNPR0Z9w1zSYWr8ZUs70zgkyMRMXPTpFsGKP4SdyAs1h
 gYDTlKwwBVwPfauLYsM/53bjt3mahmc4GsVenCC96iwSpELZA/54Bf6QYhKIYwdbb5z2
 AHAhzCo2p1w9E/No1NNALqOx7P42N3Pl5AwOysmoxj/mh3p8uYsuFodkyDeZIk0AsCsU
 MYajtRBmN8d9BC+YYXawJbrQNPVvtBq3Yp3ek+8RBg3AlU9ogvuprYYPRsriM88vgmM3
 SzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=rk5ZF5O3eDY1kMqyU3TfWHx2sPsSACItLLAgyKze1w4=;
 b=CpFUTNwn45A+OpPP4hRysYpx1hsDlbgvtz5YPyBuLJUp78AYPaSFFnOX6tcDROW7fN
 tn+QXcyECZ0N7MFQbuJBP4pxH+/+riU6R1JGbo1+SPWJbMmDykU8e1tBpnaW658AZ8sy
 Ypg/wqHao/VWFHZ+AzylBCBxcI0VxbmawEPtq4oFlkFy8YiRTpXqEbDbJ/VZMbsBH15L
 uROYL+UHshtJlysE05CZBSjUgsRIeJe4WGNDmqj9Q5lt8UT02KvMvqgO8A8EBWa5GAXR
 3tvWJSRF3zNlZgiS/Y4jE18l/XTka8HaN8G6VwA9FsQ6IqWL3bh9b/PR+4SIGaMLw8TV
 qQvA==
X-Gm-Message-State: AOAM532xYS4N2tgdYRwjEe1FrX+f1NoDkdEBZdk/PqUFMsamY5cODfg9
 oCYYc9ZxC+DmbZeY5e3qFWw=
X-Google-Smtp-Source: ABdhPJzjTDnhrKBnwYTKzTK+SPBDjhjdMBkHM07M5oIZGhHtKq0iDeDFE/rmPDemNN2JQXfuLxum5Q==
X-Received: by 2002:ac8:7cb0:: with SMTP id z16mr12236002qtv.157.1620431135577; 
 Fri, 07 May 2021 16:45:35 -0700 (PDT)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net.
 [199.96.183.179])
 by smtp.gmail.com with ESMTPSA id 2sm4492640qko.28.2021.05.07.16.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 16:45:34 -0700 (PDT)
Date: Fri, 7 May 2021 19:45:33 -0400
From: Tejun Heo <tj@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YJXRHXIykyEBdnTF@slm.duckdns.org>
References: <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local>
 <YJWWByISHSPqF+aN@slm.duckdns.org>
 <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
 <YJWqIVnX9giaKMTG@slm.duckdns.org>
 <CADnq5_PudV4ufQW=DqrDow_vvMQDCJVxjqZeXeTvM=6Xp+a_RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_PudV4ufQW=DqrDow_vvMQDCJVxjqZeXeTvM=6Xp+a_RQ@mail.gmail.com>
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

Hello,

On Fri, May 07, 2021 at 06:30:56PM -0400, Alex Deucher wrote:
> Maybe we are speaking past each other.  I'm not following.  We got
> here because a device specific cgroup didn't make sense.  With my
> Linux user hat on, that makes sense.  I don't want to write code to a
> bunch of device specific interfaces if I can avoid it.  But as for
> temporal vs spatial partitioning of the GPU, the argument seems to be
> a sort of hand-wavy one that both spatial and temporal partitioning
> make sense on CPUs, but only temporal partitioning makes sense on
> GPUs.  I'm trying to understand that assertion.  There are some GPUs

Spatial partitioning as implemented in cpuset isn't a desirable model. It's
there partly because it has historically been there. It doesn't really
require dynamic hierarchical distribution of anything and is more of a way
to batch-update per-task configuration, which is how it's actually
implemented. It's broken too in that it interferes with per-task affinity
settings. So, not exactly a good example to follow. In addition, this sort
of partitioning requires more hardware knowledge and GPUs are worse than
CPUs in that hardwares differ more.

Features like this are trivial to implement from userland side by making
per-process settings inheritable and restricting who can update the
settings.

> that can more easily be temporally partitioned and some that can be
> more easily spatially partitioned.  It doesn't seem any different than
> CPUs.

Right, it doesn't really matter how the resource is distributed. What
matters is how granular and generic the distribution can be. If gpus can
implement work-conserving proportional distribution, that's something which
is widely useful and inherently requires dynamic scheduling from kernel
side. If it's about setting per-vendor affinities, this is way too much
cgroup interface for a feature which can be easily implemented outside
cgroup. Just do per-process (or whatever handles gpus use) and confine their
configurations from cgroup side however way.

While the specific theme changes a bit, we're basically having the same
discussion with the same conclusion over the past however many months.
Hopefully, the point is clear by now.

Thanks.

-- 
tejun
