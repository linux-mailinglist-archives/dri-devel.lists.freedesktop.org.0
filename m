Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B63B3ADDD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A410EAF0;
	Thu, 28 Aug 2025 22:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ickAScEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8510EAF0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:52:51 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-32326e09f58so1553766a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756421570; x=1757026370;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu86Ald7tqqA3nYrxZxsFpT0WhbJBu30dcAkxkqb9jU=;
 b=ickAScEA46ZVDJMj3NcJjyIScIlgb77bviqJKzRQ8vuMEnCLsoeGU2PMOuk/wXcGrP
 lW/mJejQ/Gcfp6zAiAJH/a98dCi3hdnvpC7w2M6wDbDVA6ioUTEGO8U1oK/g9ffi+Ph8
 cyv5O1IAiXTfxcUWGZ+kcRRw4dGf7vB5vgBXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421570; x=1757026370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu86Ald7tqqA3nYrxZxsFpT0WhbJBu30dcAkxkqb9jU=;
 b=eJ0D+T+zZIFGBGLTYDvCbUv7Aw7Hj3FGkTmyJA8asKA4giYq2jypiotbOJA3Q+qG0b
 btG1M0nMf5B8MYUA5pbdof4XzBOo5z3G6f0+Mo0nvsvWcaEuHZQaMiS2Lj7E7Pi/TSNq
 IAZj/MEKbljnh+7hz4FdiETo6SSBZH5M4EI8Gqb0hEV22j1VSBNI4D2zp3lVwiePABrh
 SlgFwYgBtgPKGfpF5QEo9U2EOvBgz1LdPtIsN/AnW3RnhZwEoTwmsw7D7weddfXbRC3d
 x1LhICXK1ocru91G15Dmt08TL5gT5cdEqPoqtLN2Gdl5/M+Bl6lLW0sF7RlfGi4Iw9SD
 QkiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNBLe0ORSRJj80UOfPpjCbYGOnwW04Il1b1slc+RXkgUYPf9j+tpk1T2BEQzjLtYkpKSw3DawP6xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpzbBaeGjXNqsoN6uT23lBE1R/xaNDXtr0rehHHCuy3h9p8mZr
 Y12oCu3AMl7hrIxopinNeYLJDepET2xJYP4sGW8hCK2EOVnvwa99aWK386RrXTp22Pfu7muX2CS
 0gmY=
X-Gm-Gg: ASbGncuKrcj7JFU6agihIiDP7lngLeUlLZhiTHvjpPCpaU6tzGTcn7N+v3wX7cdqgco
 xO7MUEpD0mcWF3ue8X97RGhMMj5kPANuwXrOkCEQdMZ6Lq9pblE927wZmB8EUbhJRAsk7zKAzB0
 3/2FvrBjJSp2GKMFvvPOlT/SJiNRae2SpL6zevyqBKBjC54mrs471VWqQlCNpzUXYfCX8L7pDJC
 I8V0/1Yo2gAOOAfhe9gle0UZcK1/NKuYKKmA+PHwALQikRfFK9R2XyOC7LkAcxLWgsKuf2IOIzN
 criu6fhESLyH9Ok7hKWHSWc3+rZm63rhtcluWuEaHbnPgtGW4v7j42cQAigmCCFTM58Y2UgNvTC
 FBJ5ZnbN1kx2EUXYWg6a6Aedi5siU0rWfJ+oSeFRzeMeK33HrPiBcyCETBDLsX0o3WQ==
X-Google-Smtp-Source: AGHT+IGNjL94BmawQoGOQfIWosgE1xYsRWMMMUYVe0LpLwvKbEpq2VsX1XHxl55BPci9Mziohiudug==
X-Received: by 2002:a17:90b:2ccd:b0:312:e731:5a66 with SMTP id
 98e67ed59e1d1-32515ee159bmr30188678a91.3.1756421570297; 
 Thu, 28 Aug 2025 15:52:50 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276fde4cecsm6179043a91.29.2025.08.28.15.52.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 15:52:45 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b49cf21320aso1703533a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU56RzWvgEdA3Z44MANeQiAr4U24saEEJlwuphJsXQnjE5AU3zuiDwM/rfj5yAy/LofY9d+LVQjN5Y=@lists.freedesktop.org
X-Received: by 2002:a17:902:f612:b0:248:b25d:ff2d with SMTP id
 d9443c01a7336-248b25e0a84mr76625375ad.51.1756421563760; Thu, 28 Aug 2025
 15:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250821122341.1257286-1-mwalle@kernel.org>
 <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
In-Reply-To: <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Aug 2025 15:52:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XCOPeEgpjvCuDjT=OjEk1P8vszL6iJqkY-DcpXtpXTjA@mail.gmail.com>
X-Gm-Features: Ac12FXxGQ3gwKFNpja0uZrKs0DRled9vAzxyIxlYJEziCVKJJ63hTgomuUTkhic
Message-ID: <CAD=FV=XCOPeEgpjvCuDjT=OjEk1P8vszL6iJqkY-DcpXtpXTjA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>
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
 Devarsh Thakkar <devarsht@ti.com>
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

On Thu, Aug 21, 2025 at 7:36=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Aug 21, 2025 at 5:23=E2=80=AFAM Michael Walle <mwalle@kernel.org>=
 wrote:
> >
> > The bridge has three bootstrap pins which are sampled to determine the
> > frequency of the external reference clock. The driver will also
> > (over)write that setting. But it seems this is racy after the bridge is
> > enabled. It was observed that although the driver write the correct
> > value (by sniffing on the I2C bus), the register has the wrong value.
> > The datasheet states that the GPIO lines have to be stable for at least
> > 5us after asserting the EN signal. Thus, there seems to be some logic
> > which samples the GPIO lines and this logic appears to overwrite the
> > register value which was set by the driver. Waiting 20us after
> > asserting the EN line resolves this issue.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> nit: officially you're supposed to move your Signed-off-by all the way
> at the bottom of all the other tags any time you post a patch. I don't
> think it's important enough to re-send, though.
>
> In any case, thanks for re-posting. I guess it kinda stagnated. I'll
> give this another week on the list and then plan to apply to
> drm-misc-fixes unless there are any other comments.

I realized that this is lacking a Fixes: tag. I went back and
confirmed that even in the first version of the driver, AKA commit
a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver"),
we still had no delay between these two lines:

pm_runtime_get_sync(pdata->dev);

/* configure bridge ref_clk */
ti_sn_bridge_set_refclk_freq(pdata);

...and the last line of the runtime resume function was turning on the
enable. So I believe this means that the bug has always been there.
Does that sound right to others? If so, I'll add that Fixes tag when
applying.,..

-Doug
