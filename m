Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6328A29B85
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5741C10E3F3;
	Wed,  5 Feb 2025 20:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dqy8i4Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F81410E3F3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 20:54:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-305d843d925so1795491fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 12:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738788852; x=1739393652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANoLh61Td7sDUcsOJIPzUPWYEKND5mf1HpgxNeIqOG0=;
 b=Dqy8i4Il5oVRpgmxAJzEmbX3suOZoWIFOzCXbZMun82lM8XIT7xheQaPKuliA4ks+L
 T1xDFjAifN43KB7icRV7ozktjDj4fi1HEtO2gJWPHsV93jGhfICFzsL+Wq2uvQqZ6ueG
 MEEoo0rMgSMmfn70PSyOuewR4ax0bpWS/veV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738788852; x=1739393652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANoLh61Td7sDUcsOJIPzUPWYEKND5mf1HpgxNeIqOG0=;
 b=qJW5mQz0YyxiaRZjPaW/SFNG24MInUz/W60iJqu8qjUFdNTmwnvQGaMh7WfO2Dh792
 gQs7BlKLNuemzms4TnJpNxrVXjXTatn+WewUG2elXysiDxF5KhP+dI44PjAZc5nYUdWn
 3cWOiWIJElWBiqhdAm2eyByEKk+/1LENchtKxk7QcemJtmIcDUA8ysF4vn91aoWeM04w
 crBTHT0tAg57gHYpSYDqutJLJzqjlSVKemYpf32I9FjttRGQCgmNrQODaz8EGxcJp7UI
 eBn/XrKCHZSok2YxrFSrP9P0h0FX8XVDedt41im+7pgKzgw87AgYUwySXSTX++gClj8r
 CT7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZooqLZAoStSEcTcE6HXqcuJXKybEDgFOGuPv/0uUg5WLRLfCnAlN8KiHSLxtRLr2/TwweUPzAIR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn2WNY9GW6MXC7MezgPB4J9XBvyFZGJvB4oekX5ZCvVo0p9VXQ
 qx2qpOwh7UlLEaE9cBhB2y/WXAFO3z8PoQxL2ugfdrwWPr4b4y+d7mVGPS++r0qGpgMqThpvt48
 bNg==
X-Gm-Gg: ASbGncvMNY1+PCH03UJ+fTUHis7NsjW5BcTJpOt4JgRZXY+BsjIs6suSaLDW/DqmmpD
 UgVgfO+rSeI2M/wYZx8n+8SVbysOuctMhIlOa+nCtzt24Fna2bR5F20T0U6I6vx08p1wtQ4K/zS
 AwdLGjXrM7TFWCF1WczAOBsTxhiwSdGTt+G3JaPzwrd9qiaQhdWlygTtxLnG2MUHq1Ffu0EDXEd
 euKn6nsDe83FaRbcArsz9zsH1nXUHqTKDsNUbxHQR4+JLzvMY6MUJVrn0Gd7Ntvpl2JV8fA7nYD
 zPplAuxVDVxFAECi4YEKScHy8dHjEu9Ezhy4PvnK4ALRM0MlKSFf2jY=
X-Google-Smtp-Source: AGHT+IGyGfo5F2Bu9lSVgtWzUmI6THSkBMv37slKhzlWB8YFO8BCM2GsmU2580J7wWlpjomVxWZSvw==
X-Received: by 2002:a05:651c:1605:b0:2ff:bd92:1d7d with SMTP id
 38308e7fff4ca-307cf37288dmr15608381fa.23.1738788851600; 
 Wed, 05 Feb 2025 12:54:11 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a3427acesm22276171fa.101.2025.02.05.12.54.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 12:54:11 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5401be44b58so238306e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 12:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWak6YE46sYHforUrWC+6Xrg67yZv5kvkc0Czy9mBfZSaWftOhqkJgj8WigqK8AvW4QVCddAv4q+Tk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3f1f:b0:540:3561:8897 with SMTP id
 2adb3069b0e04-54405a4387dmr1581740e87.39.1738788848739; Wed, 05 Feb 2025
 12:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20250205094734.562992-1-damon.ding@rock-chips.com>
In-Reply-To: <20250205094734.562992-1-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2025 12:53:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X99T4EQzY4VYdDoiiYdUPZkYtGYsZ6Aj5v1g2sW-i=-A@mail.gmail.com>
X-Gm-Features: AWEUYZlvxLY7nHdhy0kireLndag67-xwYIEC98ToU3plgocErcjX-uvcWTYiMyY
Message-ID: <CAD=FV=X99T4EQzY4VYdDoiiYdUPZkYtGYsZ6Aj5v1g2sW-i=-A@mail.gmail.com>
Subject: Re: [PATCH v7] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
To: Damon Ding <damon.ding@rock-chips.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
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

On Wed, Feb 5, 2025 at 1:54=E2=80=AFAM Damon Ding <damon.ding@rock-chips.co=
m> wrote:
>
> The raw edid for LP079QX1-SP0V panel model is:
>
> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D927765
>
> changes in v7:
> - Add &panel_delay.disable and &panel_delay.powered_on_to_enable
>   according to the datasheet
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

nit: in the future, please post patches against drm-misc-next. I had
to resolve a context conflict when applying.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
      commit: 0e1daf2b32dc85559cb1bb67e91c5a42db332cba
