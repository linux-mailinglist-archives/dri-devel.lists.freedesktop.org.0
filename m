Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC111DA23
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 00:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F73E6E22D;
	Thu, 12 Dec 2019 23:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760E6E22D;
 Thu, 12 Dec 2019 23:39:28 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id x199so247260vke.6;
 Thu, 12 Dec 2019 15:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fc2RGJ3UClAMsvSW+fKzHU87UiE/9k4bA3dodgjrviE=;
 b=DfOwrr8xJ+MjAGBD5DPRK3CtrM98mBYbvY82OB7HXgLa1lSvy6Oh7roTWvGfy1vYmQ
 fkK8JvcONlBAl2dde0NnSED13jqqTXZ5ZuN8OUUdY4yirTMTd5eJfgCr0ry8TQ36uANH
 xdfhYjply1N4IvUEZb0K59zMzDOfBiJNVnbB2r0AW6CyGDbUwwgflvz5Zav1jhZHa2Hc
 w0YBOCUEr+bBToZQVHj23JGp9HlqIIDmA6NqcJtZxtvD0hBOtbXhVDnIgAt8g0/f/u6n
 HDWRnEdGP2SDVIYDxscK1eX/jRB4GSAjMlsJGzZvlc9NiCMDtNGeOxgcp0JjR8txI43q
 ZXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fc2RGJ3UClAMsvSW+fKzHU87UiE/9k4bA3dodgjrviE=;
 b=JeJu6KPAHlGUOHlzGUxjPT+DxlMpp4lSrS7NDXFlknsBHevua2+ft4r8ij8TyMujaz
 ZfftFhg8ECPneRVOeBmz4BKWQDX2Bys8LpZQnIC7X5rV4UjZmAUrPiRspyOzNeQBom9K
 ekQT3lcqQ/kVhALrcHjbgGXuNydGbm+2PnyF0CKjowulhL162XmpSV2pD/RszteFlRJt
 WTZxS9GmsvbfULQgZSUor3mJFA8T/AY70WWOyMig5JFD8HzSbSBtW0tGozRlpxEr9M2+
 4owKE9iZVBg6Iohgupr6AEn3StwsypclfCIcxklnaNzbZqTpNeWz34U+1nQZgWcJKt30
 2TmQ==
X-Gm-Message-State: APjAAAXoE09F9Mhu+xak+mtfGFjA7iU5cOmBa8OuJktE1V44SERIHRrX
 6M7IzesdUeiRnLwSvIZQijKNa/AViHmXkxm6y/I=
X-Google-Smtp-Source: APXvYqxiVybcStEMqYeEIGEnJ+HtMBPGQkv8Kki+YBh0DS0X1ru0NT7WrnTsK5Rvcxhr0Gt1sTo4rGQEHf7vCJ/BUvQ=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
 22mr11219224vkq.49.1576193967753; 
 Thu, 12 Dec 2019 15:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20191206075321.18239-1-hslester96@gmail.com>
 <8736dq2c66.fsf@intel.com>
In-Reply-To: <8736dq2c66.fsf@intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 13 Dec 2019 09:39:16 +1000
Message-ID: <CACAvsv4He=bKpa2VxJr-cYUoy66sw8mGgFcnpMM0qDb1qXYSrg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: add missed nv50_outp_release in
 nv50_msto_disable
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 Chuhong Yuan <hslester96@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Dec 2019 at 18:14, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 06 Dec 2019, Chuhong Yuan <hslester96@gmail.com> wrote:
> > nv50_msto_disable() does not call nv50_outp_release() to match
> > nv50_outp_acquire() like other disable().
> > Add the missed call to fix it.
This is intentional, and it's called at a later time
(nv50_mstm_prepare()) to avoid confusing HW.

Ben.

>
> The subject prefix "drm/dp_mst" implies drm core change, but this is
> about nouveau. Please fix.
>
> BR,
> Jani.
>
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 549486f1d937..84e1417355cc 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -862,8 +862,10 @@ nv50_msto_disable(struct drm_encoder *encoder)
> >
> >       mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
> >       mstm->modified = true;
> > -     if (!--mstm->links)
> > +     if (!--mstm->links) {
> >               mstm->disabled = true;
> > +             nv50_outp_release(mstm->outp);
> > +     }
> >       msto->disabled = true;
> >  }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
