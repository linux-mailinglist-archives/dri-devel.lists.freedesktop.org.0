Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D84999D5C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CC510EA51;
	Fri, 11 Oct 2024 07:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JaPgpOHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641A10EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:03:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fac9eaeafcso19110671fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728630208; x=1729235008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUYKvKXx3YacZEKlsfNYw4eUSZHyuCNL6LqQD01H25g=;
 b=JaPgpOHkF648+QsGKc4vx3mniXI6x6akovWbeX11JGjURnX7v9+8QZfKm2lLWYe98R
 2ChqujHtUER5zpDIRzMAZuAGdsCWOpaADZ49CI+yAf/eL6Yv/nuAR+RxBpXjc5+S82lH
 FHe4pJRovfGaOKceJdXi0KaadpmHYAJAP7UEIwzQ2R9/C+FlCJsh0JjcaqZ4soNQYpCI
 Do0APCjN3vuZNOJXcdrzHOHJjb5vibdL/ndPThmXx8gzghb9pvUy2/Mamxh92wH0sxt7
 5E0CGitQpdAvGKc7Vu5KvkTG5Iq0WEb7f9rXzob9YHZt4MKP3QtSPvnw9cOJ4S56tfLl
 Z/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630208; x=1729235008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUYKvKXx3YacZEKlsfNYw4eUSZHyuCNL6LqQD01H25g=;
 b=wOiJ444NXPSWD7h0ql/IAX1Y8eqVdCfpedkoHkKY5zdcXiTY8vMRbWvh5Skut5RnBe
 LyY6DAsq8RujjsgK28Nz+Qmq7MT49TgT7P287SH6jcIOu6ajvaUOiPbum7upwhFey0Kh
 fYEmLGWtDc3aeqS6Y/l/dSet/NP/af1VQN/4vuEkONZh06DSQhBeK8yBUu46Dm+aX9a7
 WdLn7tV8KFxasDXfMxaz78lh1HP9N+fzOuPI6pLUgt51Ij7Jmzy2BTCodnyx/983Umtw
 i049mt9OQTdKeD1AnATqakydaU78CO0iBKAjojUZo2tWG9K5oGoEmpsWUiWro+b7T9UN
 FGaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXESylUfgpa5GBdwrCERRpqubqiPlso+R9q6pwzdk0t9RApW2QCg5A2Eb8PdTI9gVWSpIqpxS4DVvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7/YBdAfhiztUeo/u0f5A15m0qUzCQWl26jKT7yrNOZxXJSp2z
 ZkCNcM43n1TPRdn+zbJr7B6bp4ZVK8XWlGKEyM13HPzpvLvLkg8left0XNW7YQgnPw5KlyiwOW/
 k48LI8ghXg5OAFBJqQf+awKGey8SgWviy7er9xw==
X-Google-Smtp-Source: AGHT+IEMLmWgU40XaEz7cg2fJjnrrvSFsX+Ixe67yUNnaZpe60YgcllCtweYxA726xWakmCHrvQLlc71P3K6O6pyHVY=
X-Received: by 2002:a2e:4e11:0:b0:2fa:d4c1:3b71 with SMTP id
 38308e7fff4ca-2fb3272a9a1mr5139231fa.19.1728630207670; Fri, 11 Oct 2024
 00:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 09:03:16 +0200
Message-ID: <CACRpkdZR0UxF69rcuSpcfYR69FC-rGOakeOiUUbzJH6BWGVh=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Adjust power and gamma to
 optimize brightness
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@chromium.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 11, 2024 at 4:08=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The current panel brightness is only 360 nit. Adjust the power and gamma =
to
> optimize the panel brightness. The brightness after adjustment is 390 nit=
.
>
> Fixes: 3179338750d8 ("drm/panel: Support for IVO t109nw41 MIPI-DSI panel"=
)
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you look in panel-samsung-s6e63m0.c you can see how that driver actually
uses a set of gamma+power (ACL) settings to regulate the "backlight",
i.e. the brightness of the OLED display. You might want to implement
something similar in your driver to actually provide the user with a
brightness setting.

It's a bit unfortunate that this is for historical reasons called "backligh=
t"
but the usecase is definitely the same.

Yours,
Linus Walleij
