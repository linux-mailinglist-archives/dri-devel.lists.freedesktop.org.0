Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6422551E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 03:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2589FDB;
	Mon, 20 Jul 2020 01:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A089FCC;
 Mon, 20 Jul 2020 01:00:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a15so1211698wrh.10;
 Sun, 19 Jul 2020 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gbeyqQLMszcPP9qj1dbwb1CV+0Fr8C5EowMymPGD4Y=;
 b=OJQHF33XODiz/liOvf2YbEnnJ3MeCfKjaS5o8nIyuRr014PLWcxr12E+lCtbrg/Aoa
 OV1zD9DHcN31tBlqMxIHQyMWh016mSieejmbNfSkwnlWMBH6hmSDXPdCfu87HE1VvT8Y
 O7CXKnK2Rnf2l7fymC4H0lCndRtN1fAVAsTGfeFYA4wHn4lukDPMwPvPMAjy0pH0gy7U
 9X5YwnXnYj8sevOcU80HXjdlgQsRRZCR9tFWWFVb9Fq1eeB3+UHAFNoHq6fKWq738PAW
 Fm7O+5YBezhO84UUA+nSAV/tcyPN8MORdwNQmurWPgSbUZScpwEaMbZsEf4daliVYUPU
 EtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gbeyqQLMszcPP9qj1dbwb1CV+0Fr8C5EowMymPGD4Y=;
 b=L1X9gqzOe/hwYYJwIrrSpWcOM3NCLYG2mM+pW0nLGzpZepKNvO9EsGNFFrQwjbFvcG
 i4f+TuTcK3XauuvflGeJrSUIy+ctknqEGddM2P1wLSBSY8gyfk6BEHzXR3u3TqxX90/n
 IJZZqpJwYMwQTd3XxWuvf9ztLvs4YnPFmImXYxzdTcafiWHlVVZpCp9QU5c65BGSSjgR
 E9KFMqLbKVpNtNHoSED/F8FlW3Ns32HgQKnTFSpltuiUKewcPWwpw7Sf6HbhgNVdCMff
 rak829v7pcag0XfrUOB1OCBrAh6TAf9EChtj5qSA9Zad79nNJwarZMM/jZk8+lrVDxlM
 Q4KA==
X-Gm-Message-State: AOAM532eydJ1YSrLmCsVIARdGaVeB9DTcoTwcq33pgCZFQy9q/AQQjKz
 s7pcw2OblzmQpBQY43wEYszLnOKcuQ5FAYcv/T8=
X-Google-Smtp-Source: ABdhPJxrksBHA9ekD0Q/20KLDUQZ92btwc8L37bHfTwDqFM6qzG03eQZRswFvXz1b/JUPLT+oe663zi8FmpLE2SObkM=
X-Received: by 2002:a5d:5642:: with SMTP id j2mr19802770wrw.19.1595206840506; 
 Sun, 19 Jul 2020 18:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200719073050.776962-1-yuq825@gmail.com>
 <CAK4VdL3dDBUK_jpb8Q08XBpKdmFF9MomMnb4mKJr1wotfnzppA@mail.gmail.com>
In-Reply-To: <CAK4VdL3dDBUK_jpb8Q08XBpKdmFF9MomMnb4mKJr1wotfnzppA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 20 Jul 2020 09:00:29 +0800
Message-ID: <CAKGbVbvm-P7EX9RmCxowyNjwP8K2S+OUQJ3m9uPZdemUt=g_PA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix wait pp reset timeout
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, applied to drm-misc-fixes.

Regards,
Qiang

On Sun, Jul 19, 2020 at 6:41 PM Erico Nunes <nunes.erico@gmail.com> wrote:
>
> On Sun, Jul 19, 2020 at 9:31 AM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > PP bcast is marked as doing async reset after job is done.
> > When resume after suspend, each PP is reset individually,
> > so no need to reset in PP bcast resume. But I forgot to
> > clear the PP bcast async reset mark so call into async wait
> > before job run and gets timeout.
> >
> > Fixes: 3446d7e9883d ("drm/lima: add resume/suspend callback for each ip")
> > Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > ---
> >  drivers/gpu/drm/lima/lima_pp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
> > index 33f01383409c..a5c95bed08c0 100644
> > --- a/drivers/gpu/drm/lima/lima_pp.c
> > +++ b/drivers/gpu/drm/lima/lima_pp.c
> > @@ -271,6 +271,8 @@ void lima_pp_fini(struct lima_ip *ip)
> >
> >  int lima_pp_bcast_resume(struct lima_ip *ip)
> >  {
> > +       /* PP has been reset by individual PP resume */
> > +       ip->data.async_reset = false;
> >         return 0;
> >  }
> >
> > --
>
> Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
>
> This fixes the issue reported at
> https://gitlab.freedesktop.org/lima/linux/-/issues/34 .
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
