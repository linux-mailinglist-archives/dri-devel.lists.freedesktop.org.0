Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CAA9398F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F1810E199;
	Fri, 18 Apr 2025 15:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JANgcoMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A6010E199
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:25:38 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-47681dba807so294271cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744989938; x=1745594738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLMQ/sPbd3/qPx9kvWI7kwA5vqce0csvK2YZ+gn9jtw=;
 b=JANgcoMy7a9DpuAFz0n8wLPnDxulfBowRsQYamDTWHfiurcOkBwmeQioK2XMRvnEIw
 4PlPKsZs4sEMYJI/aPONLGEde2EBfsGEREnD6GpW8yPQmyQfM4jcXT9VSieD74lRJsfI
 3PuiCBmwDwfR2IlZeNgA47tZaZfcvBgQDiia+22kEZ99mmMCwuQWGKFUZZUSmY7q0+m5
 5nRW3c2vHPgmnmzzrg47CtbwpAmUTs6zVqpD4XM2hg2q7dYk/PftTxg1c+40L0JnczBX
 MWU4apjn7FI+5baE/b/IVXFf/sFWTCoDzPoUzRPyyB8VbgbjpC5kvlXKfM6yUoUIHuxC
 pGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744989938; x=1745594738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLMQ/sPbd3/qPx9kvWI7kwA5vqce0csvK2YZ+gn9jtw=;
 b=V8KzWzLz1UbUZ81Q6Xbm+piYMi7lLgLVo5A8UjzeDwwMAT85cjXih4E1BhHE6hB/zq
 OVQl22eUoSlw6V79GNJOUI6huQiDs8WK6NwHkLpvWOtuE99+N6PbTzPUwIDorw8E6Fsf
 WRMzCHKKQ9bOB+63020h6384Ef5mH6ZjkZ4qFNI9aaAsw2MunUK3JLy9lgLRHufP2DZM
 QA4EDf0ZSTbdVnVgQr56zGZFM/5uOtIfbGQYoS0GyTcKDCg6ctKS60Oa9ABQ36zblS9e
 YN4SZ6E5cLCd/irTeTdxh+zENcMqoIT2j9rbNGhweJ72/DlinZAz4ib4gNN3B3JQht82
 YfNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtKEBwVyGe+aK0REmJLxm5Q2UyYISzs5E6TaN4G5/nQATza8ZYjlgxhlvAGUCCouE5UyZ9Q3hrrZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeGZOZJDQV18QlVksq0+EMLHKvl97oVv/sDf8UvwzIGmeqxy07
 8YSNB3SpeUG0N/fJZkxrlwYuebZGLTxe9cuL2fBK+EhDT0YV4lTvK6Vk8HXDwdF+3x/0ihZdZ7H
 SEoe9MOKX1/NCTXLefOSKRxh8TXNHYDD9kMRt
X-Gm-Gg: ASbGncv0FBgw/cBEhBbATRNB0rfTgXWQ025rXQlDis657Qxnq+S0XCVxcMEwsPp3yJY
 65juzVIRY25M1stwqSZJFvCPKQvtZm2fdDhBJGY5UHyAWPEGh7DndEuTUd0SEkMtb5KxgzMxfTK
 Db9kIgTyc3KVaaKnzfg8Z3
X-Google-Smtp-Source: AGHT+IG8hFCpUPixQxkgnzGIXz1u9OtkRLiT9un/wX7YdVEX+ucM013ElGjUErTcY8lmL4vrTIPIJfqi3eMA/XDrm6c=
X-Received: by 2002:a05:622a:24f:b0:477:63b7:3523 with SMTP id
 d75a77b69052e-47aeb10f6a4mr3977681cf.4.1744989937094; Fri, 18 Apr 2025
 08:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
 <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
 <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
 <CABdmKX0P1tpa-jxzN1_TCyk6Cw6drYM+KRZQ5YQcjNOBFtOFJw@mail.gmail.com>
 <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
In-Reply-To: <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 18 Apr 2025 08:25:18 -0700
X-Gm-Features: ATxdqUFe9V2DPeKz_fCeXdwNGaeIYNCwZNnBebHg8eIdjjPIFTp9wITPuXs7j_A
Message-ID: <CABdmKX3XaVFJEQRav1COi7_1rkMsx1ZhrJoGLB_wtywZ0O-jug@mail.gmail.com>
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

On Thu, Apr 17, 2025 at 1:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 9:05=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > >
> > > > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> =
wrote:
> > > [...]
> > > > >
> > > > > Here is another rookie question, it appears to me there is a file=
 descriptor
> > > > > associated with each DMA buffer, can we achieve the same goal wit=
h
> > > > > a task-file iterator?
> > > >
> > > > That would find almost all of them, but not the kernel-only
> > > > allocations. (kernel_rss in the dmabuf_dump output I attached earli=
er.
> > > > If there's a leak, it's likely to show up in kernel_rss because som=
e
> > > > driver forgot to release its reference(s).) Also wouldn't that be a
> > > > ton more iterations since we'd have to visit every FD to find the
> > > > small portion that are dmabufs? I'm not actually sure if buffers th=
at
> > > > have been mapped, and then have had their file descriptors closed
> > > > would show up in task_struct->files; if not I think that would mean
> > > > scanning both files and vmas for each task.
> > >
> > > I don't think scanning all FDs to find a small portion of specific FD=
s
> > > is a real issue. We have a tool that scans all FDs in the system and
> > > only dump data for perf_event FDs. I think it should be easy to
> > > prototype a tool by scanning all files and all vmas. If that turns ou=
t
> > > to be very slow, which I highly doubt will be, we can try other
> > > approaches.
> >
> > But this will not find *all* the buffers, and that defeats the purpose
> > of having the iterator.
>
> Do you mean this approach cannot get kernel only allocations? If
> that's the case, we probably do need a separate iterator. I am
> interested in other folks thoughts on this.

Correct.

> > > OTOH, I am wondering whether we can build a more generic iterator
> > > for a list of objects. Adding a iterator for each important kernel li=
sts
> > > seems not scalable in the long term.
> >
> > I think the wide variety of differences in locking for different
> > objects would make this difficult to do in a generic way.
>
> Agreed it is not easy to build a generic solution. But with the
> help from BTF, we can probably build something that covers
> a large number of use cases.

I'm curious what this would look like. I guess a good test would be to
see if anything would work for some subset of the already existing
iterators.
