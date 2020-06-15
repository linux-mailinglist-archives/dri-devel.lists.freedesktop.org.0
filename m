Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57781FA027
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 21:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E876E4DD;
	Mon, 15 Jun 2020 19:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ED86E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 19:26:29 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id r11so10049532vsj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tesv8smtIgd+xiSORLH2FyhMzD11l9j50zG5mxjhYfs=;
 b=je+Cfz21/B+VNEFNMSQ1dyBdqLGez05SnOgnWdL4+4hwhVDTK7rYVCYABbj1M1dm86
 rjckPR+MEsiF4ZX0qS17GZxvnZX4iebQ4kL9YIAjefslLRSKjx+o/gkJ5t6hUwd9NyGi
 7fYypRsHjLTh9iaIqOAoP0Wto407edtOEw2xQuaGu7XQy3w3vjHsM8INgx13psVVOo6r
 Sj/1VZdU47VOukWEjwXgFwf2rRyNeGuz4xND8G6rFLIMWM3B1q26T1X4FfsQcAR3zFZc
 iQE1mLkHRMfOTrpIk599Uu6zU5QSWhgCYvr42NGzFI+5ZFV18oggO09i1kN5VTAL4hCb
 ZABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tesv8smtIgd+xiSORLH2FyhMzD11l9j50zG5mxjhYfs=;
 b=KtzO8Z+3z45TIjPQ6Kg3OBa11OJnwf6AFICpuCi+YoswD80E5Ivib4SIExXunOQSQ7
 8PD/KmlBmbHY2j/fdxqermiyu5gPjBbCGn4dX9JrzCqtnebciRuIQJFk/gW242MIfMr7
 Hl6Vi61HiDU7K8dxqcCFVdncEuDHqVwUZRKTNSUu24H65heg43IxmQGPurMZBK1syIda
 BayLsWkvTW/EF+UWLm516+8faq6mMrgVPUycwzMA3V+Sxs+zfGyAlr6JWxtDbL4LoGG0
 nysLK30w4QP6WOW4d13vdTYoet4RALbG1zAuvTs7dAeTHSDhfBsvRVd65flVEMMYynG3
 z10w==
X-Gm-Message-State: AOAM5331eSCCSax6c7//qCljvX0IxqSpe12qRKsMgfWOumSzw77AA6oj
 CYK2HMu+koAhNENkNaeTYpcSQ0ETl2uSaddZaHw=
X-Google-Smtp-Source: ABdhPJzfX3Lt5eM5OiYlPAv26PyACHCtj2cUzj6cbo7JbwJ5YXBoX8I5wIZbnxZsCRShIO+2AASuEdn6zyT08SdkMvs=
X-Received: by 2002:a05:6102:22ec:: with SMTP id
 b12mr20800051vsh.138.1592249188375; 
 Mon, 15 Jun 2020 12:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
 <efe3f43b-e743-d4b8-e942-23fbf23b0118@vmware.com>
 <CACvgo52PLgMA-zFeOTQwzyuTXxwYOq3o37Fh1Ym4tMfM8jgvQg@mail.gmail.com>
In-Reply-To: <CACvgo52PLgMA-zFeOTQwzyuTXxwYOq3o37Fh1Ym4tMfM8jgvQg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 20:22:48 +0100
Message-ID: <CACvgo530O4fedDs2te1++cXS-=RKFkajwhRBCrtm+4NE1yXY7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: vmwgfx: remove drm_driver::master_set()
 return typ
To: Roland Scheidegger <sroland@vmware.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Jun 2020 at 15:07, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 3 Jun 2020 at 19:37, Roland Scheidegger <sroland@vmware.com> wrote:
> >
> > Looks like a nice cleanup to me. (No idea if at some point there
> > actually was a reason for a return value...)
> >
> It was required up-to quite recently actually:
>
> commit 9c84aeba67cce6514374f134c9ce2c5f35ac3831
> Author: Thomas Hellstrom <thellstrom@vmware.com>
> AuthorDate: Tue May 28 08:08:55 2019 +0200
> Commit:     Thomas Hellstrom <thellstrom@vmware.com>
> CommitDate: Thu Aug 15 08:39:27 2019 +0200
>
>     drm/vmwgfx: Kill unneeded legacy security features
>
> > Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> >
> Thank you. Will push to drm-misc in a moment.
>
... and finally pushed to drm-misc/next.

Thanks again.
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
