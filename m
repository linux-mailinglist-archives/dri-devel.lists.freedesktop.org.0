Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2EBB60B2
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3E410E891;
	Fri,  3 Oct 2025 07:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5CD10E7D4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 13:02:27 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-43f7e0494ecso558605b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759410147; x=1760014947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ec+ndxQ3jnu1a8VNviNr06HkWUDsCBC6MfDIjOmWDIU=;
 b=MXhQAOaR14u6bDuIC3O8Eh7W+l7E49KEskONxcFfcO6F/FI6bRtTSihp3OFP29KlLu
 W8cEnU0lxSLNOIwcIryEw1RVk3C6ggq9y2of+tLIFMD+j0cPbMGUDKEliw9IyDXTbdw8
 FXnGdfdG6A/omVl8lZRzgc6Oc1tVJsMQOXJHR4ud1msOn9DrchiK2LZxGraEoBow1LGy
 IMfzqaUWwUiPw/1V5TmZ/haNfC6dpitcrh9Ya8ymg4wI1SQzPMOgJyTktal0DPW3h9VZ
 qswH1NJGqzPmKTzpUaAm/tXsKxCEnzP+44CT20Vp+ile+Z5VHrX5wIiZ2ZUpeS4DhTvP
 ENFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7y1+yGKKIZtZUYU0f3DhjjNDySAQ8xLoRenMQxAGY1cp3ZuDBaLQU47NKvGQpTsFy7tAG2L1U1kk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5/BQVsWXXlrddmEzt/jXmm0CxO/iklWzMQme6UqGjlMmtXtoP
 ylH0IHFuvg0qpPZXNetZw3z9KHyeSMgGYuJiWUU1ATN0fVDUE++3CdE4ZHpH8QAL/6/GOg==
X-Gm-Gg: ASbGncuxyPnrjQvFOwW+c1UyOfQGUmVBr/oXwmLcgh7yzr3dWM9fZqt52TJCNnIaYJX
 1/kA/lJvfap9Gfj6d/Nqs/C3XCdzoOaWSS2Tv4nUWLcXoMAUfpxkgH8t4TErsPboYc2Y3bQ4iiq
 2IT5MuawYiWfhJBNNNdvEXLiPrqBxkDTxU3ZVoeNRZ35rynUNLJFeO7nFNHFu1p/sWYPAFfDvPf
 1p+tTU6XjDl5VhOdRmavmPEFx43mh7Nf5MJXuskJ/WTxnsCCXD3zGgfb1/G7M96/yLAsTGm/Ekz
 9wd1H3/msKWZikB50BMKwlfrFlbv5Ms7YtvyyzHh86EF3YQNfXDHNgrXJ71jCgdFsqVlhLhG9z6
 pb0PogwBX0RwtrCQcH3UkagFv4fgO0cGx3xOBL2JyZIYDRgoooMvqSswg3cCqpvm1WZfr4Awbdj
 Ur2Lr2+T4ViKPypMvH++o=
X-Google-Smtp-Source: AGHT+IFd1pwmZ+s64+Gkz8fgiYMFIRnLYU6lPrkV7JJ6g47aoSdGjhYub7/9sdGds3efLjM6z+1OQw==
X-Received: by 2002:a05:6808:d4b:b0:43f:7287:a5d7 with SMTP id
 5614622812f47-43fa41a8405mr3909285b6e.30.1759410146954; 
 Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-878bd783b3esm19131886d6.36.2025.10.02.06.02.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-78ea15d3489so9587416d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUUVvde3CpBxK4IydZO5Q85q85abL+XsvlJrDfUmjU5UsU7pLQjjK67AL4+xd2HMfNTSrd4dQC7l7w=@lists.freedesktop.org
X-Received: by 2002:a67:f74a:0:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5d3fecbe643mr2057033137.5.1759409779799; Thu, 02 Oct 2025
 05:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-3-byungchul@sk.com>
 <2025100255-tapestry-elite-31b0@gregkh>
In-Reply-To: <2025100255-tapestry-elite-31b0@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:56:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
X-Gm-Features: AS18NWCmqHU8DKNueQjpF6Ifrv2W5fzYfUTjQ8XBBt-1KrFWqeUHHsvmYo_0fpY
Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
Subject: Re: [PATCH v17 02/47] dept: implement DEPT(DEPendency Tracker)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org,
 kernel_team@skhynix.com, 
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com, 
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, 
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
 will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org, 
 joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch, 
 duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu, 
 willy@infradead.org, david@fromorbit.com, amir73il@gmail.com, 
 kernel-team@lge.com, linux-mm@kvack.org, akpm@linux-foundation.org, 
 mhocko@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, 
 vdavydov.dev@gmail.com, sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, 
 cl@linux.com, penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, 
 ngupta@vflare.org, linux-block@vger.kernel.org, josef@toxicpanda.com, 
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org, 
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org, 
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com, 
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com, 
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com, 
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com, 
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com, 
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com, 
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
 sumit.semwal@linaro.org, gustavo@padovan.org, christian.koenig@amd.com, 
 andi.shyti@kernel.org, arnd@arndb.de, lorenzo.stoakes@oracle.com, 
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com, 
 mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org, 
 samitolvanen@google.com, paulmck@kernel.org, frederic@kernel.org, 
 neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, josh@joshtriplett.org, 
 urezki@gmail.com, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
 qiang.zhang@linux.dev, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
 vschneid@redhat.com, chuck.lever@oracle.com, neil@brown.name, 
 okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org, 
 anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
 mark.rutland@arm.com, ada.coupriediaz@arm.com, kristina.martsenko@arm.com, 
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com, 
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com, 
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com, 
 joel.granados@kernel.org, richard.weiyang@gmail.com, geert+renesas@glider.be, 
 tim.c.chen@linux.intel.com, linux@treblig.org, 
 alexander.shishkin@linux.intel.com, lillian@star-ark.net, 
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com, 
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org, brauner@kernel.org, 
 thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com, 
 andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 rcu@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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

Hi Greg,

On Thu, 2 Oct 2025 at 10:25, Greg KH <gregkh@linuxfoundation.org> wrote:
> > @@ -0,0 +1,446 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * DEPT(DEPendency Tracker) - runtime dependency tracker
> > + *
> > + * Started by Byungchul Park <max.byungchul.park@gmail.com>:
> > + *
> > + *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
> > + *  Copyright (c) 2024 SK hynix, Inc., Byungchul Park
>
> Nit, it's now 2025 :)

The last non-trivial change to this file was between the last version
posted in 2024 (v14) and the first version posted in 2025 (v15),
so 2024 doesn't sound that off to me.
You are not supposed to bump the copyright year when republishing
without any actual changes.  It is meant to be the work=E2=80=99s first yea=
r
of publication.

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
