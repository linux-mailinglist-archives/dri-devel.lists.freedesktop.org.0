Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C41F6ADF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 17:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E196E17A;
	Thu, 11 Jun 2020 15:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA676E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 15:22:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k26so5435430wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1nlSpRW9uKZkujI3ovnMqEgLfpyhYszTXX8pA7a9rw8=;
 b=A/sme5V/cIhwe8I9Of5+XKkmePLK6qEFBuhVnLMz3sN9Y9LtjoVeRg2QC+gBfqakOo
 D7ACqOpcgouR08YG/q+5EbqcykmmmZt8FjsEVm1zcHiHcdIQTBdOIh4Twa3JOP5WB5cF
 v4Vkxtyf3AsgAFi7urVL2nqe8OI5y0bb89E8nXexnvfLWCc1s/OSw9tJgj3etzRiyuSG
 nEiTzC9DYj/pd/8EeNBqDzHgigmRmo6AOBlxblrS4dp1AtsUkkw3jQyOHltBa+1xLZqN
 Kq4uV2dgv/wfuUsT5lkpnNNuYH8nAOzuux679lKkZNeyusFXoMFckaP6pYxNJ49dTr24
 +vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1nlSpRW9uKZkujI3ovnMqEgLfpyhYszTXX8pA7a9rw8=;
 b=gHmYIUoyI1Fq8mkbCAWJrQEjGaLJOvnuLF6VmMdR4Ad+ri9KDv/MseVLkhOVT6yx5E
 OwV6B+TPQZY7t48hHwnRjmCWutGltQovLmAiWkOKZK5uWyRcAn0BSRzktjwmOkX6BS9B
 /hmpY+nHho7mlEUS2PEAl+OSPPE7QKWqL4jb7PjiQFU9yzL1/DV0wuosFgrkZGRgdNc5
 a3vAZ/3tPRBYlYWgHxEMhpcqIysCF0B2nBujf5QumoDVoHBcsHAA1JvYATroscd+2IH/
 Jydssy385rzpVpigglJQK3wGIndZAHFnbD6SW2T+7+Vauie0oC17ycSYvYGMo1qh8YO4
 3+Zg==
X-Gm-Message-State: AOAM533tZ+FfiYwNZJCCVfwE/8k+p6iFjUE4EzWX37q1AgkItzFm7BRC
 eHoQCAuz+JeWxsR04tLRji/uUg==
X-Google-Smtp-Source: ABdhPJwgOUF0ACQW0V2iGQEHEnECqPXsLPsoErKd6xk/1/oN48hrXu8XWttb4+F2J1GolhZuGaGGEg==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr9144654wmj.185.1591888923973; 
 Thu, 11 Jun 2020 08:22:03 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
 by smtp.gmail.com with ESMTPSA id q8sm4290865wmq.1.2020.06.11.08.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 08:22:03 -0700 (PDT)
Date: Thu, 11 Jun 2020 17:22:00 +0200
From: Drew Fustini <drew@beagleboard.org>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH v2 3/4] drm: bridge: add it66121 driver
Message-ID: <20200611152200.GA3106776@x1>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-4-ple@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311125135.30832-4-ple@baylibre.com>
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
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, mchehab+samsung@kernel.org,
 sam@ravnborg.org, heiko.stuebner@theobroma-systems.com,
 Baozhu Zuo <zuobaozhu@gmail.com>, icenowy@aosc.io, devicetree@vger.kernel.org,
 stephan@gerhold.net, jonas@kwiboo.se, robh+dt@kernel.org,
 Jason Kridner <jkridner@beagleboard.org>, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, Robert Nelson <robertcnelson@gmail.com>,
 jernej.skrabec@siol.net, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 01:51:34PM +0100, Phong LE wrote:
> This commit is a simple driver for bridge HMDI it66121.
> The input format is RBG and there is no color conversion.
> Audio, HDCP and CEC are not supported yet.
> =

> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig       |   8 +
>  drivers/gpu/drm/bridge/Makefile      |   1 +
>  drivers/gpu/drm/bridge/ite-it66121.c | 997 +++++++++++++++++++++++++++
>  3 files changed, 1006 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

Thanks for working on this driver.=A0 Do you plan to post a v3?

I am interested as the it66121 is used on the HDMI "cape" expansion
board for the BeagleBone Green by Seeed Studio [0] and is currently
supported by an out-of-tree driver [1]

-drew

[0] https://wiki.seeedstudio.com/BeagleBone_Green_HDMI_Cape/
[1] https://github.com/RobertCNelson/ti-linux-kernel-dev/blob/ti-linux-4.4.=
y/patches/drivers/it66121/0001-gpu-drm-i2c-suppot-it66121-hdmi-chip.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
