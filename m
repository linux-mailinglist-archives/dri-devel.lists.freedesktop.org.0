Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED3A10CF0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891DE10E401;
	Tue, 14 Jan 2025 17:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FopKS7t7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7E10E401
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:03:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7be49f6b331so81126085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736874149; x=1737478949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pwRPv3AC50iLCk2Zf2oVFdf10HsOLZLViQlkbWzupw=;
 b=FopKS7t7YhIYYUWyqptnWzGTXQVPWirZhvjBC11mfNSxtk50baQu7s1vWWSD1W95Rc
 +gW1NYQqxd0MCboHvAwvTq5F/ODHvIoOHtFKiEzVfvZ+4r28N8ctQS2jukviCOWdvJJF
 Old2sFOr1pnCo/uqMRQgOX9TYKob135PmHJupB7UfBo6frjZ6VWMGd48CtheZ8eaN+y1
 TcSuK48C78aY9XRf6g1ndLjMHs8GmJ1S6mbmPxDtsoFLI1ri2ooZ9DX+us2nwnnh9IA1
 DzzYxMVCwH2PuXQ4wQK09OZkdum6q6HcGBSxK9zpRQX11+MHFEUJFl6pV4P4m89QkKA4
 Wbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736874149; x=1737478949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pwRPv3AC50iLCk2Zf2oVFdf10HsOLZLViQlkbWzupw=;
 b=glIMS88In8v3Duc4Qk2eHDz4vI5l70qIpx6NqA9MfxBt6NCA8XZbNDZD/faT0Phc6j
 UwTruJoAulmrY4MoDSXySk3gI/oApj2vg2Hol+Cdxq5SJSTYv66/L0avnrilyuZ1FMmC
 qAMWSkZIf2YiHzXAjEJsIliX5D/pEKZ0vLggl9wMZJGi7eaoFMiIIz6DMDID/ByzylDt
 RESEaHb8LZ9i4cij4GEMITf5nplRiCcORc1Crm+nVm7ndyXAaq52DmOBw+jG2BQQmoum
 CCcAqsRXMgPMmjm+j+5fyozI/Bigb4wG4JQULx7rs52Erro8jlmdnpBHV2XR5e/uZcsy
 dpkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKi00QJgOMwmX2OSXvybgyo+sT2qsHuePm1f8t+KFfnepAc8Wh3NDi2GCbiDe3/OWe8P3nfI58KrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiDx88CYdhLVg0p6TkLJwj9CgwKIiiDIHqR9DpsChiqrMJJXI/
 sIRBQgfkcS5lgm/CBEWnBaThmGGoljE3P3565088yDH3YbvgiUch+oTdWuC05cr+mjmlMkn8FvZ
 BKM/k6+hBHvSZCjvTU0Vy+LC+qHVJKAiSQHI6
X-Gm-Gg: ASbGncspuP24/d2FZwnYrSgkDwOQJVY64PdqxQVUF+Gm1ceYX5cHUIQgBacUxSKdrbG
 KQRb0dQuLgeIJkfuzcbh2X2cd/Z5O2tqUrhZrrXRGY2rL0P1bRa3wJxvomLTGUX3eaRtLFJQ=
X-Google-Smtp-Source: AGHT+IEmCebGY2XiXiMSHiPH6lyzErlM2sxmSzBWB4EBYHNDzzHKKbPlbhF+bpXyENdSkK3zvR6V00VYB1KaeeKmh74=
X-Received: by 2002:a05:620a:244d:b0:7b7:142d:53b8 with SMTP id
 af79cd13be357-7bcd97c97e1mr4649151185a.53.1736874149139; Tue, 14 Jan 2025
 09:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-9-kirill.shutemov@linux.intel.com>
 <Z4UxK_bsFD7TtL1l@casper.infradead.org>
 <vpy2hikqvw3qrncjdlxp6uonpmbueoulhqipdkac7tav4t7m2s@3ebncdtepyv6>
In-Reply-To: <vpy2hikqvw3qrncjdlxp6uonpmbueoulhqipdkac7tav4t7m2s@3ebncdtepyv6>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 14 Jan 2025 10:01:52 -0700
X-Gm-Features: AbW1kvYQkyXZbUdcH1QNEYpQQw7S18-Qu-i6iGpqw5vVBDdyuuTWt_dBq2WlT1M
Message-ID: <CAOUHufY+BViSYS14tfN8EOhuE05KneG2syHhVCyFPppkmDH=aQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] mm: Remove PG_reclaim
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, 
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Dan Carpenter <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>, 
 David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-trace-kernel@vger.kernel.org
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

On Tue, Jan 14, 2025 at 1:30=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Mon, Jan 13, 2025 at 03:28:43PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 13, 2025 at 11:34:53AM +0200, Kirill A. Shutemov wrote:
> > > diff --git a/mm/migrate.c b/mm/migrate.c
> > > index caadbe393aa2..beba72da5e33 100644
> > > --- a/mm/migrate.c
> > > +++ b/mm/migrate.c
> > > @@ -686,6 +686,8 @@ void folio_migrate_flags(struct folio *newfolio, =
struct folio *folio)
> > >             folio_set_young(newfolio);
> > >     if (folio_test_idle(folio))
> > >             folio_set_idle(newfolio);
> > > +   if (folio_test_readahead(folio))
> > > +           folio_set_readahead(newfolio);
> > >
> > >     folio_migrate_refs(newfolio, folio);
> > >     /*
> >
> > Not a problem with this patch ... but aren't we missing a
> > test_dropbehind / set_dropbehind pair in this function?  Or are we
> > prohibited from migrating a folio with the dropbehind flag set
> > somewhere?
>
> Hm. Good catch.
>
> We might want to drop clean dropbehind pages instead migrating them.
>
> But I am not sure about dirty ones. With slow backing storage it might be
> better for the system to migrate them instead of keeping them in the old
> place for potentially long time.
>
> Any opinions?
>
> > > +++ b/mm/swap.c
> > > @@ -221,22 +221,6 @@ static void lru_move_tail(struct lruvec *lruvec,=
 struct folio *folio)
> > >     __count_vm_events(PGROTATED, folio_nr_pages(folio));
> > >  }
> > >
> > > -/*
> > > - * Writeback is about to end against a folio which has been marked f=
or
> > > - * immediate reclaim.  If it still appears to be reclaimable, move i=
t
> > > - * to the tail of the inactive list.
> > > - *
> > > - * folio_rotate_reclaimable() must disable IRQs, to prevent nasty ra=
ces.
> > > - */
> > > -void folio_rotate_reclaimable(struct folio *folio)
> > > -{
> > > -   if (folio_test_locked(folio) || folio_test_dirty(folio) ||
> > > -       folio_test_unevictable(folio))
> > > -           return;
> > > -
> > > -   folio_batch_add_and_move(folio, lru_move_tail, true);
> > > -}
> >
> > I think this is the last caller of lru_move_tail(), which means we can
> > get rid of fbatches->lru_move_tail and the local_lock that protects it.
> > Or did I miss something?
>
> I see lru_move_tail() being used by lru_add_drain_cpu().

That can be deleted too, since you've already removed the producer to
fbatches->lru_move_tail.
