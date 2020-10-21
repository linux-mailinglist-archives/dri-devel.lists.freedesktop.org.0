Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E806129513C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0059B6EE1C;
	Wed, 21 Oct 2020 16:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC446EE1C;
 Wed, 21 Oct 2020 16:59:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 13so2887135wmf.0;
 Wed, 21 Oct 2020 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOAwZaaZ/beDzvPjh4DfLLmuqS+BF1EdS0841cgpzLs=;
 b=KrcsCvPHQglJCf7oeEF5m7FV7XdFHt9x7F3gW8Rhm9Z1S0QRti2sdPhJRUd8nmCeIQ
 3nz8sdNk6BgUkY8f1F5JlMV1K0uL8nFfwxgu05ZF+h8mNRaCen+I8fHu2qwMEhXuoHxQ
 JTFVDgrFTd80wy7wECZ8QX6wcnuGl9kt13IUQGXxcIPJSeOsOY5kwp/AW1iyvLdjBvlE
 jfDbRMYRgpFMEECXiY7u070ca2FPFZbUC3+HpA7VTRRHbRF3eJzCfaBym6LyQzle5fXa
 WaSBCbwTh+MoUYuuOsfK7FkiK03/r7t6PaZbFWgBBPbVE14yW1uU1GbLQtr2syg0vJUc
 CNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOAwZaaZ/beDzvPjh4DfLLmuqS+BF1EdS0841cgpzLs=;
 b=I+yAPyKqck/xjdbo5N3tvtJA5cgClvIiEawGzj2pv0WNLgt7DJaNyGRIXzikbEyWmZ
 O7iyAfoT2V3FBH57bEEoFF7LBrC/hplLLFSFwUdzh5zGTeYPkQFjUgUZdx8H/c8NAUDi
 rapVKDmRx5+GJ50ix6AGhqsTBo3YL6I0GqK46nYIfIopBbEFOTkHyJUlnWEK+DZjf83M
 Ph2RfPrxY5HiiFLV1g1LTHKeo0br0pMWKGQQGfngrz23H/hq4lh973d0hE7UFw0ozxIe
 WT7xxHdOyWbZGn8Ik4QrSFd9pdByZgcc5Z9jbKG7KZYdAfPYw8ed1kH0LKp1NbHz5Xha
 bsSw==
X-Gm-Message-State: AOAM53260uJLvkgOSCtlsWmBvxuFktNbmndA946033XZnNSztu451UW+
 dhee+CRc7TThY7SkrLhV/uP3TaJSf795ahHF+OE=
X-Google-Smtp-Source: ABdhPJwu3PAB+EK3ul320vHDvWKoXxQTAQwJyBX44XCUJZtWcWL6PCNBwIxZExqEpwyJy/GoRVJba0GldZXaq6LR/GQ=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr4787948wmm.49.1603299549106; 
 Wed, 21 Oct 2020 09:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
 <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
In-Reply-To: <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 21 Oct 2020 09:58:57 -0700
Message-ID: <CAF6AEGvAK_mAxJB32vvPOD3jumpYprRtUBPT8GRBV8gty7fxFQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, freedreno <freedreno@lists.freedesktop.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 12:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-10-20, 11:56, Viresh Kumar wrote:
> > On 28-08-20, 11:37, Viresh Kumar wrote:
> > > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > > the device). And we can call dev_pm_opp_of_remove_table()
> > > unconditionally here.
> > >
> > > While at it, also create a label to put clkname.
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Can someone please apply this and the other drm patch (2/8) ?
>
> Rob/Rajendra, can someone please have a look at these patches ?

Oh, sorry I missed that, could someone re-send it and CC
freedreno@lists.freedesktop.org so it shows up in patchworks.. that is
more reliable counting on me to not overlook something in my mail

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
