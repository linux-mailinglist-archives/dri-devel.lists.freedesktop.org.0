Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD393410A84
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2918E6E195;
	Sun, 19 Sep 2021 07:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005446E195
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 07:26:42 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id p2so20401236oif.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stapelberg.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDHbXpvjg7dh+SdjhCDfS/UfB5aQ7bms3z+R2HHi9QM=;
 b=j4JUpiyu+e76qetV9HnbyikzXtuRU/4t5ml370KvKUgoXt0TeEzfcn1cvqfxvGR95d
 Ag12cIZPc4cstlHWqR5p93s3xQ0wHqW/vs08oG+wC9RT1SfTHSZQR4svs0lH98ur7IdI
 xRE39voiGRmdMOxg54LqxMmW1x5QW5XTKz0ffh+KlsfhvkdbYUafyuft8h1V2dZmwU0k
 jyGnfwm7gKGGHpPEcnUeU+/WDqwITkrP/ZQJ1j2FVs8Qn0F/QrvQJrrOihIoaOHAhOly
 8JnC8AMjy1fhAEYSn4XebThmpUeaIJNRntrtOPKy59kzngMvXLAZbEG3hMW2dfgTz8nQ
 iKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDHbXpvjg7dh+SdjhCDfS/UfB5aQ7bms3z+R2HHi9QM=;
 b=W6OVQNfbHNID+1taY12lDHai46VLTtVNmo/Ner099q8EvJUise/D17Nh+s5q3nV6An
 3J3FQiM4CdkcOhAoEeRkdzgoOnppNaObhOnSuD344d1yniML2NkeaEflGVXl++lprO0E
 lZ+GXDZMFHzUb7roDPI1cC0DCA7g+O4tC22VX3rF2q5nNHS3attt28IAnI+9R5HyoQGs
 PcsNsBwxstZuhoA2LZXw5HjfxdfwUK2sg8K4LkIYEIJFqkoWBRGuHopJ2AwXJMFvhJwo
 lbXNWUCHCCPxi2VMjzMakGfE6lPiCPZwItT8umWLq7rlVwz+XoBykriWYmHIAO04hqaD
 38HA==
X-Gm-Message-State: AOAM531I6cEWQOZ90TYhe+sezRCK0dU0iYqJ+40Ra1acrE34h4kI8vit
 dKzzL117z6IRyS3iOFWdPGcsTWAGqXH0Cs+DS5Ud4w==
X-Google-Smtp-Source: ABdhPJz7iTm02nClVPkBcacP44PjctVezLYsMbHv/+viqtpIIEag9MsGHQl1g0hIqNGNRzoXYGiwvC51mEY6V4gkd2M=
X-Received: by 2002:aca:ab51:: with SMTP id u78mr9864945oie.177.1632036402315; 
 Sun, 19 Sep 2021 00:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CANnVG6mOWLeLHtFrAA9zWzZRtZ6+E1EYYW5+ekwC-=rAEcB71w@mail.gmail.com>
 <CAHk-=whEUga9+qFKqQUD7+k3VdAwfmx5PwHh6ChsO0_oFCOiCA@mail.gmail.com>
In-Reply-To: <CAHk-=whEUga9+qFKqQUD7+k3VdAwfmx5PwHh6ChsO0_oFCOiCA@mail.gmail.com>
From: Michael Stapelberg <michael@stapelberg.ch>
Date: Sun, 19 Sep 2021 09:26:26 +0200
Message-ID: <CANnVG6=JQgAvnrJa5U6imdS+0+Cn=poogdi_wiV4fFzngwYzaw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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

Sure, no problem. Here are the patch files that make it work for me:

https://github.com/gokrazy/kernel/blob/d04d64114aae51aa27752adca6080ed4c9a0c70c/0001-Revert-drm-vc4-hdmi-Make-sure-the-controller-is-powe.patch
https://github.com/gokrazy/kernel/blob/d04d64114aae51aa27752adca6080ed4c9a0c70c/0002-Revert-drm-vc4-hdmi-Move-the-HSM-clock-enable-to-run.patch

On Sun, 19 Sept 2021 at 00:13, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 18, 2021 at 1:13 PM Michael Stapelberg
> <michael@stapelberg.ch> wrote:
> >
> > > Michael - do things work if you revert those two (sadly, they don't
> > > revert cleanly exactly _because_ of the other changes in the same
> > > area)?
> >
> > Reverting only 9984d6664ce9 is not sufficient, but reverting both
> > 9984d6664ce9 and 411efa18e4b0 does indeed make my Raspberry Pi 3 boot
> > again!
>
> Since you did those reverts and fixed up the conflicts, would you mind
> sending out the resulting patch so that maybe Sudip can test it too?
>
> Maybe the RPi4 hdmi audio issues are related to the RPi4 hdmi problems
> despite the symptoms apparently being rather different..
>
>           Linus



-- 
Best regards,
Michael
