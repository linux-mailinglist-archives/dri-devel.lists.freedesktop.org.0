Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD59376CDE
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 00:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113886E59B;
	Fri,  7 May 2021 22:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5FE6E59B;
 Fri,  7 May 2021 22:31:08 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 b5-20020a9d5d050000b02902a5883b0f4bso9252209oti.2; 
 Fri, 07 May 2021 15:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0YWXNTKMAQEd6z039aM9XkewcEru+auENvSRDSVALM=;
 b=ZLVjAoadVZr1dEm4/yvhnrf8/J/nef7G15JbUbGrTvaphSPPg1NYoxyWbrvVrYSS1h
 zIa96XTY8P0hpQ+yNemDEgMJuSG/c4WCmiNe6Nc+iCnLydkMAsdGrWvIm/17ma5Z4yM/
 YzsvyYwW+WiotmISk+eiR/i8Cd7aUBrZpHgxnpBYVJ84BXnaaMaWQ2eKqxevUizYrrdW
 YbtS/h3evHXgpLsmcR18uUbQaKsFRYpehUV3Ng/5C9YykCWFXuYzVQL41A0Sr+comc9P
 aI9Yzg1U+9hzWSAs+VHaET9OhHIE/EcNaIBsMQFPLcf6+DcdHyLoOGNPJ3nmswEFT8wv
 svyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0YWXNTKMAQEd6z039aM9XkewcEru+auENvSRDSVALM=;
 b=cTfYbzkGWtEQAprMn0Re2nYdOrgb3VR38CiCPNYxqExoHo9MdvT/+9GeK1DVNjZ2L1
 BWYhFTti6SHa+gGneAaRSYm0IpIo0AW7bndJiwLWNXXVSqkNiVqnT2dYPD5Am7RT5IyL
 TywPlNvXu8MFbSyGU7D9YdDqcM0UGimBl8RNgB8+p8Y94iwLNHBsHBAwhS4n64s71WOT
 THHXTxi41VCLcBKpaO3sIWa1iL7NDzLxohGVG29mV9IqXYinWoi4DptqI1p0YAXakQSf
 qv4i773fIpUnPBpRW4qazEtc/fLKh4zyCYMSHWuoqFgWHjrey0ZRXV9aEEieRNoE3nKm
 alow==
X-Gm-Message-State: AOAM5318ySASfB7FyZBafU/RW4Hxa1RNCwRzdW8340u6QV9mfC7m6AvH
 uMvY/KuQUXHpstLWOikma5yBCeuwpsOcRRH7Ybo=
X-Google-Smtp-Source: ABdhPJz6COeoWlO2jYoVGMFtMym8VH6Ykqhm4Rnoo8nk0d6rsnG/F5mHf4daWpwa7y0jBo0WQH9c2O2bb827AYiZUvk=
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr10532939otg.132.1620426667759; 
 Fri, 07 May 2021 15:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local> <YJWWByISHSPqF+aN@slm.duckdns.org>
 <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
 <YJWqIVnX9giaKMTG@slm.duckdns.org>
In-Reply-To: <YJWqIVnX9giaKMTG@slm.duckdns.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 May 2021 18:30:56 -0400
Message-ID: <CADnq5_PudV4ufQW=DqrDow_vvMQDCJVxjqZeXeTvM=6Xp+a_RQ@mail.gmail.com>
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

On Fri, May 7, 2021 at 4:59 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, May 07, 2021 at 03:55:39PM -0400, Alex Deucher wrote:
> > The problem is temporal partitioning on GPUs is much harder to enforce
> > unless you have a special case like SR-IOV.  Spatial partitioning, on
> > AMD GPUs at least, is widely available and easily enforced.  What is
> > the point of implementing temporal style cgroups if no one can enforce
> > it effectively?
>
> So, if generic fine-grained partitioning can't be implemented, the right
> thing to do is stopping pushing for full-blown cgroup interface for it. The
> hardware simply isn't capable of being managed in a way which allows generic
> fine-grained hierarchical scheduling and there's no point in bloating the
> interface with half baked hardware dependent features.
>
> This isn't to say that there's no way to support them, but what have been
> being proposed is way too generic and ambitious in terms of interface while
> being poorly developed on the internal abstraction and mechanism front. If
> the hardware can't do generic, either implement the barest minimum interface
> (e.g. be a part of misc controller) or go driver-specific - the feature is
> hardware specific anyway. I've repeated this multiple times in these
> discussions now but it'd be really helpful to try to minimize the interace
> while concentrating more on internal abstractions and actual control
> mechanisms.

Maybe we are speaking past each other.  I'm not following.  We got
here because a device specific cgroup didn't make sense.  With my
Linux user hat on, that makes sense.  I don't want to write code to a
bunch of device specific interfaces if I can avoid it.  But as for
temporal vs spatial partitioning of the GPU, the argument seems to be
a sort of hand-wavy one that both spatial and temporal partitioning
make sense on CPUs, but only temporal partitioning makes sense on
GPUs.  I'm trying to understand that assertion.  There are some GPUs
that can more easily be temporally partitioned and some that can be
more easily spatially partitioned.  It doesn't seem any different than
CPUs.

Alex
