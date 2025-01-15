Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D6A12CE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 21:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202B210E7DC;
	Wed, 15 Jan 2025 20:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="L3LspjsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764C010E51F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 20:43:48 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-85bad9e0214so72034241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736973827; x=1737578627;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmN+bSaJrXFtcRNihUwnk0h3safybjPC3LRXiDGWxb8=;
 b=L3LspjsHvUQDJ/VfWO9WcRMsap1kQULNHmuVNS/C6GoWKPRI3t84TPbJwyS06SKFCL
 0WmmFSsM+4YevNY+mUTx54AU8zNmcWDlbuD4ucGApW8/ApLsPrUjsr5YS0fVNfTKwZ34
 a5pA9l3N9X01RsnIuK69kfXG3Q6Z768FxNI3az5+WZOwDFBCAy/1xHxof85n3tZdqP7C
 8FqkoMXb/CVq9Dy8Ifil+iH2cXiOlpzmB5lysYeLsmbcDtvblLLSTbqFTpMArc13RHeT
 sN3+Wak5VdDa7gQAj0VUubd1+4FLwyvwECWyAity4XV9WH5mjg8zl/npkLvGB2KzvMku
 aGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736973827; x=1737578627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmN+bSaJrXFtcRNihUwnk0h3safybjPC3LRXiDGWxb8=;
 b=WwOAnwaSDWzMFGQtiPwKRUp3caBzNgweufDwuZ/LGl3i37rVXs9oX8K5lhFq5b83k6
 TMcDup2/WFizLeY/VFZe0ggAtRZuJ4LLVNryBRInhz0y6SxKfdm6nIUKVqP5mSeD6EOZ
 X9iOZA41XOzqegOgK+FLEYnX9FMDxda0hXmTkBuDCJEsHZti91gv3mcY+ty5dF62e07s
 4O04l8Vn9NKIBpK3GLH5eGbkUpZV4ldlPvHoifX4iwgshoIbShzL7BQl/OC6kOMu0G4d
 V2dypXzm9hqvZisu3yfAtfg67WlwssZV6SRqdMCS3Eh2LIu8xUlHz5+OpcF9ZeP43wdw
 vamQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJtWXfc3vvCCpNeCUh8AKGI7g1FwkQYSKyYvhheksOQnteQYOT79rgw6kcJN1vT/msdLOp16lDGFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOajPzfK7uVEa2ThifvsThjfeke07O4lhsOEzGYaVKqIq07dNq
 +23imNjpTS1N5ZImQeh7gk66RugzaGe7tYMwxKe7WSgxXUAQAUsYrYxp1zjnKQ+Addf62BbY9P1
 g05F6iSDRWTj1ahoIBIqWECU41gKAYXdOeD2s
X-Gm-Gg: ASbGncvXyEZc8iJ0wueN4r5cVHc4gVOTX75IdizJseye5LvZ526zB2Q7DM22u2xOqwL
 pN4PleGAu3GNDvW+LMWJl5PyiTQrao3vlkzGLzRkg1nsCSzOtWoMKUfVoPgBuPUjAAZG6
X-Google-Smtp-Source: AGHT+IGi0hs5f6CvB2IN226MXTm0Ra44UaWAgyGn2Hb2ZqR78sF/nuVzUSwuhQqEnx/3viOFB5AlpGvLLyrmeG3geiE=
X-Received: by 2002:a05:6102:26c7:b0:4b1:1a24:e19c with SMTP id
 ada2fe7eead31-4b3d0d9f91emr28490986137.7.1736973827247; Wed, 15 Jan 2025
 12:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 15 Jan 2025 13:43:10 -0700
X-Gm-Features: AbW1kvZhKsd-4bholfmYoUBqn5JymeZ06XAaCDHVg7uCmb3oxbCKX29QDQ6N-Rk
Message-ID: <CAOUHufa1vRhiwCNvVa+ztcrFix9keAgbV0E7BxFN9VKAZ+7Z5A@mail.gmail.com>
Subject: Re: [PATCHv2 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()
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

On Wed, Jan 15, 2025 at 2:32=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> The recently introduced PG_dropbehind allows for freeing folios
> immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> to be involved to get the folio freed.
>
> The new flag allows to replace whole deactivate_file_folio() machinery
> with simple folio_set_dropbehind().
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
