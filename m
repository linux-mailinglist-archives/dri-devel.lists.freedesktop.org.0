Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E678A3773B2
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 20:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9668689C0A;
	Sat,  8 May 2021 18:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC36889C0A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 18:51:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 2so17470021lft.4
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xjuz5nHo61d9Wa4XmkNxBJhrgcOJsGcLtL7RrIrVjys=;
 b=HhycAKccvwZg03wbw4Xro+QgymNA8sh992uA7x85dJAQ5PvJckrSDoeQfzpru8L/NH
 a+XxuFunPAt04tL8VZGAhW/zAXq/OscqdcLDXanw0TZ1iXza13lMdpBcvozdlRRVBcDL
 gARVDCZBwnKqISkpdCz+VzbLqWbId+MofVlkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xjuz5nHo61d9Wa4XmkNxBJhrgcOJsGcLtL7RrIrVjys=;
 b=cJV/AhlVGdVGPwvzyrKD5Qvvmz+Emh+Q3KSncrMWm2/EbW89N+pB9PsGlk/UTrDNKm
 hrFq4+5cMYcFLL0LjQqxU2553g9BuylpDn0xgKi86T+Wz/A5xqqshhHRp1kzUtUC2xPz
 KNdfQkBZzvWy7b07X0+g4g/9uDNAI4OyR4z4qoky2LMiAwZgrET/U8oB+gF35jU0JX0S
 atBzlAJY2oT3oqXglG7QuJivFJmAxbSGQ3SiYrQGu7I8CjIeECPoHBz+WcLHXLlAXNFO
 HrVrgMmYee+WKMTxDtT1m0P8odH/b2LqSjbZvzIO3kHxA4zNyldooNTw/qnKXihh7WMP
 +5nQ==
X-Gm-Message-State: AOAM533bS3B9rkEFHiX9DxN12CZpvuCtqW8I6Hrtk3BaLXmr8lavk7tS
 UIgWoEkJO5ZsUnGNmUjoaL6fbGu4vZ0zV6kFDKU=
X-Google-Smtp-Source: ABdhPJzQGFluo2DJfkduUoSaL44VNcDdP7CcvHDPwJxS1QVijCC71uB01YXRZSqlUHu8CpFKN6ESWQ==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr10913599lfn.54.1620499888824; 
 Sat, 08 May 2021 11:51:28 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id d25sm1687833lfs.235.2021.05.08.11.51.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 11:51:28 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id v6so15750546ljj.5
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 11:51:27 -0700 (PDT)
X-Received: by 2002:a05:651c:333:: with SMTP id
 b19mr12571082ljp.61.1620499887537; 
 Sat, 08 May 2021 11:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
 <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
 <87bl9y50ok.fsf@intel.com>
In-Reply-To: <87bl9y50ok.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 May 2021 11:51:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJsh4FOcMQ+eDx=f4joa-CCH1pmYtrsw0H7L0HV_GhJg@mail.gmail.com>
Message-ID: <CAHk-=whJsh4FOcMQ+eDx=f4joa-CCH1pmYtrsw0H7L0HV_GhJg@mail.gmail.com>
Subject: Re: New warnings with gcc-11
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have heard nothing about this, and it remains the only warning from
my allmodconfig build (I have another one for drm compiled with clang,
but there I at least heard back that a fix exists).

Since I am going to release rc1 tomorrow, and I don't want to release
it with an ugly compiler warning, I took it upon myself to just fix
the code:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dfec4d42724a1bf3dcba52307e55375fdb967b852

HOWEVER.

That commit fixes the warning, and is at worst harmless. At best it
fixes an access to random stack memory. But it does smell like
somebody who actually knows how these arrays work should look at that
code.

IOW, maybe the code should actually have read 16 bytes from the Event
Status Indicator? Maybe offset 10 was wrong? Maybe
drm_dp_channel_eq_ok() should never have taken six bytes to begin
with?

It's a mystery, and I haven't heard anything otherwise, so there it is.

              Linus

On Wed, Apr 28, 2021 at 12:27 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 27 Apr 2021, Linus Torvalds <torvalds@linux-foundation.org> wrote=
:
> > I've updated to Fedora 34 on one of my machines, and it causes a lot
> > of i915 warnings like
> >
> >   drivers/gpu/drm/i915/intel_pm.c: In function =E2=80=98ilk_setup_wm_la=
tency=E2=80=99:
> >   drivers/gpu/drm/i915/intel_pm.c:3059:9: note: referencing argument 3
> > of type =E2=80=98const u16 *=E2=80=99 {aka =E2=80=98const short unsigne=
d int *=E2=80=99}
> >   drivers/gpu/drm/i915/intel_pm.c:2994:13: note: in a call to function
> > =E2=80=98intel_print_wm_latency=E2=80=99
> >
> > and the reason is that gcc now seems to look at the argument array
> > size more, and notices that
>
> Arnd Bergmann reported some of these a while back. I think we have some
> of them fixed in our -next already, but not all. Thanks for the
> reminder.
