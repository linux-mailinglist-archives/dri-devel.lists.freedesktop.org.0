Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E9A91174
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA4C10E044;
	Thu, 17 Apr 2025 02:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="koNvIJeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C2210E044
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 02:09:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso33605e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 19:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744855756; x=1745460556;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSelZMOHGBCAC6ffhylcs5ml2BXN3psxianAepa1Pw0=;
 b=koNvIJeEU8vBrwVLHyjqs+uFAdTvmzScDjKkap6UToxF4jyb/Q8cUU8hSAR5z7GGj/
 GXv6LfNiaOz2Z2q+ASC/VeaNfMGVNG8sD2t/rrKGWzCYlnT6/Qu7kSu1K2uQmnseHSl8
 feJVwiBR5EH5SuLhnwwQKFYiO193ylWJB3jbhMl1zSUxqUAfbnt/lUrto6/QurB6Dtmw
 OE5VuYjzwATu8Xv67cY+hWU6Ulw5lnrq/tR3YpXhfckLf2RSlI807WVM9FJKxg3bfkyR
 q6z2it5pIpKLHX+hRWEL82YoslpEBadF/V0FnVR+lX7rmLaWuPrewTFF5DocYiTcTKPp
 4rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744855756; x=1745460556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSelZMOHGBCAC6ffhylcs5ml2BXN3psxianAepa1Pw0=;
 b=cPbqTUFY1HTbohbfMmNmR1mjElP219rxHvE92JSYEe7dRgEiPgvXLD7vqe5a/gbvyh
 tREYgQliJ1SejbQ8TwC18sO+dZpnHUlgP9ZcdQnV+pWcy29ShC4EvFD3/xNnVvc6NMwx
 ZR1BOwPy4SikhnCTFlSaLQtSBcVChF5fW+LVhhHpuYHOAiGObF9Ak+Ir3iC0pJoLpgYq
 y6C2vpmzHafUlUIoxq3Fdc5+54DoR1KZL5gfPMvrdYvjD7C/Bb8UfVSZ7EQ+JwhFgtzG
 7/IOnM+5Ekw/rCXzXW2DSZ9LIIwPxrKEV6aUCuAfNNUxCgSbyEKNIXvQeMVUlAXjM0J1
 mkng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkxPD+TSw1T0KIV9Yhgi9Zoed5ZuezBkUV2bj5g+JRDvF6ZmDtKCVkc/hCn8zvbn8UoYgoaUWc1w4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH2Uu5D2pGrak6WrWdCxcdoRenVw4yQj8oYNyZh5NThxqDcY3O
 RN1+LJPOa0+ZIdXF2ITKmzFWJqv0Cn5aFpgPuuLXSbb9OWoSvB51sGZj+uScfn62PhSSOrftr8w
 27evNw0UMpXfZApdzGbk0NwDeNkHUYTLWu2tV
X-Gm-Gg: ASbGncuMZNyoqKTYoEp3rGnZ6DcCXLhvVr24W/u4WiwTTJ7NwuoziZcdk+g40JjtEeg
 k0r1E5LbFZKfMFRCXWXYmOnBWvpp6IUR21/GT4B18W4yPfGdn3rE2+7/0x9NH+6h6+am6OgZC0s
 UEgOS3aLSz+xF3VBpQA1+Ia5vTtzplbC8=
X-Google-Smtp-Source: AGHT+IFrppytZV5cSJfrYgzaifTbDrHqkypNt5Bohd7JB9cXbxaDZ8Ylu35PtX/6cVUznzvu+dDy2IZggStg9q0OeRc=
X-Received: by 2002:a05:600c:3042:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-44063d2802cmr294225e9.1.1744855756423; Wed, 16 Apr 2025
 19:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
In-Reply-To: <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 19:09:04 -0700
X-Gm-Features: ATxdqUFLL37LKBoNbpt1TbRt2xDWynqShrVasUjLiM1tjzZW-eK8x-aahsy-M1I
Message-ID: <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 4:40=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Wed, Apr 16, 2025 at 3:51=E2=80=AFPM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > [...]
> > > > >
> > > > > IIUC, the iterator simply traverses elements in a linked list. I =
feel it is
> > > > > an overkill to implement a new BPF iterator for it.
> > > >
> > > > Like other BPF iterators such as kmem_cache_iter or task_iter.
> > > > Cgroup_iter iterates trees instead of lists. This is iterating over
> > > > kernel objects just like the docs say, "A BPF iterator is a type of
> > > > BPF program that allows users to iterate over specific types of ker=
nel
> > > > objects". More complicated iteration should not be a requirement he=
re.
> > > >
> > > > > Maybe we simply
> > > > > use debugging tools like crash or drgn for this? The access with
> > > > > these tools will not be protected by the mutex. But from my perso=
nal
> > > > > experience, this is not a big issue for user space debugging tool=
s.
> > > >
> > > > drgn is *way* too slow, and even if it weren't the dependencies for
> > > > running it aren't available. crash needs debug symbols which also
> > > > aren't available on user builds. This is not just for manual
> > > > debugging, it's for reporting memory use in production. Or anything
> > > > else someone might care to extract like attachment info or refcount=
s.
> > >
> > > Could you please share more information about the use cases and
> > > the time constraint here, and why drgn is too slow. Is most of the de=
lay
> > > comes from parsing DWARF? This is mostly for my curiosity, because
> > > I have been thinking about using drgn to do some monitoring in
> > > production.
> > >
> > > Thanks,
> > > Song
> >
> > These RunCommands have 10 second timeouts for example. It's rare that
> > I see them get exceeded but it happens occasionally.:
> > https://cs.android.com/android/platform/superproject/main/+/main:framew=
orks/native/cmds/dumpstate/dumpstate.cpp;drc=3D98bdc04b7658fde0a99403fc052d=
1d18e7d48ea6;l=3D2008
>
> Thanks for sharing this information.
>
> > The last time I used drgn (admittedly back in 2023) it took over a
> > minute to iterate through less than 200 cgroups. I'm not sure what the
> > root cause of the slowness was, but I'd expect the DWARF processing to
> > be done up-front once and the slowness I experienced was not just at
> > startup. Eventually I switched over to tracefs for that issue, which
> > we still use for some telemetry.
>
> I haven't tried drgn on Android. On server side, iterating should 200
> cgroups should be fairly fast (< 5 seconds, where DWARF parsing is
> the most expensive part).
>
> > Other uses are by statsd for telemetry, memory reporting on app kills
> > or death, and for "dumpsys meminfo".
>
> Here is another rookie question, it appears to me there is a file descrip=
tor
> associated with each DMA buffer, can we achieve the same goal with
> a task-file iterator?

That would find almost all of them, but not the kernel-only
allocations. (kernel_rss in the dmabuf_dump output I attached earlier.
If there's a leak, it's likely to show up in kernel_rss because some
driver forgot to release its reference(s).) Also wouldn't that be a
ton more iterations since we'd have to visit every FD to find the
small portion that are dmabufs? I'm not actually sure if buffers that
have been mapped, and then have had their file descriptors closed
would show up in task_struct->files; if not I think that would mean
scanning both files and vmas for each task.
