Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE363BA020
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301E56E145;
	Fri,  2 Jul 2021 11:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E23C6E145;
 Fri,  2 Jul 2021 11:57:54 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id v10so6387680qto.1;
 Fri, 02 Jul 2021 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OuZt5fA+Ly0GbEZTGNMa0tAD8B8PBqS3n928BlHp6o=;
 b=lJBGLVygbnM58I8P9oIuXKUixthhjsfzHZgnCAk2Q+lXUdCeYqefBLNQwjPxMekfVq
 wZFp70KbRUgPcVNeHHmFflsnV5e+9OjnFGt4s548zZ9G/5ffcfcMv2J7OG2hGbqTQaAJ
 w5dnFRdgdgTmuWSX9zrVi0nXl7VqjybKEvGzzYEH7sSO85BFFWkz6meYJGnlzyVpKVRO
 4HNa300pLU/80hCRjC/gjYmloD72C4m4pISC0RB0jRp0rPLYyYoVdK+HzL/V2DdXjkVA
 2w+tWl5t0Z3G7/+JnQLDfjBh3c40g6rzxQXfJyI1jFr4a84mADv86zQRR21cIcOgGtNk
 RgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OuZt5fA+Ly0GbEZTGNMa0tAD8B8PBqS3n928BlHp6o=;
 b=cJTOTsDKisaoMamSbn/9gjswarbNWztNLBiP/V/4SE2Odvz1wfW0HCbqR4DGkuK99h
 vojGozkHCpeE3IuTti+yMbCyicem+OqqenO+d7nrhS0qqMx7M7Ar5jf7gUAUaJKHF5+c
 BfFJKBdDA95Hh6mzFP5c+U1S48SoI6F9jrgzGibpCOf8/0uufSnrhhDQ2uYF06BGyUFJ
 08vfeKlbe3yoSRvbJj/NrsShhZT52vVoLMBaRtVORGXF79i1eJKo/OlB3kLW3RgEaOCe
 3uJ/kzHme1RoKRu8qoDP6DcF1zfEDHFK2qvU9qHQo8WGgC9bEY9gMyLjYtzotLWso8pr
 Oq0w==
X-Gm-Message-State: AOAM531ysS0JQhTcV21S6suGalZuRNISxsZJQrpq0U7+CsXRtn/IJi9H
 ituh7VdHz9VDYu9PfzcD3RL0wwjiPoFkzRmjalQ=
X-Google-Smtp-Source: ABdhPJz72AcMhhZNMLoknpfoERQVAra24ONLKqPzI4c4yG6N7fqyc3XoX+RP4+SOft1z31N4RvoBehT5zTVlcJs9chs=
X-Received: by 2002:ac8:5c8c:: with SMTP id r12mr4616918qta.265.1625227073418; 
 Fri, 02 Jul 2021 04:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <202107020708.XXwacDfG-lkp@intel.com>
 <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
 <20210702110727.GT1983@kadam> <20210702111344.GV1983@kadam>
In-Reply-To: <20210702111344.GV1983@kadam>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 2 Jul 2021 12:57:26 +0100
Message-ID: <CAM0jSHPTe3XNsgzOKQYA8PmE-+q6p7V+LnJtUb+1kU_XqK-EbQ@mail.gmail.com>
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

On Fri, 2 Jul 2021 at 12:14, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 02, 2021 at 02:07:27PM +0300, Dan Carpenter wrote:
> > On Fri, Jul 02, 2021 at 11:32:45AM +0100, Matthew Auld wrote:
> > > On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > cf586021642d80 Chris Wilson 2021-06-17   84
> > > > cf586021642d80 Chris Wilson 2021-06-17   85             err = fn(migrate, &ww, src, dst, &rq);
> > > > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > > > cf586021642d80 Chris Wilson 2021-06-17   87                     continue;
> > > >
> > > > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > > > complain anyway because it thinks the list could be empty or that we
> > > > might hit and early continue for everything.
> > >
> > > The fn() will always first initialize the rq to NULL. If it returns
> > > success then rq will always be a valid rq. If it returns an err then
> > > the rq might be NULL, or a valid rq depending on how far the copy/fn
> > > got.
> > >
> > > And for_i915_gem_ww() will always run at least once, since ww->loop =
> > > true, so this looks like a false positive?
> >
> > You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
> > i915_gem_object_pin_map() can fail?
>
> Btw, I sincerely hope that we will re-enable GCC's uninitialized
> variable checks.  Will GCC be able to verify that this is initialized?

34b07d47dd00 ("drm/i915: Enable -Wuninitialized")

GCC doesn't complain AFAIK.

>
> regards,
> dan carpenter
>
