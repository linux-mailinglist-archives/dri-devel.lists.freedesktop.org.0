Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB37750267
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F0D10E3C6;
	Wed, 12 Jul 2023 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A2410E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:04:33 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-76595a7b111so583187985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689152672; x=1691744672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIF186mRaGX5BFXMSlH2BgP4u+RcqYufJt4GrXqOpCU=;
 b=JLNf+3Dz86oZ76xOz22eHcNwfsk6TRMrM3Fz56cp9+Irm8LUYG5FuVu1bmJCDP/e7h
 ifVoOJMMmlLDlK7sRqID1Dye9gyXcovdGOBJigJPRfB8aY955aTO4V8Lbt054U55iPVu
 fwL/seB5FTDlt5jzzOlwWk3uHlWHirhblaMPhBNmmdM6VOhjw5GNYGqbkazW0J0QzgB+
 xUsP3WybR7T/5cS0UYzalOBFO6P9UdGIjqgjX+MLxpg5xb2+PJ+FCpIizgfTHiUfh2qE
 IvBIyfcbzGCrYfk/COueNCDWKd0RxyvQcjHFk6BYvbOplUMd+6VSYHpAey6Q1LFDieQg
 I4SA==
X-Gm-Message-State: ABy/qLZQnBR3krqazYWBsKuiG0BjZvpgs1ZnnisjyQkT7al7aPdnuz0K
 NBAYnQkFp2/thw6GcRoiZ9C3+Vsv+COGZQ==
X-Google-Smtp-Source: APBJJlGeSzXfmRKanAgvIpACNHLtEKM0xfSK6/NIj3YYeJsj1EpH9gCB5a5IOEnOOI5JRbsyxGoxrA==
X-Received: by 2002:a05:620a:1986:b0:765:aca9:1a13 with SMTP id
 bm6-20020a05620a198600b00765aca91a13mr18244298qkb.23.1689152671779; 
 Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 b5-20020a0dd905000000b00577632aa85esm1072196ywe.3.2023.07.12.02.04.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bc379e4c1cbso7766513276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
X-Received: by 2002:a05:6902:28b:b0:c4b:41ce:f68b with SMTP id
 v11-20020a056902028b00b00c4b41cef68bmr16459258ybh.41.1689152670844; Wed, 12
 Jul 2023 02:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
In-Reply-To: <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:04:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
Message-ID: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
To: Peter Zijlstra <peterz@infradead.org>
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
 Linux PM list <linux-pm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hoi Peter,

On Wed, Jul 12, 2023 at 10:05=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:
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
> We could scale by BogoMIPS I suppose, it's a bogus measurement, as per
> the name, but it does have some relation to how fast the machine is.

That's gonna fail miserably on e.g. ARM and RISC-V, where BogoMIPS
depends on some timer frequency.

R-Car M2-W with 1.5 GHz Cortex-A15: 40.00 BogoMIPS
R-Car V4H with 1.8 GHz Cortex-A76: 33.33 BogoMIPS

while the real slow 48 MHz VexRiscV gets 128 BogoMIPS.

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
