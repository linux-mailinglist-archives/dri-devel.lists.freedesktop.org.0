Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A64168B33
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 01:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953386E4BA;
	Sat, 22 Feb 2020 00:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F46E4BA
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 00:47:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x7so4078828ljc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7FVXySWzWAkk0GnSxfoldMER4c23FSPvZ1T5+iecdE=;
 b=G0w+b7lb+ocgm5S5kCkLRzHJUmVJAHNVI2kEbMLIBrcNHkW64jgWt6alVi/zorp/sX
 gEuqC+4mENe7E/dqBZvHJfqkrwW4Q9v1igL+uGS2CB5IWpFDWqRwD5Eet6h3WIFa4DOK
 PHD5yU+hpuHM+aigqVhLfFRVk7YdwQPNBYvK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7FVXySWzWAkk0GnSxfoldMER4c23FSPvZ1T5+iecdE=;
 b=Hv3JBo2Lwzzi/IGRhIhMhzS3bw7MchiedO88559cGlGK1PRj14j+hADK3vX2FtYPij
 bXXVQRf20FLE6IulEgU2+p4LO9gXPfpThK+mmJv6Wo+exv/l5Cn9N4xui+Sa7pF/8Xba
 9WW0IQFpAVbTEtgErvOqCJWhACtzRLJlCF8eW5xGvQIDyJ/bDhIDYlDS0PpuhwekHJnX
 Sfrba+OjbzPHAEzBPdR3RSPRv8FFbXD8/Bid+RylRSCdCVeoNt8uJElBCRDDbYeU2pTU
 gwP2dsne5LZufeDSEW8zhJ/NCr8ETsZUuXEXfugrA0ypn/vVitE/ZSAekZRd5ttNc1p5
 e3Vg==
X-Gm-Message-State: APjAAAUyLEUd8LzoSrhxuUY/78Rvd4Q8p/RKWEP4/jgGNFggoh+jIGOl
 6L+y3O98LvZLsVspu4c0IblFD1D/GOs=
X-Google-Smtp-Source: APXvYqzQQzA8lgmYx2Ow+bCXggTWcnLfn/NFxG4ZoARymNI89XH5+Zk1vKyDcHtasNUG7HuJ9rslzw==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr24045217ljl.134.1582332459382; 
 Fri, 21 Feb 2020 16:47:39 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id n2sm2464752ljj.1.2020.02.21.16.47.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 16:47:38 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id w1so4055729ljh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:47:38 -0800 (PST)
X-Received: by 2002:a2e:1459:: with SMTP id 25mr24246491lju.189.1582332458302; 
 Fri, 21 Feb 2020 16:47:38 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
In-Reply-To: <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 21 Feb 2020 16:47:27 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
Message-ID: <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Catalin Marinas <Catalin.Marinas@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 10:41 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Fri, Feb 21, 2020 at 2:06 AM Guillaume Gardet
> <Guillaume.Gardet@arm.com> wrote:
> >
> > Hi,
> >
> > > -----Original Message-----
> > > From: Chia-I Wu <olvaffe@gmail.com>
> > > Sent: 20 February 2020 19:41
> > > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > > Cc: dri-devel@lists.freedesktop.org; Gerd Hoffmann <kraxel@redhat.com>;
> > > Daniel Vetter <daniel.vetter@ffwll.ch>; Catalin Marinas
> > > <Catalin.Marinas@arm.com>; nd <nd@arm.com>
> > > Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
> > >
> > > On Thu, Feb 20, 2020 at 4:44 AM Guillaume Gardet <Guillaume.Gardet@arm.com>
> > > wrote:
> > > >
> > > > Hi,
> > > >
> > > > With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of display
> > > corruptions leading to this kind of screen:
> > > > https://openqa.opensuse.org/tests/1174521#step/yast2_i/24
> > > Looking at the screenshot, it seems cacheline-related?
> >
> > It could be.
> >
> > >
> > > There was a change of memory type
> > >
> > >   https://lists.freedesktop.org/archives/dri-devel/2019-August/233456.html
> > >
> > > While the guest memory type is ignored on Intel, it is honored on ARM.
> > > This attempt to fix it
> > >
> > >   https://lists.freedesktop.org/archives/dri-devel/2019-December/248271.html
> > >
> > > does not seem to land.
> >
> > I applied this patch on top of 5.5.4, but it does not fix the problem.
> > Maybe more similar changes are required?
> The patch looks legit.  Maybe the memory type is not the root cause?

Perhaps try the entire series?

https://patchwork.kernel.org/cover/11300619/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
