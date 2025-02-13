Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08617A33E49
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0EA10EA76;
	Thu, 13 Feb 2025 11:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WYwlGHoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFC910EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:42:14 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so8456691fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739446933; x=1740051733; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXGik90zFEErIbXZ4EVYn0O5awc5+cnFs54/iIUj2Oc=;
 b=WYwlGHoFUPEiKWrStruT/eOIl1fMvjWTBWG/EtEYqtK1RFfK5p3tUhrP81nVH/5F6n
 5i9X3S/ZPrnTKONAeaSQ5WdosvDLTApWqSbrvFzfCZlHll3OP5zQWUnGsLwus3R5hDnB
 0oH1hpV6/5pEBP9PDeYfnMhhkdsnaCA577/ULlP7ZU0jmWFsKdIiCHjThdIVz6wl+d2C
 wXAvSzYsM6Y+qJ/CNIDH21O3bQ4kGCRKhBs7NF8CBxOEv2jWUfTqpAhzRGvlFN9VLDsd
 RT1P+oZ2I0Y//Lvc7UKtJ3P5+7KWnfMqXtOghIMmc9aAh+S10f7hWPrFcS1SkvKycEOX
 YbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739446933; x=1740051733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXGik90zFEErIbXZ4EVYn0O5awc5+cnFs54/iIUj2Oc=;
 b=EgU5lwx2F8tbAEGlSOEej8Z58fFni3d0C7c2jkFyeHYDyLTt+CWRYwya1D/v6gao1N
 JWMxH7jz7gGDobrfKC4UpwxcTzFMGw2VOyrJ+PGNfzA4Tm3EGQB0B/Ak8jWJP7+At4JO
 1G4xEDx9DFLSu2OE3sUXwjD5RdFMrFGG96EjHvqi4v/fNv2HjAMAOhTCmnpSQ5VwsMTB
 3TuimDfjqmRyDElgxTY/ZJ36766TAZoO+aJpL7Y6X5BVsgZ4ZXbHMEg4qfBTwhMkr/EM
 Zr67T9MhJa3/BU+dLayhxjonR7OV7ODfFwFsUc5N52SX3dfQByy3qQfN4Yfbnwxyrd2K
 5+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhmFeBIc65nGyVOA35i2oLgkqrq56jT0PDCPTtkhV0QRkCgtp0UP8jNYy+LAF6yfQ/zPUxJe62an0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0CIxnUWD0vf8KIwOimqobb/CXRRcJ5Nm9Rj2kFqmqVtDpDNer
 hrEeWD0Lk+osXDHcivUhTBZQ8tXOBqP+ZZkdBkZ/pH1RFk/1odGWTpI4SEjzGSHXe32AV+V9+7c
 YaHsHVx4AAWCBU1wmUeTTWILy2EnWbcvXap6adw==
X-Gm-Gg: ASbGncvqZLi3Mn7aD0QGrJQz/gJhrEIS8lD8cWNyauFRgNQhQ/ZJ/J2oOCE8rBezjYx
 xjlv48KdZiqFJTs4V6/RflnV1wtU/vu6QiODLHGKR7YxFWarMtLGrH4Eb6HON5pNK2dVcagVb
X-Google-Smtp-Source: AGHT+IFVHA1GVeEKScMhYxf6Sfu4AeJhCGGmNc0XDmJ4H8gjxLKVfGQw8pEnoDX3laoXTfatQUM407vchatoIxg0pdQ=
X-Received: by 2002:a2e:8a8a:0:b0:308:e956:67d with SMTP id
 38308e7fff4ca-30914801652mr2362081fa.4.1739446932739; Thu, 13 Feb 2025
 03:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20240927135306.857617-1-hugo@hugovil.com>
 <f9b0cc53-00ae-4390-9ff9-1dac0c0804ba@linaro.org>
 <20240930110537.dbbd51824c2bb68506e2f678@hugovil.com>
 <16bd6bc2-8f10-4b99-9903-6e9f0f8778d8@linaro.org>
 <20250204124615.4d7a308633a15fc17b2215cb@hugovil.com>
In-Reply-To: <20250204124615.4d7a308633a15fc17b2215cb@hugovil.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 12:42:00 +0100
X-Gm-Features: AWEUYZneNXsSWxPyTfgj14jjDig6RDBsUd0vsFJ1m0e682t0ZDeQHJQZeQ9X-9I
Message-ID: <CACRpkda+jac_7KKQDs3UcfODP6kK3W03Q3KtVOCjRV+wo=M8=g@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: neil.armstrong@linaro.org, Jagan Teki <jagan@edgeble.ai>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Feb 4, 2025 at 6:46=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com> w=
rote:
> On Mon, 30 Sep 2024 18:24:44 +0200
> neil.armstrong@linaro.org wrote:

> > OK then:
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Hi Neil,
> it seems this patch was never applied/picked-up?

We have some soft rule that the reviewer and committer should be
two different people. So if I do this:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think Neil will apply it.

Yours,
Linus Walleij
