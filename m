Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E23A91281
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 07:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0BB10EA2C;
	Thu, 17 Apr 2025 04:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jOzRgPEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AB310EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:56:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF790A4986F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598B2C4CEEF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744865814;
 bh=tmm+QbmYJM9NZANVpptZlZJKOk0h1i4DjoknpPROUPw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jOzRgPElQp93kazf5N8ZLE36wCfnQfc/BSR1PlnioJ+7xdRk/0WpJnnsRx/Qdnl3o
 QpoKwWCrQbBa35QDzAuN8O+WySYMdVszRRxxefobklHRgptRnAr9N/cvTItH5K3/bU
 PUkAcpByBZVvHhFqutwjajJg9UDcRXKrLsMR+SAhss/UbgROw+hEjVgK9P3oNEOeHl
 hqFVia1DUWziQGWUlU7f5L5+aDdBCeCUV1fRR3b/1zRVuKM0erDMlzF+WnAOL9rswi
 1fOlEWuqztK1v1I1R/zYPiqzRkkTfVsS31CyQqcwepARS0SyFv13Gals0JpgopaI0u
 q9VAL+9UW8ARA==
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-47663aeff1bso4087981cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 21:56:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxutGL05g+8LgE2AUBPNw6AQPbo4hBtCnWCiZ44hK2jRuTlsqOGm8RPrc8HcMcUHEKeCAJd5/GziQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv/5hqa3w8wja6FV9cCXz6n6ppzUOKuRI1rk+7aN2v+IuW5DUE
 s97f/3a9Aq8Odds/GpfhkF3fGwa/j6WiKH2HAZoYmDCcrA6ehGmYzAZOyOXD26Rm7d19/aLFBNm
 yITSj6y8p9vOuHT2q08CLyvLguIk=
X-Google-Smtp-Source: AGHT+IFj9gpXjOfNBYbsZP+Vn5QpEwyj6N1RuCl0FwfJ9EBQ3/JCBLMKfIVXQXchSLXzLc6c/p6NnT4JZBn0Ik2MUXE=
X-Received: by 2002:a05:622a:650:b0:474:db2f:bd32 with SMTP id
 d75a77b69052e-47ad810c870mr59493241cf.38.1744865813457; Wed, 16 Apr 2025
 21:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
 <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
In-Reply-To: <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Apr 2025 21:56:42 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
X-Gm-Features: ATxdqUEk4T3fY6FmmJQdbVRkM42dn04Z_qBTtTJMviwnBymsHkeSKzqSCEwNWdE
Message-ID: <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
[...]
> >
> > Here is another rookie question, it appears to me there is a file descr=
iptor
> > associated with each DMA buffer, can we achieve the same goal with
> > a task-file iterator?
>
> That would find almost all of them, but not the kernel-only
> allocations. (kernel_rss in the dmabuf_dump output I attached earlier.
> If there's a leak, it's likely to show up in kernel_rss because some
> driver forgot to release its reference(s).) Also wouldn't that be a
> ton more iterations since we'd have to visit every FD to find the
> small portion that are dmabufs? I'm not actually sure if buffers that
> have been mapped, and then have had their file descriptors closed
> would show up in task_struct->files; if not I think that would mean
> scanning both files and vmas for each task.

I don't think scanning all FDs to find a small portion of specific FDs
is a real issue. We have a tool that scans all FDs in the system and
only dump data for perf_event FDs. I think it should be easy to
prototype a tool by scanning all files and all vmas. If that turns out
to be very slow, which I highly doubt will be, we can try other
approaches.

OTOH, I am wondering whether we can build a more generic iterator
for a list of objects. Adding a iterator for each important kernel lists
seems not scalable in the long term.

Thanks,
Song
