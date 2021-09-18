Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF294108CD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 00:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB716E123;
	Sat, 18 Sep 2021 22:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C86E123
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 22:13:09 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x27so49048622lfu.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUhWRezl8u5tAYOifSzgxoGvmMKw0j2utihzqtFMU3Y=;
 b=G7RlTiXb1hmxugnHn7dQYjSco62fLoPVZ26F2KYi08cTHeaP39JD3V2JXCMqGbsBk7
 wBqxQDiga1ktYvJwZUwmOsb4ONdR4tYsxK1Yl20PMlcAzAzhRaqduR4QLaduyfFgSQsf
 kfu/ovUePLOJPLHAJ114B4kEE7CcTgRLfK23k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUhWRezl8u5tAYOifSzgxoGvmMKw0j2utihzqtFMU3Y=;
 b=c8Nw3HJYzBLP43bEPkqML1vmKv5ohpSZcr3R3kRHUHHJH8qwpjhOuU7NxiojtqtNZn
 bdajNuTvu2tuzy5T4Gt47e92kVvKMFONuvAsfv45NpaT65mfhxlZEiwxeoHFUByrM8Cw
 Ll7sygOscXV4G+PyWjQf8CSLGh2rEYcwBEXiCDa/r8rMESHb93AdOrEHFwbqKlYn8+4m
 zscMvuirI5VnSSNyplo9bnwu4oxZ+PO5QS3nnG6rp+8oICqm+Wgm7QNqFpcCl4EVINV2
 5x9YYKmoldnz8WpPVJLQJRnxSBXdrpJ1ixJe2zWZfDsFY9kl1QUZjeqcqYiFtq0hN66L
 GxOQ==
X-Gm-Message-State: AOAM533k85VCBCS8ejt0B5YQQSVLTmtl9TY/TKD/xqXH9sTOQxqDjEYx
 NFs8cqiyw/Iv3hglBB5K7eeF9DikKLZXfDdtev8=
X-Google-Smtp-Source: ABdhPJwkpycTd5CoJNeSQFC2t3WQosPQdqesTxD1AVtZfk8t6AkZ2YDSUwSZ43GVg7R34YrWnafJ3g==
X-Received: by 2002:ac2:5b41:: with SMTP id i1mr13221667lfp.25.1632003187121; 
 Sat, 18 Sep 2021 15:13:07 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id h4sm867794lft.184.2021.09.18.15.13.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 15:13:06 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id x27so49048445lfu.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:13:06 -0700 (PDT)
X-Received: by 2002:a05:6512:b8f:: with SMTP id
 b15mr1203616lfv.655.1632003186110; 
 Sat, 18 Sep 2021 15:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CANnVG6mOWLeLHtFrAA9zWzZRtZ6+E1EYYW5+ekwC-=rAEcB71w@mail.gmail.com>
In-Reply-To: <CANnVG6mOWLeLHtFrAA9zWzZRtZ6+E1EYYW5+ekwC-=rAEcB71w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Sep 2021 15:12:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEUga9+qFKqQUD7+k3VdAwfmx5PwHh6ChsO0_oFCOiCA@mail.gmail.com>
Message-ID: <CAHk-=whEUga9+qFKqQUD7+k3VdAwfmx5PwHh6ChsO0_oFCOiCA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Michael Stapelberg <michael@stapelberg.ch>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
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

On Sat, Sep 18, 2021 at 1:13 PM Michael Stapelberg
<michael@stapelberg.ch> wrote:
>
> > Michael - do things work if you revert those two (sadly, they don't
> > revert cleanly exactly _because_ of the other changes in the same
> > area)?
>
> Reverting only 9984d6664ce9 is not sufficient, but reverting both
> 9984d6664ce9 and 411efa18e4b0 does indeed make my Raspberry Pi 3 boot
> again!

Since you did those reverts and fixed up the conflicts, would you mind
sending out the resulting patch so that maybe Sudip can test it too?

Maybe the RPi4 hdmi audio issues are related to the RPi4 hdmi problems
despite the symptoms apparently being rather different..

          Linus
