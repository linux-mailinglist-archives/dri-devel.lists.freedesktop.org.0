Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD5A3DC68
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799E210E96E;
	Thu, 20 Feb 2025 14:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MPI2KlsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6E10E96E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:18:18 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5439e331cceso1097444e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740061096; x=1740665896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0W6q0MfsecQ/oZxWXdK7pjWIJ78Sycv90qisJxzpdi0=;
 b=MPI2KlsOulICVo4Tou6nkyBVPOLw5KjAi2EecjVIAG6MATku6R2X4VIbdrW03cQuxP
 OxbBl3KauOIU0JBLQ9RWwXswM8LRTT0/A+E68fwY3vGdBBFuSv4gIB6d69xOG+8wGLef
 0UVLvJf9vjEUl5Z4wvk4/3vB4eDBL8O4qes16EoGyKVLAY9dfECWdI0UgmOZzDlqQ9Vp
 qHWybGTkLWSCWcqFPmFjLXXkO5SHG9Ofg5Ku4YE4R7ju1ibawbxoSdrTyCl7cfR8QI7e
 8fcwLdwUIjW0vsAxO3JFqWQL9uLT+ce923wNlagMDkRrbb7qeNt5Hube1IYufXobv4GH
 9rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740061096; x=1740665896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0W6q0MfsecQ/oZxWXdK7pjWIJ78Sycv90qisJxzpdi0=;
 b=GoxeUvevsnwzXBxhxOg2DtYkNgF2pcvIvmT3n/sNYrYWkCyKMIE2itd6h7XwvqSa1F
 xNeGLVLbmdIjXCiuSvwbXFGw7mu+2NTTkin9xrKD32P9cMUgkKkPWAU3WEOgyabPxPMM
 c2c4/C+6OnXt5oD5wBt65Hgi4q4sAE2kwFhJdJbHkNOc1gPC7ZHRZ7+LAnQqjgnaTx+3
 tj6dqfzUrKsw5tpGn1CuGH0vTgFCbcgm6+7v6XQe6/BLRstbvH2E62/bRZmU0zIIU5UQ
 /4p5oFl/qSK83sy7YHeYCisyvJ43DzMS6kKrnj2yIKsmV0EDwM/or4cdAJww/EXrP5IH
 qDEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDh6OH/jEG6/nn49i/xapfNGcm+hsZkNpdaMFc4/ULRRx0XGKgyjNQek6fEWltmEW0Qq7McKA5tbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjye+G5HIJVJfxU0SpdD85fWUwXRIlUkZLoLk03JA7BCmAWApt
 v1kC025CTU7VVWwpTzXLYAjtiKZ1Dq8FQgyzAflh+zIKv5G3CI1T/DrIDTweSw1ss41JvK/lMeN
 9W9pae+A4v/RTDNmqlMJk8fWGssU6t+rwhSwAQA==
X-Gm-Gg: ASbGnctPSn7cNthtruBD8ZwHGHteFhvEPjGhJgoYAU1o/kxlGhhc1w4BIBCTSPglUdS
 6ybUWq30kqrEEIh0EKbSCAAU/J19mwWEUDJTBC9VrtPK0UJMCk0yCzWQakJtU+FetB1ELYIq2
X-Google-Smtp-Source: AGHT+IGvaL3ytQhRSizHSs5j4h7le8Pj+1Uowv4GhVkmMwx1FqxJP9kusc9px7K6w3SuVO6d4TkqiTGgCnF2ShOKQ00=
X-Received: by 2002:a05:6512:230a:b0:542:2999:399c with SMTP id
 2adb3069b0e04-5462ef20ef4mr2952842e87.46.1740061096527; Thu, 20 Feb 2025
 06:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20250217120428.3779197-1-jkeeping@inmusicbrands.com>
In-Reply-To: <20250217120428.3779197-1-jkeeping@inmusicbrands.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Feb 2025 15:18:05 +0100
X-Gm-Features: AWEUYZktLgRRDDqqdpWTvRvqxLtf5I0A9ZWzKOQDA0dj-HnUxbhAd-KGVcT2F_o
Message-ID: <CACRpkdaHodX8atqWL+BXnvZ5yDvruizkZd44wUTPwe0NNWFT5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: fix GPIO name in error message
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
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

On Mon, Feb 17, 2025 at 1:04=E2=80=AFPM John Keeping <jkeeping@inmusicbrand=
s.com> wrote:

> This driver uses the enable-gpios property and it is confusing that the
> error message refers to reset-gpios.  Use the correct name when the
> enable GPIO is not found.
>
> Fixes: e2450d32e5fb5 ("drm/panel: ili9882t: Break out as separate driver"=
)
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Patch applied to next as a nonurgent fix.

Thanks!

Yours,
Linus Walleij
