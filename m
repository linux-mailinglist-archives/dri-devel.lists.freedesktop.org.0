Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3F9B0F0F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8205E10E0E3;
	Fri, 25 Oct 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dVLd8LOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426410E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 19:32:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53b1fbb8be5so2549140e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729884758; x=1730489558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YNXBWXjhsZyIQldGW6G1S9FbbG2idqyPgFLxk9omLZg=;
 b=dVLd8LOYhP55pOTMJ/YKLsZMZ7itAPbD3+HtbW23QZoxNRFtPNfLwtmrS08E3uQBk5
 PlGSMKT764Efs+kMIuzdU1B/0/1p/bcIyOsW/9DrPuHJ4rQroFOvpFa+Awt4FuXpMmK9
 6iJaIKTxnmcni+QhlRyzELihbsd/Cw8Jvf21U141P29jiDIKPHK0vczJ2DP25bPEYPzM
 QY4bp+QoJCuzZJ+kZxbUs1yR/mj3qcKBeQiNUx2yYXJ9LL7PYnK+RAgMVyXoX/tG0KKx
 wU93Sdhdij7bdzWUF5oNTaVVBNP4owddFRQ0CLxwCkr79ByrtoVw+zQRDqcrHJOUBhrB
 HCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729884758; x=1730489558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YNXBWXjhsZyIQldGW6G1S9FbbG2idqyPgFLxk9omLZg=;
 b=oX+sHdcTuN5e4n7KL9/el/Dfr8fZMohmKzQbvUUR12Wu8B1jeTe5oJm4mXC0CoiebE
 RRZBsizCgKR5tUjOUTxyUiIFJ1aez1esN0eV43Og9TVmp9Nsn6avrmzdX4GBPQas9uo3
 TVGnZ8OvzERJAY8E+O9ijGWFD6OGZGNROjBdMMng7nZpWlroO0fUKyspWlwr6565APgP
 2x7yT1Or5iODsN+ZB+L8EMCH9uYjpvpGEQG9PQFbtpukP9uc2/MVXHmgyHej2B0cDAW+
 3ePihqjNnp5VzKKAf5KrOb2m3Nq4OF7Fgy4ZoxZf3pRaQ8I4UOL5p7BXSTOAkHfA0O1s
 1lkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9nGqbBIlrqsYH0gtGz43ubhRir6VgBfmFpt2/7h0PKU4iK+xtN2IUAeoN7a6vM07kfheuVtjSRsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKVXTTauPhs0nEc1GyVYXYOEBK1qsbK1uLYQ87J+ujUNpWeuZ0
 2VZWYudLqx2ZOruxVK6oLIvMI+ejakclUPCdfgNV63RfxfP038Bex69oSenVSKlLC/359Z8qM4T
 nG7FQcPysmGDjYaqRNQF6Ayc/ep4B/9LyAKuRhw==
X-Google-Smtp-Source: AGHT+IFLkzZ+wz+p+8WFoTEL7BHuwKGT7/kp/mS0VJouAv7JpyextHokY5bgqYOvVyRs/rvthT82dHBrrhPH7m27hXg=
X-Received: by 2002:a05:6512:6ce:b0:539:fcf0:268e with SMTP id
 2adb3069b0e04-53b237094admr2369094e87.14.1729884758231; Fri, 25 Oct 2024
 12:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729738189.git.jahau@rocketmail.com>
 <886ce1a2443dfb58496f47734d1ceffd3325fb4b.1729738189.git.jahau@rocketmail.com>
In-Reply-To: <886ce1a2443dfb58496f47734d1ceffd3325fb4b.1729738189.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 21:32:27 +0200
Message-ID: <CACRpkdYp+3sqbZPZt78wKaJPUxh7yq1+WS6jnZ9fFSTROJAqmA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip
 option
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

Hi Jakob,

thanks for your patch!

On Thu, Oct 24, 2024 at 5:18=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> The way of implementing a flip option follows the existing
> panel-samsung-s6e8aa0.c [1][2][3].

That driver is notoriously hard to read because it uses so much
magic numbers so please don't copy that aspect of the driver.

(...)

> +       if (ctx->flip_horizontal)
> +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x0e);

#define S6E88A0_SET_FLIP 0xcb
or something like this.

Other than that it looks good!

Yours,
Linus Walleij
