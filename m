Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BC91803B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4E10E861;
	Wed, 26 Jun 2024 11:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wcq7DIs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68F10E861
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:52:19 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so4777984e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719402737; x=1720007537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpjrjZmRsZz45Y4K6cy5Tahj6SJPohhDcpzY7RpiacU=;
 b=wcq7DIs2+CpW+kg96iiB9v3RdyxYjBpV70OcRzEVEsERGUt6ySRZr6nnCJr1odPT3L
 gJOa0wI5I8eMbdB1YIPUQEFaEvwGaYfk88hhwqvBMg0uFbSnT1gRZU9jZXQg9Px0b+OD
 UwqCjfhrR+RRkCV5V9eHTGrKjEWApO8Fx3t+sbVXgaAqrYHPsh++BfL07sUihG2qOW1I
 1dSNkJ26sVW+nPk62hEvtHDcfSMMkGGi6COW/gX573ujYykr95pXSyMSsaJ0OEx47cUF
 ReR/Y163vWOby6WH/WU2B1AKaC7/7m5HQH6hebmBA+Fse8Js4x7ysFOdi5MpumcOzMDo
 zNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719402737; x=1720007537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpjrjZmRsZz45Y4K6cy5Tahj6SJPohhDcpzY7RpiacU=;
 b=aBXaGiRNN8A4LodFxkzJf4/+5/yvmxy5GP8A58EuGfC/t/NKmaJ9jEYDyWs5Fy6xdf
 meITMM41Du05OIbB6pQ/AezVx0TQMBy6f1oQpekvmbhO5LMcUZakC0WIxuT6C6wyatE8
 kpJzux8z0EmgBtrthm6K/swTR6tAwEe8ETuIF+PvqCTIYwPxQBEe2iDCum76Ik/c3wo2
 HOzYUT69ZQigmCfdfB/gKdofy3t11dcJ6NYsFZUHNsoLbeTbB5etngKT9BOI3XP0E9FI
 WZbcCHsaDedZ5fnIujop+3Q9kh493sN5rxvnhWs7h68EbPWtH4czrLTecPIH/Ix89dTI
 a62w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzyiQKVP/yPzaN2voQosY6ynvJXpL2z59QB70X0kVINC0vDWDQQu8Myg1Y+ntkOmYWVj68ntkuYbTIyaDqcmI50R7Xlg7QC5KHuH7uPw8Z
X-Gm-Message-State: AOJu0YzlDVmNSMKwSOBnrukfGVorwERMyQla9DNgtcpB9wb20+2IWOLx
 WMMZN/gsArFjUufeUhLNwUTEmYBJzeD5RrE5WTIPzKLWShwzAFrJ9I38iy5eYoU9M722zq4vZTs
 bW9BymLPojMC5KDthyNfAxhBqiyxXqH+OyUye0A==
X-Google-Smtp-Source: AGHT+IFt5Y6rNkv7qP0DY/jJs8uCxG3fud41/0H3+Siz9GLV1bZC8qZKtVnvB2O2VW30MKoOlKv1yDATTfc64MFALP0=
X-Received: by 2002:ac2:4e09:0:b0:52c:d80e:55a5 with SMTP id
 2adb3069b0e04-52ce183aa97mr7510215e87.41.1719402737078; Wed, 26 Jun 2024
 04:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240624152033.25016-1-tzimmermann@suse.de>
 <20240624152033.25016-6-tzimmermann@suse.de>
In-Reply-To: <20240624152033.25016-6-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 13:52:05 +0200
Message-ID: <CACRpkdb9CNMw1z8q6gQb0Pi6fZhOfXCoiM1s5QdszRqgbxa+Lw@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] backlight: gpio-backlight: Use backlight power
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org, 
 jingoohan1@gmail.com, deller@gmx.de, f.suligoi@asem.it, ukleinek@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org
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

On Mon, Jun 24, 2024 at 5:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
