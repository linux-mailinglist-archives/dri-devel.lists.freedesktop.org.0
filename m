Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789255E9781
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 02:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4911D10E4AB;
	Mon, 26 Sep 2022 00:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955A10E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 00:38:50 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 129so3745740pgc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 17:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ZsMZDiPJ05dqPEjOyzQRRCQyAniieUtquk7D7/uc9oo=;
 b=EloZHChUwOJ+IAK+dqPRjhd24FYS6MkmFqZpedddEJP3NPIP54FWcwg3RKRz6Ai8pZ
 z2DviABmbm5Ne8x7+vcrgYA1N3bmoOgjdNpOgYz+yaXmcZ9y56Pdoen1P+xANPX4dHu4
 HiKqS9DzqPcFKjopFBXMCDEaM898Bv94O7hJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ZsMZDiPJ05dqPEjOyzQRRCQyAniieUtquk7D7/uc9oo=;
 b=G/p9RmvYoKlT+MRlfv0802fuxTuz4ArHNNb5ZHfyjAlTu6n1YHMpWJ0eQ2/N/u1iQO
 8qAn2WBC28YcNlErwKbpyGZAU+ZjG/121nY4Gf+6u/cMEtJQ/siznDW/iedbMeLanS/O
 2ljcadxz8C0vN1JY6mi3P6bHtwaG9P8jJfal6NgV/oYLNz0PQvdt3hrTdsG6u2aMBmGJ
 KykxcLE48nQi1TeXGyqG0p1/KTG8Q9w+ZYqV1wDFR8K69PBCB69/KwnU08TPpQnTwJHn
 vCD7k1HiAaKnr8PJGyOEw4432cJFCE8EraeaZC3AAwdVkmBwF1RYXUC2Ilxx70Fw1SVE
 +S2g==
X-Gm-Message-State: ACrzQf1yPwPQfojMLaQwjvn1DDnUynhj4BW/awULE73H6GCTeTTBkxWo
 BxnAGhJMQPewtbTVB+nXjWsc5w==
X-Google-Smtp-Source: AMsMyM7j48vn8CX614C8f5vlUd1g6FcIEIYyyHHTpwyTo0bx6Hew8gRK92T2JHXk4G8JNUKlDJxOQQ==
X-Received: by 2002:a63:4b1d:0:b0:439:e6a4:e902 with SMTP id
 y29-20020a634b1d000000b00439e6a4e902mr18048148pga.212.1664152730415; 
 Sun, 25 Sep 2022 17:38:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a17090340cb00b00172951ddb12sm9640855pld.42.2022.09.25.17.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 17:38:49 -0700 (PDT)
Date: Sun, 25 Sep 2022 17:38:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v2 14/16] kasan: Remove ksize()-related tests
Message-ID: <202209251738.6A453BC008@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-15-keescook@chromium.org>
 <CACT4Y+bg=j9VdteQwrJTNFF_t4EE5uDTMLj07+uMJ9-NcooXGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+bg=j9VdteQwrJTNFF_t4EE5uDTMLj07+uMJ9-NcooXGQ@mail.gmail.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, kasan-dev@googlegroups.com,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Andrey Konovalov <andreyknvl@gmail.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 24, 2022 at 10:15:18AM +0200, Dmitry Vyukov wrote:
> On Fri, 23 Sept 2022 at 22:28, Kees Cook <keescook@chromium.org> wrote:
> >
> > In preparation for no longer unpoisoning in ksize(), remove the behavioral
> > self-tests for ksize().
> >
> > [...]
> > -/* Check that ksize() makes the whole object accessible. */
> > -static void ksize_unpoisons_memory(struct kunit *test)
> > -{
> > -       char *ptr;
> > -       size_t size = 123, real_size;
> > -
> > -       ptr = kmalloc(size, GFP_KERNEL);
> > -       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
> > -       real_size = ksize(ptr);
> > -
> > -       OPTIMIZER_HIDE_VAR(ptr);
> > -
> > -       /* This access shouldn't trigger a KASAN report. */
>  > -       ptr[size] = 'x';
> 
> I would rather keep the tests and update to the new behavior. We had
> bugs in ksize, we need test coverage.
> I assume ptr[size] access must now produce an error even after ksize.

Good point on all these! I'll respin.

-- 
Kees Cook
