Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80706A12D03
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 21:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C096A10E7E1;
	Wed, 15 Jan 2025 20:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="x73qBOuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165F10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 20:53:13 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4afe7429d37so25644137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736974393; x=1737579193;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdXo8lbXht5SZgkZQ04ipp/CMqgcMbj1MEn0xWqPJMs=;
 b=x73qBOuGeVGv/j/KEnrGoRf6nwkWpeSQUTrjRhBf6aVfUCBaplPqtCCcOZAx4JRE4v
 1d9WHbVS0Ibqyv1cklKbbfSxCyWuyp2ai46kwJLxTyYgnbzoPFbqWWxIThrmByvj2bw0
 L+9FU70S+hAMDgMKiKp3KEDPFWLC8l4prDRweHck8d6OMK6wxKSFiGnqFpmpVTKLAKT2
 1IONzYK/lUd4U6XwYlOiJlIbjXhwDpVq9RgeL6iYAe0AtB1E4oqiP7PKf/mneImiBzy/
 7BygLnB/rYjMULq1EMjrGtbSyRaaWGp1CYK3NUSSuodvj1GT/Owx5eTG/LzXVHowtQ9+
 KTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736974393; x=1737579193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdXo8lbXht5SZgkZQ04ipp/CMqgcMbj1MEn0xWqPJMs=;
 b=T3fTBIW4HUQJhJyJaOx4XdjYzeeQ0jbUSOJyrX0BZ9/JcIgMizi+xa3sgH4Xu2Vx82
 FF4pCKrmnywMP9WQ/nO6wBVkeoYOM3G+OvAlkPlsqpafb2ItqKjsBHY2NQIsuI1Bu9Bl
 ybiwu02skJm1BAH80JMdADYSURxZ7PG9t6xBSXogArtRykZsE3bH5WliD6UW0O2+GXaw
 rn9wbtMxKN/ZFH9jJmD5Z+pACuFVlgrZa9XEgYBQAjHKzHi8eA4u1OxNlN9qiYCfzIx9
 +OifdIoCYGaPmtFhil403mRpts0XC347y4LuW0X+E4lL7Zjv8FCO9zTsN7CXdYtjF/qp
 akaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzEVWSu3/uL79EO2p6b+WGBRY9zv8bqZRR4FlVaB/LdmSitkCHLfmTX+Zkymu6IGFi9UNtSU2E2D8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAEgB+sKTv1ESGEaZEgFThP4h78MFQ2IQ14obXA2Mqnn4/KAUv
 u5wGkezv8GXWc9/Mb6wGxqFWTjxcKgZPAAmszZeQwaQN+0Wumvb3wqifnORyjoIw1t1OMq+i46Q
 uM+I5KDVSCScce8qudKv0eQFs9wraTlHlXRxy
X-Gm-Gg: ASbGncvUrK1ptWddEsrtzj8woNY1VrEEhvINGsywX5bpVQvyVFm6z5bOb+VVTKVIJzY
 PcFSiSLKldP+VqOmdWRfFwgXeX8MAa8Kyc81XC8j5GLXnELl8DhfOKzizCajs+EsRPKyg
X-Google-Smtp-Source: AGHT+IE7UsauDDLDB3PU6I85iW+57wTMyoC2RI6ZhjsNUrio1gBO9Rw8foY1mGOBbUURNkj3/A70Nc+YgN9e75p3kqQ=
X-Received: by 2002:a05:6102:ccb:b0:4b6:20a5:776 with SMTP id
 ada2fe7eead31-4b620a50949mr21061479137.17.1736974392789; Wed, 15 Jan 2025
 12:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-12-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250115093135.3288234-12-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 15 Jan 2025 13:52:36 -0700
X-Gm-Features: AbW1kvZLvuakft1NqA0r5gmvnmIH6WfLrEQ0-PFFagHKXbdONcPPwciIY5N5R1w
Message-ID: <CAOUHufa8FZY0tQ8Camv7mHN9tWPYLxcpjt5rFTDLg+NwYULOQQ@mail.gmail.com>
Subject: Re: [PATCHv2 11/11] mm: Rename PG_dropbehind to PG_reclaim
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
> Now as PG_reclaim is gone, its name can be reclaimed for better
> use :)
>
> Rename PG_dropbehind to PG_reclaim and rename all helpers around it.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
