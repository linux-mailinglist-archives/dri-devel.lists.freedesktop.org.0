Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D662A96F325
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3A10EA1D;
	Fri,  6 Sep 2024 11:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VrRHfjiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8787C10EA1D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 11:35:33 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e1a9e4fa5aaso1988396276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725622532; x=1726227332; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G4MGtjs5dofMDa08crIubVUGiyT33xxJyNXECaSO5qU=;
 b=VrRHfjiPImZD5jHTTHNsIXu36vBgWsVyVfZ8MrHt/pY8CzUzUqMghoRGQnZylRczxA
 c7Ujmw19HYzHqyVSBLUnSZvcwITafxp4N1leWmoTqg+3WbG6oEeLfJDEmhkRrWZsso2i
 K8Vopo7A3bGH9DRYffuKTc6Coww8R8l9ZG2/V7CgUmyuYxOqq+v2Co+lfiXWvAJZkD2M
 cNaCB8Stsh/6GmJiiYBYkeBeTPxUmBCnKN2YtqqI0wNVFi1Kc99hQGIt4kw6QrPvruRt
 rMlsJrD4vOLWOkrz+vkqb8m1jbNboHW4hA/L/uDW89mlWHOVvfBt4aqkgMxqBRqGbNRf
 RBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725622532; x=1726227332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4MGtjs5dofMDa08crIubVUGiyT33xxJyNXECaSO5qU=;
 b=AJ9rucE9j0JNpZqw0Jrho4nZs+eKsriBea/MWCDx8JR1gZV/bIzIRTA5YwVZJ+6X+7
 eoAVSZ1aTxx9Pgnmx7VEN7K8O0JOUlYaSZxw0iI7ZavXRBbOqOn8MeuYlcRjyMhN/S7N
 ZrUzhoFawvNOBX1NjuMIN/RgMf3GHtZKEXX+fVDfJ9i3D+usdH01D37+7pg3W0/qxC17
 AsXvifP/OeG4EzZV1xdXK6lGHNjWKWRH8dQQKqI6QcHQMx+7+my+4ASq3KRAbYgPq2GO
 K+UrX9/9GfLhrwKZt1trpM3v4RjzrbxGlQ41qvipMCjjbbxGTGuYvLjoOczWK+ajvSuS
 +8xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbZlJZBpMp2IvrRDDAzUD4YzI6P/XMPE7Q4BAXwwGxHNe08gl5bKMGQO4sO1/HpQbMoCuOXiuOVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxiU6FjYqYyIHRc8ZUtZL9ZC7zpA55c9iukcpEbMQDG/C1OXHB
 Z/DCowT/M/Bqms0GKTc5LvyPYm9S6rgryf1Dz4SOXqiwdyfmhoFKdbTZZTxPYYBMOm5nGydAWcJ
 pHAynOlUJro4SV44pKj+3U1A6Hd3bpWFfEdxSlA==
X-Google-Smtp-Source: AGHT+IG+ElisUJ0/Qq7f/WCMCZfQCBvKZ4j5xc1ADihAYSJbTXA18QR6nGPwP+SLc7FS1BLGz6TzDS6rI43soiiWSOM=
X-Received: by 2002:a05:690c:6f03:b0:6ae:528f:be36 with SMTP id
 00721157ae682-6db44dbab24mr29072817b3.12.1725622532290; Fri, 06 Sep 2024
 04:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 14:35:21 +0300
Message-ID: <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 6 Sept 2024 at 09:39, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> users were updated. Add missing Kconfig selections.
>
> Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll update it to drm-misc-next if nobody objects within a few hours


-- 
With best wishes
Dmitry
