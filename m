Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FCAA9A6E2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DBD10E111;
	Thu, 24 Apr 2025 08:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uC/vkBuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C4110E111
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:52:47 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3105ef2a06cso8021811fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745484760; x=1746089560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pi6I9/2PW0WKwJeejN5o1HPNrvvIUYugrgLnZZJ7Pu4=;
 b=uC/vkBuVyv5KAodN+tOYiVDsiFtgID9nLLzsVoqNNeZ2BkAwmy4aptsBhzM0jjnQXd
 IV65PY7aagJrIGNSBf9VsCd3frVB8c0PJqpFTMwzUrlbFoOjyRYM6M3YIlklgffY2RY3
 HwoxSwyYCNrYvP7nB4dma4IQ0dr1M1T++bajLr2gokktZEJqBXceC+cf93LXFin6i+go
 OqvBsDHWFT5dfpm805Os88F4rd10JGNXjmkZ0EB87Bqzjy9HOpynMaLniH1pqN3nkkPJ
 oZB1flsCfwtPgSxi8TxfPioF2ip2xxGklLgpQpWucuGrmMsALoCmF0V2e5fHiOY/B/F+
 jA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745484760; x=1746089560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pi6I9/2PW0WKwJeejN5o1HPNrvvIUYugrgLnZZJ7Pu4=;
 b=fVA/OEibbLM1TON8USq0sDNlPAb1caOgxKnxosMFWvRz6GpqetqtJsW+bV3Q30YJ/a
 VN4Hkm9IQh+d2VYQAnd4cQCrK/LU+o1HGMNIX4tenj9uKheZTjrzbWNtpAdNwHspWm8v
 JpmNgFw+HVETKek+EfnD4AK6+ZYLgnLuO6EjW5kB/vLW20t1pBrDPIqYDIueBSJQY06G
 6CntZtfGFq6QmWSV+DWQc3rCVj7S87jFFG0OEEGaqAEMut8YLrQ5SnF/VFQJBkOtLiQH
 67c4IzXpKs3RiRyX0wf2oISkxteCpGRbykUZZ1L/5lLESxGgrCudoOwCFWgdVOTd9Bd6
 7EkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj3wGt0PKtuEfgzRJPWJmrwYMP9ERnRGectDMp/VjZ7leQWr+1FV2FsgKNFgzTpgYxjuQsmI7QRwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylYVgndL6AHTuAaMo3WY00PuxYFvoSO9xNzaXkrObdUdCji0Jt
 Xg7P+OOATpbom0OZ6tqo+W7r7BPRRqLfcyU9PGQVjiz2UTV1QEmWQjOOpPlgQNAI6FndLRCkaf8
 4RnfD24kGg9qIwLx1Iy3riTzBbUfpl1j5l+EsHw==
X-Gm-Gg: ASbGncsMojF5XlL0YWsIFz71OvZ5193vMacHeq/ITmUEkdblDcmz7+9x39A7OG5QIQX
 OlM4y5sz0r3OPU6ThlF7Cq8usu8Svnclx3abDSpy9gfgUNu7HYexO55HQCre4dBqlTtplJZQIfn
 PvCg1k0yPtqsZs0NFSgx8HVsSvZqIstGoQ
X-Google-Smtp-Source: AGHT+IHAB9LWhYEooDYo0NS7+cNeVroUrJMiu/TtDGjCg2QMPYKVyjyzVDKPg2dN18XgA6c11bYigJex/WlKFNej81k=
X-Received: by 2002:a05:651c:241:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-3179febbfeamr7382591fa.30.1745484760431; Thu, 24 Apr 2025
 01:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:52:29 +0200
X-Gm-Features: ATxdqUGMaYSVPrnrhvuCdxBcM9tsozWah8p2gB0BcCstcebhaxaVqziqhHfQoJY
Message-ID: <CACRpkdY0d_a8qzN2bJD+yzZ0P_twwPM21yV771YoABuVQzXAUg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: via: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Apr 8, 2025 at 9:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
