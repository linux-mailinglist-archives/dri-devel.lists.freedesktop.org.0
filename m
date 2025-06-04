Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C9ACE4D5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 21:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747EE10E7CB;
	Wed,  4 Jun 2025 19:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZe4rVxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445ED10E7C4;
 Wed,  4 Jun 2025 19:34:33 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b26fabda6d9so22105a12.1; 
 Wed, 04 Jun 2025 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749065673; x=1749670473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPBd84LrS9cSOHyLnSC1TFUVA8656z2E4qXxfvYJEXU=;
 b=hZe4rVxVcCTmZsKzl0IWMpk1nSpHQ8vM83Gf1wprsMttYEZ9Iy7dBE/SMCAk8BH2I+
 HM6KGqz/yDlfT5X+LYho+X+JEWCMNBVSjUgne4aqD1YC66VbSYgMRJs2jHchLSu7pcWL
 9rv516FCHIDC0uW9Iw3y+UzNAVsj9Hxt46wdwQC2tVz4z+5a6ZYkDqKOSzHzsmcDCujJ
 uPkzt2y1UZi0IRcSURV9GTyo/7GSs67MKbkYWjI3TrXP3GA+iN3ixeEW4N3wECFemOo+
 SRzSrjSwZn1Q96z0B+NObtfIy/8njq6eR1Nn1AyadHusCtXPJdsIMiBArO511Ff974Rp
 3Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749065673; x=1749670473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPBd84LrS9cSOHyLnSC1TFUVA8656z2E4qXxfvYJEXU=;
 b=a5OkJXMOkz8+XFDsQxcVryyG/mFzQ3xZXqej74GzO7ypfaGmYhPt7YiQR4vIqTLRUZ
 IdldpmhONyDJNkw3Yl57pRVE/Oh3lFe6WtEZCJibrSL89zfJDXhchilgwlC3Jlt+91fQ
 joxL5VEowoafcwh7fNIDiforVY2A2I97uRjNFh8q0RtY3F1bXxdgvWV2IdfoaIURTkWY
 l7JLiAAy3Qv4682lQ3r/yb404p7QWkddd7cZAH8g+Janceerq3j/9qjHZr0xF8KULnrv
 UYGE9/7GatILJEbKPdB4YEj2y2HWfex3Iym7PxJ10c+C4Olu1jLOkIprV8iSgjtHu/ni
 3hlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcqg8OWQO+Q8weT2WfBuVSoy8qFz2YiPp7mFQv1cl/gnPAdjchogtvrVGsTLqqTpj3IIAOOQ9U8ew4@lists.freedesktop.org,
 AJvYcCVdoF3sbAws6AwH5vI0SI6CeW5wtx4/EqYMSULHSj4BoGRlPgqegBSrt2zHErmHqwfM57SlpVzH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2R9U9OvL92usitd3FbQ4Pwq86uo7MhPt2Owa0D+0M7nT6zHtp
 eRvAv/Bz3QpsPn6drYYnW7ALVbnsTyUfQ9dOUYi/89jGq8BLorThIOJjIOX4EddJ+lEg1iJ1w9i
 Z++AgametpPG3p7JvPfsvS+6SE5ske0661g==
X-Gm-Gg: ASbGncvdcYc64suVtfc7Y34fP+nliiLPrsNTMTXbkiJTgG79TTFejBlx453LmovktDC
 nBBpRPtikT8ufELinnHWdL565KKM7K4NY8ORoX2sJGyvglJNAMVy/4+wnNoJPxdE9atCWxS/0mL
 0ENEgctpHnDiYqa9mkZSzZGqlHLH9dU7mhCg==
X-Google-Smtp-Source: AGHT+IFN+KwGSw/GBFnrkHH8eKCuRlKYuIQM6biFeRyaeQWEXfpgRodSPrJcuJPA1CyPGvOWxGac+vuNl0YL06MHrDQ=
X-Received: by 2002:a17:90b:38c7:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-3130cd862eamr2170101a91.8.1749065672724; Wed, 04 Jun 2025
 12:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250524055546.1001268-1-sdl@nppct.ru>
 <CADnq5_MyV_C-XJCQEiXKLQhhEGErq7SnvhqFE1AauQPJvt5aYw@mail.gmail.com>
 <bee381b3-305b-46e5-ae59-d816c491fce5@nppct.ru>
In-Reply-To: <bee381b3-305b-46e5-ae59-d816c491fce5@nppct.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jun 2025 15:34:21 -0400
X-Gm-Features: AX0GCFub-bzEnLI8mXirUWoNvHzDhPws1qxQCINmsU6eXeWdNUBSVW7dtrkmElc
Message-ID: <CADnq5_P-1xGEjJpe--HFFQUaz9A=AO7mQwTXNCZJ693UgdaW0w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix NULL dereference in gfx_v9_0_kcq() and
 kiq_init_queue()
To: SDL <sdl@nppct.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jiadong Zhu <Jiadong.Zhu@amd.com>, 
 Yang Wang <kevinyang.wang@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
 stable@vger.kernel.org
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

On Wed, Jun 4, 2025 at 3:30=E2=80=AFPM SDL <sdl@nppct.ru> wrote:
>
>
> > On Sat, May 24, 2025 at 2:14=E2=80=AFAM Alexey Nepomnyashih <sdl@nppct.=
ru> wrote:
> >> A potential NULL pointer dereference may occur when accessing
> >> tmp_mqd->cp_hqd_pq_control without verifying that tmp_mqd is non-NULL.
> >> This may happen if mqd_backup[mqd_idx] is unexpectedly NULL.
> >>
> >> Although a NULL check for mqd_backup[mqd_idx] existed previously, it w=
as
> >> moved to a position after the dereference in a recent commit, which
> >> renders it ineffective.
> > I don't think it's possible for mqd_backup to be NULL at this point.
> > We would have failed earlier in init if the mqd backup allocation
> > failed.
> >
> > Alex
> In scenarios such as GPU reset or power management resume, there is no
> strict
> guarantee that amdgpu_gfx_mqd_sw_init() (via ->sw_init()) is invoked befo=
re
> gfx_v9_0_kiq_init_queue(). As a result, mqd_backup[] may remain
> uninitialized,
> and dereferencing it without a NULL check can lead to a crash.
>
> Most other uses of mqd_backup[] in the driver explicitly check for NULL,
> indicating that uninitialized entries are an expected condition and
> should be handled
> accordingly.

sw_init() is only called once at driver load time.  everything is
allocated at that point.  If that fails, the driver would not have
loaded in the first place.  I don't think it's possible for it to be
NULL.

Alex

>
> Alexey
