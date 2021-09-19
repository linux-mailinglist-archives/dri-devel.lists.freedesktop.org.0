Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6A410C9B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 19:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDF26E219;
	Sun, 19 Sep 2021 17:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ADA6E219
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 17:19:55 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u8so5528515lff.9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 10:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uu4R7ChKxFmRN117qtU5kppP9usYorKjw6vZuQDActo=;
 b=CYsTyJJu4O19/TmKYyBVSmHYaNKYjwcgnz+K4BRynZ9dKagvYevt1JhftLDXvyMI4o
 sqktSCFDB94lG0cb75ZURzBbYIB2KSqrhwLp+i87i00SYFE/L66Ll6oFw8JJlmLmBinG
 HSN6mTmNP2FVDEbKH+21DgAUlyBrBMEI3BxtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uu4R7ChKxFmRN117qtU5kppP9usYorKjw6vZuQDActo=;
 b=zvOiC4/EOGHsfl6c+C9xoC1EMYUDPIUtznMJvpnlvTNMiFA/rg4iscihMCUtowCXrD
 /WKfya1Z62YdK/cgSbnBaTn+Q6KoY7wERDcqU88hSkfHFMnB48CK8rXGG06F/LR7vK5X
 07zLhrCBjGwolzXQx7x7lhwXtDYaW7OU9x4S/IIVvJDeyK3a7OKegjSuEF/W3MaYTMgw
 y33uwV5825FCIaESrwORet9ZhLd0/TPMPiSyrbxbBntLlRuucnkO3OXvxlc6QVgNaQ7D
 SPMlKKaQRm51f9Qg4MGAYXe7+PKGxXOVQ8nZr7CVL24yEEbKFT/e5bXYPsXDmjpOOmWv
 svtw==
X-Gm-Message-State: AOAM5301gFrm6Th3r4fZU+ksv0KT4w+C9mCC8j0QU3qzTdzuUyg5FsJh
 lcRRCm63SCsPbAfawrrsOcARzunD1q1LiX3bntE=
X-Google-Smtp-Source: ABdhPJzePoLTC6wQLq48ETdGZaKQ+1oFMtZKzK+ueyWM5YDuPlgB2vqdwphc+TVCtfYKT+TX1UVqCw==
X-Received: by 2002:a05:6512:1096:: with SMTP id
 j22mr1847675lfg.441.1632071992879; 
 Sun, 19 Sep 2021 10:19:52 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id o12sm1059385lfo.197.2021.09.19.10.19.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 10:19:52 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id i25so57322155lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 10:19:51 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr18858267ljp.494.1632071991679; 
 Sun, 19 Sep 2021 10:19:51 -0700 (PDT)
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
In-Reply-To: <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Sep 2021 10:19:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
Message-ID: <CAHk-=whno5+L4pANmwzeT0oT==C179pCJe7_3VwDw=EQ73nSmQ@mail.gmail.com>
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

On Sun, Sep 19, 2021 at 4:05 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> And indeed, reverting 27da370e0fb3 ("drm/vc4: hdmi: Remove
> drm_encoder->crtc usage") on top of d4d016caa4b8 ("alpha: move
> __udiv_qrnnd library function to arch/alpha/lib/")
> has fixed the error.

Ok, since your pulseaudio problem was reported already over two weeks
ago with no apparent movement, I've done that revert in my tree.

I reverted the two runtime PM changes that cause problems for Michael too.

          Linus
