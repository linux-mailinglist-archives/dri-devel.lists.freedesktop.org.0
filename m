Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5132F1CEC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA7789C99;
	Mon, 11 Jan 2021 17:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F3089C99
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:47:30 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id p5so165876oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 09:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+v4loQqoKnSU01DgtTKZQGSh8k+FidOwtUdREUyZeI=;
 b=KA/O4HM+2QgVEYB9kebla4ZOxx0dvDk9Hbf3kFJNxD/x++j+7IhrRtYBqYUv43RuN/
 DqvXOHw8pecKm+Sdf7fmQIyJydFOjAO+EwnkgTR/DvXYht/SMy3+UZvmJl18TgK3xhXB
 utueB43a4O1JoLC3RqTcMPaqoKDCQu6gq6rTSJgOemiLal/XBBBXfe8uQwJcOqB4UcIZ
 WsW3NN66DoNalxNtFM5wSJm8mw90Jk8Ofs9F/JX7SluBwebqyz2sBWP6n2HhhCc2xMaN
 7Pmlf8Wjvrh/SpsAoiLSD3eWZdS4ZXmUzMRv/5/CpD48ifbYR0pOa2SBGUHdf9HSJOCJ
 uSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+v4loQqoKnSU01DgtTKZQGSh8k+FidOwtUdREUyZeI=;
 b=sM/qDWQ46CBiD+daFUHB32ochvJ9v6O+Wbv49bN6TX9y/pJur1uN4ZOBPfPdGtnmjU
 P1DzXEUOSb+a1ExUD2hJYFxBijOopXAVbLBqAxmcXhKuflem8Ht43W5IGprPKNkWC5zq
 o8PvkGTWrG2ekZmkjhE/5NpmUrnbLCeTEM33IZYi87dlHs+kF/cYv4eubALq7sK38zis
 dY8XOSWxdBEswNnk24X0ASslXUtmRiNl0/6H96mbgWqugymjK0uDA0jcKOK+eBijC15Z
 czJKulY9f6pF658eL8duerdcaKujpZ5xssLpiaz3VOar2ts8Aoh6ycUHjgSkYdK7RJYL
 Zs3Q==
X-Gm-Message-State: AOAM533aBHPvCV/wVgkBGExLoaR5d+xgWhJ252lZM4+Sj+fwuoQfacdN
 xayQ+oAWJ+vHa4jVsfTpCyUkJq+GARDZm4mJrl8=
X-Google-Smtp-Source: ABdhPJzzsn/agYq0JoX8BF6YJaVV8lO0HKlPCKKUF4t7McrULCj/fgpm6BlBIYGnvjZdinNDvOpPnMpfKyRKizL96MY=
X-Received: by 2002:aca:6202:: with SMTP id w2mr312851oib.5.1610387249370;
 Mon, 11 Jan 2021 09:47:29 -0800 (PST)
MIME-Version: 1.0
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20210111154245.GL504133@ziepe.ca>
 <MW3PR11MB4555953F638E8EDCD9F2CA90E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4555953F638E8EDCD9F2CA90E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 12:47:18 -0500
Message-ID: <CADnq5_NTwynVt=ZPF-hiNFaWfEWiDnoTQCS0k1zx421=UAFSNA@mail.gmail.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 12:44 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Monday, January 11, 2021 7:43 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
> >
> > On Mon, Jan 11, 2021 at 03:24:18PM +0000, Xiong, Jianxin wrote:
> > > Jason, will this series be able to get into 5.12?
> >
> > I was going to ask you where things are after the break?
> >
> > Did everyone agree the userspace stuff is OK now? Is Edward OK with the pyverbs changes, etc
> >
>
> There is no new comment on the both the kernel and userspace series. I assume silence
> means no objection. I will ask for opinions on the userspace thread.

Do you have a link to the userspace thread?

Thanks,

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
