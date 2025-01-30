Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE5A23523
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 21:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1CB10E9C8;
	Thu, 30 Jan 2025 20:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="diTvSajR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B8C10E19E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 20:37:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so180998266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738269453; x=1738874253;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xT8Ut8gLz6JZTplLJnZjKEdD7Di9InMwjf2e/4aq99k=;
 b=diTvSajRNMexAoOrzFThwOjio09Pb1WOSqSxaI7WZ5MuXlUUhpLvkoMjc5/3oTpyUW
 VmsknnqJdTJXkE5Z3fuw/Dg8FnfK42eqnjSpZoQaBkuGHtuOpb1ylM6NkBEGPwm5TXGn
 KqUMf4mPCQfkBaJ3oq7P7a331NM3OGwyqhw20gukt6yE5dFiAqWFVlkDz9t9bDu8MHkA
 eQvr9Y+IE3Aq6xeMKQC1AzC4fnmra20wM9KrY6efWNS8vFJFccv0SAkJzjMqQhbDqdqC
 9vYkRet21tlsCFFhat6AtLpag5uaLLdmwEtJy98sGZ4YK6Hfv1pBDuuizGYd/w0i5pHZ
 y1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738269453; x=1738874253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xT8Ut8gLz6JZTplLJnZjKEdD7Di9InMwjf2e/4aq99k=;
 b=nKthLSS+mJutQTyPeo9sctIJSAjGcApSXtJcyAQfXYRq97nes5uu+H/1Mb8CEUF5xb
 fbtYNURSo2AQZPMRZlSud/5DgatTBCLVvORqkzaSW+zfN8y516JjFmSjh5mAWptfHqDJ
 plolssw0gCIRgEQtkIOkmtfSdnHftGtnD7aho+8p6APH3vkptQH0ZRx1fJik+t9nYSqu
 AijbisZnoPZD9jwWI+ZVLCNTn/+vfop59rN1DxDg9ZgW9lOaeDeffoTZMbZ47zb1vD+e
 rDdtypLk5bzRBJZN7rwJ9SZOJlLPtws4wnRGNmaVQ0PT2yjENrbnL3IZtaUY+HoIPOks
 PKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpt3nVMDZwMXhUIG7sYTBxnddIqAeyDK1svUWPieGSkhn2owMNMc9gtP+gdWemvKnkcaCKHDskKyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdIvBPD5FEp6UMNHlEixzw6ESYlh2Bbwc0YnLeyI38b6DlaaTH
 RtJCB1UFQp1w/wd8xjYoRXhP/eYzHplBJVj8gTmpXdrMxGu7QyrYp1+EjunGOD/aSIPfPu08dmh
 DXAxBobNyvobaUdlo9ff/V+MUNRujuNpwHBq2
X-Gm-Gg: ASbGncuCKrY5zanKgtWmKBKm3hco/fECJFmd60cYR83DY46DWbgpAGH52qfHwCo8zcL
 ixJXe0wg/JgSaUHRP9Ik7jy+IptAUiEnkP5qzlNia8fHH3wGlAEebx9TAKATM/6JHyy7UOemruG
 5UnuGgDSJR9q3dtFxXGG4oq6NfdDkTXw==
X-Google-Smtp-Source: AGHT+IHgOIJu66b5+FkCjUTqLe+kFJ5pnzkiI2EWbnmTxxfuYeBlU3TGfepPLf9b4v1IsOlZVSVianh0S1Lnh6AsAs4=
X-Received: by 2002:a05:6402:4311:b0:5db:f5e9:6760 with SMTP id
 4fb4d7f45d1cf-5dc5efa8bcdmr18615952a12.2.1738269453403; Thu, 30 Jan 2025
 12:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-2-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250130100050.1868208-2-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 30 Jan 2025 13:36:57 -0700
X-Gm-Features: AWEUYZk-T3PmFiMQXizTQSxtfw262HuFGqWt0YvgioLZEIzF4uEgK1GJyl43NpI
Message-ID: <CAOUHufaap0fbU5LGhvm66Dh7jiBjsJiKPmLjVje=BkoB3C8ToQ@mail.gmail.com>
Subject: Re: [PATCHv3 01/11] mm/migrate: Transfer PG_dropbehind to the new
 folio
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

On Thu, Jan 30, 2025 at 3:01=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> Do not lose the flag on page migration.
>
> Ideally, these folios should be freed instead of migration. But it
> requires to find right spot do this and proper testing.
>
> Transfer the flag for now.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
