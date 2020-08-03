Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD123B0E7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 01:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AAC6E375;
	Mon,  3 Aug 2020 23:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE726E375
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 23:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596497386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRm3NJEvomEDfGeZbbN2TL8ZG4riiX42sSsKVhTtCDg=;
 b=gnpz+bbygtb/GaFZouS/0L7RFXi6+vfhKfaoDz0vKxibt2kxfpZd7+O2nCdYRjqT7QcFQ3
 sleg+iYljtxHGq+jDVglVYioIHisX9KYr4sbRBk6Tqp669hSMhWtKQW994HR6Pb7z5hQxU
 TAfKOqB3p5Eqa26FF/+ffRFwF9ooCnI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-d6ZBt0-tMNSn8yxzJ8-swg-1; Mon, 03 Aug 2020 19:29:42 -0400
X-MC-Unique: d6ZBt0-tMNSn8yxzJ8-swg-1
Received: by mail-ed1-f72.google.com with SMTP id p26so9863517edt.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 16:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XRm3NJEvomEDfGeZbbN2TL8ZG4riiX42sSsKVhTtCDg=;
 b=YREmrgCptdBXJqN2FLAO1HcMqGgrmRElYE1vx7nuDbAyqM6tNuMunl50CtT6FLtvRV
 X6l8Y2VdFWViKjSdJxfZhp15BVQzpQ4FTIknRIeSBzU8BRZX8bsIi2ZdRiTyJSmGN8hH
 IsguLoGyGEAmdpGvin5Cd7k5Ztl4L8n67ALN2q2D7QDm19AmueCiEEkSCRpCVhiwiLeR
 r2YFuar0bPnnOHtxLVghzhPJtzzgvGuLG9K9qPZGHAHiJDYkK26vOicpP8+9Fe/d8+sH
 arw8ftgtePMqB5HYH4hwO0FrX6JUHQaKCPXQ9E85gAewvDL6j33STO7kbH4t/gv1XDd3
 toRg==
X-Gm-Message-State: AOAM533NU+9S7+xsnHNKyLeZHQNbClnd6ettoNiyc1DfLF+jgMmSfB92
 O2Ohgd121HnePU4EdkmlYJIi3dA9T5SqMpUXcY9W01Jt5ZMvJfVquFwS6oQJD6Fa/UgW+xT7HCC
 FP76ucaxCVfSB4lXC2trPEcCY1rcevdhjZSy0ZG/WiCTd
X-Received: by 2002:a17:906:1104:: with SMTP id
 h4mr18840734eja.456.1596497381274; 
 Mon, 03 Aug 2020 16:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp34p+Z8Mc6zwI3NcJv7oAfXkQvVK17vRb9paXv+mYpGH4EsJxZEwwVOS602UUu476FtjmqlNZsTpKWJyyYFw=
X-Received: by 2002:a17:906:1104:: with SMTP id
 h4mr18840718eja.456.1596497381059; 
 Mon, 03 Aug 2020 16:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200730192110.1466e63e@canb.auug.org.au>
 <20200730120303.GQ19097@mellanox.com>
 <cf7af4c9-592a-2143-831a-cb0f44bc768e@nvidia.com>
 <20200803231923.GR19097@mellanox.com>
In-Reply-To: <20200803231923.GR19097@mellanox.com>
From: Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 4 Aug 2020 09:29:30 +1000
Message-ID: <CABDvA=mvks3Nrs=8wo1jomPxGjWFxwz4EWrppmmHTzsOuQO6Kg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Ralph Campbell <rcampbell@nvidia.com>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 4, 2020 at 9:19 AM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Thu, Jul 30, 2020 at 10:31:45AM -0700, Ralph Campbell wrote:
> >
> > On 7/30/20 5:03 AM, Jason Gunthorpe wrote:
> > > On Thu, Jul 30, 2020 at 07:21:10PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the hmm tree got a conflict in:
> > > >
> > > >    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > > >
> > > > between commit:
> > > >
> > > >    7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
> > > >
> > > > from the drm tree and commits:
> > > >
> > > >    4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
> > > >    1a77decd0cae ("nouveau: fix storing invalid ptes")
> > > >
> > > > from the hmm tree.
> > > >
> > > > 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
> > >
> > > Oh? Ralph? What happened here?
> >
> > Ben did email me saying he was planning to take this patch into
> > his nouveau tree and I did reply to him saying you had also taken it
> > into your tree and that I had more nouveau/SVM patches for you on the way.
> > So, I'm not sure what happened.
>
> Well no answer from Ben and it looks like it is in the main DRM tree,
> so I will drop the 4725c6b82a48 patch from hmm.
My apologies, both for this slipping past me, and for the trouble.  I
did mean to drop that patch from my tree before sending it on to Dave.

Ben.

>
> Jason
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
