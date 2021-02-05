Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57520310B82
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D956E2B4;
	Fri,  5 Feb 2021 13:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425806E2B4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:05:33 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id t25so6806965otc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=meHuzs6N41tZwNz5Z8o9DqX2fcdLCbhLwuuynzEyeWM=;
 b=caNcsbg+cluV4xsl+wtBGBB0+tBVxphrCq08ie5y62VKKrrvFqHJl4eLA753W6yxcx
 +DsfIeed0slxZgU+awR4rrvFavZxYfvGEqGNS7qi3cj7ZT7FTuj9kwiuXEmbea+Uklvt
 S+/Onew+8DaR2I0iNwiG8CXgsWbaVu9d9oMHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=meHuzs6N41tZwNz5Z8o9DqX2fcdLCbhLwuuynzEyeWM=;
 b=AW1UZxteWkGv3YzYHjquPFGxBoXOwlyDJm+3wq/+9hiCVBhGwffZimeO9S5PQMzU27
 yoz0qHaT/3Y2o7ntOy6Z2FDScHOIaFvBkHc6roaoP2S4N87Xj9QV5tzd92WEadB+MZ9d
 z5+z0uWgaeqxuz+qtgBxQMzqTvNemQrsuerpG3IRrblu+ugQQJ2Sm6xD1vW2WLnoRHqg
 ajDGgCFVdO3MxSflrrzcqBCLaJUTgYA0/0uCx3jrnt4DzzZnwKT2r00vr8qfzd8/+6he
 BcqgulXeoENdFjya7+KbXP4BX9DwoLuXyjvONEJa/4K3J2m+U308xywop8QQ5e1qc/kh
 tw9Q==
X-Gm-Message-State: AOAM532JoizZoo/MTbXaFnOs8smcMaguQTL3XFw6ejg7iI0KUa76D1CN
 Ps0kbq4haAnw6kNzOl3CIaUplKLbVEWbfs4ENyT3NA==
X-Google-Smtp-Source: ABdhPJzng89M/HFnFqHXCqLK/NUEuD1p6NqDzjg+NI3npAgpIIrnhRIkeejWN9f+opFyGRDm7xIyl4Yf2/s72s+33io=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr3221863otr.303.1612530332640; 
 Fri, 05 Feb 2021 05:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au>
 <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
 <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
 <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com>
In-Reply-To: <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 5 Feb 2021 14:05:21 +0100
Message-ID: <CAKMK7uFSF0cHZh6KikMf2MmBykZazE5HGA1ejJU++GWyfuTmfQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Gross <mark.gross@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 12:14 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Fri, Feb 5, 2021 at 12:07 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> > >
> > > Thanks. I already asked Patrik yesterday day if DRM missed to pull an immutable tag I provided. I think they can pull and resolve conflicts themselves. Alternatively it would be easy to resolve by Linus by removing Kconfig lines along with mentioned files,
> >
> > Patrik, I have sent a PR again, so you may consider pulling it, thanks!
>
> Daniel, is this something you can pull into drm or ask one of the
> drm-misc maintainers to do?

We've already created the conflict, and my understanding is that Linus
wants to have visibility into conflict-y stuff and doesn't mind at all
resolving conflicts. Hence for 5.12 I think we're fine as-is.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
