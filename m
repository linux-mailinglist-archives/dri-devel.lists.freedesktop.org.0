Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F7B272CE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 01:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B210E234;
	Thu, 14 Aug 2025 23:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W6DVPLsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E511410E234
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 23:10:46 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2445818eb6eso12208625ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755213044; x=1755817844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60PL/oxrejEGqmONPWLHGxzqkl5vemphiufOxPK6tJg=;
 b=W6DVPLsC842nJxz0rFFgpgCbzNzjfI+Lwf9xwx/RXPp8u36wlxnwbrPhMw/Tid96FG
 KzTw9INeYSReA6FbiC7qyZFZlEDczrYpziSxIRpXdugOJnoz6BrlSqQ6cM1bnDfN6pwO
 8JeNk1wGoRfqTRWlhncoDMocoBlLPvoCgJ9jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755213044; x=1755817844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60PL/oxrejEGqmONPWLHGxzqkl5vemphiufOxPK6tJg=;
 b=AzNJ88nZhvmcvC6nXOHPDGHxDdohMOgroA8PMTVhrKeKc7DP1uhcmu/Pb48FAgjngy
 Ou17JYWHybgSTaqKmQ+akEF4HumnwlCBddbaEFHOzSXg81mwN0Ey+jSa0C2rwIgC4k8M
 kWfJdB++oLOeKOj36dnId4/CYJbYOClaXwilJwb3fp5LEygwVnEW2bX6x4V366nYgr6Q
 IEExlYUn9J+PqOlrbIxThkvY8xXb+uO0vwJ1oNpvUbo1Cua+bC5kEhPx8zpe/+CtmSVR
 gUQKK+GQoGvXZEtOsg5AAIJ6SE5/2RRwCSOkjBZpR6wH2binwkwICQ3Wb0I6V4TrTfVD
 RGqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG//PNtUiZyrQ+o2z9v55vS5e4G45/TUcsjIWjbqvR8MbF5ToRRgJSX3Hcl/FfU/O84sOI/5/+ta4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzQaxQFLnK67CUWQ0DOXQ+85Kwq3bjYagQwGhpEfPJqgDoAInD
 gNS21UhsulQcFNYG7rXggPDzMacGuP9k9Si9vvlIxaVWwNr0lzVekcOAJi3y9PpYcS2aupIfgeR
 BDeY=
X-Gm-Gg: ASbGncvz30fSwpzgzT9HldamM/fjh1TgHIWEw98KhAFNjAmCOAifV6D3KQW0XbBhUwz
 kftqXrnLpMC/7Gy8/YBjEJ0Ml2N7NcemvYl2h8HlZvPedqJYPiRHWYpCnKUdpWtuSuFKvWqdh9l
 saP2cfm3zZrJu9HOvKvfETnzOlwC+xfrxWZbyeDHHuwsyO51rqqvGWeL7/EOjkovvCuHaYuMLRx
 Mc0ppup0kTl3F0PsLVgrej2ivtUvfyZ+Md89OwO4s0/xPbAtyEQ8D05sDc25MAv7LIgkDyUz6s+
 e7Vf7XccVgarDq8yNbnOVq93bfjJYei1mFeif/nEI9f/xj1dAFbbFKrLW82aVUwM7em3u3EoZRf
 J9I1mOJ/bDFK9V6HVxrWUKlmBxb6Zi4PZaBz5dLQpSg7EfoWMSREKPJepAqGKq0Piug==
X-Google-Smtp-Source: AGHT+IECmJgwCIJX/9n+eTMQRgr1y4CM5bQOl11eqw1Iv0gZM9t8oI058P+T0sUOrU/26axa9wBBdg==
X-Received: by 2002:a17:903:41c2:b0:234:98eb:8eda with SMTP id
 d9443c01a7336-2445868b52cmr64316075ad.28.1755213044078; 
 Thu, 14 Aug 2025 16:10:44 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f7445f2sm1764114a91.2.2025.08.14.16.10.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 16:10:36 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b47174c3817so1063656a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXK476zIqobD+D1VvYLtqWLjJgXgvQIy4CLaDmL8bJbqjomg3Zq5dw3p0eydiyJRIDOBsythuduTLQ=@lists.freedesktop.org
X-Received: by 2002:a17:902:f78d:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-244586d8e16mr79147325ad.49.1755213036298; Thu, 14 Aug 2025
 16:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250731032343.1258366-1-me@brighamcampbell.com>
 <20250731032343.1258366-4-me@brighamcampbell.com>
In-Reply-To: <20250731032343.1258366-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 16:10:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiOspYS2TdDy6Ww2EgxTUVKgC9Bx56WU1y6a2wQVXmUQ@mail.gmail.com>
X-Gm-Features: Ac12FXxi9RkgHR4pMbyFh3pFNLJh60xWsgOW_dQYqmDelZcW1Vg0aa7a75_0dco
Message-ID: <CAD=FV=XiOspYS2TdDy6Ww2EgxTUVKgC9Bx56WU1y6a2wQVXmUQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel: novatek-nt35560: Clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
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

Hi,

On Wed, Jul 30, 2025 at 8:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
>  1 file changed, 60 insertions(+), 138 deletions(-)

Pushed to drm-misc-next:

[3/3] drm/panel: novatek-nt35560: Clean up driver
      commit: 5fbc0dbb92d639d10a5386ad0ae87a54680a04be
