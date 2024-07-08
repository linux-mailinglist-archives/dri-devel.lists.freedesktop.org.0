Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609E3929EB3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0910E010;
	Mon,  8 Jul 2024 09:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0610E010
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:11:16 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-64b5617ba47so27893527b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 02:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720429874; x=1721034674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+26DeDF78WoLLiEz1PmqGvuNHmocCO9aokey/X9KA7M=;
 b=hnEzRaSmMh0TT8cwHIi/uvlxBiSeN+9ZWlt5WMoJ8KHDIef1y8ZfcaNUT5wgrsuQmV
 qGEAGfirwFU0q1QtDtVnMyF4ZsGShKMjD8XP18vSjUMEJmMZb6tk+IG+u6ekCyBIk5+7
 S6Xji1tV4j5Dj3MaM5cizrXA1M2UMQiJ/yXh5k+Kexfp+n5F5jJhkN2gTcZtSWqF4UdJ
 qrPFgdR+4xLXpOcamMFCOCr+IKiUyhp3hjWN4rFVEeohKN1bElrOb1yt3nWgi7DJYt3r
 TubwE7HIuEzC5CNj/O+m1MQYSMmVt7tezda7Cf0WXWr57ginyRWZL+N5OVsI1sTMffuu
 7SwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSZlY5hdn6abtFAaislLNNtKTaZz5LAT9tHt92dBHfef7EXexP1UPmHpSdpC5nSAdaVfM0IFzQar9jjkf1a6jdLw43Cv3JONwi5xoi8NMV
X-Gm-Message-State: AOJu0YzyHNQegdrV/cIs3BnLtKRfic941vnGVa4oRX0u+XSLHndWp7f2
 UGkN4+BXXqxhkC1XJFBi345DQJqaWmFYEeTXPQiVy3B4QKelloxvMaUflnyw
X-Google-Smtp-Source: AGHT+IE/eSF2cxdIwPse5h6CyUh1hwd6lZyLuZnGEWUu35hbLbXhp9LsMuab8RXAlVh3wWlfSfVA8A==
X-Received: by 2002:a81:ab52:0:b0:62c:c65d:8d1c with SMTP id
 00721157ae682-652d8636094mr88948167b3.52.1720429874143; 
 Mon, 08 Jul 2024 02:11:14 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64b3a625488sm35821537b3.43.2024.07.08.02.11.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:11:13 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6512866fa87so30235327b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 02:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUig6CX1D5itGfzhVphBnX0L2rBLjBDTkxwMIqzR+KrPtu5ezWD3XoXbMb7/dHAfghrAfffHDt3//np3DP9xxT68k5Wvzwk/s8e9BCROG+F
X-Received: by 2002:a81:c20c:0:b0:651:6cf1:76b with SMTP id
 00721157ae682-652d5e0088bmr90434947b3.22.1720429873380; Mon, 08 Jul 2024
 02:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 11:11:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
Message-ID: <CAMuHMdW4jmGDa=Ns-BCptyg0r-SydjUq_DVCCD_ELTHm192Fuw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if
 RPM_ACTIVE
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
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

Hi Biju,

On Mon, Jul 8, 2024 at 10:22=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> case it won't call a put. This will result in PM imbalance as it
> treat this as an error and propagate this to caller and the caller
> never calls corresponding put(). Fix this issue by checking error
> condition only.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, but the code for pm_runtime_resume_and_get()
seems to disagree?
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

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
