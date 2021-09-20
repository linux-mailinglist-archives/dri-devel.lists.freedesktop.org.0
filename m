Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D904411CBB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3706E595;
	Mon, 20 Sep 2021 17:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAC46E595
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 17:11:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id e15so31742350lfr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vd5FDJp/Cqf/+76tU4czUAMMEVauYWgC0xxxkAUywqA=;
 b=LleEKnQ0zpQBpWbXgFvOt1UZjDhHE7qTolhbcBIkCjXc0KmfFCp1EWvrqarM1pqAdb
 8818JG4MzGVo+nl9VQFjBoJeGamZ9RIAXvN/bTcoAa7DD0Jh9DIUIAPPG6saVYA3Ctx7
 ykgqTn8hnQfiQQUPmCCmFH/GG/9Mv+3M8iSPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vd5FDJp/Cqf/+76tU4czUAMMEVauYWgC0xxxkAUywqA=;
 b=Ab8CV+cnHv87gXFZZUv88hL/PLKTkVL3XtVmO9RFTYxoygYb5y+d2D5dxYWmCzrgz2
 B5HTGmduJ8YFUMQJzq/ERjk/iOO0ovBuWpuPzWzhCPZ775pYdcB379kNl40tHDOlm8ta
 a4n2uNcWVXM/m1ZMwu6n10YgOVKBNbhngf8D4WiOetJZwQUbe/4C1+xcUh/RpSk9ZhsL
 Vgss9uaEiXwZcS+LQguYFCoZrdLQk/ec39b83X3LL/Cx2KWAWaJcoZT+NpUEsQ0XzmPn
 R/enY2FoOOpdfHmT+9Itxykbv4aVCZ0bAMqSw9HWYwC4QHsPRu6I3NBVlItISQ6lW7GW
 EBWg==
X-Gm-Message-State: AOAM531s2eP9gHugyDAZXvaZrXmK3hYXRArhTVVCP7AhPzdlWi4x/TBy
 S/Q7ycVtKs0rmnmO/E1t+8AwJhEfUHSyKqAW
X-Google-Smtp-Source: ABdhPJyNxCv4u5QvxSO5aDJpPGDhpM+6LbQQyOpehqJdXDMWtuCC8MgHQeVnRIEqNzUnUzDIcrOPtA==
X-Received: by 2002:ac2:442f:: with SMTP id w15mr19202706lfl.491.1632157877510; 
 Mon, 20 Sep 2021 10:11:17 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id j2sm106569ljo.45.2021.09.20.10.11.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:11:17 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id y28so68988113lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:11:17 -0700 (PDT)
X-Received: by 2002:a2e:5815:: with SMTP id m21mr15992048ljb.95.1632157873099; 
 Mon, 20 Sep 2021 10:11:13 -0700 (PDT)
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
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Sep 2021 10:10:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
Message-ID: <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Maxime Ripard <maxime@cerno.tech>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Michael Stapelberg <michael@stapelberg.ch>, 
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

On Mon, Sep 20, 2021 at 5:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> I'm sorry, but I find that situation to be a bit ridiculous.

Honestly, the original report about the pulseaudio problem came in
over two weeks ago, and all you seemed to do was to ignore everything
that Sudip said and reported.

THAT is the ridiculous part.

The rules for the kernel are very clear: regressions get fixed or they
get reverted. And I saw absolutely _zero_ indication that you took
that pulseaudio oops at all seriously.

            Linus
