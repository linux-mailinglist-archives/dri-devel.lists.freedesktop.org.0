Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37AACF05C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9079F10E2F6;
	Thu,  5 Jun 2025 13:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZO3dMJBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E39A10E2F6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:25:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5532a30ac45so985564e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749129909; x=1749734709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=ZO3dMJBzsse3Qifm3xdnbniEQGf84ZPMQuVp4/CY46cv3ZIj9TlSZZtjjEBrMpM+PG
 fnLO/puXxXQVMJa3fEM5zhLiUPtMFqt1uM3I+emW8aNLucGUk1JHE3zLX1NVXwCurkP2
 TH1/RzXS6lOXJNEh6w7t4blNWINXeuab+DxrH0ic1CZtQk3g86Tw41RSIlM3ENeTL4Gl
 QY0+ZmgOMnfOB9X22/cG2MSsZ+3wspseL8GD8fu+A0iHYk7YbnsXRWNM2z5fs3CN3ypp
 QxsyO8tmuGJidv6E+wvjq4G/Z4grf7QoLVW504pA00fVM7nLcPRp+0w9Tlxb9tZoc2Wb
 aIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129909; x=1749734709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=XGdOOQcTDZw1waKa/xcqIMufAajeS1behDxu8k/IbBLxICdHo9/GSsvkHgn4ly6tHg
 FYqm3i3Jf+kFsxFBtnlJXmzWk3PqfepPLgpDW0sUIR9/vRzmUuZ/WFWIoUSXDq9PdE/1
 gV1k0lRf5J1ITCmR7hm7ivdrfHpxuDKqjDvkX4+XOQbxSu4leCEepWRsBsRsE7MGwuO1
 AJ3z6LZw+E6HAbbOtbX8o7UqLwQ2FkXhYXHCgxOPo9DECgFZU+T2hk7t7o4KUIQyUeOY
 vzGyliwb79dFk7Um9ep7uw+fspk2+k+yEN7gsjWUYIXbDZg0uq6uIOcoI1uUZITtZ63P
 qYlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSVsrP2waMMBs911F7wBKDMoV87NiTNlSRLTwolr2HEk6UkpBXafseyxb2Dvr8r5MseyQPCeOuZ1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD08V2wQgiHmmkxyBuJHBHh9V19NzzI8T62QN+YpiGodazWgk6
 k9oYU+AFWsjFYQ/DJWlpwVgOrmLnNBTvJEO72UzQtCqLrQJBwfoIaUYhd06x8koH9pZkuBmRz0F
 rOqyPdwi2lUvzdHJlqjbJMX28ivm1+Mw87AcoBxS2qQ==
X-Gm-Gg: ASbGncvyiNZgkQWzavXgb4T3OssKpkZSRF/N3nUk/V2x1MrSEaKgM3tXjw3ut4P+x93
 7jYUunIPR/2PgTDYhUDTgYXCAmTx7+OmrR3C1wdPbNdq9fftpnH2hVgG+GWwLW80A0FL1hbB+86
 Fh6jzxYWp7MjW5ERtw6/5UZAoN7NK6hpcDP0NwnTsTpbg=
X-Google-Smtp-Source: AGHT+IF3sXGaPyJ0XISPPhd4itJm+I/bxd4yDXWrIuh/urkZa6iB32j4QI8PHWP6SsXF9fH8sesBFbcCxG3XmlTi4jA=
X-Received: by 2002:a05:6512:2250:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-5535d9382afmr1191878e87.26.1749129908619; Thu, 05 Jun 2025
 06:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:56 +0200
X-Gm-Features: AX0GCFsuDOnRf8VOFhj72Sq5BRDaYd4ZYfTzaT_rcR04We-Hc_s5kA1IErejF1M
Message-ID: <CACRpkdbisyKvG20fDV9tHcipr-+en8Hj+pZtvv0512oxzYwp4w@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] panel/truly-nt35521: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
