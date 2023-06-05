Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8762722C23
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 18:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5810E2ED;
	Mon,  5 Jun 2023 16:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438E710E2ED;
 Mon,  5 Jun 2023 16:05:26 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5585f2f070bso3621162eaf.0; 
 Mon, 05 Jun 2023 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685981125; x=1688573125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmwIG2LQ/1DCImJZNs0vH8WQcLvxkVp94qeGmLp2Vvw=;
 b=k9LIBIMFTYow9c2RzFgtROLZbM8LAWprrue4ijMpkvTZO+m4Qww8P8WbJb2qgUKtKA
 iUYp4gf+nU9exVms7e8ytnM+TkbimHZMzKvbNUeC61DAP0SAhQoi0LdqNzaimwQsDKAd
 m2fMnbZgrPaD1Iegex2s93YMH7TVIfZYOsUFoS0LrHRq542H4zRzPT9OMeAGkdEm88Kq
 TzvtFwTH+GJBFwatiQuQOfqx5eT1oAT5EKRODwLRDFJvBBhOQNcXPFGnNANCr/4qLxoe
 a7Bty7xfmXgVdcJhE0ZkUW7Z3zExYw0amINQeUWs6maDGhAH3IgPvkGXUrxuulzjsH7m
 aEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685981125; x=1688573125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmwIG2LQ/1DCImJZNs0vH8WQcLvxkVp94qeGmLp2Vvw=;
 b=ItUJsu786wouIMIvyZ3QJ3ClJLAV6FayUb9OpHgeuqwPRPulUYO2lp8CwR8/uIggcW
 fchvx90ipGFYdHgdLHWqiHmZ3XZXnoXUE5T83IxyVOsEUXmkP/U7yxnUkscYRaTwxSdg
 NJk1dUzJstqjQQnoM5XOZMtBhbvAPLAYNlijgRpv8OSkf8vMA2ZeqhQn8NKI1QeAowaS
 cojgBVBrXOpgMu1nklQv2tXBYx1vHsGX4cLeekfBwK4AygQknniywgau8UhlYhMc+/fQ
 62/i73jUg9IAc4e5SQM7JCGtaaDMjTlyybvJsQnKxNYwITlxMcb7HyigOKaf0W6vhbRF
 I5TA==
X-Gm-Message-State: AC+VfDyW8akialmwnwBuXst+N3T5pxWorzgW/fJdxTGgbiUguFi6h0j2
 UkS9Y9YpMOeInRu0R15zdUKn3Ed1tFc/WBjFf8A=
X-Google-Smtp-Source: ACHHUZ4sg16nvaPi+jRtLM+NPeFlsdjQfLErXtZphYrUXuBh0uzRYbI3btowTEY5CeenMg9WCYmkNySM9iFSSCq8Ceg=
X-Received: by 2002:a4a:a446:0:b0:558:a104:65fd with SMTP id
 w6-20020a4aa446000000b00558a10465fdmr289579ool.2.1685981125254; Mon, 05 Jun
 2023 09:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230601214814.2329224-1-olvaffe@gmail.com>
 <CADnq5_NQ2zgvRDZ8NWUsCm-8JO6PZSEmQ+WrbjYqjv3vTLfinw@mail.gmail.com>
 <CADnq5_OmrnBhRbRZ_0thdKktNsSDG4w7dr8Vn_sbiNT2_t2UQA@mail.gmail.com>
 <CAPaKu7RuyPMBb2gAKCa_EhXyar8QpEEJ3zwRBP6dXdOc-VSasA@mail.gmail.com>
In-Reply-To: <CAPaKu7RuyPMBb2gAKCa_EhXyar8QpEEJ3zwRBP6dXdOc-VSasA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Jun 2023 12:05:13 -0400
Message-ID: <CADnq5_O3iCiRVXv6ZpTa5-GP7noaaGSBG6gfaU_ABnyH=GY3qw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix xclk freq on CHIP_STONEY
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Jun 2, 2023 at 11:13=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> On Fri, Jun 2, 2023 at 11:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > Nevermind, missing your Signed-off-by.  Please add and I'll apply.
> Sorry that I keep forgetting...  This patch is
>
>   Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>
> I can send v2 if necessary.
> >
> > Alex
> >
