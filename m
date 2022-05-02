Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9C517247
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E4210E51F;
	Mon,  2 May 2022 15:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6610E51F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 15:11:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so4366095pjv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+fYt/5Kz7fMdzGgWjp7XMLLraHbe7JhowY7ehw5lu1Y=;
 b=MLOZ01pFhYttJUIpKvXwQt58S0iKaNEdTov0zTpQQepmjnWbMw0TPpeDWTPJ0hmMyz
 f6KBJviThmz4lESgX/mZGEBOuGRibRp4pdYja4SlgASeejOo5rlw7wE6w0q7OPgLAcar
 esSoXADn0AYEQiCNIun/NEMlSQPtVuYdOHfRtttbyxKn0CNuTPvaBBaJ8bFGOWcZp07m
 dqA4DUnIW4rb7sv3BfN03uULPWOwyfUu2BlKcawwrOiyqYz6CXpxm8914sR3c2kGfZVJ
 wFIbYrQ2jGuYJRvEc2YellXId8dF8uHTUrN0CCY1FF8Ew4WnZqlbEiocoOqRllh+Nb/I
 mf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+fYt/5Kz7fMdzGgWjp7XMLLraHbe7JhowY7ehw5lu1Y=;
 b=JzDsiKm3WeYBZPvD0TFqSm9u9owKD0TQrWLelCZcheYrru+be+zzaFTBFjb+hG33Nv
 Um0OMJdfjuPu2wS9B5ZGrcYErl2F3oWBQPav5cxsxsUa5E+xStvzLavMf56lhbfPhdgH
 bgOP33A+4rRujJ8AP0SNV/dnnxm+Qh7e1OCb/RvqHzwT9y/PihsubjNhk3F8COzbJmmH
 jUrI4dH3x7xyQVRJIo3g26wOg+GgwrgZ3O7dH2hOZv7+7b/61PZ0XexBEVwd9KZKqZHC
 3JFWkDT8ti6/EPjp8oyBDTQx6gWov51LU1qLWgrmC6jUdU4EoW/ItHkgoIx5AwbjDPLR
 d9ug==
X-Gm-Message-State: AOAM532FS0YonkzYvjdNMasP+vH3cHFbt3f7A+5oOGWjbje3nuOZ0nSo
 tX7YlcsykZnGGsAAnc0C7vpjmdclKRzOjc0ggQTPnA==
X-Google-Smtp-Source: ABdhPJwJfSROCD11NB0E9djhzgDXsLBgMJ23ztSc+gUj853AdR/Z84vGZ0eEjVgMeA0SeknsqvCUgMXhRmThULJKJww=
X-Received: by 2002:a17:903:31d1:b0:159:804:e852 with SMTP id
 v17-20020a17090331d100b001590804e852mr12093048ple.19.1651504319503; Mon, 02
 May 2022 08:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
In-Reply-To: <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 2 May 2022 16:11:48 +0100
Message-ID: <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Apr 2022 at 12:55, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> On Tue, 26 Apr 2022 at 17:36, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> >
> > Hi Mike,
> >
> > sounds like somehow stitching together the SG table for PRIME doesn't
> > work any more with this patch.
> >
> > Can you try with P2P DMA disabled?
>
> -CONFIG_PCI_P2PDMA=3Dy
> +# CONFIG_PCI_P2PDMA is not set
>
> If that's what you're meaning, then there's no difference, I'll upload
> my dmesg to the gitlab issue
>
> >
> > Apart from that can you take a look Arun?
> >
> > Thanks,
> > Christian.

Hi

Have you had any success in replicating this?

Cheers

Mike
