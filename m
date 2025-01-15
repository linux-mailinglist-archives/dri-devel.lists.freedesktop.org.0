Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8DA11886
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 05:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C114910E4BC;
	Wed, 15 Jan 2025 04:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aIWyknF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BAF10E4BC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:29:42 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4aff620b232so2108523137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736915322; x=1737520122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SiaIVXIhhM1sp+r10z/vJyY+tzDQMN+pj3uAuSz6ZII=;
 b=aIWyknF1MpbwJm8vMsCSpHf82cZMGD/SDkoW1QdrnArBa8AVIKVjQTpSTYeU+v7gYr
 j+/LaCBHSKAFApUkoRvJx/E+p/ylwztrbNbutoP4x5oqaE+KU/llO6LpgyyD3h8ldS89
 PG/xQG3zI3TKFlvXTOsfx7szxermAvD1fDwZtyznSRBKi57IUuxa0WxAbE+HJk3ficUJ
 1RJo+6ntundNcq65FerBDwyRmrjn2tF4zYioQLoWJwFDYDC5u36jHoLRzrcUrm8xRCAE
 6p7rVrtBASqr7FjcNY71iePKzmSUJnm2n2eCRUaZxNQnPR3uZcoxtddi/q/mbfFPJECB
 XAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736915322; x=1737520122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SiaIVXIhhM1sp+r10z/vJyY+tzDQMN+pj3uAuSz6ZII=;
 b=M19LJYpM8VLeF68TCJmt9BqQMnVHLMEO8hlEewp4huYKX4NpMdckZkIFuFiikSkmye
 aW8CZ3kvw9jzFY2DxmOTNQZmmK5trjxjP4ao7hX1i/zcIX7VlaVp+QKcWoFWe7kSmtZE
 te7xbzJLXKC7JcSIk2JcJGqA8rZi3k/aQR0qk46LMsFOBxyibs/PE+R7ohr0B7HZTEmO
 XHqMSeYhhu/NsLy/yT38uRKjBZWeTIU5YQpd04W9oA2Ofs7zequyLwRITD+/ReF5h8hm
 bH8zxCW1kkOJ+javVkoB7WuLjPmtI+G9ibn/B3GRozZtz8sB/aPGL3Jd6oE5jur4ISho
 Ov5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR8hZa9U+XuVvIQ7MO4VFLd35XLbIOqCDGrAm23fi/2aziTbHrFLva32SKCObkY9vJgCHfNpdXyXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7GS3aUgA2XW4tRzJEZzNU8XqniAuZSo0TBCeFzc+Mpu4P4Iba
 gPPImG+T+EckgDAx98EkzJ/SiuMoRqLt/V6vuNrJBx95efSXY/4SfsdsJHfiO2kPNsblKf2Y00n
 A9JgJKFlFyX7+J5D1+7IaUZfMK/Quv4g09KoC
X-Gm-Gg: ASbGncucIk8IVBRj01TON2xScrxNoOmrHqvlgDHqG6g1YgKaaONSx52RzJf1n9zU7/A
 1edpYOxh6TwHNTH32qhtnZcLcTAN4uYAlP5q++P7ackV376N6+8AMY0g/mKBuHmJ8OGy9t4g=
X-Google-Smtp-Source: AGHT+IH/FRwv1gjMQVdrZyTpxRo/2P7ZfMOmxND6HntPtKv8PRHbhPpC3eKReWiv2QbmErnwLgBIFI50EeMrfGttcP0=
X-Received: by 2002:a05:6102:370f:b0:4b3:c658:2a36 with SMTP id
 ada2fe7eead31-4b3d0f8f840mr23231900137.8.1736915321756; Tue, 14 Jan 2025
 20:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-5-kirill.shutemov@linux.intel.com>
 <CAJD7tkYH8KO8NLJY564PRAmW-mtMfDCMTECGKyYyVAf+JtTcRA@mail.gmail.com>
 <sct6vvupd4cp6xt66nn6sfs7w3srpx6zcxxsn6rz5qo4tz3la6@btdqsbicmrto>
 <CAJD7tkZwgKRc2kbY9WutC8meOV+CpQSpxKSpkUorEneJJuX9og@mail.gmail.com>
In-Reply-To: <CAJD7tkZwgKRc2kbY9WutC8meOV+CpQSpxKSpkUorEneJJuX9og@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 14 Jan 2025 21:28:05 -0700
X-Gm-Features: AbW1kvaBboGLsqdjopVloMA7j9dnfG52vbiddOAszVwHNFJf23o0CFxEnOZVFVU
Message-ID: <CAOUHufYFKZ=agWpS3mFHyDjXs_Tq7VhM=qBayL0FtJis=W0+Tg@mail.gmail.com>
Subject: Re: [PATCH 4/8] mm/swap: Use PG_dropbehind instead of PG_reclaim
To: Yosry Ahmed <yosryahmed@google.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
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
 Vlastimil Babka <vbabka@suse.cz>, intel-gfx@lists.freedesktop.org, 
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

On Tue, Jan 14, 2025 at 11:03=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Tue, Jan 14, 2025 at 12:12=E2=80=AFAM Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > On Mon, Jan 13, 2025 at 08:17:20AM -0800, Yosry Ahmed wrote:
> > > On Mon, Jan 13, 2025 at 1:35=E2=80=AFAM Kirill A. Shutemov
> > > <kirill.shutemov@linux.intel.com> wrote:
> > > >
> > > > The recently introduced PG_dropbehind allows for freeing folios
> > > > immediately after writeback. Unlike PG_reclaim, it does not need vm=
scan
> > > > to be involved to get the folio freed.
> > > >
> > > > Instead of using folio_set_reclaim(), use folio_set_dropbehind() in
> > > > lru_deactivate_file().
> > > >
> > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > ---
> > > >  mm/swap.c | 8 +-------
> > > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > > >
> > > > diff --git a/mm/swap.c b/mm/swap.c
> > > > index fc8281ef4241..4eb33b4804a8 100644
> > > > --- a/mm/swap.c
> > > > +++ b/mm/swap.c
> > > > @@ -562,14 +562,8 @@ static void lru_deactivate_file(struct lruvec =
*lruvec, struct folio *folio)
> > > >         folio_clear_referenced(folio);
> > > >
> > > >         if (folio_test_writeback(folio) || folio_test_dirty(folio))=
 {
> > > > -               /*
> > > > -                * Setting the reclaim flag could race with
> > > > -                * folio_end_writeback() and confuse readahead.  Bu=
t the
> > > > -                * race window is _really_ small and  it's not a cr=
itical
> > > > -                * problem.
> > > > -                */
> > > >                 lruvec_add_folio(lruvec, folio);
> > > > -               folio_set_reclaim(folio);
> > > > +               folio_set_dropbehind(folio);
> > > >         } else {
> > > >                 /*
> > > >                  * The folio's writeback ended while it was in the =
batch.
> > >
> > > Now there's a difference in behavior here depending on whether or not
> > > the folio is under writeback (or will be written back soon). If it is=
,
> > > we set PG_dropbehind to get it freed right after, but if writeback ha=
s
> > > already ended we put it on the tail of the LRU to be freed later.
> > >
> > > It's a bit counterintuitive to me that folios with pending writeback
> > > get freed faster than folios that completed their writeback already.
> > > Am I missing something?
> >
> > Yeah, it is strange.
> >
> > I think we can drop the writeback/dirty check. Set PG_dropbehind and pu=
t
> > the page on the tail of LRU unconditionally. The check was required to
> > avoid confusion with PG_readahead.
> >
> > Comment above the function is not valid anymore.
>
> My read is that we don't put dirty/writeback folios at the tail of the
> LRU because they cannot be freed immediately and we want to give them
> time to be written back before reclaim reaches them. So I don't think
> we want to change that and always put the pages at the tail.
>
> >
> > But the folio that is still dirty under writeback will be freed faster =
as
> > we get rid of the folio just after writeback is done while clean page c=
an
> > dangle on LRU for a while.
>
> Yeah if we reuse PG_dropbehind then we cannot avoid
> folio_end_writeback() freeing the folio faster than clean ones.
>
> >
> > I don't think we have any convenient place to free clean dropbehind pag=
e
> > other than shrink_folio_list(). Or do we?
>
> Not sure tbh. FWIW I am not saying it's necessarily a bad thing to
> free dirty/writeback folios before clean ones when deactivated, it's
> just strange and a behavioral change from today that I wanted to point
> out. Perhaps that's the best we can do for now.
>
> >
> > Looking at shrink_folio_list(), I think we need to bypass page demotion
> > for PG_dropbehind pages.

I agree with Yosry. I don't think lru_deactivate_file() is still
needed -- it was needed only because when truncation fails to free a
dirty/writeback folio, page reclaim can do that quickly. For other
conditions that mapping_evict_folio() returns 0, there isn't much page
reclaim can do, and those conditions are not deactivate_file_folio()
and lru_deactivate_file()'s intentions. So the following should be
enough, and it's a lot cleaner :

diff --git a/mm/truncate.c b/mm/truncate.c
index e2e115adfbc5..12d2aa608517 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -486,7 +486,7 @@ unsigned long mapping_try_invalidate(struct
address_space *mapping,
                         * of interest and try to speed up its reclaim.
                         */
                        if (!ret) {
-                               deactivate_file_folio(folio);
+                               folio_set_dropbehind(folio)
                                /* Likely in the lru cache of a remote CPU =
*/
                                if (nr_failed)
                                        (*nr_failed)++;

Then we can drop deactivate_file_folio() and lru_deactivate_file().
