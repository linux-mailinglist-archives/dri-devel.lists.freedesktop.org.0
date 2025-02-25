Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53EA43299
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39110E0F2;
	Tue, 25 Feb 2025 01:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="C7NAN6zA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69C10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:48:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-307325f2436so49295661fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740448125; x=1741052925;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iiZFDEoMMUeQmVYehoWgRQ2XvY7Zgjn8HI/dvzzcXBQ=;
 b=C7NAN6zA55sSQBH9ItMNhegi9MvWVeins9tMvoJLpfjI8EhzvbufiuiarBfxiobvwS
 NgnpB6G3eRJ45/XLTpT2MGI8FB8lR6HHmMdCulXyYHxRmSq8yDXjb+YlIemnaWIffvHG
 9ZxaZCIgsa+ZTwYPa8HANjm3JGKY+pWwq8rZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740448125; x=1741052925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iiZFDEoMMUeQmVYehoWgRQ2XvY7Zgjn8HI/dvzzcXBQ=;
 b=Tx+9t0bpOkAPCYJXsuqrvA5CNukTFnG9e6dt8LDSCLh6FYhHrObEXwkNrzI22n7MQX
 q941QSpRhLaZTGgDV23kzbBAT1qKk8D64lWnzLagec3Rvwh3kYDATaJH+6z4DF09EMbp
 4qbfYfKV3d19d5G3n65PxnevTNx68bAMukztTZpHcYMeLa7p03ZyLeFj/mFcoXk//U48
 +Yp/YQdgwcUfnt3b/QAbG4TqdfCwVVbEK8Z2PUTl4xi0ElvFWLfCLXXgpgWMm9llqLP1
 8AX0MheDoqjqThLrpxZ/KWdL1yUNrat9/5Abfa161LRsGqf1CzUNfjpBiu6KSY366JBA
 vLpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdA5jxg8IVPQ0w4mKuuX8gtToYVMtxMmezC+kons56fJ8iEfnqQ44o7Nau5r9+4IbdGuyF3Akocho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXL3lSv3WHNi83AI9+Oc64HhjkPIA5PRQYzkKXoJOHUvcVLqbE
 KdojLFVbN7YHAx9TECSnh14eCJF1SRIKkQvPXH+PpaOltfFEjcMOlPrGAaL2mRfhTXDPJo2at8h
 ffXtW
X-Gm-Gg: ASbGncsf8w0yH19jZlvhEShIqXSAP4cxoG1NfJnv+iYf3f93IkJJk0yHDaoWaPi9cK2
 ZqLerUWtQd7EtWmbkaSv+isqj7aWHOhW3NJpi1cL5hzeJlJZgNeUeRmTGFInj7AbaoYEUpNqngU
 q49y4/A0USPIkxbXdEwzGbVmxRvv5Qd0legT00fytEZZ/PRX+SzXdI3iCSCJoKJNHGngET3aV2P
 JYIaYJfaBd+dKUaDeExgnlpMTLaTflNRkQb93SlQPhCJaad2Umz2JgiUDiSRELOX0ijHslCK74l
 9veQ9k9XQA6Fidkt6Z0I9p40+rE3DFDxD7YxVDme/sphvS4TKYeJVVN6yehjHByVlg==
X-Google-Smtp-Source: AGHT+IFaezCHsCCt4LIimz7vblTUbfjtqAygQaTP8Q/QeQK7kXNHrcvnrdI7mrya/kSOlX92qZWMlA==
X-Received: by 2002:a2e:9ccc:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-30a59986f79mr46150091fa.30.1740448124779; 
 Mon, 24 Feb 2025 17:48:44 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ac30e1sm877841fa.74.2025.02.24.17.48.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 17:48:44 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545284eac3bso4963050e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:48:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUwSAKmcdPUMQVajJgERcmEoIbxsSafIhFafOkJD9H/+UEQ44CbVk6e3atPMMj5N544V5gm5jJWbk0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1591:b0:545:102f:8788 with SMTP id
 2adb3069b0e04-54838ee917cmr5921345e87.19.1740447651791; Mon, 24 Feb 2025
 17:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-4-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-4-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJb=-TsXS3bgv-rgiON5-4icGgh81gYEJuA=ieDaBT+Q@mail.gmail.com>
X-Gm-Features: AWEUYZnEpuNKLIwyvEJM2DgjUifuLCeYu_2BU0vlX35x8eRwRX1_fUCYojEGI6Y
Message-ID: <CAD=FV=UJb=-TsXS3bgv-rgiON5-4icGgh81gYEJuA=ieDaBT+Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/15] drm/bridge: analogix_dp: Add irq flag
 IRQF_NO_AUTOEN instead of calling disable_irq()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> The IRQF_NO_AUTOEN can be used for the drivers that don't want
> interrupts to be enabled automatically via devm_request_threaded_irq().
> Using this flag can provide be more robust compared to the way of
> calling disable_irq() after devm_request_threaded_irq() without the
> IRQF_NO_AUTOEN flag.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
