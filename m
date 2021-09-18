Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E84108CF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 00:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076A86E12A;
	Sat, 18 Sep 2021 22:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1476E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 22:15:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t10so42772586lfd.8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OI+BReMWEDWhhCbGGWKSjxgoXMu+PXVPVEM3SVfbuAc=;
 b=MgWiM8MeZ8y6RT/u9FsH9+OFNDgEG4iGscz8y1ZJz7doZW2Vv05F0MoJ8VQ4F4f19a
 /qOAnRx59b9MAGFQFDdw/X8VRGOmwoICPGhT94aTOiD41zU7MTaDD9atwbN1SzZDgx/g
 JpJbT1/4HxmnHdjMelnX4dnI1cFC+LVGggwfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OI+BReMWEDWhhCbGGWKSjxgoXMu+PXVPVEM3SVfbuAc=;
 b=gBPgZw1fzfjBRHJnt/OAr3fYnMWfX1KJdb5Bm7TJIRIYhJNM5Hr1wZ5o5FVP2JUeKy
 wYkkaCKKkR5jJg7/HS8o6ZtE2Xp7HYONPnnZPy/Ke+AneVgeB/NS8GIxbkaNyxZDAbS8
 /t13ReCKHkIypim8GttxzC9TPRQcsysunO2NxsVIfZ64nPWEi5idFehGFaebloIlC0gk
 1JVgaubzkL1Y4AiSyF2L8mOqlueJetzmVAsJf1q04CAuvDD53xiMg8rM8z9nOdx2hCqV
 HTuM828NHCKCaL4PQXr2UtcMoTl7P6sRF8VtSJJ6c5wgm+L8u3SlPMz+kdRnqQC9KxnN
 7kJw==
X-Gm-Message-State: AOAM533c8zK4en+0zWsIGifhBbTxaTrGIkff8jSH+/s+tfiROX7mT9sM
 ovKEv/3Sp/sHVbaroGtVowFkzDJ5BADvHFR6X9w=
X-Google-Smtp-Source: ABdhPJyEgJOTrfFOHF2Ednev2EqdFEeQ+XphBP6v87gjdYoGUIJ01v1FCU87WAKjYUAQT+9KJFlpFA==
X-Received: by 2002:a05:6512:3189:: with SMTP id
 i9mr13221984lfe.152.1632003343447; 
 Sat, 18 Sep 2021 15:15:43 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id v7sm869634lfq.192.2021.09.18.15.15.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 15:15:42 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id x27so49067792lfu.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:15:42 -0700 (PDT)
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr15913950ljf.191.1632003342620; 
 Sat, 18 Sep 2021 15:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
In-Reply-To: <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Sep 2021 15:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
Message-ID: <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Stapelberg <michael@stapelberg.ch>,
 Maxime Ripard <maxime@cerno.tech>, 
 Emma Anholt <emma@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Sat, Sep 18, 2021 at 3:00 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Its still there. I am seeing it every night. This was from last night
> - https://lava.qa.codethink.co.uk/scheduler/job/164#L1356

Note that that web server is not available at least to me.  Looks like
some internal name or limited dns, I just get

    lava.qa.codethink.co.uk: Name or service not known

so your reports aren't getting a lot of traction.

             Linus
