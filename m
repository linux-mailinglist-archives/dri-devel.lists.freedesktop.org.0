Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861DAE8C53
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952410E233;
	Wed, 25 Jun 2025 18:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ETGeaGx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6432310E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:25:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234fcadde3eso3518535ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750875941; x=1751480741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhlQKvgXhBKkjEGOu4VGBmR9okHVz/Noc/QfUL7Lp3k=;
 b=ETGeaGx5Zfe+FMAmj0IbHy2WveuiMyXwxjCjEwvx8ZxkYjWmSnl/YWApRv/RPgCDuM
 l7IYVgUk8qVTEAY1TiR1O7gk+2JS7OBOvT2iI6MMXQ2Bmu2ur/s8Yl+ab7VVkdkikGIw
 hXcd/XXe9AxzRYqh3nUI+vPVyc3R68Y04JrAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750875941; x=1751480741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhlQKvgXhBKkjEGOu4VGBmR9okHVz/Noc/QfUL7Lp3k=;
 b=v44rxwZBlYp/2eWn1bSDXhhXpdNbcE0E2SV7u7fve9ihdSrKLbiKm901aP+J0IgJys
 cZEisaOC+p119797Svped//RsZ1WNgw65Oxs2NxmiEmxm6qvCd3fZ9of44g4fpUtHhtH
 ZczN2TZiOLB5e/ZnhtPtdNON2fYCiBJt+hwghP/4OL9m7tsmIzdVeEjgGIAUXZP4NiFF
 tmySHpfuE6zQKm4bkfG2LnyJHz1TXd72P0cieDFF9rPgHPBCZKa5Z4tsGCtc2W1IMZ5A
 TL+kwp+gUknxQZYHsFGyXMP9HbSU1d7AtUH0Wg4uVwSQpJulaVUkULVeC7HpG4o/t7M7
 Nx5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjfFt3ueo5ABLvhQoaEl1wYEHcUF2aHdV4ttrzrtn8JONSN7kUnpG12KSS5+xuVPK7jiw7UY/b+8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUJsTkr1ioSCbrtkryEfwQ/kSDtJD3JN42CNqNdqECprNKMRDf
 cUHBWQVz6q9QLG4/616jrYpZzWfImMkhWwowiLEDvrL1x+61MCBZ/u2jY5ld6oXyXWtO7H9PtmE
 STJY=
X-Gm-Gg: ASbGncuagmdy8AQv1D5IOAmSA1M7fAoJODdCOWyUzsB58Xcp3m1M8MrnxRop+uZkxlw
 iLB4EqM0e0mG+FHX96a8Tcyqvd12YCOnj0+XTUSXJmKPRBRp0vDGtfuiSzPXxziTtHISz6b2Ijb
 v/FfCt7RWkMftUEZmj5gS5jjssYKQTPr2phCZTApjiyGzQlpYcsBQrjqoE4f2Wu2w1KoFB5C3Z7
 nTyEcXW87RVngCRfXvo+uTxq7gX4UikN/MBLW2t8wANIDhhQ+WWr/qZVHnJEYiZUgBX6YLkr4xr
 uamXzuWv4W18rcuEM6P4tA2VU8UaHhnoDAJy+wsa9bncG0Aw0+Km7WkO7G/oVhewz52T6rDGCuf
 AuL0dgMMRD7J/12P9bIjUE615skZ7Fw==
X-Google-Smtp-Source: AGHT+IG32ItHU4RdMa9QeqkSpvW1TdEdq0Qa5YqyBYGO+7jTIgxfFcPeOLRL9SjEhIBrJdLBsipOZQ==
X-Received: by 2002:a17:902:e5c6:b0:235:ef56:7800 with SMTP id
 d9443c01a7336-2382404d8b0mr65491665ad.30.1750875940811; 
 Wed, 25 Jun 2025 11:25:40 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8611756sm135748165ad.103.2025.06.25.11.25.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 11:25:39 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-23526264386so2037645ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUe9JkPNtth8mOqG8Q9qH2miEEihI5xn9yI0DdUlFuAAbG9vZ9f/1eqIhTUnvg6tmyvKhAX1gJbOs=@lists.freedesktop.org
X-Received: by 2002:a17:903:110f:b0:235:f4f7:a633 with SMTP id
 d9443c01a7336-2382404b2f9mr69281635ad.28.1750875938884; Wed, 25 Jun 2025
 11:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250620074951.32758-1-brgl@bgdev.pl>
In-Reply-To: <20250620074951.32758-1-brgl@bgdev.pl>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jun 2025 11:25:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
X-Gm-Features: AX0GCFvGmQ04Lpb3ie1KV9hPN8Te_UvujGUQoddbWMoxDx1BT5BpEPNEUBtns9Y
Message-ID: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line
 direction check
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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

Hi,

On Fri, Jun 20, 2025 at 12:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
