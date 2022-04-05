Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4E4F3D06
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EE910ED71;
	Tue,  5 Apr 2022 17:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04F210ECDD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:49:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r10so10096616eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RXCW1evSnb4oJ88sHTAFEYTq0HTuOW2ocRpwnA3InQ4=;
 b=DFediYf4lKdcEGd6wHnf3P2A1rH9d97LcubT3QP6yRNY6vUA82uDkOevPceh0sN/Wl
 AzNDVgFuK6V76WaqpSYAiG2hRF9Re4Ov3xlC/Ms7hpW9uCTQ7y898MEv8Ijbqhc6SxXo
 QvfpY4jywVuV6j8Ii/P3vkQXreEU44Hlqin6E5RTxZAap0ziUpyUXuD83coag22gB7nJ
 kP94eXAsBC1cr7hK8pVNGZaStSW21SliZd84A/wTh+8QK9KZdm23HHaRa8zC2IVlp4fq
 sk905jrtMt/I2FOoTaeCu/ArrkOR8UVb6SsiWhRhquLKZ90pI6vt79FBY7MRBMWLMUZ2
 L8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RXCW1evSnb4oJ88sHTAFEYTq0HTuOW2ocRpwnA3InQ4=;
 b=z/4xKu3+NuvfHkOao+5HIA+/GBhjdyFCKnV70SNgAHbb7S07/vFChq0HrA/u2+bBfS
 jftMedv286kn1miHv4sRKN78iGVFsRLfhW51rdoA0PhWcb2UEarufKlBXvH/6S0BaGwA
 KWwpi9luwXZX0dCqzLz5PnEK6yk4qcF+T5mTMQf8ohKNS75y8bO/CCxqkoKv6J1S23+b
 fKEe7EBa6aI2c0KusTx/URxGELHB0R1bgNaYtm4/Ut/EzXk22PS95/f2bpuafD1M7ZcK
 A7HS/WDvKIOalBtlB6TwQ0WHS0kUPwy+gOB5eJZ15fN1rgroldXuJwpVUM+PyuVlo2TY
 XN6g==
X-Gm-Message-State: AOAM532RX2GOxRry3DiBZqal3poGU6qbogaCZzTtkk2odL2CWqGR3R0R
 TouiSYTPAHd0B/zYrp5KPupFq1bSUcu/vojCgeMZcw==
X-Google-Smtp-Source: ABdhPJy3kLISS/qYYRzMDmjCuhPu7OU3AJeQfL+t2mEx7NkNwMYgXC85KD1rOoe+vR5iNyCwy95ZqCXnaDcme/ng0CI=
X-Received: by 2002:aa7:d98f:0:b0:41c:bf0f:4c45 with SMTP id
 u15-20020aa7d98f000000b0041cbf0f4c45mr4818393eds.379.1649180950052; Tue, 05
 Apr 2022 10:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-6-tjmercier@google.com>
 <20220329152142.GA15794@blackbody.suse.cz>
 <CABdmKX2874NdYCBzpKLnqWhZQDkC2wKz4ZL_aFNqrec6iAutpQ@mail.gmail.com>
 <20220405121245.GA30368@blackbody.suse.cz>
In-Reply-To: <20220405121245.GA30368@blackbody.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Apr 2022 10:48:58 -0700
Message-ID: <CABdmKX0aF5zXozbb7npcEq3PgaeDE=gaGLf+jYY4oRKW9N+46g@mail.gmail.com>
Subject: Re: [RFC v4 5/8] dmabuf: Add gpu cgroup charge transfer function
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 5:12 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrote:
>
> On Fri, Apr 01, 2022 at 11:41:36AM -0700, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > This link doesn't work for me, but I think you're referring to the
> > discussion about your "RAM_backed_buffers" comment from March 23rd.
>
> (Oops, it's a non-public message. But yes, you guessed it right ;-))
>
> > Anyway the test I did goes like this: enable memcg and gpu cgoups
> > tracking and run a process that allocates 100MiB of dmabufs. Observe
> > memcg and gpu accounting values before and after the allocation.
>
> Thanks for this measurement/dem/demoo.
>
> > Before
> > # cat memory.current gpu.memory.current
> > 14909440
> > system 0
> >
> > <Test program does the allocation of 100MiB of dmabufs>
> >
> > After
> > # cat memory.current gpu.memory.current
> > 48025600
> > system 104857600
> >
> > So the memcg value increases by about 30 MiB while the gpu values
> > increases by 100 MiB.
>
> > This is with kmem enabled, and the /proc/maps
> > file for this process indicates that the majority of that 30 MiB is
> > kernel memory.
>
> > I think this result shows that neither the kernel nor process memory
> > overlap with the gpu cgroup tracking of these allocations.
>
> It depends how the semantics of the 'system' entry is defined, no?
> As I grasped from other thread, the 'total' is going to be removed, so
> 'system' represents exclusively device memory?
>
That's right. The system charges (soon to be renamed "system-heap")
result only from an allocator (in this case the system heap) deciding
to call gpucg_try_charge for the buffer which is entirely device
memory.
>
> > So despite the fact that these buffers are in main memory, they are
> > allocated in a way that does not result in memcg attribution. (It
> > looks to me like __GFP_ACCOUNT is not set for these.)
>
> (I thought you knew what dmabufs your program used :-p)
>
I'm coming up to speed on a lot of new-to-me code here. :)
Just for completeness, these buffers were allocated with
libdmabufheap's AllocSystem.

> So, the goal is to do the tracking and migrations only via the gpu cg
> layer, regardless how memcg charges it (or not).
>
> (I have no opinion on that, I'm just summing it so that we're on the
> same page.)
>
Yes, this reflects my intention and current state of the code in this serie=
s.

> Michal

Thanks,
T.J.
