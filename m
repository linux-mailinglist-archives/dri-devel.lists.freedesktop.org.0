Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E148B37AB18
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D28A6EA6D;
	Tue, 11 May 2021 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4B6EA6C;
 Tue, 11 May 2021 15:48:21 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 o202-20020a4a2cd30000b02901fcaada0306so4288470ooo.7; 
 Tue, 11 May 2021 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5G3X0SsMYoBRSudd4/RxfVXt3YIGObL1pFXwXeHxFjA=;
 b=ergBPEMz0eajaLPXgWUA6rjor17KYhfwTmK2sOuzzDbXqsPIWtVRKjfxbIfzY9OkIc
 q0L2k0bcDQHmQnOLvySuWkGTMFVDa41heYsNZzJu0POZhOZPPGT8MDgenaetDOwBDhCO
 JZWEsqDG+G1ALmEIReIrhqYUxm/ZrRY7aAZPIYjXQJCm15gyHomQlJ2mOncSfwLSnUUn
 x2ltw4rw0iutyooHA0z3ND6QaxqyQb28rLR3pop34okjpBS4V5vtmt+PSopxAYHRWt8h
 +pljNqMcTsAXw3aWT6x7hsB4OHac8L/kKUSbwPj5bGCzHiu9F6Sx1u0g/8NXmUgau1Xk
 QhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5G3X0SsMYoBRSudd4/RxfVXt3YIGObL1pFXwXeHxFjA=;
 b=nQIoXC1Rzi5AFpCx3YLXePcxyc+L9m0YMcDuR+3/N0d8fz8tfYRKJV7Shmq4mBhtWh
 nf/DT7CUjTNj9Q5QnUPYzsd2LWsLEXnQX5PcdGaYB8xYRUVHbnGlc6ST2TtOzsSoWBSl
 YkcT8+yz5Rq9ELQX43zsSBqZRes8nT0XgOnwA/uM22uklw5KL9c8YcS8jPDlwWXlblOc
 IrRXw5sX6p2PkHEkUcCwkHwxjqvJZF1+PMLTUs70P9pfD+OvQSw7TrJN69mbFsua+FHL
 uKs1lUIsgi9Jsi6pqzEIEP56yjMnjVZyLIe+iPJ53+9LXfBqZMJ1ED6pqGBNSmjb/cff
 swyQ==
X-Gm-Message-State: AOAM532iglRIPO9RztUjjNdz37/bj5G7/+vYU+yw5zijTWI+7v3Y50YX
 Z7Lmt5lPGreAOei9hjlDPp8CmsTitSpgd2dqEVc=
X-Google-Smtp-Source: ABdhPJzACYbQ8TvRjv21GKdTUAKZG5wgcKKCL8UftacLyBzooNVzwknDRupMyFB2bQaOxgOZJU1/+G22G6kfIOv1RJs=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr23978147oor.61.1620748101287; 
 Tue, 11 May 2021 08:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local> <YJWWByISHSPqF+aN@slm.duckdns.org>
 <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
 <YJWqIVnX9giaKMTG@slm.duckdns.org>
 <CADnq5_PudV4ufQW=DqrDow_vvMQDCJVxjqZeXeTvM=6Xp+a_RQ@mail.gmail.com>
 <YJXRHXIykyEBdnTF@slm.duckdns.org>
In-Reply-To: <YJXRHXIykyEBdnTF@slm.duckdns.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 May 2021 11:48:10 -0400
Message-ID: <CADnq5_MDvhJiA2rd6ELAx87x2RdXJ_Am6N=xZQdtsG_KCubAtw@mail.gmail.com>
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

On Fri, May 7, 2021 at 7:45 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, May 07, 2021 at 06:30:56PM -0400, Alex Deucher wrote:
> > Maybe we are speaking past each other.  I'm not following.  We got
> > here because a device specific cgroup didn't make sense.  With my
> > Linux user hat on, that makes sense.  I don't want to write code to a
> > bunch of device specific interfaces if I can avoid it.  But as for
> > temporal vs spatial partitioning of the GPU, the argument seems to be
> > a sort of hand-wavy one that both spatial and temporal partitioning
> > make sense on CPUs, but only temporal partitioning makes sense on
> > GPUs.  I'm trying to understand that assertion.  There are some GPUs
>
> Spatial partitioning as implemented in cpuset isn't a desirable model. It's
> there partly because it has historically been there. It doesn't really
> require dynamic hierarchical distribution of anything and is more of a way
> to batch-update per-task configuration, which is how it's actually
> implemented. It's broken too in that it interferes with per-task affinity
> settings. So, not exactly a good example to follow. In addition, this sort
> of partitioning requires more hardware knowledge and GPUs are worse than
> CPUs in that hardwares differ more.
>
> Features like this are trivial to implement from userland side by making
> per-process settings inheritable and restricting who can update the
> settings.
>
> > that can more easily be temporally partitioned and some that can be
> > more easily spatially partitioned.  It doesn't seem any different than
> > CPUs.
>
> Right, it doesn't really matter how the resource is distributed. What
> matters is how granular and generic the distribution can be. If gpus can
> implement work-conserving proportional distribution, that's something which
> is widely useful and inherently requires dynamic scheduling from kernel
> side. If it's about setting per-vendor affinities, this is way too much
> cgroup interface for a feature which can be easily implemented outside
> cgroup. Just do per-process (or whatever handles gpus use) and confine their
> configurations from cgroup side however way.
>
> While the specific theme changes a bit, we're basically having the same
> discussion with the same conclusion over the past however many months.
> Hopefully, the point is clear by now.

Thanks, that helps a lot.

Alex
