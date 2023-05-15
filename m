Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76770289C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8699310E18D;
	Mon, 15 May 2023 09:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CB910E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:30:53 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-55aa1da9d4aso218902587b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 02:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684143052; x=1686735052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5HVddrLO4VbxVo027rV2P/x57tsHFKWdwCAhtYMAxE=;
 b=TN13Gw+87AfRdcii2pT2TNUW03S6Qfsr390oJQf/HMbmUJvKDE7b3rrzPfjiuDFzO0
 0B90Euaw4KatLguyam/1vMR1rd8owBBmyB1bnFd+mkplzj/31JgV+2rDsdWv9Ssezdgn
 qarSl/dv+CTwlRF/6DtefiFLVO4sjAfCESoS6DHmEFpaWxFO6TnhEa+lL+UqZ9cy2id0
 fSM4MJ35LkQIYHxCHT4MFrk0/+gHu5OTRIrenPQGND/EkSCM6bNqSdRDHvdvzO3T7m7P
 ni+AvGXjo1uZsNAiaUDRaB4SAdH1v9SsLe3Ps6MerT576xMcLF57UO9YGF21R8p2vITu
 2cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684143052; x=1686735052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5HVddrLO4VbxVo027rV2P/x57tsHFKWdwCAhtYMAxE=;
 b=OUM8p0VV/X06gXjy8+Qa9rrzepBmHkY5vOdhKnh8byL8LF6e1Tsi9OewVA6wTdaBGX
 SxbiD3QdzCDMly2RD4xgqr68ksUwqX1at/MbEV9m9EcYve5/gbh5+DTjhDW6PLTZRfR/
 3aqOsw/Mo4CyE6FoH/iNE0PvfiTW+uBFvks0yVM+M4zx+D879mQWa3xwQ4kd8mppmeey
 wSzvaePG6VAzdih0200umstNSLfmp/o3yqcAloYijLFr5CHnRlb6n1SBse1Uj+5A+kzJ
 bVRFXwtqsgOCjN1CJEzLMVYo8nrhYVw19x0NolTrq5NFrvcel88O70zMWMeBldvWG9/B
 CPqg==
X-Gm-Message-State: AC+VfDxsK/ZYfvy/02YBcZIpwsPcYlz8btoLN7g4dAy4xczfqKsRBC1j
 LvOoVTO5ms2/W6SJRTGa4fK7xaa4h/4gNNHjx96DZQ==
X-Google-Smtp-Source: ACHHUZ53cbL1qOTjniX6VMa/odEjFqcQrgXvzjQa7eIJPu8Cg0KBTQs4biQ3B6AHyW7wAa/3POtyGr5Voby7Lj1Ds70=
X-Received: by 2002:a81:5456:0:b0:559:e965:fee7 with SMTP id
 i83-20020a815456000000b00559e965fee7mr28767440ywb.41.1684143052438; Mon, 15
 May 2023 02:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
 <27ba33a6-2949-a303-14b0-9985b4514e3b@suse.de>
 <CACRpkdbSAc174ejXT9V+kZfRQeiq48J1=kDQvoLvH_tF+qXKtA@mail.gmail.com>
 <61a08812-c452-b146-bb24-71aeaea26e33@suse.de>
In-Reply-To: <61a08812-c452-b146-bb24-71aeaea26e33@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 May 2023 11:30:40 +0200
Message-ID: <CACRpkdaE=v=eyazZ-scUX=SpOB9_CkVe5V9yK_GrSR=wWTt8NA@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 11:26=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:

> > I think I found this, the bandwidth limit calculation in
> > drivers/gpu/drm/pl111/pl111_display.c was using the bpp from
> > the config and this was decreased from 16 to 15 and as it determined
> > cpp by dividing bpp/8 this decreased from 2 bytes to 1 byte.
> >
> > Testing with DIV_ROUND_UP() in combination with the previous
> > fix!
>
> Great. It's the code in mode_valid, right? That fix should be good
> enough for now. In the long term, we could make some of the internal
> fb-helper code available to drivers. You'd then be able to use it to get
> the depth/bpp values for the color mode.

Yeah I sent a patch, check it out!

Yours,
Linus Walleij
