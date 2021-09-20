Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CAF412020
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F646E5AE;
	Mon, 20 Sep 2021 17:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4837C6E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 17:48:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i4so71507913lfv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=quC5lT3BOgEYfLhY7FtmZ9mjQC53OyOAVxF8d8SxaxQ=;
 b=Lf5AKiKS55V+86Q/1I3AQhAa0yFXtRndhaiiugz99ti/LhuTti800lMN9Lc4H0M7vA
 obAg2GE+89X5PTFeHq55X24CnhsMSNpodk+TNKRwjTRP4uZavq0Mv6hx/0b5ArhuBRR7
 XnWVUVCvqAAvODq7Wg0QhAs8xgvyveB0F+Ayg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=quC5lT3BOgEYfLhY7FtmZ9mjQC53OyOAVxF8d8SxaxQ=;
 b=v3e1zvbL9sSL35XxT4/Qr54wMbUPPLWaLQZFZRFHb+5ItOgiJrMSx73T7rzJ6sMUmG
 xMpweKcAn8Q3vm3Uu/ZP07PYpjMjZVpzviNZwVAfyDiaBEDX4SoPuNBIPH57VKVieNqn
 7ei69cLxK3U+xgcdoyR/9G+o6nc7eVEXhwmDE3u5UCp0Jcgb4Q9YBWr66j/j2KyOzBlQ
 mSLObl4kTwAdrZUjEJqCHws1ThB1S5skUS/2XAIaafvq0+ZZS0PZVAVIgid6dUanOuhE
 5Sw+z577dzkuno2T18TwJNn5OdxgnTF5LbmU1DwZT0cEBI+njNCjM0ZhgSdS2G3PeHzV
 +6hA==
X-Gm-Message-State: AOAM533I/wWbjHtkgEHyCLJtwRgQmr/RS2+Z9v8jNuZUzwLOdh/G7rHz
 7q/P7RbwIkISp807Zwp3M5bt2yY90oDSijwc
X-Google-Smtp-Source: ABdhPJy784FVNdbFZZJMOa8vYYbQfCfF+Fauid/sPbRIa5gsW/TnUW45nKdgB/FtlcUBi296/1wFsQ==
X-Received: by 2002:a05:651c:289:: with SMTP id
 b9mr3641889ljo.465.1632160081252; 
 Mon, 20 Sep 2021 10:48:01 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id e15sm735045lfj.163.2021.09.20.10.47.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:48:00 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id b15so52587209lfe.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:47:59 -0700 (PDT)
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr8710634lfv.474.1632160079451; 
 Mon, 20 Sep 2021 10:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
 <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
 <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
 <20210920121725.37es5k3t2p2bg4ml@gilmour>
 <CAHk-=wjG7ZYgZLiRb4boJKOMo16UHO+zNoaxi3B6a9qBtxvzHg@mail.gmail.com>
 <20210920173255.pp5dyaxqy4x2eo65@gilmour>
In-Reply-To: <20210920173255.pp5dyaxqy4x2eo65@gilmour>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Sep 2021 10:47:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com>
Message-ID: <CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com>
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

On Mon, Sep 20, 2021 at 10:33 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> What I was interested in was more about the context itself, and I'd
> still like an answer on whether it's ok to wait for a review for 5
> months though, or if it's an expectation from now on that we are
> supposed to fix bugs over the week-end.

Oh, it's definitely not "over a weekend". These reverts happened on a
Sunday just because that's when I do rc releases, and this was one of
those pending issues that had been around long enough that I went "ok,
I'm reverting now since it's been bisected and verified".

So it happened on a weekend, but that's pretty incidental.

You should not wait for 5 months to send bug-fixes. That's not the
point of review, and review shouldn't hold up reported regressions of
existing code. That's just basic _testing_ - either the fix should be
applied, or - if the fix is too invasive or too ugly - the problematic
source of the regression should be reverted.

Review should be about new code, it shouldn't be holding up "there's a
bug report, here's the obvious fix".

And for something like a NULL pointer dereference, there really should
generally be an "obvious fix".

Of course, a corollary to that "fixes are different from new
development", though, is that bug fixes need to be kept separate from
new code - just so that they _can_ be handled separately and so that
you could have sent Sudip (and Michael, although that was apparently a
very different bug, and the report came in later) a "can you test this
fix" kind of thing.

I don't know what the review issue on the vc4 drm side is, but I
suspect that the vc4 people are just perhaps not as integrated with a
lot of the other core drm people. Or maybe review of new features are
held off because there are bug reports on the old code.

                   Linus
