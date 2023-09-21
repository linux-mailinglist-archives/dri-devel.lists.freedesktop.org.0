Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312747AA2B0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 23:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB47D10E619;
	Thu, 21 Sep 2023 21:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7610E618;
 Thu, 21 Sep 2023 21:30:59 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1dc5e0c251cso819420fac.2; 
 Thu, 21 Sep 2023 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695331859; x=1695936659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRQx4MtP7CogAM2k3egutAbad1iU42X+I8tMH6KQiSE=;
 b=NoIZ3vEIVQfDD+XRvGIzO1u5SPv92V+yh3I5FNAzqtTa72nZqOWBN+/jtW1goRQZa+
 a8Am7pnx5+4wCjGYZ+rTGUqc+zyhJVC345YhClI8Rmc+9frhCy1kYXNVO7XiKXZvIMAl
 ZMaaIW2TSlyw5KcKyfnPKkFFfl8Goms2gE5VIL3JowUy1lI/rYdn0ge4qhbr81otv+7+
 BUi9jDSNgQG/SE21X+dZBeQsbqgtvJZqWuHtIzeccd0XPIS45+h8ABiFD8PvunJXjI3Z
 Wgw1WNoDxWH0KFvjIRP4NabOgu1d1MOzPoPVc6heafWdKCA/ueZY2HigzEfYgjt8/Vpe
 YWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695331859; x=1695936659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZRQx4MtP7CogAM2k3egutAbad1iU42X+I8tMH6KQiSE=;
 b=qzArv9G2ApJYBpe01og6PpteXNjiXD1AAiGZOWjlg+Qaw8o3skps5F5aO/+QX3b1UO
 CYgZfBU1tb2oCoDCIsjHd0kKwft6LAkBppY9zGoBhpp2GMHaNNlWr+TqI1r+Up/LwHaZ
 dTUB94oI0XCcAl3CXZCWwtqqfsCGkzW3tYp2FNwKFt+xSOLQ9/XDgrD54Mbyr1j/1wDD
 VvljMGAib9HM7aE8C95SwDW56xOQRfYoCTbh2ClEItT2uqv2sOtlR1dh59AlYaEfaYmn
 RM3Nx52aaXvKBSpYn4lxJfYnmBI0BgmV1GH5COSx2ah/O/oP1U+dY5P3SjHO6nWRn5BM
 EfnA==
X-Gm-Message-State: AOJu0YxXY3JS7pkvqaOcfK4J+bPxp8cNYVHGJ+rZMpolqj35Z0d0cc+k
 H/r7hiXM2DGRFvKna0ifZpvWXKx9DAmecupmg34PMfVPp/U=
X-Google-Smtp-Source: AGHT+IFt715I00380osbYtVzdclqr/hqNJL/SOFApm38LHhReKMJ8aaGPy2id0D33lpMxWkdkzW+T2Hsq2jmIfMxkhk=
X-Received: by 2002:a05:6870:b506:b0:1c8:c313:3e0d with SMTP id
 v6-20020a056870b50600b001c8c3133e0dmr8078539oap.46.1695331859015; Thu, 21 Sep
 2023 14:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
 <BL1PR12MB51444F28FD848B91BAEDE88AF7F8A@BL1PR12MB5144.namprd12.prod.outlook.com>
 <8bc269a0-b720-4f7b-a9df-c50d90ea41c3@gmail.com>
In-Reply-To: <8bc269a0-b720-4f7b-a9df-c50d90ea41c3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Sep 2023 17:30:47 -0400
Message-ID: <CADnq5_NDokcoJ_bht+oEEyo+PYHJmTjyH5mGLCpWkL++F_Ok8w@mail.gmail.com>
Subject: Re: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be
 rate limited
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Yu, Lang" <Lang.Yu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 4:21=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> On 21.09.2023 21:52, Deucher, Alexander wrote:
> >> backporting commit 187916e6ed9d ("drm/amdgpu: install stub fence into
> >> potential unused fence pointers") to stable kernels resulted in lots o=
f
> >> WARNINGs on some devices. In my case I was getting 3 WARNINGs per
> >> second (~150 lines logged every second). Commit ended up being reverte=
d for
> >> stable but it exposed a potential problem. My messages log size was re=
aching
> >> gigabytes and was running my /tmp/ out of space.
> >>
> >> Could someone take a look at amdgpu_sync_keep_later / dma_fence_is_lat=
er
> >> and make sure its logging is rate limited to avoid such situations in =
the future,
> >> please?
> >>
> >> Revert in linux-5.15.x:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi=
t/?h=3Dli
> >> nux-5.15.y&id=3Dfae2d591f3cb31f722c7f065acf586830eab8c2a
> >>
> >> openSUSE bug report:
> >> https://bugzilla.opensuse.org/show_bug.cgi?id=3D1215523
> >
> > These patches were never intended for stable.  They were picked up by S=
asha's stable autoselect tools and automatically applied to stable kernels.
>
> Are you saying massive WARNINGs in dma_fence_is_later() can't happen
> in any other case? I understand it was an incorrect backport action but
> I thought we may learn from it and still add some rate limit.

All of the current places where that function is used check the
contexts before calling it so it should be safe as is in the tree.
That said, something like this could potentially happen again.  I
don't think using WARN_ON_RATELIMIT() would be a problem.

Alex
