Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E1B3EB37
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D095310E4E0;
	Mon,  1 Sep 2025 15:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="EidL1I17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E55410E4E0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 15:45:14 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-71d60157747so34490807b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741514;
 x=1757346314; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vc+cyyLMv3ZDCW9TrBfgm90Y/n1yLM6D15As+zF4o6M=;
 b=EidL1I17nTSPOWXCNHrWZKE4UprJM/Xd6dBsDSbtQSjAjZF48NghCXOfd/V3ar/jg9
 +oPNSKjMzfYYDXsTWBmWqx2wp4Rr99C8X142uB4iklpXn+gmLlAW2nezrn/pN2h4ZMTo
 /xWMaAYT8A0Txwca6s0cNQCZ+vVRAJkPm6ks140xdkD2w0DB4JYkZhxP+cc1V8IIA2TA
 iTgQUj5Wp9cbX6LICy3E/2YMUJcGnqWJ6xabWOsdlLDCq4CcNdqTNOcl5rCuxDMBv4c7
 EP2pvOxJX3yDjjBlPhcKc1xlSBEz2SiRi7IP8152SvRouCsvzGrg5x39xYxTS+Y6vJbt
 MzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756741514; x=1757346314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vc+cyyLMv3ZDCW9TrBfgm90Y/n1yLM6D15As+zF4o6M=;
 b=bjmN8tRfBCisIhgNvJwdYNzl+oJJp/cLrM2YLW4d69JPdXBvWlOpEhJ4S6U3f0MeoI
 bDtSRH9VJc5u+HfoVFp2QKqavZutEJTnPIAg41+3sl4498ndS2bplzQGARnLc8kkf6rM
 2nylTGAVN44P0sBrcu3bvdLuW/EOOpGffypkogYlXnL55YFbTCoIeLiNW5dA+bf6Wse5
 QV89/HZezhsZ1EbT2ZqBkYtErLkYN+I/AMmK/IRZ98Q6S95bQlXWaG42aKKQZY3io0Xd
 SwD23Hx7WdvLYxycp4C3mIp6IeksuW+FqUjBmylsInkajbtGNaMywJ51/UpEzhYCbRIC
 zlAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhUmV4jgKE1bcVKTgqiepmSVd7Ai6lgxCBPxmvpo72TvxdeWli67w6vwuKarysOQLA3MQ3mroVzNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTYqqAGJOOg+9k8nMCgJj/ZYEw5vQnhv/MUS52tp1mBU9bEV6u
 rFBTqLnQ6uRKUoXA5NBYhFD6Tom8BIBzrLFk8ljloFr/9fBhybGbKX31lwBXEJK8OH+XqcvcypM
 YLiP2sPk=
X-Gm-Gg: ASbGnctS4SW/iQZwktH91e/2ecHqsWZMZl9SltWbSKhreqjRukbdc6VzHuzlqboiifv
 1b1SOuEPP0XFla20hkV9thFfFz2m6zKOAgk27AQW8yPB4HeYfVMpi87r6MwwvhqTriKZ2PHcj6/
 5YRiL28qOQe0hoKa3nzH4sTrDG2SRq4FYJk7e5JvpYqdo/wSsthXVDki18jeB3FVBPNs8WbCHkO
 WLNPUDrbuUN09kDGe2NwOICuF4t2rf86Y/gVMAEOeCmUI8qNHfXekHE3x3YuPFDeIJr2iyCYW4A
 JgFC5tWC60P5DR78pNehnbvqSHdO40KGND07exMKCGpUMKWc3hlZVtDzJwv1abfjgFliycR/4wK
 lkDSEc49wRcOXNMFZIw6MDFyrKRLUc8iNKukjiTBg7cDrccxrmqCw4qpnD3lm7QfZjKvpgA2ZGQ
 o0IWMV7Sv7O9E=
X-Google-Smtp-Source: AGHT+IGSi6cFAZZL8+O/mvdP7LgUHjtthBDJfrjJIW+sCXF8D5Cz9V6lgDC57xW7D4hljukaf/5LkQ==
X-Received: by 2002:a05:690c:d88:b0:71f:9a36:d33e with SMTP id
 00721157ae682-7227656f463mr95844407b3.48.1756741513545; 
 Mon, 01 Sep 2025 08:45:13 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7227d5d1736sm15557047b3.15.2025.09.01.08.45.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:45:13 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-71d60157747so34490567b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoNoW9zyBuxBv+i8NNzEdPZvLKZ0JCyggz9M8nyChuh8xZ9VGlQoD80zyNtYTDe96c1ApXs41MvGk=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6004:b0:71f:db79:994d with SMTP id
 00721157ae682-722763d887dmr101946407b3.19.1756741512904; Mon, 01 Sep 2025
 08:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250818185658.2585696-1-heiko@sntech.de>
In-Reply-To: <20250818185658.2585696-1-heiko@sntech.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:45:01 +0200
X-Gmail-Original-Message-ID: <CAAObsKCGbS4kkYjFvQONjF7RWbzNRejCGMi1puzHnSpsR4pguA@mail.gmail.com>
X-Gm-Features: Ac12FXzZ3kIusG_YEYmGkUAIbd5-b4np1Jxp8QvWXSPz6RxKWESjaAnxctrV8IE
Message-ID: <CAAObsKCGbS4kkYjFvQONjF7RWbzNRejCGMi1puzHnSpsR4pguA@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: Check the correct DMA irq status to warn
 about
To: Heiko Stuebner <heiko@sntech.de>
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Aug 18, 2025 at 8:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Right now, the code checks the DMA_READ_ERROR state 2 times, while
> I guess it was supposed to warn about both read and write errors.
>
> Change the 2nd check to look at the write-error flag.
>
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Thanks, Heiko, you are right, I have applied it to drm-misc-next.

Regards,

Tomeu


> ---
>  drivers/accel/rocket/rocket_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5d4afd692306..3440b862e749 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -422,7 +422,7 @@ static irqreturn_t rocket_job_irq_handler(int irq, vo=
id *data)
>         u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
>
>         WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> -       WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> +       WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
>
>         if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
>               raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
> --
> 2.47.2
>
