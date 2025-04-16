Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB95A90FC2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D605D10E9E3;
	Wed, 16 Apr 2025 23:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kCEkynKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E41A10E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:40:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so27975e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744846835; x=1745451635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Mxjt3rihuzILbcLl043WrZ7HaX9/u729SBhzDpJcjw=;
 b=kCEkynKrmI1hZyxfmW42/FSqcmDr+SURRosLEOpFIipmKTZk5BRkfPMf8LAYF0KVNW
 7pJcWIi5nv8eYrg4X7ePftJ1FpXWkfxtd3sQeMdkW+3nzZj4s7T7BbJg7ACVleFBhox9
 hj589V8VQj49paYiIXblIhqnsjrVtM2CHUDy/TkMSzfI+kb6FzS1IiNLYLXExJay6ht9
 CCTN9DPBdNEJhkWi2Mmr9dqVx9K5wyYHfGPqY8siet+itPETQZ/sULBAHkuyeML6vdYF
 RQLY46vAXOuPAUnqEZh5p1Sfv7el9GVHRYUdlzte0Zza2LX7iNVzTdbcVRQUIY19sL3Y
 PZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744846835; x=1745451635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Mxjt3rihuzILbcLl043WrZ7HaX9/u729SBhzDpJcjw=;
 b=eBXNGBPVsX1sst9SenAOtI4O1XuizdzksER7PjxeAvTS1h4UFhjIwSRt7LlnvVZCSx
 LtRudwL8mcXxmjRrC6002UBl9Nnjk9TbzT01FY0iUAdvW+0fEmUdc9s5bbiya5TI+1EL
 V3f0r7cHkuNMw8iKUiLdXLcreeFBLVogLZvBIOzxYCL5L96u+47ppL+MhF2sBG4c93Md
 hiFsRNHD6cbGwWwvDu25/SnQZap9kur0pqGJaOU+f+jFeJa6i8pgIlkEdFrLasp/jhw7
 aV3zRiFoUG2wo15EJUcIG1aGoU8hVfGzIusVg+3IKMHYt9Estmh4ftmO1TISgr43V+wp
 +QUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv1I2c0Rfc9pEH+8r4MVp4sE37pJlj9aXtUer0tfqnEHR85ljgp2W3OLhpLWvxuhZD3NKSbxGDnoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTfylHD2VkLjKYxRHuNnbu1nvi503dcqJ8ovTjCgzYXB9AIhe8
 jzo9hvljj3MlGZQLuT+DHl0jy2BYp+0kzMCPz+Iwy8omf2hMv/3vj3I6itpQUO/VZjc/dODIK2L
 lB74h/I7ev93lVKlYnKNlWhG9tm+xHskd0xxd
X-Gm-Gg: ASbGncv6hRGUqzBBM8Wzn0o9pPBhFoXiJPgs2qbEogQ5r9eMMYGYlOxSkPTdT93f3m2
 Vs6k144bPH5FSek2iR1Y+TaepoR4CEy7yhneos1vx/i1wMAgsOsbHQ95r9kUWcxkYHCt/qS1W+1
 C3yu/O/dy0TX5VxRJSGce2DpvTnjF1gQPQtqLDsCOBobIp7DGmdhU=
X-Google-Smtp-Source: AGHT+IHYwzghKbnTQryW+DgZnRoQaoVXvuuAUTPz6qIMWx+I2V7QXqmb5/BgPuRKmM0AahWplsMUsAlWl25L3C8nIj0=
X-Received: by 2002:a05:600c:1910:b0:43d:409c:6142 with SMTP id
 5b1f17b1804b1-44062a3eddamr573455e9.0.1744846834549; Wed, 16 Apr 2025
 16:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
In-Reply-To: <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 16:40:22 -0700
X-Gm-Features: ATxdqUFLZu_g7cAHhskZ0L5MamFR6bpu5Vd8u8TDIC07BpRPPZAKqsf2Wefu0qw
Message-ID: <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 3:51=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > >
> > > IIUC, the iterator simply traverses elements in a linked list. I feel=
 it is
> > > an overkill to implement a new BPF iterator for it.
> >
> > Like other BPF iterators such as kmem_cache_iter or task_iter.
> > Cgroup_iter iterates trees instead of lists. This is iterating over
> > kernel objects just like the docs say, "A BPF iterator is a type of
> > BPF program that allows users to iterate over specific types of kernel
> > objects". More complicated iteration should not be a requirement here.
> >
> > > Maybe we simply
> > > use debugging tools like crash or drgn for this? The access with
> > > these tools will not be protected by the mutex. But from my personal
> > > experience, this is not a big issue for user space debugging tools.
> >
> > drgn is *way* too slow, and even if it weren't the dependencies for
> > running it aren't available. crash needs debug symbols which also
> > aren't available on user builds. This is not just for manual
> > debugging, it's for reporting memory use in production. Or anything
> > else someone might care to extract like attachment info or refcounts.
>
> Could you please share more information about the use cases and
> the time constraint here, and why drgn is too slow. Is most of the delay
> comes from parsing DWARF? This is mostly for my curiosity, because
> I have been thinking about using drgn to do some monitoring in
> production.
>
> Thanks,
> Song

These RunCommands have 10 second timeouts for example. It's rare that
I see them get exceeded but it happens occasionally.:
https://cs.android.com/android/platform/superproject/main/+/main:frameworks=
/native/cmds/dumpstate/dumpstate.cpp;drc=3D98bdc04b7658fde0a99403fc052d1d18=
e7d48ea6;l=3D2008

The last time I used drgn (admittedly back in 2023) it took over a
minute to iterate through less than 200 cgroups. I'm not sure what the
root cause of the slowness was, but I'd expect the DWARF processing to
be done up-front once and the slowness I experienced was not just at
startup. Eventually I switched over to tracefs for that issue, which
we still use for some telemetry.

Other uses are by statsd for telemetry, memory reporting on app kills
or death, and for "dumpsys meminfo".

Thanks,
T.J.
