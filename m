Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062EA2AED3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCABB10E8EC;
	Thu,  6 Feb 2025 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lebJQpKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851BA10E241
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:28:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401be44b58so1318343e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738862877; x=1739467677;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJUUUjrLov9sJIl9/dsnkCvRrMfN6OAfg15ppJicsmM=;
 b=lebJQpKau756MmWQwfDG9Z9stUViAeCLQIclGIZPsVf3vB3CoxSSc/o7SohU2FAP/1
 dCTLc88lTNT5Kd4No2Koz61Sq3ILyTVDftuxLb4M8OVfRBVwBPndTk7h7YOpqIexv/iB
 ofvG2VT7Y5thb+WmrpjptmKXgE1z4B35WA4tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862877; x=1739467677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJUUUjrLov9sJIl9/dsnkCvRrMfN6OAfg15ppJicsmM=;
 b=a6v7jFDMn8+pgePrP7EsGJvY7vG8L/2Xtdkfg6TIQtOUEc54uj9+SVEd1KWESWyC9l
 eR5iwSl1uJ2In0IhoghLokETDaDavXc/e1Mv05umLcTJE3FrCQgbN0tiwrtFDhUJNoZn
 b2Xia7D537dOzuAvxFl94owbfPcXuCz2Cf9NqoHkWqoiPXf/q0pMqMTBQz1VcPlkZIbA
 Y6Ca6s4D2dWDj/EJJINleDRhln54U7CzOTVZVNlsWv7S+SnahObF70PLPuPwjIH30BHx
 DbJmJIWj+BTIJPwXDDHL663BXohr9CO2WklhXtWOKGtMR2qhRAXLG5jnzYIg42hdQv5W
 SfIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP/dCwX5E31AQbanGdkXOzaaNyNfQFZBw4Nmn61FOh51O+tT5dkptll+J0XjPCY6yJ8pyVSqlmKgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhGsSSGq9QGEWIxSuVh7jmiEhBOsr0g2VpywCh2usmnMmPoPop
 4uKgEH33mBBgEVs0APv++u+6ws4MW+EAPojJMXYlmZe1Gcs9RJWdGZjE9dri5cLjyeF+JuU2nM6
 sovx9
X-Gm-Gg: ASbGnctwQESh1v2Hwg7SaQ91zBk43GJwpt+dMJCgAoZ8gLJ854tcX1FZeWo94ul3ACh
 u6sDn77OFYTvUdOpq4ASeLRSA6dlQN1RXuPPbJlN3grAi/DK6ef5nZoOJ7VijRxW+7BNmaBMdpw
 N9UfT7Aa0EGCHL6BqTiygC6KfyTVtikuVjC0+MYmagPOzbfsEUuOIyj+YRjkttJLJjw6GOZLtb4
 YOx3OL2aJU+I5f9yoKphfcUXlSCWey5lk6Zaj2lTM+HlOPEzF3F0uRj90sxE+Wzb4cmtTyiVfPA
 440jVnB2KrLYtnzXTmvr9qu3Vwr/nN/E8siuu9WZvVHaJs1alV/eTlw=
X-Google-Smtp-Source: AGHT+IEm3e0o0brsaSVKWBDVDpbjebZoYptwFPQqwvya5Dtu1CazELFKOCV9jqnfwGaqM8DqbiJAYg==
X-Received: by 2002:ac2:5631:0:b0:544:ed0:b686 with SMTP id
 2adb3069b0e04-5440ed0b6f0mr1232172e87.15.1738862876793; 
 Thu, 06 Feb 2025 09:27:56 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54413a801f9sm37052e87.129.2025.02.06.09.27.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:27:51 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401be44b58so1318128e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:27:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAm3XR9RpWLqpxs4xOPH29YLxdcngjJPLzJjNIRdTSpGCRnQ/ax2WpgOJHoC5tbfFbljAMVlCRCkY=@lists.freedesktop.org
X-Received: by 2002:ac2:5f75:0:b0:542:9636:2981 with SMTP id
 2adb3069b0e04-54405a1ead1mr1769381e87.29.1738862871039; Thu, 06 Feb 2025
 09:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
 <20250206-drm-cleanups-v1-1-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-1-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:27:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UV+psKjd9R=Z=v1jf5y48dS3-O+uu+5qp-bZNteXJ5yQ@mail.gmail.com>
X-Gm-Features: AWEUYZm6jGvL4mZzbh9s5YygPSphYTnr2ocZgOhaskVwIuc8XI42h9zOQQmsmW4
Message-ID: <CAD=FV=UV+psKjd9R=Z=v1jf5y48dS3-O+uu+5qp-bZNteXJ5yQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/panel: remove unnecessary forward declaration
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> 'struct drm_device' is not used at all in this file since commit
> aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel").
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  include/drm/drm_panel.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
