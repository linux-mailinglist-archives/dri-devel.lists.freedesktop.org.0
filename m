Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E2A0BD1A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94210E02F;
	Mon, 13 Jan 2025 16:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NMT0LmBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125710E198
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:18:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6d8a3e99e32so38548566d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736785077; x=1737389877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfzu8LVinRmTffQRsvj5JwYAQma905XvC7kwPgp95yk=;
 b=NMT0LmBDF1+qTES1ljrWD6/dDHmWRR0eSf8gundeEGBASvViO6G4wicpR18VuE0isK
 2PBZlXZiEJowT9OEfBa1hSBcCM/HIgsic8jEiH6V5j6ee4ohPdBygdNDfvxITHFCljaU
 i/QN5hfaxHePLcCXhQ5N+mAcP9f0C2Q0ZcCLEoucB0Wvry8/l6+S8XziHACjTaVSGsfO
 rTqspHJJa2fa2iGPOhr+HCmOSGUXe7qaOhSADjIsbzjJ5RIsWBJuQfAxiPfCDSgh8bD/
 dhZ7IxXYpAaMxBckZTGuSo+1enVJyEIQfrG5pHqHiTXqUWnSUq8CKKiQ76nwwNjXIuH1
 pUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736785077; x=1737389877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfzu8LVinRmTffQRsvj5JwYAQma905XvC7kwPgp95yk=;
 b=GP9XGh90cGY8IUV/rrtU+LtPZrqlfQKpLnVmI9YeDHtEuq7Vp9vfamdLAqIETZmfPp
 J6G6ApBQTCLaccvfaoI0EvK0CI9zALZNpiFjmNYMLEn/25M4r6oL0KTbLATKBvYmkHOA
 RurZUBJdjS6GWMo+Dbs+3kTVHwQeGTNekC367o4U1myt09ZKBUHMzkfxYC7JPmpR/WKE
 s0E2iAiJtxkbOcrbQgqmCwZym5YzrZVmqVGzaNL0mzTsuLOClHMGmFWXwrWmlHsMHlJg
 tHUEpmx1pHVia9AeUq0G/IN/7ja3L0thhpxjKcvmb2+Fg9rKqwm8hrP7HNeObygqvAoQ
 gjdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKM85glUvhrMUUBGN4ZV+sdBHkEe0fAcfXLbs2BFtFGsqkkAlTQOCx2+WCWNL2XPGq1AmiyoxgwJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBTrTQnDeS5OEuilWMRBNBAnPZVBa55RCq/cJvsDtqmZfmgtqk
 c4Xx3ICrHjlgvb5ohkyIvGDE9kDalguMYwGQi93+4WyZaLqxjd6/biO6Bk2jrWzB8iGyzMi+Ln0
 +zvB5Tt2lPC0NNUe8jGzIdJL6peY0VSwLBg0L
X-Gm-Gg: ASbGncshUk/MrotNLOGbbxSFpCWIxHiLx5VoHvGsm5IZeSinTDQpuQJ40biQmyX8nqe
 CM886KqOjfgXx5YW0rm+54GqB6Iza7s/fdv8=
X-Google-Smtp-Source: AGHT+IFDY+ySlB1nZMJq9PlTNDL8qUtu0AiaG+WzwFjnrE/ylu2IG3nFGi1mN1AYrMM9NBOj0s/u+5iNgQWpIVWK82E=
X-Received: by 2002:a05:6214:20ce:b0:6d8:812e:1fd0 with SMTP id
 6a1803df08f44-6df9b1da95amr320133376d6.15.1736785077170; Mon, 13 Jan 2025
 08:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-5-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250113093453.1932083-5-kirill.shutemov@linux.intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 13 Jan 2025 08:17:20 -0800
X-Gm-Features: AbW1kvZz7xe4mjGEEdN13LDK63_d9mSHRFPhCcbgv5eQRi5YXclVXjASqcr-k6E
Message-ID: <CAJD7tkYH8KO8NLJY564PRAmW-mtMfDCMTECGKyYyVAf+JtTcRA@mail.gmail.com>
Subject: Re: [PATCH 4/8] mm/swap: Use PG_dropbehind instead of PG_reclaim
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
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
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>,
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

On Mon, Jan 13, 2025 at 1:35=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> The recently introduced PG_dropbehind allows for freeing folios
> immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> to be involved to get the folio freed.
>
> Instead of using folio_set_reclaim(), use folio_set_dropbehind() in
> lru_deactivate_file().
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  mm/swap.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index fc8281ef4241..4eb33b4804a8 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -562,14 +562,8 @@ static void lru_deactivate_file(struct lruvec *lruve=
c, struct folio *folio)
>         folio_clear_referenced(folio);
>
>         if (folio_test_writeback(folio) || folio_test_dirty(folio)) {
> -               /*
> -                * Setting the reclaim flag could race with
> -                * folio_end_writeback() and confuse readahead.  But the
> -                * race window is _really_ small and  it's not a critical
> -                * problem.
> -                */
>                 lruvec_add_folio(lruvec, folio);
> -               folio_set_reclaim(folio);
> +               folio_set_dropbehind(folio);
>         } else {
>                 /*
>                  * The folio's writeback ended while it was in the batch.

Now there's a difference in behavior here depending on whether or not
the folio is under writeback (or will be written back soon). If it is,
we set PG_dropbehind to get it freed right after, but if writeback has
already ended we put it on the tail of the LRU to be freed later.

It's a bit counterintuitive to me that folios with pending writeback
get freed faster than folios that completed their writeback already.
Am I missing something?
