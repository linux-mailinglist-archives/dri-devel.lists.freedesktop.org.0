Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72187C2FA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 19:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F5310FCDE;
	Thu, 14 Mar 2024 18:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m86/5iSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090B10FCDE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:45:03 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5dbf7b74402so985015a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710441903; x=1711046703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdRUBQjuQKEr2keYvjv61bWNOQ7/Rlg66Padmbb9nNM=;
 b=m86/5iSqPpGuw6YVW+8UDJTlVAqNWeWp7dBIt8jgxSPVX1s7UDW3kSuV86pFo3ieZz
 6NFLp4RSvm6W51gmGZPtZOAGKYApmrgPfDw+ZkbuT82Xr8umAAK44OVoQzRm1xJftnLc
 sp75s1N5O4Y2BPLGITgCs4VatIs1v1t14UxSIN9Q2yo6tSSKFchRNdYO2OwMVvRHg5p3
 7hdlJ8vixwluPyQk9FEMjuhRNEI100srwm/uMtWm3sa2P8BcRP3V4Ms57GJbCx399aE7
 7OP0xP81oaoEOr/bFD2EOcb7kBCdkM3vAqvGsr14PrYLj30bOLvt/imHFP4/0hzjLKRK
 rt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710441903; x=1711046703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdRUBQjuQKEr2keYvjv61bWNOQ7/Rlg66Padmbb9nNM=;
 b=BCuC7x8dhsRNqiZdsB70B1VvrYvOdrLjcrd6rYYMS1XadxowIz47nUJzqkcSmDjEl0
 H89MYwkpmHZsNhDmEilCmUKd1/XoSppXIbhYK09Ef7daRwmU1qpZ65LJ8xkEWxDp8acU
 84Dz8UbxM94s3w5cDzkyeJVEf6qhQR6wIq0yMJ8ShjLE9zrQhGIrHhUF7kkyZg/XhcRu
 pWi4yZCa28fToK2Vx7+KaGfuEjOQiovg8ToOhyV7J9GqDcKx1LzOP8jrtYNpEuYjzVmQ
 HuPSto+Klwgj8ZjC2DPdQyPHBME7zfaoA+RkHw/DgpwKM9Dasp1lWLEyEMfFp8l+scvl
 5imQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP27/ROXPmpuecS3jIxA3mo2GvUeJ7+VNvmoc3zhdmvdoJ+PPW9VY4m4V7wtaVZOkiKHXS6ZcAnyBh78cisFqpeGC7IUqMBKkzD3zw3ph1
X-Gm-Message-State: AOJu0Ywlk5hQsUPbnJg9idHYn1NWhU6kJguUz43oad2kFw4zeipEnspw
 rBoby/KzK30kxXCAopms+ftLfgoy7cdY9y/qGip32r6+2pt37kO2cSkjpi/vUv+1W+iwyfp/BI7
 b9OCeQaR3XgTXBr5j4RJ5TLiucbw=
X-Google-Smtp-Source: AGHT+IElVDkE6h2N+narObE2NptN8URSUteehVkaa7yyeR14RvAyrq7UfdfojrQVblxCfBAHP3mM/HO1U0Dhq5D4HGQ=
X-Received: by 2002:a17:90b:3118:b0:29a:e05f:3f55 with SMTP id
 gc24-20020a17090b311800b0029ae05f3f55mr2569865pjb.2.1710441902809; Thu, 14
 Mar 2024 11:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
 <f17e7660-ea10-4d5b-8234-79251c4c3483@suse.de>
In-Reply-To: <f17e7660-ea10-4d5b-8234-79251c4c3483@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Mar 2024 19:44:50 +0100
Message-ID: <CANiq72=hG65K-Npx1uRxr1SdEZACAQTvAZPD9UgOp129y71NdA@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org, 
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
 Miguel Ojeda <ojeda@kernel.org>
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

On Thu, Mar 14, 2024 at 9:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> As Sam already said, it doesn't seem to make different in practice. I'd
> mention it in the commit message and that's it. Ok?

Yeah, that is what I meant -- thanks a lot!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
