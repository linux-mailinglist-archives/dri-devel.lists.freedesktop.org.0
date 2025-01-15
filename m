Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABCBA12DEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4194610E821;
	Wed, 15 Jan 2025 21:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RIOmN3m9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4754510E289
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:48:22 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-85b8c94a6b4so32820241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736977641; x=1737582441;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltmn9Mm22yVt64ua+/2W5DkLu4FvUvXKpZxg/TWxbvY=;
 b=RIOmN3m9JASTt3Cq/ECMSQIHIQooWcnMvrePthJNZ4z+a7RpDwbVKLiJKXDZzurFQw
 ygFT0JvnjR2ai3a8xlfdBSeg7sHbRGJRH2rV62EuuLLvl55zVsNrjXCLeEBIJt6xoeB5
 HIa8kBvOXKU/Fnl9ltEwyYutV1l+MsjRL6PUbAH+VABOsKZWjJYCAtdOPO7c8q0fF8ZO
 takEDSR4kziejV3AX0JeW7PRZSFtKPPItq6Zb9blx7iGqLT59w4AWThvAOe1RIQwXp0e
 nPwZBcG+nERvmHKYuSWEeC23vgVU7D5RV+aYxJPRZbj/JNHRl3nL1URPrJWctNLB+x0Q
 O4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736977641; x=1737582441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltmn9Mm22yVt64ua+/2W5DkLu4FvUvXKpZxg/TWxbvY=;
 b=w/5fXQWOg5x5IzwHtSIawnlC+ZY4ooGl6f3iUKi7Jxu+nD5S2X/TK6/oc5zPivFtzk
 T/FDMTnVySDqHGj5wsxuBAEVjZx7iODqXXR13NAjBzYaS1sMc4AqND7gIAybvmZHtqiM
 NnwCHkXz4r2LjToozTzLj3fyKuQqg3ZEI3maYZogmhJhze7YlfIlHV0XSLZmK+EItZXX
 TlE5uPiVlPOqd8irdsmKvT3fioO3D/+4hDBP9t3BV4gdfFD+b+S+7IzEmqgV4G5pBCHH
 hxvuu/9eaFJ8Gn068bh4FhA9RZ1RbZMmYvtg2IXqYjQKuROqghcX8wcyaCeTDwY7oJeE
 yJgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXotqAE8xYXk/p+sM0nRgw8iT1FER6aWpqrkIpp8TqVi7RG1QUjqvSYzdzQGeIpcXUwcZOAAkfCYbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0Aa9AYKEX9qCCAwMbxpwFPgZET/yHbxv2YNH3Y9zJVY9T36So
 6zNs72Yy/N5vmRHOdRkRI8Rf10eemkkRYbhib7y31g0/RxvDV+t7yK2O1Dt6iIl9kpcj8gm2WUd
 ee3pHIJpgf8D4GJCQJ6AWDeKu1sh4t3P5Cnbz
X-Gm-Gg: ASbGncuCy6IZChfMUWYnQbPaewCVlSo9mz3C/ea7zP1ZZ5kIHRIEIMKwezk+J1oZ2tK
 RZO/A1vMJhRNxQ/HjKVVegMmPZtMAKSzv520CEmWi7LYweFm/N6GCFE6utwXFbNgjXsvd
X-Google-Smtp-Source: AGHT+IHddxhJJTm91TzdAwSi6uafTRzEfEyn82rLSJiZKUTard4Bp+c3/yQxdvAEMnMOjsCchFbxw41UJMogIcZ05rQ=
X-Received: by 2002:a05:6102:54a4:b0:4b0:ccec:c9de with SMTP id
 ada2fe7eead31-4b3d0ecc1ecmr29653773137.24.1736977641130; Wed, 15 Jan 2025
 13:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
 <Z4gqJqcO8wau0sgN@casper.infradead.org>
In-Reply-To: <Z4gqJqcO8wau0sgN@casper.infradead.org>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 15 Jan 2025 14:46:44 -0700
X-Gm-Features: AbW1kvYmgQZAQoh1evl_F-cwT96TWCJNKl3oZphib0Y46aUVpuxrrUuhtwKH4hA
Message-ID: <CAOUHufZ42ZV1SU+rGLM-2j2Hp43Q9eLY_yFYg8jsifOfcPHUgQ@mail.gmail.com>
Subject: Re: [PATCHv2 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()
To: Matthew Wilcox <willy@infradead.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
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

On Wed, Jan 15, 2025 at 2:35=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 15, 2025 at 11:31:29AM +0200, Kirill A. Shutemov wrote:
> > -static void lru_deactivate_file(struct lruvec *lruvec, struct folio *f=
olio)
> > -{
> > -     bool active =3D folio_test_active(folio) || lru_gen_enabled();
> > -     long nr_pages =3D folio_nr_pages(folio);
> > -
> > -     if (folio_test_unevictable(folio))
> > -             return;
> > -
> > -     /* Some processes are using the folio */
> > -     if (folio_mapped(folio))
> > -             return;
> > -
> > -     lruvec_del_folio(lruvec, folio);
> > -     folio_clear_active(folio);
> > -     folio_clear_referenced(folio);
> > -
> > -     if (folio_test_writeback(folio) || folio_test_dirty(folio)) {
> > -             /*
> > -              * Setting the reclaim flag could race with
> > -              * folio_end_writeback() and confuse readahead.  But the
> > -              * race window is _really_ small and  it's not a critical
> > -              * problem.
> > -              */
> > -             lruvec_add_folio(lruvec, folio);
> > -             folio_set_reclaim(folio);
> > -     } else {
> > -             /*
> > -              * The folio's writeback ended while it was in the batch.
> > -              * We move that folio to the tail of the inactive list.
> > -              */
> > -             lruvec_add_folio_tail(lruvec, folio);
> > -             __count_vm_events(PGROTATED, nr_pages);
> > -     }
> > -
> > -     if (active) {
> > -             __count_vm_events(PGDEACTIVATE, nr_pages);
> > -             __count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE,
> > -                                  nr_pages);
> > -     }
> > -}
>
> > +++ b/mm/truncate.c
> > @@ -486,7 +486,7 @@ unsigned long mapping_try_invalidate(struct address=
_space *mapping,
> >                        * of interest and try to speed up its reclaim.
> >                        */
> >                       if (!ret) {
> > -                             deactivate_file_folio(folio);
> > +                             folio_set_dropbehind(folio);
>
> brr.
>
> This is a fairly substantial change in semantics, and maybe it's fine.
>
> At a high level, we're trying to remove pages from an inode that aren't
> in use.  But we might find that some of them are in use (eg they're
> mapped or under writeback).  If they are mapped, we don't currently
> try to accelerate their reclaim, but now we're going to mark them
> as dropbehind.  I think that's wrong.
>
> If they're dirty or under writeback, then yes, mark them as dropbehind, b=
ut
> I think we need to be a little more surgical here.  Maybe preserve the
> unevictable check too.

Right -- deactivate_file_folio() does make sure the folio is not
unevictable or mapped. So probably something like below would the
change in semantics be close enough?

  if (!folio_test_unevictable(folio) && !folio_mapped(folio))
    folio_set_dropbehind(folio);
