Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63F8B984D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6410E798;
	Thu,  2 May 2024 10:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e2i9Ch6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410B010E798
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 10:00:15 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2b3c711dfd3so245908a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714644015; x=1715248815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jlTYG9vHv+Kk/nSExLseCcWYaSQ+I1BuCKbKEGymUY=;
 b=e2i9Ch6bQjV0Sx6sT9zzCrMXKPz7HBkq6A+9u/kNX+tqQp8xdBTeK4bDtEZhV8mkTX
 +SJoQDMQ/CbvE9oliKOfnnLtlKDaGpsdmPS8j0MJDc3tjYvVurQJQigQy0I4Sa3WKkGk
 RJNKZu4MCRqA/7MLo+27/tIlJ/4BZJboEz0WQdKxlmntnFcL4vT8R2O02h5LSS/+86Np
 RUoone7inbUH/bhZSK6sQnxler4rr0w3YfKloJyloY+JXZFZHFw4+ySpp+r3NlaYXTSA
 m+jaZ0XgTbNe8UAMFUy2aOItYLEsGzWdJpYODyHgeMakj3okt76rWt/yk1JrX3hZAT5X
 2BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714644015; x=1715248815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jlTYG9vHv+Kk/nSExLseCcWYaSQ+I1BuCKbKEGymUY=;
 b=Kh/YyqSPhto0Lqkh4xoHSHwppwZ0dYF1r4MPnbK2mSIS+YZt/TSm4p2ZUf4WG/1Cnt
 8dcg5BDRJmR0YF7sy8B2Df6b9MLOzdlwgy/xmyirqZNssgfj9SiWwOviVsJptESoisXY
 YvXBLohH4bSck6VqNsXFQvrGyHgK5f/D6nna4ZaIxuLnoEToUZ/OY+GZBdtBtyISf92p
 JpPyTxUgVq3YxNwbdCxyN7X/3RX+XCfK/sc5OOvVKXogAnafvKUgI8Frch1cNOKyaJ2N
 dK0zcNbHph1MLWxkI86NK1F44QJVsv/e+BnWbBowjSj5t7bRUjhb1fHwQeb0F8UF9ta7
 mKoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6AUdDDF48NkotzQ3bevjeNEkADpfZQnUah4rIliBw+JYFem9/EPDyparwiGcinYrDHN4GbI3rG0Fl7NH6favfEmqG9cvEtchAICQHgXt6
X-Gm-Message-State: AOJu0YzJxrM+8fkL/waJF2AqLILzrMRFzqyxfciaOeNCL5JfKpDejnxr
 ANvlDijaWxQHmyIwktwv1L5Uc1XJMTr+GoWeVMyUi03qbdEeiAmMxnU0CPtUwVLXawYjkab8u7x
 K6PLmkXpEbxz3WJ6tnrGUjpnWx+4=
X-Google-Smtp-Source: AGHT+IEUUsxz2FqNCRKrlLd3iOcD1MJqsQo+2bTELDCjLfSEv9td5Hp7tE+SN0ytUqa2A4nCjVwOC5GVl19cUORFy9s=
X-Received: by 2002:a17:90b:3d6:b0:2a6:c503:95f2 with SMTP id
 go22-20020a17090b03d600b002a6c50395f2mr4930182pjb.16.1714644013879; Thu, 02
 May 2024 03:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240502063621.65687-2-shresthprasad7@gmail.com>
 <20240502093623.GJ5338@google.com>
In-Reply-To: <20240502093623.GJ5338@google.com>
From: Shresth Prasad <shresthprasad7@gmail.com>
Date: Thu, 2 May 2024 15:30:02 +0530
Message-ID: <CAE8VWiLP-QR_KaHBPYjA=UVJ8SShpKseB5Xp9Hpkd1RMcvt-qw@mail.gmail.com>
Subject: Re: [PATCH v3][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
To: Lee Jones <lee@kernel.org>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com, 
 skhan@linuxfoundation.org, julia.lawall@inria.fr
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

On Thu, May 2, 2024 at 3:06=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 02 May 2024, Shresth Prasad wrote:
>
> > `dev->of_node` already has a reference to the device_node and calling
> > of_node_get on it is unnecessary. All conresponding calls to
> > of_node_put are also removed.
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> > ---
> > Changes in v3:
> >     - Remove unnecessary braces
> >
> >  drivers/video/backlight/sky81452-backlight.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
>
> No idea what you're talking about.
>
> This patch/version doesn't exist in either my inbox or LORE:
>
>   https://lore.kernel.org/all/?q=3D%22%5BPATCH+v3%5D%5Bnext%5D+backlight%=
3A+sky81452-backlight%3A+Remove+unnecessary+call+to+of_node_get%22
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

I'm not sure what you mean.
The patches show up just fine:
https://lore.kernel.org/all/?q=3Dbacklight%3A+sky81452-backlight%3A+Remove+=
unnecessary+call+to+of_node_get

If you mean that the first version doesn't show up, it's because the
commit message
was changed to better reflect changes.

Regards,
Shresth
