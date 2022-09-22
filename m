Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D65E5E70
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207810E3E4;
	Thu, 22 Sep 2022 09:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EFC10E3E4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 09:23:58 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id c4so7207326iof.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=eq1ulTtXYhBmIV3Hec+MzaFRLDXw1vSRF6+bOMmPhJ4=;
 b=bE2W6qfxPeZ5hG8th9HBte8uWTQjYuCcr36yI1hhiheOM64/zofTi1amyoUC/YRb+J
 NgesQGAjTL00GMSehk4Np33KVgoKvpm/Mh3RSzMdF+EkL5Y4k9K6GB3q17DXyKsUm/6E
 tSUleWEaIUryrEiqLEE56d9SYCS/YFMrs6gU37f7Pqu7tr26K2zmBNy6tAGoGVxQ5f+n
 DlMD1/oSQBrQp/QHyG7CgFktY+50H+Wm33tTFaH8FxMf0iDQdWTe9OU6Ok7FDH/xYrVm
 +Y17qm2jbLBl43Ckz4h9g/NlAB7oNcZMDPJUHArvKPR8Jrr0Y7Jjk4kBCdA2lo60DN3B
 Aphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=eq1ulTtXYhBmIV3Hec+MzaFRLDXw1vSRF6+bOMmPhJ4=;
 b=0lqtryE0uRcMYayyBKzcWFqKRIKYAtvHuxOYX3zTEQT01PwwH207Shdy0ZOHBK8RNQ
 YUbhu7wBRLUsUYufAcAB9mYzsAJfJmot2/irgsQTuFk/DlXpEtgMUpZNL+tPPhw0CHoZ
 +OHarZeDznSeBtubeiZ7fFSGxTGydWseo2i90Ce4lPbHLW+fs5nmESTWaIP/R1umkdEz
 m+gjSc/otzNzhW/5XuLnoXQJZljKhMhKx7xqXVKhADsluq3jlEw4lKb8UuaEUm6imh6Q
 up513xisVFx8mglp5P51//TE1OSemIGNEdpWyeIayqbkfKw5BY7m61sZMdTU4sUS+9gB
 nwuQ==
X-Gm-Message-State: ACrzQf3adqR8PL5F6JjxtlWlv73M5ZjfSw9qodgqhQ8vmjlNqv0u8P4i
 HeOzAJ6wqbmD/GItLSxl4eZ7wr+DJgD8vljvjBM=
X-Google-Smtp-Source: AMsMyM4VmAwcaT5Lc+Ww++2Y7GpjHXOf8JO1cC9hLR1vHps4lN+vAXggqFNSedolxw1DncuzKFlDGIHvcmXTBzRY/kM=
X-Received: by 2002:a05:6638:dcc:b0:35a:7ba6:ad51 with SMTP id
 m12-20020a0566380dcc00b0035a7ba6ad51mr1404409jaj.256.1663838637536; Thu, 22
 Sep 2022 02:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-12-keescook@chromium.org>
In-Reply-To: <20220922031013.2150682-12-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Sep 2022 11:23:46 +0200
Message-ID: <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
Subject: Re: [PATCH 11/12] slab: Remove __malloc attribute from realloc
 functions
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Hao Luo <haoluo@google.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 5:10 AM Kees Cook <keescook@chromium.org> wrote:
>
> -#ifdef __alloc_size__
> -# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __malloc
> -#else
> -# define __alloc_size(x, ...)  __malloc
> -#endif
> +#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __malloc
> +#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)

These look unconditional now, so we could move it to
`compiler_attributes.h` in a later patch (or an independent series).

Cheers,
Miguel
