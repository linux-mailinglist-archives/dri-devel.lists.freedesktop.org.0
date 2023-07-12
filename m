Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9B7503F7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DC110E4BA;
	Wed, 12 Jul 2023 09:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BE310E4BA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:58:05 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so851465276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689155884; x=1691747884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y6MzudJP2Fu/sGdEnelPPluUqTi475Db7xeaDmuW9Sk=;
 b=DH3L2IVWgui9s55vkgH8eT/hXXnGkBEz8GgkIqHDcQfkM6NlCI+655Ac0PaR+4XuF8
 5VmtrU6qXSgB8W1FhgLMH9Da+3Yhdbesq2afgofzUy4gxH6ZVdqUDeFJi96xK4oOA9cX
 z6URfpg6YvqF/AeXID+IBrwX3rWxLt5PT30AFPgKQmTuXsi4esjBUyIt+1z/zf2r6QDq
 LAJLnRPmVEpHZ4pFW/e95zwi1UoA9TbcnDGPDot7ZbXfFND/j0bKv2jjPeoGWkoiQCxO
 +CivdeMyPUd6zvP0CMJku/jMuVc+IzW3Hr2ySZ8NNalwpwruSgkb4hxzb9GBmwvw7iWW
 E+FQ==
X-Gm-Message-State: ABy/qLaIvG3aToHH+MRJQ8rAJ4IAB4LL9xeW1qQ+m85g7ro/0TBIHyI3
 ND8OOBHPqZYagzfGAchJVOFaBlyX6w3blA==
X-Google-Smtp-Source: APBJJlHcyZ453cGS5IdEUbr3IMftZlP3HYnFuGjsII59WsHTUS/OGaI2u2f4ABvkN7sLLMBO9hsHEg==
X-Received: by 2002:a25:b102:0:b0:c60:a101:e961 with SMTP id
 g2-20020a25b102000000b00c60a101e961mr1676149ybj.19.1689155884210; 
 Wed, 12 Jul 2023 02:58:04 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 x7-20020a5b0947000000b00c5ec980da48sm838978ybq.9.2023.07.12.02.58.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 02:58:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so851447276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:58:03 -0700 (PDT)
X-Received: by 2002:a25:ae5d:0:b0:bd6:a97e:3597 with SMTP id
 g29-20020a25ae5d000000b00bd6a97e3597mr1632945ybe.30.1689155883328; Wed, 12
 Jul 2023 02:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
In-Reply-To: <ZK30CR196rs-OWLq@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:57:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
Message-ID: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
To: Tejun Heo <tj@kernel.org>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tejun,

On Wed, Jul 12, 2023 at 2:30=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
> On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:
> > On Tue, Jul 11, 2023 at 04:06:22PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jul 11, 2023 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> ...
> > > workqueue: neigh_managed_work hogged CPU for >10000us 4 times,
> > > consider switching to WQ_UNBOUND
> >
> > I wonder whether the right thing to do here is somehow scaling the thre=
shold
> > according to the relative processing power. It's difficult to come up w=
ith a
> > threshold which works well across the latest & fastest and really tiny =
CPUs.
> > I'll think about it some more but if you have some ideas, please feel f=
ree
> > to suggest.
>
> Geert, do you mind posting the full kernel logs for the affected machines=
?

https://drive.google.com/file/d/1toDs7ugZJ2eXatpdvySY4yxSsNam9xAC
is an archive with boot and s2ram logs.  Note that my kernels do contain
local debug code, and may be noisy.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
