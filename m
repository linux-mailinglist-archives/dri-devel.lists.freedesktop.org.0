Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A58B0477D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 20:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0BD10E092;
	Mon, 14 Jul 2025 18:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D17bBCu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543A10E092
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 18:46:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-23636167b30so42379465ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752518787; x=1753123587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhYwsgQPrArtrFiygSmDmJo6ydvTXUjtDEZ18FPii+4=;
 b=D17bBCu53jIs/3AJ5h3yfHSGHixAS0NcM1efgvKx+grD18KvRxN1u6ve1TrWJPLwWu
 0N+dZNAQdkbKCXUxNk0TwN5oW9/oUn4aIfWC130HUnKcXj3DCOnJ2Lp2oyV7hqALVIdK
 sIx0jsOFjUssqbywliRWSzr06DAXH+DAP/QIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752518787; x=1753123587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhYwsgQPrArtrFiygSmDmJo6ydvTXUjtDEZ18FPii+4=;
 b=TxPPJza5YaAfNOzw+zUm8uUgTIxor30gbD/JS7jH3e/AATFOAh+ca92IpyDbXN2qgP
 EKCyMptQERtEuF13DBWyBqVGHi9tKe1n3Ie3wZHLSR1bwgwHwdoHbXIyyopp3ItBtV7h
 iJJTvGb0gmKLGL7UtuyotABIOIywKguAmzPoykJMcgoQHIV00r/eTwd4MxYHMqBPIHMQ
 WlAV2HJ+Y1zTx2wFao6/B8YQjzebTk1Lpsdapuyig3wSlKh1SxsRl96BeE/GccJWoqKo
 Olv1LyA0YB3W2WXlowXncS7/r0Eo7gWj+K6R+KDFKaKJ4tLXcNhVXmWp0P5pou5Zn4Oq
 6C/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE9UU5P2gzTp9pFIVSw7GGkhand7EzlS7vDKLbts3RDGllVfasr7L/IhMgN4Ppfl5jR+uXTUiJiWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAB03Zc1G2x8NorcMuM4p+rnTXDN7qsHwl6vii2+rGAoDSW68Z
 whCK5YUDbZCyoVkmV5P+7FqsHJ3RCKgUgXEF+L68hkH66PRZNm6v/Ia0y97SaJLZFEnjATo+Hwj
 PDvk=
X-Gm-Gg: ASbGncuzEFernsiGz6wWLEjuWtJ1LpXYMKCGxXimg7wq2/qCrlx0G19LBPIQ6yE932q
 GPVZ4M2DZSh/pQZHCfGJd1JrbGd8568TNqbVp3Rx8S8kNVwS3wZ+3ttCltrax+rdepDfQoh3ED3
 VHMxE5Baw6tCOrolPsZE97BjDbKNFvJayeywO7HAW+GsHKXaW8s3brI/8nlhUqv8TY4JrYeREtz
 ziFCcwEfC+pb1dSIeeb3RsdmC87SGpWE0fKVOWnr2+Ak6o5eGNBlwdjpIOIxfdJpfDZYAqdIezd
 GnhmlFfEig6QL3vB0DW3QRuZo5u7pOCbr0D0in5BwWxSxGbGiW88qWXUlAfprSpsOUVUePN37FH
 afcew/jD2dMuRHd8CdqRkjKPMGLPG59bKYJLCy4zgw5U7/Ot3NR3PTPfv/EEn2x4G3w==
X-Google-Smtp-Source: AGHT+IGD/Cr4rV4SnB0w1h/vk8S0uZiE22uvfr4qMrTXGHNRblvvRum4fjMG7AbHfy+zmf80a+qi4Q==
X-Received: by 2002:a17:902:e74c:b0:235:eca0:12d4 with SMTP id
 d9443c01a7336-23dee0e567emr252109015ad.53.1752518787204; 
 Mon, 14 Jul 2025 11:46:27 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4322781sm97078565ad.125.2025.07.14.11.46.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 11:46:25 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b26f5f47ba1so3708627a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiU3jneV8fcljipf9AAChPEm/S+gvUPsPiCq09K1jUVQG5bkRSz5g9oY+FViAYgZqN+ar4c/W3FFo=@lists.freedesktop.org
X-Received: by 2002:a17:90a:fc44:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-31c4cd158bamr19315242a91.35.1752518784559; Mon, 14 Jul 2025
 11:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250708085124.15445-1-johan@kernel.org>
 <20250708085124.15445-3-johan@kernel.org>
In-Reply-To: <20250708085124.15445-3-johan@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 11:46:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1LN2Q2C9P9Ed3V+Uar_T2Sp--ssnf8H29R-N2Qz3uEA@mail.gmail.com>
X-Gm-Features: Ac12FXxB9Xcr1r23IW5HQaM5mlJ4_4Yoc45Qq6mTbhKGiBDrgy7Y7zJvyC4IrHo
Message-ID: <CAD=FV=V1LN2Q2C9P9Ed3V+Uar_T2Sp--ssnf8H29R-N2Qz3uEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: fix OF node leak
To: Johan Hovold <johan@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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

On Tue, Jul 8, 2025 at 1:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Make sure to drop the OF node reference taken when creating the bridge
> device when the device is later released.
>
> Fixes: a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel t=
o its own sub-dev")
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

The patch doesn't apply to drm-misc-next, which has commit
6526b02e1020 ("drm/bridge: ti-sn65dsi86: use the auxiliary device").
Seems like you need to resubmit as a patch to the new
auxiliary_device_create() function? Do you feel that this is urgent
enough that we need a separate patch for stable?


-Doug
