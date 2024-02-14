Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6350855509
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E1710E59F;
	Wed, 14 Feb 2024 21:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PgtjxqLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EA910E557
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 21:41:37 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so359842a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707946894; x=1708551694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnjm8I32cDhuopRTHQD8F4ipS3W9vZirc7u9Gsk+x7w=;
 b=PgtjxqLv1KN0ohn4Eq79hh4tfZf3KsjvMUcbyK/7CZF8XeSmvMPS0G/G3YInsJ3e5k
 Mk4zrFvjnijvRI0PlqMa2dkcnN57Ozqw0pbE6K2bU2DKZNjhgKmRpQR3SkFo2EoNoZ6n
 pck3mERpMQixbDPxS9c9t/s6bYVG0V00k+HZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707946894; x=1708551694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnjm8I32cDhuopRTHQD8F4ipS3W9vZirc7u9Gsk+x7w=;
 b=uTaNEwsXcrSdQcM5dreODpwgnserhOtlkZYwnvP+u97PGHBgIzJqeMRT4vDR8ZIX0v
 8R2kF3oNKv8IxyEnHD2GBzgBPdKgEFZ2h10P21cldpCLAUYfsvk3iyDb8vUBMrb8VyiV
 f96XxX6wv+LArdW5rBtT6ZSfU6gm3Kuuibb26FXp5P3MxxdTUMk3bHLcpPaW2tYWEKam
 EAy94yDwpPtx2/AvM4t3XoDzujKev05duKNXCbsFx40Ns2q9fAxC0O/tyOsPjEN4e97H
 mSF8P7WVHPt5o++S+uN2f/Fctr+4aLstM5lAqVZ4fvJUNfx0QMOCvI0Ej5ETBQA13+Pb
 iPkA==
X-Gm-Message-State: AOJu0YwmCDZH2xTNKsBoIVJMxDJc8lI/VGk/AQwoO1tHdVtrkH1R49vT
 TAd7ZkV2qWAmlpZ/4w+2/Kpt6gZmnDEKQR9XMs4i1LfW85NcaV9pEkvu/ClvxbFxYfiFHOvwKtZ
 ilECh
X-Google-Smtp-Source: AGHT+IHeqx6Wvbop6BhTqG1/PFnAsVAkEl2lbiFQdQE2upYgFBoEV1YcaC3V1ePfqo4N6BBlT4lLqA==
X-Received: by 2002:a17:906:810:b0:a3b:b947:af77 with SMTP id
 e16-20020a170906081000b00a3bb947af77mr2823011ejd.67.1707946894578; 
 Wed, 14 Feb 2024 13:41:34 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 vx1-20020a170907a78100b00a3d014fa12esm2009415ejc.196.2024.02.14.13.41.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 13:41:34 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-561f0f116ecso1123a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:41:33 -0800 (PST)
X-Received: by 2002:a50:9f08:0:b0:561:e7d8:50a8 with SMTP id
 b8-20020a509f08000000b00561e7d850a8mr369992edf.0.1707946893039; Wed, 14 Feb
 2024 13:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20240214072435.1496536-2-hsinyi@chromium.org>
In-Reply-To: <20240214072435.1496536-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Feb 2024 13:41:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VmDZvWVJ+DKN5bMPvJaLouNq26=Qyd4N9O+a0FeWCJpA@mail.gmail.com>
Message-ID: <CAD=FV=VmDZvWVJ+DKN5bMPvJaLouNq26=Qyd4N9O+a0FeWCJpA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/panel-edp: Add auo_b116xa3_mode"
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

Hi,

On Tue, Feb 13, 2024 at 11:24=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>
> This reverts commit 70e0d5550f5cec301ad116703b840a539fe985dc.
>
> The overridden mode fixes the panel glitching issue on mt8186 chromebook.
> However, it causes the internal display not working on mt8173 chromebook.
> Revert the overridden mode for now to let mt8173 have a functional displa=
y.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)

Given that the breakage for affected mt8173 Chromebooks is pretty bad
(black screen), I'll plan to just wait an extra day for any screams
and then I'll apply to drm-misc-fixes.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
