Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B087ADD4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7D210F5BC;
	Wed, 13 Mar 2024 17:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jgiySrCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457A10F5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:44:22 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-29c75e348afso39605a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710351862; x=1710956662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCUUui1NbQfp/vSqXOMgH0Aw3ATqns8Rr34Fh87bhTI=;
 b=jgiySrCokZxR/4iX9sNf2JpTGhg3y6TQEZre17BA8CStWktoe0eCh+gHCyvGOuHZIA
 zTDzIzCbvebjRe1iREKD9sT0g1nUMBZ6xRncLrTzpkvioVegHB++yvDV6xVRebSJPtyS
 xx/EnSIuCjCm+ICQLZnOJsD9XI+cpOpQmgQgEE9JrBnv78WjGCSBgGw0fP4eBUyjFYJ6
 lVkR2/q0IwisDhRwI9wPekUiO1QYTkunLM6Z0tafszI5sTvGGH/b06uDuQZmEz5nVsqW
 rqTk/olYuqmSZdaZ94LE7/woc8RA3LcmWC4Y2GYguz3CBV2yswpyjvHNqkdR9wis2RyJ
 /Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351862; x=1710956662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCUUui1NbQfp/vSqXOMgH0Aw3ATqns8Rr34Fh87bhTI=;
 b=wD8IiChX43kvVZuMvlyZOlO0cnD/r/a005mc7s8M4VjjMfAZeOP9dD+8QGmBf3Nta9
 1C8QStd2W9mR0sdNozNKrqBnOqsexgBIRc8U2IoOoNZJ84Ixs4HFrPm9gRrC84s74h2a
 iO4V26Bo7tL6kQYPrpbhwGKzuWJ1VtSoUhwXgvsX2fI8CZKk0DI38zvaGQCs38UZDf4t
 QJ4H84HKhoUgP0ttZO8GbilQAWyZxJjMo+9PSbosVrBP4ZU4d1WsHDqgtpavaXDcU1Jr
 NWpGX8LSO27UjR2NUss3w1DW5uoZ88RCsytuG2kXFFEBIz9MVQtqGImZxHb/gf/C7487
 +Xvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXAVJWGv0ucJ17FvZAZjM17600gZn7vyHDMzrUxiAs4uvrnbDA7t1pPEXZPk8vTYI7GY0gCFW72dvmyq9cEv9CCVUZ0btO0ve3Dz0jAiDa
X-Gm-Message-State: AOJu0YzgyjVCcmzUASQmSdtnWfXL5H2B3nrvOeJW4M2M6MWNZUeraUT/
 j0fioCJo5tMYgEb+1ejpg2XmEyXV6eF7L5iX4JO6SO5AZfKlSqyZu6k+aiYyvZn2FfeQOGzKkdP
 1bb6Tao/kkj9/SbaVQXTnj33ICvs=
X-Google-Smtp-Source: AGHT+IF9f9pLaLdPeTSCtAhybglIyQQ2XIUnjYf9d7DmVSyCMeubFDXCZGcM00CwqQ2KUlRJTxsSfizN1sbtkt9PlhI=
X-Received: by 2002:a17:90b:4c81:b0:29c:71d2:ac2a with SMTP id
 my1-20020a17090b4c8100b0029c71d2ac2amr806844pjb.18.1710351861647; Wed, 13 Mar
 2024 10:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
 <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
In-Reply-To: <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Mar 2024 18:44:08 +0100
Message-ID: <CANiq72kJj+Mz6QAMuk7y-OeymWZKo9K9ccXaRwR2r0AkHmeKdw@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org,
 daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
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

On Wed, Mar 13, 2024 at 6:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Is there an advantage to making this const?

Not much in this case -- it is more about trying to be const-correct
where possible.

Cheers,
Miguel
