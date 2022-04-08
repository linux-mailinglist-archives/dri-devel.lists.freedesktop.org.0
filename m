Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1C4F8D49
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 07:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189410ED73;
	Fri,  8 Apr 2022 05:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978D510ED73
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 05:42:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k21so13269385lfe.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+HXRFmonCLAOKu7Tx1l0IgtdhflHf7kEkD9u893yPQ=;
 b=gVIdhhP4ICXLdTOfdrNFbOA+Jr/YPS4zvSK1bSFU5CR6vxifk/0LBMAXt4iCloTQVH
 0sGrq4tKJ5z2d/0OqWbmPvp1I4RhBoWno9HgRgIYg/PFnPfeUuUI5XJd53FSZPqVMA0x
 A+3kUSdSMSVb1XBETA29zYZxNikCFwkKpRWM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+HXRFmonCLAOKu7Tx1l0IgtdhflHf7kEkD9u893yPQ=;
 b=WSBJcK+a4bWWgrUlB7wmtM4IO1KYwjDsmSUp+m5kYD9HmcbkOaqoPWS8yVjLXQhr3P
 tBAtrntsHp/bP/7bNSEN833Mwj2ZMFBspLSDUOmmNJXslNCRBY+gJDTvsr42q+77JzOj
 aTICbwTwprYTvB+PVTdCu8QBKoURJ1864ifrw966/jtaFLUpasdFTnpHJnlfv9lJ3UZJ
 x/2YSPJ5LFbKhHpmXiHI+sQrUb15RGQexGf9ukHugYQGzj0zCLbAYWAAftMjMir5vCtK
 EDX5/48aityC1L4Ggih9YBt650PmpfqfKjX1t/O82hy75Cn0izoOue2/oB+ScNfOhFVX
 K6tQ==
X-Gm-Message-State: AOAM531Yyj1w4BaV2SlFcqLAfKeIBXLN/QNa7pTiThq/ex9Uv/iLdS4U
 Eh9kBsHykrKi59/xv59q2Y5ed1olqFqAp3bK
X-Google-Smtp-Source: ABdhPJwkGnGaXdgaAruqP2zc9TSSHbsAtnehiQ84/Ade+A9Ps5Ra44nlwADvAEfH/dqMu0iyBehbaA==
X-Received: by 2002:a05:6512:3b9e:b0:44a:47c6:eb16 with SMTP id
 g30-20020a0565123b9e00b0044a47c6eb16mr11574416lfv.486.1649396574643; 
 Thu, 07 Apr 2022 22:42:54 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 g36-20020a0565123ba400b0044a2a1ccd99sm2360760lfv.20.2022.04.07.22.42.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 22:42:54 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id by7so10191486ljb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 22:42:54 -0700 (PDT)
X-Received: by 2002:a05:651c:b07:b0:24b:4af9:828 with SMTP id
 b7-20020a05651c0b0700b0024b4af90828mr2474847ljr.506.1649396573727; Thu, 07
 Apr 2022 22:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
In-Reply-To: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 7 Apr 2022 19:42:37 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj_=LwGgPVfnOdEJF5O2rt2NEXCK5155v88eDHdGkWOWg@mail.gmail.com>
Message-ID: <CAHk-=wj_=LwGgPVfnOdEJF5O2rt2NEXCK5155v88eDHdGkWOWg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.18-rc2
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 2:20 PM Dave Airlie <airlied@gmail.com> wrote:
>
> I think this should fix the amdgpu splat you have been seeing since rc1.

Not the machine I'm currently traveling with, but I'll double-check
when I'm back home.

Thanks,
                Linus
