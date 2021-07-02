Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C23B9FDC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18E06E131;
	Fri,  2 Jul 2021 11:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2AA6E131;
 Fri,  2 Jul 2021 11:35:01 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f6so9087066qka.0;
 Fri, 02 Jul 2021 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUnrlRFtMwTx8PyzXSlBjwhwzhk6QzcohvKozuFJ2lQ=;
 b=NXgX81+OuVZnhCG9yftG8GCiP5Nzsc4X64RjOLjlgXYtTx60z3NPih8cQuulxQFsbT
 qOxeG1aSGizEEq22Ql7kKWy5keXCrkau++zNa4wI6KTa3SGE6eIcI+r+c9slP1Xbl/1y
 agv4hxNUi1SdjFeeGbo0KqQdTPX6bvy1fzOjFwKlpNjHNL1ClqRioypKovwkQLeHD/LY
 ujBjpbK2CFwZ85hIwt2RHEn0zKCEa3F7GS24LF7bIBiu6Xrbo9FzRgBTcClcB4HcvdMM
 yMBcTHohu6psXZv5oPc9Jph+Xxzi8V7J4/QHYZ+r5YQ5BLDNFHO72V+d7zbaHbLyxVhx
 8vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUnrlRFtMwTx8PyzXSlBjwhwzhk6QzcohvKozuFJ2lQ=;
 b=H4PbHJn0+SXuT7AoOgk3tBC4aT9IzytJufoeBWgNKsvZs+bVnnjHEUa/MoCWdvZX97
 UTBRQIp4ZwOlrYOr5Cn+OjnB5pX5CU9CsWmvEK9fkGhWkvASSJFYE7xzLuLDIMZHPEHx
 Yq6mRlz1F7vgCj3shvQGtnfctbFNdEYgg6dqOhJeY/Jj9N5ilt1Je+KRs4jChEK6jA59
 bWz23hWfzzq4n8WsgeU9a4eiUO+vSo0j2Zig0MBe3azwCFcaZJaFsfc5aBnLh4eWGgzC
 l5WMsAHxTElm0uF/oAOUYDSUqrht0uKKhqzTlWtihvO+EkJ+ra37ml/NHjxQRELuKVdu
 je0Q==
X-Gm-Message-State: AOAM533l4Aw0CsandYOZsyliz9teAz40tw+4C7DiL2U44Up74j8wTokM
 xxPQBAmLTmmXiBHGuv+5YkJYbJblCMxHz1BGTlI=
X-Google-Smtp-Source: ABdhPJzTmhDKsu5FEM3Q+faNKVkTZBMhgEHRH6+KOLM6VR51Dfn8IHsnITb/AM/U/9bbqT83wBzyb8lEQU70pUqX9M4=
X-Received: by 2002:a37:4388:: with SMTP id q130mr4847896qka.460.1625225700565; 
 Fri, 02 Jul 2021 04:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <202107020708.XXwacDfG-lkp@intel.com>
 <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
 <20210702110727.GT1983@kadam>
In-Reply-To: <20210702110727.GT1983@kadam>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 2 Jul 2021 12:34:33 +0100
Message-ID: <CAM0jSHMyXEdS9wgkypKdvW1BNdUgcLxZR8Pd8nxSpPQHtiX+yA@mail.gmail.com>
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

On Fri, 2 Jul 2021 at 12:07, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 02, 2021 at 11:32:45AM +0100, Matthew Auld wrote:
> > On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
> > > head:   5cd57f676bb946a00275408f0dd0d75dbc466d25
> > > commit: cf586021642d8017cde111b7dd1ba86224e9da51 [8/14] drm/i915/gt: Pipelined page migration
> > > config: x86_64-randconfig-m001-20210630 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > New smatch warnings:
> > > drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
> > > drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized symbol 'vaddr'.
> > >
> > > Old smatch warnings:
> > > drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 171)
> > >
> > > vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c
> > >
> > > cf586021642d80 Chris Wilson 2021-06-17   32  static int copy(struct intel_migrate *migrate,
> > > cf586021642d80 Chris Wilson 2021-06-17   33             int (*fn)(struct intel_migrate *migrate,
> > > cf586021642d80 Chris Wilson 2021-06-17   34                       struct i915_gem_ww_ctx *ww,
> > > cf586021642d80 Chris Wilson 2021-06-17   35                       struct drm_i915_gem_object *src,
> > > cf586021642d80 Chris Wilson 2021-06-17   36                       struct drm_i915_gem_object *dst,
> > > cf586021642d80 Chris Wilson 2021-06-17   37                       struct i915_request **out),
> > > cf586021642d80 Chris Wilson 2021-06-17   38             u32 sz, struct rnd_state *prng)
> > > cf586021642d80 Chris Wilson 2021-06-17   39  {
> > > cf586021642d80 Chris Wilson 2021-06-17   40     struct drm_i915_private *i915 = migrate->context->engine->i915;
> > > cf586021642d80 Chris Wilson 2021-06-17   41     struct drm_i915_gem_object *src, *dst;
> > > cf586021642d80 Chris Wilson 2021-06-17   42     struct i915_request *rq;
> > > cf586021642d80 Chris Wilson 2021-06-17   43     struct i915_gem_ww_ctx ww;
> > > cf586021642d80 Chris Wilson 2021-06-17   44     u32 *vaddr;
> > > cf586021642d80 Chris Wilson 2021-06-17   45     int err = 0;
> > >
> > > One way to silence these warnings would be to initialize err = -EINVAL.
> > > Then Smatch would know that we goto err_out for an empty list.
> > >
> > > cf586021642d80 Chris Wilson 2021-06-17   46     int i;
> > > cf586021642d80 Chris Wilson 2021-06-17   47
> > > cf586021642d80 Chris Wilson 2021-06-17   48     src = create_lmem_or_internal(i915, sz);
> > > cf586021642d80 Chris Wilson 2021-06-17   49     if (IS_ERR(src))
> > > cf586021642d80 Chris Wilson 2021-06-17   50             return 0;
> > > cf586021642d80 Chris Wilson 2021-06-17   51
> > > cf586021642d80 Chris Wilson 2021-06-17   52     dst = i915_gem_object_create_internal(i915, sz);
> > > cf586021642d80 Chris Wilson 2021-06-17   53     if (IS_ERR(dst))
> > > cf586021642d80 Chris Wilson 2021-06-17   54             goto err_free_src;
> > > cf586021642d80 Chris Wilson 2021-06-17   55
> > > cf586021642d80 Chris Wilson 2021-06-17   56     for_i915_gem_ww(&ww, err, true) {
> > > cf586021642d80 Chris Wilson 2021-06-17   57             err = i915_gem_object_lock(src, &ww);
> > > cf586021642d80 Chris Wilson 2021-06-17   58             if (err)
> > > cf586021642d80 Chris Wilson 2021-06-17   59                     continue;
> > > cf586021642d80 Chris Wilson 2021-06-17   60
> > > cf586021642d80 Chris Wilson 2021-06-17   61             err = i915_gem_object_lock(dst, &ww);
> > > cf586021642d80 Chris Wilson 2021-06-17   62             if (err)
> > > cf586021642d80 Chris Wilson 2021-06-17   63                     continue;
> > > cf586021642d80 Chris Wilson 2021-06-17   64
> > > cf586021642d80 Chris Wilson 2021-06-17   65             vaddr = i915_gem_object_pin_map(src, I915_MAP_WC);
> > > cf586021642d80 Chris Wilson 2021-06-17   66             if (IS_ERR(vaddr)) {
> > > cf586021642d80 Chris Wilson 2021-06-17   67                     err = PTR_ERR(vaddr);
> > > cf586021642d80 Chris Wilson 2021-06-17   68                     continue;
> > > cf586021642d80 Chris Wilson 2021-06-17   69             }
> > > cf586021642d80 Chris Wilson 2021-06-17   70
> > > cf586021642d80 Chris Wilson 2021-06-17   71             for (i = 0; i < sz / sizeof(u32); i++)
> > > cf586021642d80 Chris Wilson 2021-06-17   72                     vaddr[i] = i;
> > > cf586021642d80 Chris Wilson 2021-06-17   73             i915_gem_object_flush_map(src);
> > > cf586021642d80 Chris Wilson 2021-06-17   74
> > > cf586021642d80 Chris Wilson 2021-06-17   75             vaddr = i915_gem_object_pin_map(dst, I915_MAP_WC);
> > > cf586021642d80 Chris Wilson 2021-06-17   76             if (IS_ERR(vaddr)) {
> > > cf586021642d80 Chris Wilson 2021-06-17   77                     err = PTR_ERR(vaddr);
> > > cf586021642d80 Chris Wilson 2021-06-17   78                     goto unpin_src;
> > > cf586021642d80 Chris Wilson 2021-06-17   79             }
> > > cf586021642d80 Chris Wilson 2021-06-17   80
> > > cf586021642d80 Chris Wilson 2021-06-17   81             for (i = 0; i < sz / sizeof(u32); i++)
> > > cf586021642d80 Chris Wilson 2021-06-17   82                     vaddr[i] = ~i;
> > > cf586021642d80 Chris Wilson 2021-06-17   83             i915_gem_object_flush_map(dst);
> > > cf586021642d80 Chris Wilson 2021-06-17   84
> > > cf586021642d80 Chris Wilson 2021-06-17   85             err = fn(migrate, &ww, src, dst, &rq);
> > > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > > cf586021642d80 Chris Wilson 2021-06-17   87                     continue;
> > >
> > > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > > complain anyway because it thinks the list could be empty or that we
> > > might hit and early continue for everything.
> >
> > The fn() will always first initialize the rq to NULL. If it returns
> > success then rq will always be a valid rq. If it returns an err then
> > the rq might be NULL, or a valid rq depending on how far the copy/fn
> > got.
> >
> > And for_i915_gem_ww() will always run at least once, since ww->loop =
> > true, so this looks like a false positive?
>
> You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
> i915_gem_object_pin_map() can fail?

Yeah, they can totally fail but then we mostly likely just hit the
err_out. The for_i915_gem_ww() is a little strange since it's not
really looping over anything, it's just about retrying the block if we
see -EDEADLK(which involves dropping some locks), if we see any other
error then the loop is terminated with ww->loop = false, which then
hits the goto err_out.

>
> regards,
> dan carpenter
>
