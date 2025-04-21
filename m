Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8255A955B2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 20:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41558891B8;
	Mon, 21 Apr 2025 18:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ppk17UCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284FE89186
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77DBB6115F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350F4C4CEEC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745259189;
 bh=UqEEYmm2ZXFfWchDWvLB7F32I6SFMlaqs6jCp43ewCM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ppk17UCNl+NWNPGpHARWMjemyWbSH9b7F3SpbJpbNRAIL/eZQhz2jUdaPGWOORfuX
 BF7liSOnHOAHTxlK6/w/iDPm6+Cb67yZSeg+++/vbkoOK/ZWAn9z1vWGyR9VxjwGth
 yR3+JakJ1x9Ak1YIb1gXzIwBvxBDo4KqrXwyPs2OwSOio+DAANzjk03OxR9PZ7Y9e7
 rUEhmkIIMke6QRiobyTnI3uvZtFv8CDQHkwraVG5dX4NHc4v3GnttzfOP6M15nF670
 hkkpy1Tj/Db/7dvKTEeRC++AL8m5ePdBYDBIwOoofAOJyw+4tzeHyOA41ikITFdowY
 ZRf55xE3tOf9w==
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-476ac73c76fso45338971cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTH9sV+taSrWkGI4Nqy2jQ/aatdYZs4cS/qxZw0c93fsV3zcJhOjiCptR7nVzgWmhqaKThLM2H57U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1xuf+QBEdviUd6x0wN1MF475gZW4MzdQz5+2Y+D0vly/iUMsa
 /8zP2nggf3PVcLMEizuPejPJVCRiMPr1Tfa4ACESr69CGK6P9ZTT2Ud2UuSvECCx9QzG0koi5mp
 kSpJ5RaGAC1abbkzrxIeDSAQdhD8=
X-Google-Smtp-Source: AGHT+IEMoK6z85Hs/F8U6UU20wgjMdYOaIFxg+BBuF5nUJtPL8v5TWwEUaRQNjNwFFSXKecYeXKtzNZd4CPhFPCMLAU=
X-Received: by 2002:ac8:59cf:0:b0:476:a03b:96ec with SMTP id
 d75a77b69052e-47aec492c20mr236803811cf.32.1745259188284; Mon, 21 Apr 2025
 11:13:08 -0700 (PDT)
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
 <CABdmKX3XaVFJEQRav1COi7_1rkMsx1ZhrJoGLB_wtywZ0O-jug@mail.gmail.com>
In-Reply-To: <CABdmKX3XaVFJEQRav1COi7_1rkMsx1ZhrJoGLB_wtywZ0O-jug@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 11:12:56 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7G+Y3DcpN+N7c4wUuSGoq-DaUmLTAy87xAKWK=ZAZ+Dg@mail.gmail.com>
X-Gm-Features: ATxdqUGaR_CqVYxjaESNT2qiEdWLdHIia7pDWLQYNSOmKVvfaPSPNPMNDOlcZB4
Message-ID: <CAPhsuW7G+Y3DcpN+N7c4wUuSGoq-DaUmLTAy87xAKWK=ZAZ+Dg@mail.gmail.com>
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

On Fri, Apr 18, 2025 at 8:25=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Thu, Apr 17, 2025 at 1:26=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > On Thu, Apr 17, 2025 at 9:05=E2=80=AFAM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wr=
ote:
> > > >
> > > > On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@goo=
gle.com> wrote:
> > > > >
> > > > > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org=
> wrote:
> > > > [...]
> > > > > >
> > > > > > Here is another rookie question, it appears to me there is a fi=
le descriptor
> > > > > > associated with each DMA buffer, can we achieve the same goal w=
ith
> > > > > > a task-file iterator?
> > > > >
> > > > > That would find almost all of them, but not the kernel-only
> > > > > allocations. (kernel_rss in the dmabuf_dump output I attached ear=
lier.
> > > > > If there's a leak, it's likely to show up in kernel_rss because s=
ome
> > > > > driver forgot to release its reference(s).) Also wouldn't that be=
 a
> > > > > ton more iterations since we'd have to visit every FD to find the
> > > > > small portion that are dmabufs? I'm not actually sure if buffers =
that
> > > > > have been mapped, and then have had their file descriptors closed
> > > > > would show up in task_struct->files; if not I think that would me=
an
> > > > > scanning both files and vmas for each task.
> > > >
> > > > I don't think scanning all FDs to find a small portion of specific =
FDs
> > > > is a real issue. We have a tool that scans all FDs in the system an=
d
> > > > only dump data for perf_event FDs. I think it should be easy to
> > > > prototype a tool by scanning all files and all vmas. If that turns =
out
> > > > to be very slow, which I highly doubt will be, we can try other
> > > > approaches.
> > >
> > > But this will not find *all* the buffers, and that defeats the purpos=
e
> > > of having the iterator.
> >
> > Do you mean this approach cannot get kernel only allocations? If
> > that's the case, we probably do need a separate iterator. I am
> > interested in other folks thoughts on this.
>
> Correct.

I read more into the code, and realized that udmabuf fd is not for
the same file here. I guess this also justifies a separate iterator.

Thanks,
Song
