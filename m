Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF914E6B3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 00:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AFC10E50C;
	Thu, 24 Mar 2022 23:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944610E431
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:31:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so10734615lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUdde2mcwvp5FLcF5BVkcO4uhR0gnw4uVhoG7NgX+Oc=;
 b=aXlO/WI50ZLLlXfIaFQuO8OH6UHPRUmwG/mj67PyZZTaqVIDV2iExtDNhL9St5OWwD
 wZrXN0NIa8HPAvrBbR0tG+ybkatyfhdjEdV7+vfLlO4Vtmq1Xz/eAKFNjtpsyP85EUpr
 X1eET4cd2plnz8W8LbmpqbroKj0rQeCZ1me68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUdde2mcwvp5FLcF5BVkcO4uhR0gnw4uVhoG7NgX+Oc=;
 b=Iuw43YoI26T8Ytey62j0lJiRMIKlZCo5LrQLB5m2mMK2Q0NeFfdjYj9bEqciNtO+Oo
 TzFKVHmLgyI47HRVW4J3af0qOBM3O+pyj9Pr4mKsdyNwv5wASSCqt9hl6+eGgucuN3av
 eU+XH/90BU6252zhc9UZDJ6FYJxi4ZUHKoRKXnZq1CwPh6xJuSU3cYKqJo5Z78Nnt4Ig
 qRzXtHV6EfpdEhQ+SxqzephcdpmOEDYomn2dd5UswmEvzygg4u3f8zeAQhRga0TTJy2K
 TUYtwIeDiZDrUmCzvxKaebMWJafSQgONvvZ4vdrhvget+vmUiM4t/uf3JSRjSbg19nBA
 IEEQ==
X-Gm-Message-State: AOAM532a+1sv/b5QXBpBFy+3G8hXLuW4Mn+kLpGhDz2GRC8oWhBdlxJT
 CO9XSH35LXIjAoFg9LspHSo177vnTQSmmAWXjq4=
X-Google-Smtp-Source: ABdhPJxCE7UeCRjZjHf9iTdRHFaQLhNdcSyMuuAcE9iCQnC1poCHteKptmZ41KYivZoDcNT0f1Z0Ow==
X-Received: by 2002:a05:6512:3743:b0:448:5782:8db9 with SMTP id
 a3-20020a056512374300b0044857828db9mr5715815lfs.263.1648164662462; 
 Thu, 24 Mar 2022 16:31:02 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 g2-20020a2ea4a2000000b0024983b1a8dcsm472945ljm.105.2022.03.24.16.31.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 16:31:01 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id h11so8224029ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 16:31:01 -0700 (PDT)
X-Received: by 2002:a05:651c:1213:b0:247:e2d9:cdda with SMTP id
 i19-20020a05651c121300b00247e2d9cddamr6055229lja.443.1648164660936; Thu, 24
 Mar 2022 16:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
In-Reply-To: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Mar 2022 16:30:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimbsaM03q_b2XNR0Aw13C8YoZ36KpyOgyYcefLbK_cGg@mail.gmail.com>
Message-ID: <CAHk-=wimbsaM03q_b2XNR0Aw13C8YoZ36KpyOgyYcefLbK_cGg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.18-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 7:30 PM Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main drm pull request for 5.18.
>
> The summary changelog is below, lots of work all over,
> Intel improving DG2 support, amdkfd CRIU support, msm
> new hw support, and faster fbdev support.

Ok, so this was annoying.

I've merged it, but will note three things that I really hope get
fixed / checked:

 (1) My merge resolution looked mostly trivial, except for an annoying
conflict between commits

        4ed545e7d100 ("dt-bindings: display: mediatek: disp: split
each block to individual yaml")

and

        6d0990e6e844 ("media: dt-binding: mediatek: Get rid of
mediatek,larb for multimedia HW")

where one of them splits up a file that is modified by the other.

I ended up just getting rid of all the "mediatek,larb" mentions in the
split-up files, despite the fact that (a) those mentions can be found
elsewhere and (b) the split-up did other changes too, so maybe it's
wrong.

 (2) As Guenter reported, the fbdev performance improvement of
cfb_imageblit() is broken.

I was going to just revert it, but I see that there is a two-series
patch to fix it at

    https://lore.kernel.org/all/20220313192952.12058-1-tzimmermann@suse.de/

so I merged it in that broken form, in the hope that this set of fixes
will be sent to me asap.

 (3) Very similarly to (2), but broken mediatek DT files.

I hope my changes in (1) didn't make things worse, but there's a
series of fixes as

    https://lore.kernel.org/all/20220309134702.9942-1-jason-jh.lin@mediatek.com/

and again I hope I'll get those fixes from the proper places asap.

I considered just delaying merging this all entirely, but it seems
better to get this all in, with the known problems and known fixes,
and see if we hit something _else_ too.

Anyway, let's hope I didn't miss anything, and that those are the only
major issues.

                  Linus
