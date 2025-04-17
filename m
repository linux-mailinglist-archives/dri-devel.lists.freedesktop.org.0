Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6F2A92C40
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D723D10E3BA;
	Thu, 17 Apr 2025 20:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N6W+nuAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B91C10E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 990B45C5918
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537DDC4CEE7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744921583;
 bh=MSIoVWYIYAa+sUrhLyrq1Kjxud8OtJpQnV0I5LjBO3c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N6W+nuAgF8wmxKr9Z/HKX+7tNCeuSss8zKQJLTwMz+IlsS4t7ZGGhILI/OR6ppTfq
 l60y43C66mjR1XBnTy6Tvsl+Enal2NTF4guNNvdWNaeI98/J8uSl3BW6KKuDieWcY3
 AOFRjW4JSrXy4KVbSNAIGZW0hwTlRJwCN93DnuiaaPgHG6Omn0WuFNn+Txuf3Fcb5e
 OMdtwBBITtFF4V7zQlc5VKa+f6flSy3a2n2Ap2A0cQNfLB8TjfZtxMphcDH8BUTlCx
 Hzzg1UQzL/VnNePd/2jGcqXSq2xM5tEpwLtEEJI51FY05tI8qQ19ovPSQ2TpKjclGk
 IM98KcsvSEaUQ==
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22423adf751so16164765ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3qqPhW9TG9QKBxkL8OPKrOI0kJnzCLNg3ILB10xsYXbSrXe7WPGzDGlAUOyW9W8zU37Lm+VP2WGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv0bfGjI4UQ4N3Wl4cu8fnwCk5hwcGHTZfNB6IebxEMlwr1KFx
 UKDHYWskjdzd5GiPzhzga0XQ3mA9rmXyuzjn1829U1dYWWhZ2NZqQIWdHcs/PMn9sQwnwT+qHe2
 T/+9v1aY4P3RlkjCrih0c6yqlgcs=
X-Google-Smtp-Source: AGHT+IFIdrqkfQ2yDNhbz/9FblYuTge4nV1XL6JmTPE16v3aMPcbe2NW0UpaM5bS7OK2a90u3v9z9kEDj0ljXDeJmJ8=
X-Received: by 2002:a17:902:e5ca:b0:220:c911:3f60 with SMTP id
 d9443c01a7336-22c536283ffmr3670365ad.47.1744921582932; Thu, 17 Apr 2025
 13:26:22 -0700 (PDT)
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
In-Reply-To: <CABdmKX0P1tpa-jxzN1_TCyk6Cw6drYM+KRZQ5YQcjNOBFtOFJw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 17 Apr 2025 13:26:10 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
X-Gm-Features: ATxdqUGujoL1qIc8Dt7pK8kwCaaGN6jWIU0L4gFL9hmFjqYOACzGGnezHayKk80
Message-ID: <CAPhsuW5bgBNu6zY0rn7ZH4VK54nruryU4bS4LrDDsxnCfqQicQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
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

On Thu, Apr 17, 2025 at 9:05=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wr=
ote:
> > [...]
> > > >
> > > > Here is another rookie question, it appears to me there is a file d=
escriptor
> > > > associated with each DMA buffer, can we achieve the same goal with
> > > > a task-file iterator?
> > >
> > > That would find almost all of them, but not the kernel-only
> > > allocations. (kernel_rss in the dmabuf_dump output I attached earlier=
.
> > > If there's a leak, it's likely to show up in kernel_rss because some
> > > driver forgot to release its reference(s).) Also wouldn't that be a
> > > ton more iterations since we'd have to visit every FD to find the
> > > small portion that are dmabufs? I'm not actually sure if buffers that
> > > have been mapped, and then have had their file descriptors closed
> > > would show up in task_struct->files; if not I think that would mean
> > > scanning both files and vmas for each task.
> >
> > I don't think scanning all FDs to find a small portion of specific FDs
> > is a real issue. We have a tool that scans all FDs in the system and
> > only dump data for perf_event FDs. I think it should be easy to
> > prototype a tool by scanning all files and all vmas. If that turns out
> > to be very slow, which I highly doubt will be, we can try other
> > approaches.
>
> But this will not find *all* the buffers, and that defeats the purpose
> of having the iterator.

Do you mean this approach cannot get kernel only allocations? If
that's the case, we probably do need a separate iterator. I am
interested in other folks thoughts on this.

> > OTOH, I am wondering whether we can build a more generic iterator
> > for a list of objects. Adding a iterator for each important kernel list=
s
> > seems not scalable in the long term.
>
> I think the wide variety of differences in locking for different
> objects would make this difficult to do in a generic way.

Agreed it is not easy to build a generic solution. But with the
help from BTF, we can probably build something that covers
a large number of use cases.

Thanks,
Song
