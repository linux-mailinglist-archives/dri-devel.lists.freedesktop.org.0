Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E420EA74324
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 06:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE410E1C9;
	Fri, 28 Mar 2025 05:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ILL0qpgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21EC10E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 05:06:30 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-51eb1a714bfso1723159e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 22:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743138386; x=1743743186;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCE7GTntYqSA2aC4XD1nczisWULGvBASqmrfxCUaKwc=;
 b=ILL0qpgCNYuae3Q3MRxbYq8ZtNWHqWJ+DeNDaj5ufMpIC4UWUFGFXM9foohY1rkhLS
 oQ6/LoR32zwXenl2jA2h+1HvPXq1PEzf53B70ea/yDCFD9d/pwdaYFwyOZaLTY0hcW+L
 bMmkpwjsi7PLRkG3lHlkqkW8zkZ1iMpJcdX1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743138386; x=1743743186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCE7GTntYqSA2aC4XD1nczisWULGvBASqmrfxCUaKwc=;
 b=LTw/L6aDsggFufNtyIGnTV9zYWvjEH9EWnaBfWDAGtQbpLGxRkv3NdTBtM+k4Et27X
 QHAdyKb8wanf/S+U4hyO4BJlgUO3iq5hvCEvwUExq7LVRpOlASvl7WqLt7QdoZ9XTgvY
 r1Dp/6hRxIa7adE6yvjrsz51PowitFPNo9nVDuo/gp0zoghoOSazDQW9WkLjQrjDFEHB
 HllUFDOOqKPMfVXlJcrjDuxj4B8+0Q3mXwfQgXASIPPd8RJ8Dm0DbL7ZBC1Vaed/Hyaw
 exBvD3e4qSy09QjGMwYDkwKrOm3KUMvmL/Td+wauOfxQu+F5WwJvozeWl+CANDDkeIXr
 Marw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkl4ZXSmxmt3d64M3hslGFS6SS4hakVdmkyUZX5ohO1YGUJgvF2fznAM6HE4jISi4r0s5QJg54BMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL91zFi2eyxyfxJabvWKHYbNtgSOxypOc0jJAH69bN3kNFIXJt
 6LotKijVv4GUI1JMVkm9iWmjM29ld3JEFlqZlWvwQtyRsvkBYzJiLwN4JKXA9syzvbLB8/79SC4
 =
X-Gm-Gg: ASbGncuOAOkQ832ildPLdZCxQXuQIclMzNkTLqUZD/WmtpeDolMQg6JT0pmkhRGs7wf
 ihf4aqMSiJQSXpAPUJetH6hSz1BsA6+d/n1KB1ANKpHtMTDoJ+sPcwpMDRyvZZIOR16xumWDVyF
 z+P26jQtvjbkAZvc3tjY2QTow15KT+x9MZwVqUdfboWNKzFaYSZi6jztXH15XoI0E6T/8JLdKs0
 oqMseRL5dmKozB0ZEM2SPTvkkddb9M3rQW2Bk7n4vTCB6zWrGv/Fby5+kJUKw4/RI1NUbePClMY
 kr3ZIMntvioAOzSc6A812nwNjkgSBk8TZ5U/zWOFehbQKtFRS0tdzDL+67sfKLSriRUKw1yVutR
 e1U2x
X-Google-Smtp-Source: AGHT+IE2+kmAq3w7bZDsjfkBYEWv0vzO8alK9ugaPjkyu5c7B3764vCfnAgcJoksAd/GPjXMII3oEw==
X-Received: by 2002:a05:6122:a1f:b0:520:62ce:98ed with SMTP id
 71dfb90a1353d-52600a3145amr5909111e0c.6.1743138386118; 
 Thu, 27 Mar 2025 22:06:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-871a3389526sm228239241.25.2025.03.27.22.06.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 22:06:25 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-86b9b1def28so1669644241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 22:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAyPOl5MMxA2eAkOiaSNMfo0qWm+lT6ZeanFeQiV5jGHMDMihMqwbXj6ISjRkEPMsJ/rSN6CIxqPo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1594:b0:4bb:c8e5:aa6d with SMTP id
 ada2fe7eead31-4c587067e55mr6354275137.17.1743138385225; Thu, 27 Mar 2025
 22:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250325081331.1965917-1-fshao@chromium.org>
In-Reply-To: <20250325081331.1965917-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 28 Mar 2025 13:05:49 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngKqPNwQphqD=31nJ_aLFQSDZTutRkXBoJQ2toh88uU4g@mail.gmail.com>
X-Gm-Features: AQ5f1JqpvGGgqSHXl4XTQPZ8DaVc0ASCtP3cW5-tkw39h3dpa_7wqVobe709AjM
Message-ID: <CAC=S1ngKqPNwQphqD=31nJ_aLFQSDZTutRkXBoJQ2toh88uU4g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Simplify INTERFACE_CHANGE_INT reg
 clear write
To: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
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

On Tue, Mar 25, 2025 at 4:14=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Simply clear the INTERFACE_CHANGE_INT register with 0 and replace the
> indirect `x & (~x)` pattern, since they are logically the same.
> No functional change.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Hi,

I noticed that Xin sent out another patch [1] to completely remove the
block where this patch tries to modify, so feel free to ignore this if
applicable.

[1]: https://lore.kernel.org/all/20250327120558.1272081-1-xji@analogixsemi.=
com/

Regards,
Fei

>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 0b97b66de577..df2d1dd95d01 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1586,8 +1586,7 @@ static int anx7625_hpd_change_detect(struct anx7625=
_data *ctx)
>         }
>         DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x44=3D%x\n", intr_vector);
>         status =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> -                                  INTERFACE_CHANGE_INT,
> -                                  intr_vector & (~intr_vector));
> +                                  INTERFACE_CHANGE_INT, 0);
>         if (status < 0) {
>                 DRM_DEV_ERROR(dev, "cannot clear interrupt change reg.\n"=
);
>                 return status;
> --
> 2.49.0.395.g12beb8f557-goog
>
