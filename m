Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DE1E1A30
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 06:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73192898C2;
	Tue, 26 May 2020 04:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9F6898C2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:23:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i16so16500184edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 21:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkzgNeUNEbnNJvODhfdpaGDgefYg9bmlm6y6oms7G+c=;
 b=jmMpwOkn+zb0iuktLXODw0ITTnfQgUYYIUn8kj0+0VE4HnMJ2oS0v/rtjhq+58ObQR
 HcKQse3EBQoSWCXYdkHzQULOhoqQHiJg10YmK4zULLvuoMw0eK5eolwLwtRhJ4jiIQOT
 XqZUBHNhDGqVJ5zWoyDp+c5gDow3hxrjnAfXZzDH4LtAeyM9IlyUPUlg9jIwGOnSDzs8
 KKqTTObkJXjEYrMbDoXI33Cbte5NexMBR1KTJzRatBoppLO7Ya0oXsaED9FbTHan4nJg
 9IbL+t7n8tdA1mkZIaY0N8SiQiKF1oPtmtPkxiZ6jb+ROO+0EQ2WukKCXg42rRl7VOPZ
 yaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkzgNeUNEbnNJvODhfdpaGDgefYg9bmlm6y6oms7G+c=;
 b=VWwJkOgu2NLL4IsHgcPXi5Dx2y6IFzbOotf7276DGnfHx3HgKD/tWHC+Xu7eIWTTFL
 P3MZ3DWTIQVLZB8YDED9/xaq8U3rsdWCnZ7v3J2RmW9UN4K9EApnqpvN/8O2axJYmV+Z
 aurdjzqP/bhfKPh7vZL6gxgKawe6ZHlTZ4Tx1GCnCYRXKzhajQDRUXiWXjEok/jntbKz
 x1DJCYrFpeaX9J5nFMf/bI7bZjbHPyWiqZCqq+vpM/Io9p3L5pmGrNQfW1SCdbRrANL+
 pffQQ2AkOnH8j1Uz/A6y3+WgT0Sxl5NT6diEsfEsFC/erMO4ieH9hi6oRJzxYo/wdxQL
 bakA==
X-Gm-Message-State: AOAM533MLYahFRbfwBt4kkMrHQqlSWdVmos5MaSC10qtEtk8YNs1LXBL
 YPi7ge0TYGWLDYvgQzDOCaCSQn5+2DKm3J/vi9w=
X-Google-Smtp-Source: ABdhPJz2Vn5CDQom18MJ+e1T3aah4Ow5CTNZ/6hbKDPvn1FphzxzUH9yeJd2lttpcr/cKAgnWBjUbZrluAWcO66UHwc=
X-Received: by 2002:a05:6402:948:: with SMTP id
 h8mr17504187edz.127.1590467011223; 
 Mon, 25 May 2020 21:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200525235712.VqEFGWfKu%akpm@linux-foundation.org>
 <21b52c28-3ace-cd13-d8ce-f38f2c6b2a96@infradead.org>
In-Reply-To: <21b52c28-3ace-cd13-d8ce-f38f2c6b2a96@infradead.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 26 May 2020 14:23:20 +1000
Message-ID: <CAPM=9twdkW83Wd4G1pS7cP2nf3wOmYvKxUfKA9EUkOEf7BuvKg@mail.gmail.com>
Subject: Re: mmotm 2020-05-25-16-56 uploaded (drm/nouveau)
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Michal Hocko <mhocko@suse.cz>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, linux-next <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 May 2020 at 13:50, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/25/20 4:57 PM, Andrew Morton wrote:
> > The mm-of-the-moment snapshot 2020-05-25-16-56 has been uploaded to
> >
> >    http://www.ozlabs.org/~akpm/mmotm/
> >
> > mmotm-readme.txt says
> >
> > README for mm-of-the-moment:
> >
> > http://www.ozlabs.org/~akpm/mmotm/
> >
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> >
> > You will need quilt to apply these patches to the latest Linus release (5.x
> > or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> > http://ozlabs.org/~akpm/mmotm/series
> >
> > The file broken-out.tar.gz contains two datestamp files: .DATE and
> > .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> > followed by the base kernel version against which this patch series is to
> > be applied.
> >
>
> on x86_64:
>
> when CONFIG_DRM_NOUVEAU=y and CONFIG_FB=m:
>
> ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
> nouveau_drm.c:(.text+0x1d67): undefined reference to `remove_conflicting_pci_framebuffers'

I've pushed the fix for this to drm-next.

Ben just used the wrong API.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
