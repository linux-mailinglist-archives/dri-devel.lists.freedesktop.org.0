Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F666BB30
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D210E0FF;
	Mon, 16 Jan 2023 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996810E0FF;
 Mon, 16 Jan 2023 10:06:04 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id o5so3223299qtr.11;
 Mon, 16 Jan 2023 02:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcfbiaOtd0rIUu3J0LzMQ7r+7EcuQP5IsDRStK58JTY=;
 b=MRFq8jog6K+m3QygukJB6P9m+c7DNGO5Dc0KhaQ0hqsOFPwfCfp1GA15TCZCr9Qng2
 2SwOvIJCWk9BRmmi3y7FLWSB//KapQ8rvOwKmh4WIXE5smEUnYIwNeUyG6uxPtg2PSLp
 5VmmLpynPG9EaRZRgi4B+OelwOPepQs2gvT8rBsZtSBZIBg3yw2RwelPGPg9SkxUJzts
 jpFzt/RkhWb4p7CaGKIsGwTp1BGIKNXoEGkQr4s5mz7vY3R2OvXiW3vrE41wzVbxQCg4
 Wp5Bdmna/PcU3tkmeQgXtz/1UDOPLZyjpDjz0a20d0Ob1uHcmhP0CtEu9l1xWr5/UAyG
 YITw==
X-Gm-Message-State: AFqh2kooV+4xlArH/dFQAd8K0cAhHpj0CdiJTNGCkwj6yk/xP7QjWQ17
 PmE2xYH/pt0p/KyRFBFUScZWslJRhjxMnA==
X-Google-Smtp-Source: AMrXdXt5Lf3AfHmY3lXvdrJM3vtCiJIJ6ksC78StyWcKRjh93tcA8NATIFaXb90z4+h8s3x3CawEcQ==
X-Received: by 2002:a05:622a:400e:b0:3ab:af8e:64e6 with SMTP id
 cf14-20020a05622a400e00b003abaf8e64e6mr80983152qtb.67.1673863563649; 
 Mon, 16 Jan 2023 02:06:03 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 d5-20020ac851c5000000b003afbf704c7csm8752472qtn.24.2023.01.16.02.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 02:06:03 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id v19so23781317ybv.1;
 Mon, 16 Jan 2023 02:06:03 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4703291yba.36.1673863245804; Mon, 16
 Jan 2023 02:00:45 -0800 (PST)
MIME-Version: 1.0
References: <Y7P9IcR7/jgYWMcq@osiris>
 <20230105095426.2163354-1-andrzej.hajda@intel.com>
In-Reply-To: <20230105095426.2163354-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 11:00:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Subject: Re: [PATCH v4] arch: rename all internal names __xchg to __arch_xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 10:54 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> v4: adjusted indentation (Heiko)

>  arch/m68k/include/asm/cmpxchg.h      |  6 +++---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
