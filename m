Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D5C76DCC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 02:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A5510E039;
	Fri, 21 Nov 2025 01:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="npx3mUrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D552410E039
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 01:24:30 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b22b1d3e7fso144757685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763688270; x=1764293070; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S501oRNPXFaui6LNQdJlEz7mEWZdKyDXXyx7cM9Nvjo=;
 b=npx3mUrhkuAmoahE51NDxmgJIYLrSVQY+4z03yrC0cU27zkZnqWsilR/1PF17v98Hc
 JmYfGgU9vkQPiHQrf7i1nHaRP4sSY7aoCNR+NksG5mX4PV394yedsIDZmDxovVJzwABs
 jOM0HoWbzYNQXQ++ljT08UafuxNkTyURqz/0qNNSNvQA/P0zumaO25HeKd2IERR2+YCc
 EGYB6LcLdVRq0opaPH6Jn4e+DljjJZWrwBjEQXh+enjnpfVT0CJQOjhvEHnBvK80MEDv
 Wwb1saqbp8mhF6Qz7WltWTsAT1iZ1jhV79UBf2dJCVSStuIDN1+DnTF6GAlpCZiQedbj
 cbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763688270; x=1764293070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S501oRNPXFaui6LNQdJlEz7mEWZdKyDXXyx7cM9Nvjo=;
 b=eOBcg/qYxg7skMHbkNlZF219R/NO0Mz+edNdiFdlLbhowXUnyiYTCvGAuyCmvJRBpc
 Xagf97TrVQcYL2B+Bg8avHY8Oa+FWpDxUsIz3z/ehiX/WW8lAm2dFzTZeFYyDmt9zhNx
 VSMzEWjrJYK3Q3euJVHelUy9FhhxNYrULQubAB6iEo/MBLY+sNlbck52JZwA3KqJ+PS2
 wK0+dpJ1vMnilRZ2zUVMzoNnDsubOFUiON57NrGscBQw6As1c0+ja892iB1maKanZsvB
 OaCmFuGDhusFvD9rXCIxQpHyA6F0vM09yaR4OsURkpE/7L54RJA4icH6XcjW5nx5E22N
 uABA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO8h215WzlAmBHjnGh4SepTBsus0Hd0yQql0E/9pK8xQeDKt0bSnIxsdXYBukPPQ4gZ/eXgggZp1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYrJ4sg6TBIfNGreDQmKHK7Ye67X6jP/KczSOUUfNEap83u4wy
 tYa8XL3TKv0oVncaiRSVOmLZQ/nZMrwOLwabBqM/T3zU+OWY4JP33hCgEvV/zyhuvwDcdhWh2M/
 FriR8N1cskxSKSKS6yTj6TLSrrec/paU=
X-Gm-Gg: ASbGnctITvexOsSrIX4VkjIKrdaoGZVWrNZ+rgfDGYp6Za5C28n1VTntC8tGRmMDD0g
 GMpUNPs9titlUBKoZs0blXdepO+FNM0ljx0B2jqxQmt41wbKA71xuSF2VfWprcibtNIjT4+D+v0
 6NT77Ga8bptIAPwkMmTAIRtew+XdEGjTPuN0APteLlpWnh53sIbd7x4jo7c3j1mhIrr6km0OR20
 fKwJOSpeCU0/TBnZRkcPNaucdgX7OeTigJkaWMpGqXHK4f2uul+zakB8bvV/rfVx6r+rQ==
X-Google-Smtp-Source: AGHT+IELR0Y8MMC2IUY4VhJkvLWnV/PwywUiJ5X5L6wH3I6vLbKEaD3LENPCPlOKpe35gSnMK7AKTvy6xnB8ca8uJ8A=
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id
 af79cd13be357-8b33d468f92mr51138585a.40.1763688269620; Thu, 20 Nov 2025
 17:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20251021042022.47919-1-21cnbao@gmail.com>
In-Reply-To: <20251021042022.47919-1-21cnbao@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 21 Nov 2025 09:24:18 +0800
X-Gm-Features: AWmQ_bm-P1ruFcb-9PJ4wRhOHg5o1AnRHk24v2ra0lTOp-J1klyFcrWEtn5PclI
Message-ID: <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, 
 tjmercier@google.com, v-songbaohua@oppo.com, zhengtangquan@oppo.com, 
 marcin.slusarz@arm.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Sumit,

>
> Using the micro-benchmark below, we see that mmap becomes
> 3.5X faster:


Marcin pointed out to me off-tree that it is actually 35x faster,
not 3.5x faster. Sorry for my poor math. I assume you can fix this
when merging it?

>
> W/ patch:
>
> ~ # ./a.out
> mmap 512MB took 200266.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 198151.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 197069.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 196781.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 198102.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 195552.000 us, verify OK
>
> W/o patch:
>
> ~ # ./a.out
> mmap 512MB took 6987470.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6970739.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6984383.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6971311.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6991680.000 us, verify OK


Thanks
Barry
