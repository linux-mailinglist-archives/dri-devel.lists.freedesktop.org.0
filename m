Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F2D08B48
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF89510E294;
	Fri,  9 Jan 2026 10:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED4C10E294
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:51:37 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5eeaae0289bso675398137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767955896; x=1768560696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+PrHggOm39VeVydYN6TMkB/guB5c9Xengt3pqY0OQgA=;
 b=iKLmRQmrd0Od1Z9ToLa6pSq42Parn/w8/T1vnM0f0JJrIMK+6t8SGnOahf96o4IC5p
 pQw+ArmIiWJdh2f9P6M++9nnosH3OZMiXE9CIIaDmCPJ75dfJp6z7UcfSH51zh4A+wrx
 m0tgrlSz2i9aUA4tfpOoGW/k1KVoQZyRJUESk+97JM8aDj52oea5nORW9LI6YfYo3O0X
 jezjFr5Dl2Bwa/kOCMtnJBpQegz6+cIpNzJXcmc2iRkUcoVGaVs4mImIN56b6E3yJI8b
 U2Np/zm8K/Kp8DRoqagmaC/jRoOsLzo7/mYWvf02q01cvo9wLqAup9gR+P7VnB7xtawN
 pW1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtx0LnZglChcrPFsWZ2KU3VYyySrcg+r9oXiLbsKKYyWHBlTe9huPhNdU0BmbR0UU3BANP+65gOi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLx0ltb2fnCraFHZIErwcE1fUsKF2WwyYATAttlXdVqRtAE68w
 nRGIOOzDHsG/pveO25YAXqSGyKzPreu2gZwigKuK0LCt9syQfwzxvd8t8irnL6lc
X-Gm-Gg: AY/fxX4rOwXioKk1y3rooVqnwnzBQTyCs7wjp9Uou78BfD881sBnLL0JBI9cXD4cd14
 gWfd2Ex/nXQLkTvz9VolPG6z+Hdjo9KNKT6q8SbjJOYfm+CYLQQCGpnwY4kItDP4opznGGfaSVl
 leNUjPN/9ozwJaFwMpYzSVmXbWbxJ4dK76E4AkQbFL88kDrgCHn4CDm4Mf+5jEBcyUTKnH2JN0g
 N7EIm5utjy42y+Eq62sWr0WOFVKWN2hapXk3nA4kfrEwpjDOOspCdiNASVfhMv3kEjFneRooqhZ
 uy2pgh61lESpHbYyJjT8mOTr55JZOlrlz/fZ+a39boKFO0xLp8gZUWyPB5rgo/cwDXX+ETFbs9m
 9/KX9q/jJSn7utEdJaBD0f2Tee+OXYq6vosGtbkGBiXy8xGzG90APQ3nFwsFTI75PhNBgMdwOMD
 09UCCFRypPHPrxfhUFK0aBcrVtWO7MtInqPZ8v/wXnKLjhm61ZK9nkAlqUwV5a8s0=
X-Google-Smtp-Source: AGHT+IFNcJC0BDyOz2BiDt5cAi0m0cMAQ008xgsM2MJ+fJE2daugnPAn+g8G2jB1LkTbhMB1G2LYwA==
X-Received: by 2002:a05:6102:3a14:b0:5ef:a59e:617a with SMTP id
 ada2fe7eead31-5efa59e6280mr32165137.21.1767955895986; 
 Fri, 09 Jan 2026 02:51:35 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ecdaf1bab4sm8159951137.2.2026.01.09.02.51.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:51:35 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-5636470c344so585180e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5XP2UWVkni/mOq9ATJqUBEHQbNwpP+pJfCE/lsd6QXI/rfhvviK0wrSFmz4tshCyjjHHef3TKJ9s=@lists.freedesktop.org
X-Received: by 2002:a05:6122:18b5:b0:563:4a88:6ebd with SMTP id
 71dfb90a1353d-5634a887159mr2995245e0c.3.1767955895564; Fri, 09 Jan 2026
 02:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
 <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
 <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
 <4e75acf9-2e04-4ad4-9241-d8fd36462404@kernel.org>
In-Reply-To: <4e75acf9-2e04-4ad4-9241-d8fd36462404@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 11:51:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM3JfgDCri0=rq8L8e+bvhZ0EhMvyFD_0v7NJ-Z7v6og@mail.gmail.com>
X-Gm-Features: AZwV_QjshkTYtV04MygmILu94BM_s12nNFHOxgxtfb9evPWzSLQreqflAdgzCzQ
Message-ID: <CAMuHMdUM3JfgDCri0=rq8L8e+bvhZ0EhMvyFD_0v7NJ-Z7v6og@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vincent,

On Fri, 9 Jan 2026 at 11:48, Vincent Mailhol <mailhol@kernel.org> wrote:
> On 09/01/2026 =C3=A0 09:40, Geert Uytterhoeven wrote:
> > On Thu, 8 Jan 2026 at 20:06, Vincent Mailhol <mailhol@kernel.org> wrote=
:
> >> The kernel has no actual grey-scale logos. And looking at the git
> >> history, it seems that there never was one (or maybe there was in the
> >> pre-git history? I did not check that far=E2=80=A6)
> >>
> >> Remove the Makefile rule for the .pgm grey scale images.
> >>
> >> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> >
> > Thanks for your patch!
> >
> > There newer were grey-scale logos. Linux also never supported
> > drawing them.
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Thanks. Just to clarify, is your Reviewed-by tag only for this patch or
> for the full series?

For this patch.

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
