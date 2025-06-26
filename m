Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF794AEA207
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 17:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F023E10E2BE;
	Thu, 26 Jun 2025 15:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zk/vrWey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29BE10E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 15:10:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-553b9eb2299so1998593e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750950634; x=1751555434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axf5NbpAUzrmzPpqLLrUEqqBeYpEBv2j8XoiaPjeVEQ=;
 b=Zk/vrWeymS7TZJbKemw1FLqNKWF44jd+Isyt5llDpnQDf4u4u9IJQ8CfNXNkU5bjV4
 QIQRP49SRmjE6jenLjGRzedAocd6LdKDe1nuWsb2swr5EQvKK4S8qa6p1e1237xHazNq
 TJI3otKybjGPG9Uf6GzL4r+5W7Q16E1mqJ+cytPPE0I3BxGckZxDNNHk9ZWPTSzYzb2J
 kfcIFqjcgk+1c/lX5a8dXb4cWisdreYlLIilUAVjckcvG2uvKBHO8n1pUlWLWU79ACB7
 R4veI8t+1zP0yo27AKbfxydfisD3x8Zsb3CtfHZQdaUteUaXwAEWnwBmgbcAPtXC8Ne2
 1WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750950634; x=1751555434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axf5NbpAUzrmzPpqLLrUEqqBeYpEBv2j8XoiaPjeVEQ=;
 b=eoWYMiALJAHoegn/Izs5ly+Xpc6sA3PMeNosUZ61KYkdOR49XsQSzr9M/9sittaGhF
 3W4WQHba2BW6EF580D7ZFSss+l6T34Ze6Ywm1RkwsU68jsyeGgki2UALTaJan5ySTfUt
 vVCyIAnGY0NPJq1N7ddNqEc1+GOyZ7eg9tK5t9d9lstIZeCZwWZjVGShncdVouMJ/3Zr
 MlGQGcLO7juV2q0byGD9x3oZnVUVz7dU2WdHdrBA0pbcUkFW/o4Wub+yHK0Vgl8YPzn+
 R4ERzyMMXNk1B1Y1CskOTvB2MidoltIeiPrcYZVtOpCjQt58Al1KABzM7bgBm+s8gHiY
 u6Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu4kgMDYOJg0cwY65+nkqw9hlMQ7Byz2f3L0GAigg928k7jete7x1K9kYWC+Jz/r3Aej/NGyWLxNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3PKTB99monlGZcTZZaSL6iQSIy5zDQjI4yXSKgAjIz/ESrHpo
 DPGBOtRkJg/wBz4GYOArQ2P1K52iRSWfHH7ClfCzJF8BVIy7rMirgyuFOg7iDAoccRYuGzHa903
 +Vgt9HVjLaIVdyBc29mq/bKZ7qrKfQXk=
X-Gm-Gg: ASbGnctxPOloKUyOfTe+HhSxoZMG9GC06C4w1KTTDteaOgho9GxSIG790QGBz+PtbPH
 HitbTX8i2m7U8BBT6Vx2xuOYefO1n46aytiXvJJiXfuHJ5HEphk+u0OGmjoZZi98hkRgraFKd18
 kMBhnMcpnh9SxjfhlAlmQZnoaSWCIP9hhpA124IKEVMI1E/is+ydXvp6XQmyu2ZtI0AwsUemkPY
 bHCNA==
X-Google-Smtp-Source: AGHT+IG3aKdtoEX8k5XdMgWvxuQl/T0lmpkWTNORwe1brAkFFcnT7EjGtyotrt42fszQPUKuv/8ziotoOqBGlnuUj28=
X-Received: by 2002:a05:6512:239e:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-55502caf1a4mr1616123e87.26.1750950633544; Thu, 26 Jun 2025
 08:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
 <5baab2ed-c48d-41ae-819a-71ca195c4407@igalia.com>
In-Reply-To: <5baab2ed-c48d-41ae-819a-71ca195c4407@igalia.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:40:22 +0530
X-Gm-Features: Ac12FXzNyUo0k5FLeYm1nQk0x2e9IyduCv2spuHDSlghF9NcaV2B_Em4IpBcyCY
Message-ID: <CAH4c4jLqQORVWNLmNGAqevbSCnALtkfod6gTuXe-oae0izR9Bw@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, hamohammed.sa@gmail.com, 
 daniel@ffwll.ch, airlied@linux.ie, arthurgrillo@riseup.net, 
 mairacanal@riseup.net, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
 gregkh@linuxfoundation.org, sashal@kernel.org
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

On Thu, Jun 26, 2025 at 8:32=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi Pranav,
>
> On 26/06/25 11:22, Pranav Tyagi wrote:
> > From: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> >
> > Currently, it is possible for the composer to be set as enabled and the=
n
> > as disabled without a proper call for the vkms_vblank_simulate(). This
> > is problematic, because the driver would skip one CRC output, causing C=
RC
> > tests to fail. Therefore, we need to make sure that, for each time the
> > composer is set as enabled, a composer job is added to the queue.
> >
> > In order to provide this guarantee, add a mutex that will lock before
> > the composer is set as enabled and will unlock only after the composer
> > job is added to the queue. This way, we can have a guarantee that the
> > driver won't skip a CRC entry.
> >
> > This race-condition is affecting the IGT test "writeback-check-output",
> > making the test fail and also, leaking writeback framebuffers, as the
> > writeback job is queued, but it is not signaled. This patch avoids both
> > problems.
> >
> > [v2]:
> >      * Create a new mutex and keep the spinlock across the atomic commi=
t in
> >        order to avoid interrupts that could result in deadlocks.
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
> >
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.1739=
76-1-mcanal@igalia.com
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> This patch violates locking rules and it was reversed a while ago.
> Please, check commit 7908632f2927 ("Revert "drm/vkms: Fix race-condition
> between the hrtimer and the atomic commit"").
>
> Best Regards,
> - Ma=C3=ADra

Thanks for pointing that out.

I missed the revert. I now see that commit 7908632f2927 reversed
this due to locking issues. I=E2=80=99ll drop this backport from 5.15
accordingly.

Regards
Pranav Tyagi
