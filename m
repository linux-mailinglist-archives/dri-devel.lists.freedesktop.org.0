Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D185970FAED
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C895810E47A;
	Wed, 24 May 2023 15:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA14110E47A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 15:56:04 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-561d249f045so10969417b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684943763; x=1687535763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/xlNHQmCJGrJgMwJlbp45hBjwc9f0+Hviv/Ik935io=;
 b=fbp8Bh3OSU1X+wmq5XXLv8tSpuavWHm2zd55wy1mnkOfs5dYp1Tz69LT0AVZ8eueER
 oMEjkM+74neIizlbdBsMaIDlcOxOmEyq5gvBozT4tdgTC08ZRA9h26DAFv75qVEx0CfH
 oSJaQi+O+8aozZXBlIy680JM6/eWqicUCON+cS56KFGZnh1gABbwQLp9fbA9OMBjHmdl
 XTgEmrZvxNLGkIPtO1G2vgb4nkXhk8+x8h/6Qm69K2rNil0TJ5Jh/mBDDgEhF2ATfwhk
 oTxsZ/3hxuh4pX6gJIsn3DF1OQ9r+hIBkAPY74mAfDFpUlP2Ll5J5EePPHwib4kXfN/6
 TBoQ==
X-Gm-Message-State: AC+VfDyLHvqonk5aRA+V643Z4pt2nsQK6graV6C5O34xcZUOm51v6Vjl
 W9S3a0mQZLAxkas9fI/gtrsplZpugEbt3w==
X-Google-Smtp-Source: ACHHUZ6aQfN4iSmhwfqCrw5svR0bQ4QnrCQlVlbmVgqkYaeFxr1YbPhwOKsE6y2nxh7qQpBNyWlsXg==
X-Received: by 2002:a81:9c4c:0:b0:559:f026:46d1 with SMTP id
 n12-20020a819c4c000000b00559f02646d1mr18182043ywa.40.1684943763284; 
 Wed, 24 May 2023 08:56:03 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 f4-20020a816a04000000b00559ec10f245sm1675154ywc.103.2023.05.24.08.56.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 08:56:03 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-561e5014336so11053607b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:56:03 -0700 (PDT)
X-Received: by 2002:a0d:ca50:0:b0:561:8350:babb with SMTP id
 m77-20020a0dca50000000b005618350babbmr16530033ywd.49.1684943762898; Wed, 24
 May 2023 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdXN7_bEodiW4M33JPhN0ZQPZ+Yj66qQk-OOK9ugqhhWtA@mail.gmail.com>
In-Reply-To: <CAMuHMdXN7_bEodiW4M33JPhN0ZQPZ+Yj66qQk-OOK9ugqhhWtA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 May 2023 17:55:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHUGm2yES-EL5Rk2mSdCgcmHi4k9BO37qxXQXhqEWuDw@mail.gmail.com>
Message-ID: <CAMuHMdVHUGm2yES-EL5Rk2mSdCgcmHi4k9BO37qxXQXhqEWuDw@mail.gmail.com>
Subject: Re: Convert existing KMS drivers to atomic modesetting?
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 4:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> According to [1], there is a conversion guide for atomic.
> Unfortunately the document does not have a link to this guide.
> Where can I find it?

I found https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-driver=
s.html

Obviously it's a bit outdated, as the helpers pointed to in the first
step were removed in commit 21ebe615c16994f3 ("drm: Remove transitional
helpers") in v5.0...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
