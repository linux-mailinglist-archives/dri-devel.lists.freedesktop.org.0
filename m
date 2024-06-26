Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5783918038
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907F110E860;
	Wed, 26 Jun 2024 11:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZBbM96sN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAA610E861
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:51:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52bbf73f334so5262846e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719402714; x=1720007514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpjrjZmRsZz45Y4K6cy5Tahj6SJPohhDcpzY7RpiacU=;
 b=ZBbM96sNDW/iPpIFR5FBPDJAWUJH+9b19JhEpMbi+M4YXcsaIXdyZs9el64S6V/6Eh
 zf4nKLzjw76fOyf72RR9akS0ZqQF/oTrrU03OGZCRAS1Mz3pMnz/wYEOUHrd+4SAmwCh
 MvoOpa2Pn4RokpLuK0gJZ7zwMHDwMH/Vfgl9lgJ0c80Zw1TeGHFj83CCWLsVmfZAfaBq
 Gf6hPTCF+DK1xrKzRlkR4vOWb/2EpSnxHbeKlSOXMkUvBoaS3bknLnKzabTxLqx3hor6
 EhsBe+rnDJFDSr2i4zGAix5/1el9dCZlBsz5NihLb3TrYg7ScBliFQd3mXmH3AZVl1M9
 0DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719402714; x=1720007514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpjrjZmRsZz45Y4K6cy5Tahj6SJPohhDcpzY7RpiacU=;
 b=mhX9QcVkse5tqk0jcMI8n4O6qbyS4ZBkNsrCgkF4U3ZnrWd1JcTwHJLbbPvgvXIcbd
 oYDGkv/5E4PgyeYRaDevTv0wl4LZx15Y3zZeuqF4xAqcMKFa7rkWOFWS3uRLaVSXx0c/
 a0lU6KmbAIocRXu5pvjtt2z5QsrMxA9P2k0AIwdL4ehfzl9Bt5zBOch6APc8mMjNp0rc
 eQu2ZjH8GrKqrTUlUB188OHAWqTgxA1G5R/vsAhN06MGkoMGuDt8r+CqCJ9CfRMXjcg8
 7HDgcZt6gJYxmJbrQtCEpYnHlqurknK2MuNSLx2JAO7sKDTI0yvCzLHp2EGqjtGdGbp0
 X0SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3wJuFzBx6OuRZGkNgz4yWOgYPibKLPN6zLGGPgvt92fOjwX92Y4Zv1e7n+ljxI6gkPIPN65UO5dNb6ChKURs3O3QhSpTIzJ5g5x3mPwYW
X-Gm-Message-State: AOJu0YzmLztv97oXNvcIqZAHzqAqFveVInrPnOh92PEZfVOazpy0TDyK
 q3zs9QpojVhLjx7GDaoA/Eq6fwTP5FYmTJ++wfqiKGovvU113q/ccr/eGikxbNvJYvqraIxnBnJ
 gD2GNWL+Jr4iNpM1+3/VQLns4lgEqffNVrbb+Dg==
X-Google-Smtp-Source: AGHT+IGn/BLs09UZTXijTnoE40QKwlRJA0amamIYfiwwfiDRAcDmK1jL7i2Ig/go5BAD0nIbt9Kry0L/xhH0oehqM5s=
X-Received: by 2002:ac2:4d01:0:b0:52c:a483:4cc6 with SMTP id
 2adb3069b0e04-52cdf7f6665mr7139770e87.36.1719402714424; Wed, 26 Jun 2024
 04:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240624152033.25016-1-tzimmermann@suse.de>
 <20240624152033.25016-7-tzimmermann@suse.de>
In-Reply-To: <20240624152033.25016-7-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 13:51:43 +0200
Message-ID: <CACRpkdaYzWkBR=m=sokfXJHvWwdkDXb2r=te0i2J3WMwmFeVWA@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] backlight: ipaq-micro-backlight: Use backlight
 power constants
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
