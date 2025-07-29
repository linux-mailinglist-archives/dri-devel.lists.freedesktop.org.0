Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118EDB154B3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 23:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408510E0AB;
	Tue, 29 Jul 2025 21:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Tp6Mzajt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822C510E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:34:56 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-31f314fe0aaso1366848a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753824891; x=1754429691;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVCLxnNX9ssCVFunVtRLzu94Pq3RrLWSiFarp50OMoI=;
 b=Tp6Mzajt7VD3Y8RGz7xJ25cwq/YhrbrrqFfO3eUGkvJIb+5FuZZawg3Nj/QICXf9Ho
 bAN3Pyyk2eYmZQf42gnh47wHEBThD07+PDfTSGL+QGhIXudZqVZzoIPyJ7O83+rOyyyZ
 OQ9M31hk2RAgRqoUkghAXPldNU7Meh9eoErfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753824891; x=1754429691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVCLxnNX9ssCVFunVtRLzu94Pq3RrLWSiFarp50OMoI=;
 b=AWbfi1LUfNzGmxQd49JycB56UYgMp/cZ7dVs0ktg+QI0e60KPjETZQp17M9/cww2IX
 gQWPSwkD0+qqmLljdPUowv8W8Aqp9tuO++IJpfX3IWJr/+neGRT6719sBQvYU90EY5JY
 dCBexHurUsDQhh9UEehRSk5lPiSs+FjChxC9teVu1ryT0n3RPT+jLK4xxHGa4i6KbiJg
 hRlOn8CLCdZzImc5zowQfbpCw43eoR3fVA0gEj1eGj8iEBhN5yIkH7aK5BtwUrxYYmSm
 cjZhEoRC5ycKvdlyW1eD6FxoyMCjucn+JRH8oTU6rZbKi4rCyiFJYBP9S1ArOoJlAyhs
 xXGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrzyKYOXdQ4xvoeMbLTdHBqFQTT1JFIPGF8wDOOCwyqcE9jIvFwQT1x3JNrpNU/NfiulJ/5Y3JqbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSLdiBIiiEATQ035b6bbT6oNkQQZsY/U3u8F7u+Zj9Gz4HaI85
 Yn+eBsn7vrlcltwLWwAZ4mP0gZ46/RUB3upRIC561cpTcnvKkX0DfGD1VJWHqqWCa0EBAaMt4y6
 +1N4=
X-Gm-Gg: ASbGncsyv6O0BVernl3i/D40X8rGm76A0RyeggjtdJPaEeh1+QUgmdIJhANDgQj+HAZ
 fSBKUZvqOI4XuNa2mvFPXb81YKAZDG2s4KFVE5EjDRFasvittPWHSaUKJWeGugQYA2SZRzntzPh
 USbBLeZmle1bI2PSMKYr0qaB9u3PlizZTA9cge+/dJVUaYrqe8hGzQNajwnAgW7cDQEA//kcfMQ
 f6ICvH4WVAwIqnrIcQnXPdbcimqgRGhgy77y4yRUP4tDz9n/Dp441i2GmY3Z/hrvSQNwK3RjiJM
 kz0FyBEAlC4KtLPMNxirTOcpDxWRadO0ubcTlsIBOO3okJFgHzqWrD7dB/Gi02F1jlfzVNmnBps
 0M7DllHaE6VczQCSInOAOGYbxAmiOHllkDRKFCWUva7EaiISLpKkiJtgqT/aZGA==
X-Google-Smtp-Source: AGHT+IGpymHkIXdgbauPJ/OlHS1SWkfpv+kMPjtd9ph12xyfsKCBgjGJKwZ+CNdCcbImAiSPMAoJcA==
X-Received: by 2002:a17:90b:3c42:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31f5e28b870mr1309925a91.28.1753824891520; 
 Tue, 29 Jul 2025 14:34:51 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f33e58sm81195a91.33.2025.07.29.14.34.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:34:44 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-31ecd1f0e71so3234020a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:34:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXG40TgIjvbv6wRshyBcsSGh0RobgTWcOcDr0RGHVOvEdq7Qj1+Ks322zacQWloG2ZPaQpA8ORgCSQ=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3948:b0:31f:3cfd:d334 with SMTP id
 98e67ed59e1d1-31f5de1f1f7mr1224460a91.4.1753824882727; Tue, 29 Jul 2025
 14:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-4-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbTQRD+hbykD5DXGWKXsJ5+rEH6vWa4dsSMmxU+NKz2Q@mail.gmail.com>
X-Gm-Features: Ac12FXzeQrf6_M_2inD2z7AMl0MQ8EJWdRVuuxzGi0c9nlBwan7lOfCSMzDT35M
Message-ID: <CAD=FV=XbTQRD+hbykD5DXGWKXsJ5+rEH6vWa4dsSMmxU+NKz2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: novatek-nt35560: Clean up driver
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

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
>  1 file changed, 60 insertions(+), 138 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
