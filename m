Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B429675788C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC2C10E0B5;
	Tue, 18 Jul 2023 09:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522910E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:55:12 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-577412111f0so58986857b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689674111; x=1692266111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkfu4+zrfsEvNM/oP4wLx2h/8nsgQPK5hugPJnR2T8Y=;
 b=G+14QMV/yitMSCUMMFJ9vlq1AN1jHxA8k+zxw1TXpj8cLHkaUtrrIWKx0AcH/99u0P
 qFvdpr9coOsaURGXWzpF387Wg7PvqznryQhWQp0aPwWoD5RyGAoXNoNjfm2Gy292XuyR
 5+PQss5dLwGggmgx75NTqwjPB7R92pRrrKJNq9LwRdQoWY0QCnQot/0DVF8LXXGpyDla
 ARwPued0YeIFswyvPOmS2fa2usZvVjLuJHxyz1Vg0ze2kBswRwNutUNoXxSICeIa9Whe
 QTAnBN8tFfTWhs9dGA1Kk097npvGh8CeWvmDCr/B3WIasFQVOdbU4QXKlaRxLrnovJ7U
 +ZSA==
X-Gm-Message-State: ABy/qLZDha4j2NnP24h2mjMxzSc2kYdriQFmx5mYhVL0Z94w81JB+ZZZ
 776FOlq1S23qbNSfbStrOdqpVwIvBDO21Q==
X-Google-Smtp-Source: APBJJlHn9y3x0FCjD7m3OB1ARwaHLzaDn8oso9zJoQpz+Jy/cOrIlhNkogVsGeGGz/pdvo12Oe5MJg==
X-Received: by 2002:a5b:24e:0:b0:ce2:9918:982 with SMTP id
 g14-20020a5b024e000000b00ce299180982mr2250823ybp.50.1689674111524; 
 Tue, 18 Jul 2023 02:55:11 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05690204ed00b00cb8f1578837sm321764ybs.56.2023.07.18.02.55.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 02:55:10 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-caf3a97aa3dso5815886276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:55:10 -0700 (PDT)
X-Received: by 2002:a25:860f:0:b0:cec:59f7:b352 with SMTP id
 y15-20020a25860f000000b00cec59f7b352mr989091ybk.58.1689674110647; Tue, 18 Jul
 2023 02:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
 <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
In-Reply-To: <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2023 11:54:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
Message-ID: <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
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

On Tue, Jul 18, 2023 at 1:03=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
> Can you please the following patch and see how many reports you get? Look=
ing
> back at your reports, I think some of them probably should be converted t=
o
> UNBOUND but we should have a better idea with the adjusted threshold.
>
> Thanks.
>
> From 8555cbd4b22e5f85eb2bdcb84fd1d1f519a0a0d3 Mon Sep 17 00:00:00 2001
> From: Tejun Heo <tj@kernel.org>
> Date: Mon, 17 Jul 2023 12:50:02 -1000
> Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMI=
PS is
>  below 1000
>
> wq_cpu_intensive_thresh_us is used to detect CPU-hogging per-cpu work ite=
ms.
> Once detected, they're excluded from concurrency management to prevent th=
em
> from blocking other per-cpu work items. If CONFIG_WQ_CPU_INTENSIVE_REPORT=
 is
> enabled, repeat offenders are also reported so that the code can be updat=
ed.
>
> The default threshold is 10ms which is long enough to do fair bit of work=
 on
> modern CPUs while short enough to be usually not noticeable. This
> unfortunately leads to a lot of, arguable spurious, detections on very sl=
ow
> CPUs. Using the same threshold across CPUs whose performance levels may b=
e
> apart by multiple levels of magnitude doesn't make whole lot of sense.
>
> This patch scales up wq_cpu_intensive_thresh_us upto 1 second when BogoMI=
PS
> is below 1000. This is obviously very inaccurate but it doesn't have to b=
e
> accurate to be useful. The mechanism is still useful when the threshold i=
s
> fully scaled up and the benefits of reports are usually shared with every=
one
> regardless of who's reporting, so as long as there are sufficient number =
of
> fast machines reporting, we don't lose much.
>
> Some (or is it all?) ARM CPUs systemtically report significantly lower
> BogoMIPS. While this doesn't break anything, given how widespread ARM CPU=
s
> are, it's at least a missed opportunity and it probably would be a good i=
dea
> to teach workqueue about it.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>

Thanks!

I gave it a try on a system with an 800 MHz Cortex A9, only to discover
it makes no difference, as that machine has 1600 BogoMIPS:

workqueue: drm_fb_helper_damage_work hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND
workqueue: drm_fb_helper_damage_work hogged CPU for >10000us 8 times,
consider switching to WQ_UNBOUND
workqueue: genpd_power_off_work_fn hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND
workqueue: blk_mq_run_work_fn hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND
workqueue: pm_runtime_work hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND
workqueue: phy_state_machine hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND
workqueue: drm_mode_rmfb_work_fn hogged CPU for >10000us 4 times,
consider switching to WQ_UNBOUND
workqueue: sync_hw_clock hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND
workqueue: rtc_timer_do_work hogged CPU for >10000us 4 times, consider
switching to WQ_UNBOUND

Artificially low BogoMIPS numbers only happen on systems that have
the related timers (Cortex A7/A15 and later, Cortex A9 MPCore,
and arm64).

I will test on more systems, but that will probably not happen until
next week...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
