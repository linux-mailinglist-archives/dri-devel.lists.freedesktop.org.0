Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679184108E4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 01:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ECF6E12E;
	Sat, 18 Sep 2021 23:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF066E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 23:06:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y28so48484813lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 16:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Te964VqPByhjompp0uyOrJnwZKeP1ELPnocgi50w+F4=;
 b=ZKe2+6zi467DufY6ID7iQ/xPyDlNGTAaSNS44Ftq97xBG7FCfpH/H76PM0cjWp1Us2
 xSf+kEfLwv3AKWjVeT0uFDXHvKcoW1pVZW6xPN+D2hwaHM9OaSiwhPJ3BrXNVbZkldsK
 jMl1eh6F8rSL0O1rj7/hYaO/cdL3VcpswCTEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Te964VqPByhjompp0uyOrJnwZKeP1ELPnocgi50w+F4=;
 b=SSGXGNJId9WZg1aw+w4Xllt4CpNqe7wNlui9mGcRjde8B77SQeYFZEkFxCQCCS/0B+
 BlW2MT8oPjnSgQoheo+LGXjaXV61cuz4u2NGHygQKsgSeh3BCvaTpNODWGD+UgqzdiKo
 t8XXRF5bk8oM1srh9diiKc1NJg2nNvPB+K6Fw4jxBtXhvJyPru02e1vXQ/kUbkl/ukxI
 gH/1eEw2xMYCH5wb26W9Pe0lB6B5TAqw5b6lLKeiVmlqmMrXOyzlhrwCQymC1Zi8rLCJ
 dHjGnN1D6HrfSnnS4CobVdyE+3Prs33gGeiSyWSz0JwD+GC8UadxRwdRMCUk0Ag8v3CD
 mn1A==
X-Gm-Message-State: AOAM5331Akc6EMNgTzLYVTqPXilkLqoT/yxx7ulhgMKgprFUgTND6U2p
 TkNFg+/6nOPZ55MuMS6MPnwZdTVPO7JdeWvJa0g=
X-Google-Smtp-Source: ABdhPJyuPs5i1sn2Uz/Ls2FYRsHIMM2vCBoqHnJ1J3KM287q83qrTEwzEHr1j5i4X87IQash5sshVg==
X-Received: by 2002:a05:6512:33c2:: with SMTP id
 d2mr11433544lfg.18.1632006413143; 
 Sat, 18 Sep 2021 16:06:53 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id k20sm796094lfe.271.2021.09.18.16.06.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 16:06:52 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id y28so48484635lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 16:06:52 -0700 (PDT)
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr16051415ljf.191.1632006412113; 
 Sat, 18 Sep 2021 16:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
In-Reply-To: <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Sep 2021 16:06:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
Message-ID: <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 3:48 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Also, I have now tested by reverting those two commits and I still get
> the same trace on rpi4.

Ok. I'm afraid we really need to have the VC4 people figure it out - I
count do the two reverts that are reported to fix the RPi3 issue, but
it looks like the RPi4 pulseaudio issue needs something else.

Any chance you could bisect that?

Actually, looking at that first report of yours, the RPi4 sound
problem apparently happened in the range

    9e9fb7655ed5..7c636d4d20f8

and while that range does have a drm merge from Dave Airlie, it _also_
has a sound merge from Takashi and various ARM SoC updates from Arnd.

But most (all?) of the changes in that range to the vc4 source code
came from the drm tree. And Maxime in particular. I think.

            Linus
