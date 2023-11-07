Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679437E47B0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 18:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8E810E638;
	Tue,  7 Nov 2023 17:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763B10E638
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 17:58:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9db6cf8309cso883820766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699379885; x=1699984685;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGXr30B7ae9S2k+FMAtadT8oxyML17udu5CvmGuW3q4=;
 b=BbTjkiGj1ZeCZnHiyg7heo/1MwRcS5lmHL5+IPrgjvm0i2rsxfGnxFvD6ASdPelr/1
 JE/0QeaInOkpitIpcw9SrL/ByYemEg9WG8QwBQHFACHGNU76KRbmRsHwDq8aws8JgvkW
 gOPW0zNXqm93DsmmM4y1D9ij4O6nMH64YSLu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379885; x=1699984685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGXr30B7ae9S2k+FMAtadT8oxyML17udu5CvmGuW3q4=;
 b=He1+ZIucU1GBCHqit/VZQ3LE+YlfLq0tUaV3446rMumcjtLheIN7YuwwtXDvv7rR3S
 muwnvz0u8UBRwJLRZaqWN//1VkwR/RI7Zu42946EpjCAhiig75Ri8i8n7hl5SHcZbVVa
 zirZ8cmjSvCT3Lu2G+u1FqTYLYa7JyeQZxstsA0uQewv8AnY31nCrvfB5gHXjSmQ7x1v
 FH+MznsWyM2aVS92r6nazgbb8Ex0YQWGyKfDMi0yHi0asBnBhALDbYgC90/o6YpkV5RB
 g9pP8Zmw+xyhyL5UeaGGDx6k1322g0K+eWjzCN4qikIuCiYWSOSzks6bYM6/YaJtCZwi
 iFrw==
X-Gm-Message-State: AOJu0YwdbpIJTHuWrF5eaNkEMARD9Tw5BlQ//lGNYqOLftXEvi/l7KcW
 DpAJ8di/AqMPFZ6c7GiOEwFIP56e1QOxDjKzmFJxlPTn
X-Google-Smtp-Source: AGHT+IH8o75ZorVutUHFqFcOCmN+U123px/pUs/2H7byQCgcajnSfnFhpPbHXSGCBED3STJr4b8mMw==
X-Received: by 2002:a17:907:6ea2:b0:9a5:846d:d823 with SMTP id
 sh34-20020a1709076ea200b009a5846dd823mr18603049ejc.45.1699379885290; 
 Tue, 07 Nov 2023 09:58:05 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 h5-20020a170906718500b009dbe08bc793sm1318598ejk.18.2023.11.07.09.58.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 09:58:04 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-54357417e81so565a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:58:04 -0800 (PST)
X-Received: by 2002:a05:6402:5410:b0:545:2e6:cf63 with SMTP id
 ev16-20020a056402541000b0054502e6cf63mr60142edb.6.1699379884098; Tue, 07 Nov
 2023 09:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20231107000023.2928195-1-hsinyi@chromium.org>
 <20231107000023.2928195-5-hsinyi@chromium.org>
In-Reply-To: <20231107000023.2928195-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Nov 2023 09:57:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WpZt0MsQ3Yi01+hMmBgL7Z-S_+sjUipopM6qTQkgOY8g@mail.gmail.com>
Message-ID: <CAD=FV=WpZt0MsQ3Yi01+hMmBgL7Z-S_+sjUipopM6qTQkgOY8g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/panel-edp: Avoid adding multiple preferred
 modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 6, 2023 at 4:00=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> If a non generic edp-panel is under aux-bus, the mode read from edid woul=
d
> still be selected as preferred and results in multiple preferred modes,
> which is ambiguous.
>
> If both hard-coded mode and edid exists, only add mode from hard-coded.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v4->v5: remove inapplicable comments.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
