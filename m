Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B07A5A0C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 08:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8A10E142;
	Tue, 19 Sep 2023 06:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB30610E142
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 06:39:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso697908766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1695105544; x=1695710344;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hAyqek3p98q16RahkwI0D/FxxTx4UvCSeS2iR1VVOX0=;
 b=aLhzvYuaFoGhIMBAhFLhUFBU0r12ZPhA4Xn8YahM48eyqh+ZLRSZHQA4Ews/laMc2M
 xpxkOyc9NiIo4kv5gebCddZhDLOCL2vWbAWVQu33KmfZzfIcnyNtieHgtF7z4cTbtbOk
 ekM8V1oT+8rmyFI/r08/bPU8TjAfBmPn30h4RLoG52blHaZivCDwvMSNNEmwiHni/Xfa
 vsXgUGX63epQAiYUSqUg7guXnOgxh60IQ4zVGxWBcUQ+igtPthqMESytPAp99uUAdMqd
 miHS50yCtKGxAeZTtuPQHCkYcWttFIiD+FQtgyygj7XlwDzDz6eG7vwWf9DTUYXbytF3
 /HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695105544; x=1695710344;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAyqek3p98q16RahkwI0D/FxxTx4UvCSeS2iR1VVOX0=;
 b=aBJf6kV/V/jyQ6klbSxb1iPmQRICnTgC5DzeXqEDBOt1JFV7z3ot0ZIyMkR+2/Hodc
 SrvhENIRRumBQP9k0b4tlvijA9oS7YzFZiaBp43VyKRSNu1yy9uqhPPAvZdTzw74Fske
 MzVi5wdM/eLmw2L+jwcuBafOXaShjRfYX7N0SIMM32p6l4ahuouqTxpydpZoXjWP340z
 Sj/dS4uOvzx0pxwVlA37Biz+6S+sEJ+7qZRB8QHezkn561cmVsWQBdtQKOstMaOWyYZd
 8Jvnxaa5caolZYLxcPpF0/a+yqCo3cUCD5/iDZ+kFN0A/PSC63YFRf0tC8VciEuIkkFm
 d7yA==
X-Gm-Message-State: AOJu0Yy6LCxboxPeRxtcfkluZZ+mRKfpAhWdszaKuQY+XHXFs7I7A/1i
 VDXwluhIOXuYEyVR1o3JoyTU2SjMh9+q0g0ThQJC6A==
X-Google-Smtp-Source: AGHT+IEgjR2/6ErhRUie4lpYjXQHuHiGdo1Vzs8vCUTeHBmj44DBDfG/XBjy/ewQUd4zrbs6TUxZaiDsfRA7ZSY4QbE=
X-Received: by 2002:a17:906:2097:b0:9ae:3dd:e751 with SMTP id
 23-20020a170906209700b009ae03dde751mr4996859ejq.66.1695105544272; Mon, 18 Sep
 2023 23:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
 <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
 <87pm2lzsqi.ffs@tglx>
 <167ee2ad-6a7e-876c-f5c9-f0a227070a78@I-love.SAKURA.ne.jp>
 <ZQLAc/Fwkv/GiVoK@phenom.ffwll.local>
 <2784f5e8-ebf4-a000-509e-415e14390e23@collabora.com>
In-Reply-To: <2784f5e8-ebf4-a000-509e-415e14390e23@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Sep 2023 07:38:52 +0100
Message-ID: <CAPj87rNAv_ACFJF_PbWnJjjmSrSOvfVuvOHq9mmza5w=t+BF0w@mail.gmail.com>
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
To: Helen Koike <helen.koike@collabora.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 syzkaller@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 Arthur Grillo <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Sept 2023 at 23:02, Helen Koike <helen.koike@collabora.com> wrote:
> On 14/09/2023 05:12, Daniel Vetter wrote:
> > Also yes how that landed without anyone running lockdep is ... not good. I
> > guess we need a lockdep enabled drm ci target that runs vkms tests asap
> > :-)
>
> btw, I just executed a draft version of vkms targed on the ci, we do get
> the warning:
>
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/49156305#L623
>
> I'm just not sure if tests would fail (since it is a warning) and it has
> a chance to be ignored if people don't look at the logs (unless if igt
> already handles that).

Hmm, dmesg-warn is already a separate igt test status. I guess it just
needs to be handled explicitly.

> I still need to do some adjustments (it seems the tests is hanging
> somewhere and we got a timeout) but we should have vkms in drm ci soon.

Might be due to the locking explosion? The kernels should probably
have soft-lockup detection enabled as well as lockdep.

Cheers,
Daniel
