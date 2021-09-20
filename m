Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E04114E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91F6E4E3;
	Mon, 20 Sep 2021 12:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2906E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:51:17 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id m21so41950512qkm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uYjOElSwpBjxB4TyAE8RVQcgitT8BIw7aBfE1NV3SJ0=;
 b=YYDt9I78NytmyTkcRAg2rCMqe225vDLclwVbSn3NR6JJAFB9BszfGZOYZ23hN8uZn6
 ZJiHaWeiVX/AURGjH0UN6N+R5fm51iUXzYi4knpx703a5IABf//ge+A4j1IKk0pPgi0g
 EmDRjIO1Q3HZT7azKYMGG7r6oQsvlxhK/5OmMJ414+w0Fr6llcG6pxkwubUHJQsg5R1W
 41OxxfgRHO6RLNMIpsmST7P2qQk6m+ZzgaTEcFXmY/fE+C4m0xt3+0uKR1OJ3/rGwby1
 KlxI+ierFl+UOG/fAngWP5nGTP0J+AaOhDlkZ2r/WO74qdE+aRhlIZzs9S9Uij14/qLj
 2Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYjOElSwpBjxB4TyAE8RVQcgitT8BIw7aBfE1NV3SJ0=;
 b=IJ/6wFAd3sKjLpyZ+ABJclgcZ0eRTuWiGpY5nzoNsiQ/D3321Fgh6rykxRBmjLlAqV
 bXlzL5NSmqxlMP52RSQG2GkvH4lQV37/E3P9Gf3gbgLONKIn7yfmmpOeJetjNpAiw4e/
 XZHcFUGYjP7XgMeJ1Iv6vwOhUscpaJ0h3Db08VxudL7ezU1Q+T276kmanFla+e24QHca
 4KU72YeHz3w3/ZD9OJ7f04eXkrG9gEuzfEk0sqQ2yww1IBoqPlI9/eaqwD0E2qhco/sT
 fEhTdsIWQM+1luf1EhiTPXDvOmvLZXQa4c0XPPn7IHRC8av2x0IltMr5vmsK+Zu3auix
 pipA==
X-Gm-Message-State: AOAM532vJZUgjX6B5OSZIZZ10dBZQXJ8Wdy8UY5wXsgcEZUDf9qUVc+D
 VzvSGS+rw2itxT+DlU+lhiC+pVLAIMM0Vo2nQ3U=
X-Google-Smtp-Source: ABdhPJzYbG7Si/JiuaNrBipSDXAnN5w0whFiYFQaR1nvhAqUvpDqzcJfAyc9FAo8Oxu8XRS40NAovZtVU4qxRkXk6E0=
X-Received: by 2002:a25:2142:: with SMTP id h63mr31546706ybh.70.1632142276098; 
 Mon, 20 Sep 2021 05:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
 <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
 <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
 <20210920121725.37es5k3t2p2bg4ml@gilmour>
In-Reply-To: <20210920121725.37es5k3t2p2bg4ml@gilmour>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 20 Sep 2021 13:50:40 +0100
Message-ID: <CADVatmOq7rPV3evSCMwVdxiJx13QW_2mQ2QM9jm_LOGzdHXgYA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Maxime Ripard <maxime@cerno.tech>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Michael Stapelberg <michael@stapelberg.ch>, Emma Anholt <emma@anholt.net>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 1:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sun, Sep 19, 2021 at 10:19:35AM -0700, Linus Torvalds wrote:
> > On Sun, Sep 19, 2021 at 4:05 AM Sudip Mukherjee
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > And indeed, reverting 27da370e0fb3 ("drm/vc4: hdmi: Remove
> > > drm_encoder->crtc usage") on top of d4d016caa4b8 ("alpha: move
> > > __udiv_qrnnd library function to arch/alpha/lib/")
> > > has fixed the error.
> >
> > Ok, since your pulseaudio problem was reported already over two weeks
> > ago with no apparent movement, I've done that revert in my tree.
> >
> > I reverted the two runtime PM changes that cause problems for Michael too.
>
> I'm sorry, but I find that situation to be a bit ridiculous. In order to
> be properly addressed, Michael's issue needs some patches that have been
> unreviewed for 5 monthes now.
>
> However, if one reports an issue to you, without cc'ing the author, on a
> week-end, the revert is done in a single day.
>
> Even that audio bug only got a proper report yesterday, after you asked
> for it.

Apologies if I have missed any of your mail, but iirc you have only
asked me what tests I am running, but Linus asked if I can do a
bisect.


--
Regards
Sudip
