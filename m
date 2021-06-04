Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96639BCD2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 18:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314206E07F;
	Fri,  4 Jun 2021 16:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AFC6E07F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 16:15:04 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m9so7962542ybo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cHqepmK+EIGQKcbSlFGvfjVNFBN5RmudswxwfB7pw00=;
 b=gpkSiRHqaUSYt3p3/MlBJAS4AnqZ1/SHMvYwrQxgcwn/plytqUIgui0lG6ti8Krt/I
 6BC8XlwAefHJp5noB6oWwvfC9IGvG4I5q/iqcLuQ+JSMAQWe2sp+rnJKjVfObStHTIdm
 u19wRqwxr2JQz3BRnAyh7jc+zCapx2W9MSkCcXh51kacRcqL+puCBPQDr8RWjw1IM75A
 CXIGPyL4ogCvN/sFFdjtI837EJ8JJcrWkCoLnheE1O5HBYJLBfLTTBsZsBfLYDTUBXUl
 kCdGS1IUCgu7IHKAlXHZ/qdY1tChZo5eObHDSBO983x/UifS4eNDGYC+ajNZZ4po2UE6
 YCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cHqepmK+EIGQKcbSlFGvfjVNFBN5RmudswxwfB7pw00=;
 b=KIe4wp8QBesDTK3gdSG9djuXfD9/1GXW74s8h9VKHQaZRSC9DmCvSRMkCC/HhjaWnc
 mV0d5CFaU+LmrBreWaDQIP5GxpgFntgXZY/4hOiug0jaI2Ug5d5txdnSjQQDinpMBGKP
 dHLNgDzBTmvK0BvyUq4yDiQucX4fOvQeJCK15G3DPBogt20bbwWfB5ngnGZztwjo8g12
 mBbueBH653VmPv9VWyPXAlz2HhJQQK5BpCvaBu8OpCUtLLtqcVNm0GlvbnKFaS/FgGUM
 LevaYBd4SQ6GAKDs6g98VX/AWCNUrgbD640ttkv0byVrrPiyTH8H55hZatn3t2xoDBvZ
 S7RQ==
X-Gm-Message-State: AOAM530G7mVrl95li2tln7CPWct4+7XR2UHZW/uvzvZyLoFq7thdD9GU
 9/JVd+QvCK8s44RzWVrVvoClpqc2VTsYZxKMEo2lwQ==
X-Google-Smtp-Source: ABdhPJwK+qPeJOkR8o9OoC6TpoI0orpuAIZwVe1sEUyRa6TgLZBtYhclfntAhFBtW2oqTfkM9l39akb8DPOheRMIC10=
X-Received: by 2002:a25:3415:: with SMTP id b21mr6242061yba.241.1622823303777; 
 Fri, 04 Jun 2021 09:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155228.616679-1-christian.koenig@amd.com>
 <CADnq5_Mrm8GtG2uMxKac+Ev3kTFv6Hn+nL5F8vEFcWHJsceu8Q@mail.gmail.com>
In-Reply-To: <CADnq5_Mrm8GtG2uMxKac+Ev3kTFv6Hn+nL5F8vEFcWHJsceu8Q@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 4 Jun 2021 11:14:52 -0500
Message-ID: <CAOFGe94Zx_DVVj9XEGG9tvwtNGctxboJb8oCLK5a2FKJV26SQQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add missing EXPORT_SYMBOL
To: Alex Deucher <alexdeucher@gmail.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Fri, Jun 4, 2021 at 10:59 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Jun 4, 2021 at 11:52 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > The newly added dma_resv_reset_shared_max() is used from an inline
> > function, so it can appear in drivers as well.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> > ---
> >  drivers/dma-buf/dma-resv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 3964df438505..6132ba631991 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj=
)
> >                 fence->shared_max =3D fence->shared_count;
> >         }
> >  }
> > +EXPORT_SYMBOL(dma_resv_reset_shared_max);
> >  #endif
> >
> >  /**
> > --
> > 2.25.1
> >
