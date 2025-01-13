Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C59A0BD02
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27810E126;
	Mon, 13 Jan 2025 16:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mkMacR7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C4C10E126
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:12:22 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6dd0d09215aso35864826d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736784682; x=1737389482;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nln6xuSTTaoMOsjO/bzAdYR40fjFobKxVXqk79yIRg=;
 b=mkMacR7fGD+ZuPdJfJhk+6Np65ffwqly4ZKEWFHbZ3Z2lY1cR+Y0OXlNkaSHO1XMTR
 9tJDIWSOq4D8z1mVgyCnkKEtSHz+aVg54ipcqygsCOKRVIpT+AJu/xDE/8gVivh8+10+
 x5aJnlU2b2kNm2Ls5ezn4Hs0m0m3X999n9Mx4zq1MG6+B167zw39jRxGKUUBPB90FyWE
 XH7Mqb8HvDW1Zjx8IA4/4mcSe2jmVO0RDOcBtNTo6tvnnCoxJ71XyiWiXMU3LSI67ej6
 rTogxDMXOtU91VN2EMeZtA+jEMANolS5/fcn05VIIvdqN8mZfvJ/4YxPrG2AzawfC5M+
 Lcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736784682; x=1737389482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nln6xuSTTaoMOsjO/bzAdYR40fjFobKxVXqk79yIRg=;
 b=VxIFjKbRI9wb3iJiJMgdVRVKxfjq57LRH0xwjgcsbUSwrwuPxuCghReCYAfLV2xR6N
 w+8kzeBHBcb1+kpCzzTbA0dsNGXbcR6xzlficFgH2OLeHTCto4mw+pUoFpa2ljfJZd9s
 kmWrg0AF0UQ7K2wDQF7iz/dNlf/3rAajYVR4Zl5ZJkJJF1D/JgC34ElsyBRlsPtE8oaM
 aTCrgfjl3Z/fUBuiyeD/L6ruB7J8asXpnlz9qTfZtUkvkZkposLCrk5lnkAMVgC2y/U4
 rlns/RNtqxKC1ZL/zvsjM/89rqQkJo1GYU6iNVp2o9htU6CK3YU0ykq2PrI2+ZGKuIM3
 Gq3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOEUL+RHgXnNA+O65gwzaeGp4ziimoZzCFJbRw++Bo3C3I7TUmRf3x0wFRIqzYPb/HQpFciNmZOg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhkxWAb4MGTRM26fRAFpv/E1NpAefcwzKSzruB2l7I8HKChXDb
 enOdmdMSYjr+cMJg+7hiW1EvpGqwLAEkTzTuSvx+NwPGy9kka59r/VKX+0rm1vFIKe7GSnTL+Lq
 lWC2dWI/ylrLjFSmUxwH/yY1hm7fftu2T2zzL
X-Gm-Gg: ASbGncu9/PTRFqfWWvxNqRnZSE9K6QZoE9acRrNQRQF6jjGenkubY5oTpMPLsqxUHUz
 l6+GLxAXTNXjL+n4O8mLrPgSUD1AJao4ur9g=
X-Google-Smtp-Source: AGHT+IEZHimf0erqHl9P9hdsVm///MN8stQzn+Oj7UFKcLM1rFbaFHquGnXMlUQnxJqTuDGwgck+ox3NI5bhvjgf1ZE=
X-Received: by 2002:ad4:5ca5:0:b0:6d4:25c4:e77d with SMTP id
 6a1803df08f44-6df9b2ddad5mr358474696d6.34.1736784681463; Mon, 13 Jan 2025
 08:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-4-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250113093453.1932083-4-kirill.shutemov@linux.intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 13 Jan 2025 08:10:45 -0800
X-Gm-Features: AbW1kvYVFjw-APVc_AtsFocTeHs3A7WI3FQm934n3hdXUG8p6Ploc_paz3DXv-A
Message-ID: <CAJD7tkYfh=K1FV2NPFD5P0+Td66PtoMRHAkAcwUJcRwYDKLZjQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] mm/zswap: Use PG_dropbehind instead of PG_reclaim
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
> zswap_writeback_entry().
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yosry Ahmed <yosryahmed@google.com>

> ---
>  mm/zswap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 167ae641379f..c20bad0b0978 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1096,8 +1096,8 @@ static int zswap_writeback_entry(struct zswap_entry=
 *entry,
>         /* folio is up to date */
>         folio_mark_uptodate(folio);
>
> -       /* move it to the tail of the inactive list after end_writeback *=
/
> -       folio_set_reclaim(folio);
> +       /* free the folio after writeback */
> +       folio_set_dropbehind(folio);
>
>         /* start writeback */
>         __swap_writepage(folio, &wbc);
> --
> 2.45.2
>
