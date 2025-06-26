Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E26FAEA0E9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2795310E8C1;
	Thu, 26 Jun 2025 14:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ij/53Xjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92B10E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:40:41 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-234d366e5f2so15227335ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750948838; x=1751553638;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktVHpVwkar6BpRFpT2c0I23iBcQUDcPsZbqMOUPU8EM=;
 b=ij/53XjbfLU+4VQRLlTUOUEy+3GTNTvZOxNeRqtzq1qyU++LwfNN3TMO0phpUzrfz/
 YuAANJL+5MYyeTIHimKWnaDhNsXQSAN9bKMhXuI0JYgJDonR4Y+PeJganxUw5vMwW1Ba
 a+Cqovqm+keqqJuhEebBM59yb1BIOCvE5/lOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750948838; x=1751553638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktVHpVwkar6BpRFpT2c0I23iBcQUDcPsZbqMOUPU8EM=;
 b=rv42yYlKvfVxhebbfGrf+1jvJa2RGuaHRwlICSnUvpK4jzyaVGgDwUVn2nTYd34ACQ
 uEhVGWntOO5yX9FzQYwprcsWkIhzj3iv/kn7Sj4lHqsh9yBqyVAAvLhzjwH+VAxj89UJ
 Dge3xjnpWwk/DL2t6Dk5xWc8W/GfyId9qCcfGruzndcAtSD9jR9QQPv0wv+LhC4x+p8s
 CwFHq3OIWSE7QE+aXteFT8wmHPRGrgoAsLKGCzB0fjTqYa/tejLKHXkbbWWaZhiwRqFS
 i7zNFrWQt94toRDLqY9whBQGWLP/57zwyhdFr+HRizvbyoPQu1IVyJ7sxRMfg2Jk1ctv
 ixjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf6k5hsiInKlAX30USb5fSDoJKlJTRdLnDiC1F96b/yKc7M4UNSQh/Q8FysMavg0P8GkXBB1YmZBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8qxJ0rVKxKOHExuK4o3TOObcRzfbPqKnp30sHhrwgPu4ud+Fp
 DjnnqFs02VoLx8M7eSd5o8YU/ZTqDDISIur6fOAdIQmNE7gxb63XdeZY38u6fPmZ+WUMarxf1vO
 PnEaJV7IP
X-Gm-Gg: ASbGncvDGGd9VDJmqZgF4QdZaBF7LJzF19she25kuf7A6WvWlOWIlzDTsq8QEx63VZL
 8x1GJfS/uMSB2iPFobfpW9wtBfDsCcmJG0U2hdQVwqgXZFdD853hLpSE8B5BFKdX+8ztXcI2XGi
 aRrnpBpLoROXH/WNqnZ57YGjmkL6aphZgFP8tLgJt2ZmFM9tCkvBmiijuGZyG/Gv0lvHT8sGGbM
 47DPa2ViNOSCuZOOZrA3spZHKLZbM8Ylljy4RqeduE+6KiJH6SRNnPfYrE1DSmgAcomHOhQxPk6
 f3XgG3eDsIxsR0Wnl13UTEpDV9uBOncxf2jkNIiZx3jyNPJ25besuyH0ade3NhNvMHIPE7fGbkP
 OEqrlUUtYWCJHcnN+wylVUexN4m6rrgTN5nU9
X-Google-Smtp-Source: AGHT+IGWMlspIQJ3JCDTsumEN3ZJn13kZYd6o7zhQMfRGalWDtu0IEPYlUlnutAZJo0FVNrTi6pfsA==
X-Received: by 2002:a17:90b:2e49:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-315f26b1ab6mr10709651a91.28.1750948838343; 
 Thu, 26 Jun 2025 07:40:38 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f0dsm4902739a91.3.2025.06.26.07.40.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:40:34 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-315c1b0623cso1262670a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWBr4jjrYQOTm+AOMNr0UxY4/NlntC2eAWit3K2cXd2bD+/k6MHvlYhOV1+UKlpIc08g53jhB1xSo0=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2c84:b0:311:e9ac:f5ce with SMTP id
 98e67ed59e1d1-315f26965camr9459965a91.21.1750948825200; Thu, 26 Jun 2025
 07:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250620074951.32758-1-brgl@bgdev.pl>
 <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jun 2025 07:40:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-XPij=ztJprp3O0eo3Xe80vS59+bAP_nERobEBNPXxw@mail.gmail.com>
X-Gm-Features: Ac12FXy9GKHhd2g2BMUwILWpLqK8s1l4nJf-UsGjEGsCX_D33Z1nSU4jBJCrYPI
Message-ID: <CAD=FV=V-XPij=ztJprp3O0eo3Xe80vS59+bAP_nERobEBNPXxw@mail.gmail.com>
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

On Wed, Jun 25, 2025 at 11:25=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Fri, Jun 20, 2025 at 12:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on inp=
ut
> > lines"), the GPIO core makes sure values cannot be set on input lines.
> > Remove the unnecessary check.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
> >  1 file changed, 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line direction chec=
k
      commit: bffc0692359f8d06d989657c00b274802a791692
