Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7123B9F20
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6716E0D6;
	Fri,  2 Jul 2021 10:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB4A6E0D6;
 Fri,  2 Jul 2021 10:33:13 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id x6so4426490qvx.4;
 Fri, 02 Jul 2021 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Af+XF+noTcBUucdI0NOhYSvyfqBvxV6C/Ny46DpwAr0=;
 b=eykoskR01P5e6BiAROOvIb8VakWln3P1l+t8PR8XowsyvVyi+6O6kHRCSK2B8PAYy2
 waOahbW18Br5rYSt8F379gdgD/flCnLVl7bpJ2MpP+2pZewiQ4ybp2+ckAT63cijJgy2
 y5eBQz9O3yZ52wiqxANVsDFg6VVyL9RGGleOo33KjdM+AN9AceMBYC+s/nC5QuweO1uY
 7JIxhWZKUR9CyKgOTE7VoU//koBwcCA0WyOKfstjsUNLVsTILhVNB8EHbTEiP2lgY3yC
 CJvidypqD1/95NQJnIrLDUyKDum33gL5htpoHe1WPaKSiu/OJfg8ja/b0ypKssEyg8OZ
 oSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Af+XF+noTcBUucdI0NOhYSvyfqBvxV6C/Ny46DpwAr0=;
 b=hGIJGqkIPR+o9G6jT+97lNSHG5SVyc8a2ukyelZTDtMM9I2bY6PZnLH5yvPKAxPYkE
 5/eYnwqe2DDPoGCi3dxeKGhEG6/JufeAMBYi+VrEH8u9SbRFGaxuxWYT73t+6zYsHx2h
 rV7xhBoODy8xVWzjnxD+XUfqH0mVT6x8FUhcqQNcsgCZPyqsAhLndwfKIP9MqzO4+tiD
 z7MuYLH2K0iIxmNm2WU6ErCF2MOygkhc9BinL6+hRVbEK8Wvx/zw11ZHdZNmnOiAWwPG
 1w3EMyAYOKfaKWaJ+pKmhQsT0YJdIvl6Un6Ya32F8pkNBD92Tv4JtGwuZ72LY6pkkHtQ
 puMw==
X-Gm-Message-State: AOAM533wMnk3JTaw7NHGgI2lRmVSH11tYOFToFwGzrOIySPZOYaVUtk3
 KJlVKCyFqpc1+vYf0CR9zFNLFJw6o2mYUUpF/b4=
X-Google-Smtp-Source: ABdhPJwsQREYk9X6FAXUDeQ8Kip98QW1pu+OP0QytZaQRnRG/eaulyyNbuYAWvakO146cLjm9L2khA137kKJD3+ti7A=
X-Received: by 2002:ad4:4666:: with SMTP id z6mr4463912qvv.60.1625221992447;
 Fri, 02 Jul 2021 03:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <202107020708.XXwacDfG-lkp@intel.com>
In-Reply-To: <202107020708.XXwacDfG-lkp@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 2 Jul 2021 11:32:45 +0100
Message-ID: <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14]
 drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized
 symbol 'rq'.
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, kbuild@lists.01.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
> head:   5cd57f676bb946a00275408f0dd0d75dbc466d25
> commit: cf586021642d8017cde111b7dd1ba86224e9da51 [8/14] drm/i915/gt: Pipelined page migration
> config: x86_64-randconfig-m001-20210630 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
> drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized symbol 'vaddr'.
>
> Old smatch warnings:
> drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 171)
>
> vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c
>
> cf586021642d80 Chris Wilson 2021-06-17   32  static int copy(struct intel_migrate *migrate,
> cf586021642d80 Chris Wilson 2021-06-17   33             int (*fn)(struct intel_migrate *migrate,
> cf586021642d80 Chris Wilson 2021-06-17   34                       struct i915_gem_ww_ctx *ww,
> cf586021642d80 Chris Wilson 2021-06-17   35                       struct drm_i915_gem_object *src,
> cf586021642d80 Chris Wilson 2021-06-17   36                       struct drm_i915_gem_object *dst,
> cf586021642d80 Chris Wilson 2021-06-17   37                       struct i915_request **out),
> cf586021642d80 Chris Wilson 2021-06-17   38             u32 sz, struct rnd_state *prng)
> cf586021642d80 Chris Wilson 2021-06-17   39  {
> cf586021642d80 Chris Wilson 2021-06-17   40     struct drm_i915_private *i915 = migrate->context->engine->i915;
> cf586021642d80 Chris Wilson 2021-06-17   41     struct drm_i915_gem_object *src, *dst;
> cf586021642d80 Chris Wilson 2021-06-17   42     struct i915_request *rq;
> cf586021642d80 Chris Wilson 2021-06-17   43     struct i915_gem_ww_ctx ww;
> cf586021642d80 Chris Wilson 2021-06-17   44     u32 *vaddr;
> cf586021642d80 Chris Wilson 2021-06-17   45     int err = 0;
>
> One way to silence these warnings would be to initialize err = -EINVAL.
> Then Smatch would know that we goto err_out for an empty list.
>
> cf586021642d80 Chris Wilson 2021-06-17   46     int i;
> cf586021642d80 Chris Wilson 2021-06-17   47
> cf586021642d80 Chris Wilson 2021-06-17   48     src = create_lmem_or_internal(i915, sz);
> cf586021642d80 Chris Wilson 2021-06-17   49     if (IS_ERR(src))
> cf586021642d80 Chris Wilson 2021-06-17   50             return 0;
> cf586021642d80 Chris Wilson 2021-06-17   51
> cf586021642d80 Chris Wilson 2021-06-17   52     dst = i915_gem_object_create_internal(i915, sz);
> cf586021642d80 Chris Wilson 2021-06-17   53     if (IS_ERR(dst))
> cf586021642d80 Chris Wilson 2021-06-17   54             goto err_free_src;
> cf586021642d80 Chris Wilson 2021-06-17   55
> cf586021642d80 Chris Wilson 2021-06-17   56     for_i915_gem_ww(&ww, err, true) {
> cf586021642d80 Chris Wilson 2021-06-17   57             err = i915_gem_object_lock(src, &ww);
> cf586021642d80 Chris Wilson 2021-06-17   58             if (err)
> cf586021642d80 Chris Wilson 2021-06-17   59                     continue;
> cf586021642d80 Chris Wilson 2021-06-17   60
> cf586021642d80 Chris Wilson 2021-06-17   61             err = i915_gem_object_lock(dst, &ww);
> cf586021642d80 Chris Wilson 2021-06-17   62             if (err)
> cf586021642d80 Chris Wilson 2021-06-17   63                     continue;
> cf586021642d80 Chris Wilson 2021-06-17   64
> cf586021642d80 Chris Wilson 2021-06-17   65             vaddr = i915_gem_object_pin_map(src, I915_MAP_WC);
> cf586021642d80 Chris Wilson 2021-06-17   66             if (IS_ERR(vaddr)) {
> cf586021642d80 Chris Wilson 2021-06-17   67                     err = PTR_ERR(vaddr);
> cf586021642d80 Chris Wilson 2021-06-17   68                     continue;
> cf586021642d80 Chris Wilson 2021-06-17   69             }
> cf586021642d80 Chris Wilson 2021-06-17   70
> cf586021642d80 Chris Wilson 2021-06-17   71             for (i = 0; i < sz / sizeof(u32); i++)
> cf586021642d80 Chris Wilson 2021-06-17   72                     vaddr[i] = i;
> cf586021642d80 Chris Wilson 2021-06-17   73             i915_gem_object_flush_map(src);
> cf586021642d80 Chris Wilson 2021-06-17   74
> cf586021642d80 Chris Wilson 2021-06-17   75             vaddr = i915_gem_object_pin_map(dst, I915_MAP_WC);
> cf586021642d80 Chris Wilson 2021-06-17   76             if (IS_ERR(vaddr)) {
> cf586021642d80 Chris Wilson 2021-06-17   77                     err = PTR_ERR(vaddr);
> cf586021642d80 Chris Wilson 2021-06-17   78                     goto unpin_src;
> cf586021642d80 Chris Wilson 2021-06-17   79             }
> cf586021642d80 Chris Wilson 2021-06-17   80
> cf586021642d80 Chris Wilson 2021-06-17   81             for (i = 0; i < sz / sizeof(u32); i++)
> cf586021642d80 Chris Wilson 2021-06-17   82                     vaddr[i] = ~i;
> cf586021642d80 Chris Wilson 2021-06-17   83             i915_gem_object_flush_map(dst);
> cf586021642d80 Chris Wilson 2021-06-17   84
> cf586021642d80 Chris Wilson 2021-06-17   85             err = fn(migrate, &ww, src, dst, &rq);
> cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> cf586021642d80 Chris Wilson 2021-06-17   87                     continue;
>
> Does fn() initialize "rq" on the success path?  Anyway Smatch would
> complain anyway because it thinks the list could be empty or that we
> might hit and early continue for everything.

The fn() will always first initialize the rq to NULL. If it returns
success then rq will always be a valid rq. If it returns an err then
the rq might be NULL, or a valid rq depending on how far the copy/fn
got.

And for_i915_gem_ww() will always run at least once, since ww->loop =
true, so this looks like a false positive?

>
> cf586021642d80 Chris Wilson 2021-06-17   88
> cf586021642d80 Chris Wilson 2021-06-17   89             if (err != -EDEADLK && err != -EINTR && err != -ERESTARTSYS)
> cf586021642d80 Chris Wilson 2021-06-17   90                     pr_err("%ps failed, size: %u\n", fn, sz);
> cf586021642d80 Chris Wilson 2021-06-17   91             if (rq) {
> cf586021642d80 Chris Wilson 2021-06-17   92                     i915_request_wait(rq, 0, HZ);
> cf586021642d80 Chris Wilson 2021-06-17   93                     i915_request_put(rq);
> cf586021642d80 Chris Wilson 2021-06-17   94             }
> cf586021642d80 Chris Wilson 2021-06-17   95             i915_gem_object_unpin_map(dst);
> cf586021642d80 Chris Wilson 2021-06-17   96  unpin_src:
> cf586021642d80 Chris Wilson 2021-06-17   97             i915_gem_object_unpin_map(src);
> cf586021642d80 Chris Wilson 2021-06-17   98     }
> cf586021642d80 Chris Wilson 2021-06-17   99     if (err)
> cf586021642d80 Chris Wilson 2021-06-17  100             goto err_out;
> cf586021642d80 Chris Wilson 2021-06-17  101
> cf586021642d80 Chris Wilson 2021-06-17 @102     if (rq) {
> cf586021642d80 Chris Wilson 2021-06-17  103             if (i915_request_wait(rq, 0, HZ) < 0) {
> cf586021642d80 Chris Wilson 2021-06-17  104                     pr_err("%ps timed out, size: %u\n", fn, sz);
> cf586021642d80 Chris Wilson 2021-06-17  105                     err = -ETIME;
> cf586021642d80 Chris Wilson 2021-06-17  106             }
> cf586021642d80 Chris Wilson 2021-06-17  107             i915_request_put(rq);
> cf586021642d80 Chris Wilson 2021-06-17  108     }
> cf586021642d80 Chris Wilson 2021-06-17  109
> cf586021642d80 Chris Wilson 2021-06-17  110     for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
> cf586021642d80 Chris Wilson 2021-06-17  111             int x = i * 1024 + i915_prandom_u32_max_state(1024, prng);
> cf586021642d80 Chris Wilson 2021-06-17  112
> cf586021642d80 Chris Wilson 2021-06-17 @113             if (vaddr[x] != x) {
> cf586021642d80 Chris Wilson 2021-06-17  114                     pr_err("%ps failed, size: %u, offset: %zu\n",
> cf586021642d80 Chris Wilson 2021-06-17  115                            fn, sz, x * sizeof(u32));
> cf586021642d80 Chris Wilson 2021-06-17  116                     igt_hexdump(vaddr + i * 1024, 4096);
> cf586021642d80 Chris Wilson 2021-06-17  117                     err = -EINVAL;
> cf586021642d80 Chris Wilson 2021-06-17  118             }
> cf586021642d80 Chris Wilson 2021-06-17  119     }
> cf586021642d80 Chris Wilson 2021-06-17  120
> cf586021642d80 Chris Wilson 2021-06-17  121     i915_gem_object_unpin_map(dst);
> cf586021642d80 Chris Wilson 2021-06-17  122     i915_gem_object_unpin_map(src);
> cf586021642d80 Chris Wilson 2021-06-17  123
> cf586021642d80 Chris Wilson 2021-06-17  124  err_out:
> cf586021642d80 Chris Wilson 2021-06-17  125     i915_gem_object_put(dst);
> cf586021642d80 Chris Wilson 2021-06-17  126  err_free_src:
> cf586021642d80 Chris Wilson 2021-06-17  127     i915_gem_object_put(src);
> cf586021642d80 Chris Wilson 2021-06-17  128
> cf586021642d80 Chris Wilson 2021-06-17  129     return err;
> cf586021642d80 Chris Wilson 2021-06-17  130  }
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
