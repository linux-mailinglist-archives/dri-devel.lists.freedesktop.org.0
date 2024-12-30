Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C19FE601
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E297210E4C5;
	Mon, 30 Dec 2024 12:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qPCF/yyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BEA10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:46:56 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3004028c714so103971931fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735562755; x=1736167555; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wR+rDjRYRPZhYRjSFOwWeCZzooZ4kP9UqFam3k443z8=;
 b=qPCF/yyt3sgcI2BWvLUpFvZEFOOc3cCE7smKxFgFWtohGu8VM0Qg4GnYyNNC+F5gvA
 6hB4xI8mJ9Aw5bRJoEorJKsnXXsh4eiciwjTH5sInMSX1Z6dFEtOp68/IFtr2hyIrjIZ
 5pUfnk+W2iRhpcWO4tzJrP3DW3XxQVEiqt1WMa0MczmuNb2/RZSJe1hMXAX/5sk/3G5z
 OCJs5B9OXNCLZAvw9ZT4TJJu1dWTu68yz0o5MIFekqOCtdfLgr9bPPMsd6eKzp/zEaun
 QosQgLRT/2hb4IG+fx7TXjsgoDE5wa3f1hIgDZstDy7/evJiTpehEPAs6jEA8zTT+6Hz
 lKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735562755; x=1736167555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wR+rDjRYRPZhYRjSFOwWeCZzooZ4kP9UqFam3k443z8=;
 b=a8vg6RkiZSUNr69tsPfryZAHsdnQoxPWsxFCp+N+z/EI1o6ns/8ICufAuWAXMRq2a4
 WuZO8rkojiTjFlnJ3rvnRAcBclxoBokdzMoQZ99giKPSUWP9MonUAsrzoHlkFCwqlBqa
 XcSv5EryytguAQlYhqY1o+mVQ+4SJ137+aNK3FV4kbmExP9Iwv6x2xYI6O4fXwcdNv/Q
 4zTz0uPMnWW2waFFPdbRLAoXyVgeEFDlXKnwdFd17f6r0urFtVVqylO7iGX23vF0mbj/
 +6fAYFFgdAaXZSBpGbaLVlyMc3dYSyVB36c6IC+GrWFgLL8BaTA7apna33QcrOOYtot9
 R0JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNmIEJXIDDeAp5CaZpBnMVrfJyE7sytiJvLE5uYGDG+gclen78Hs2Vi8qAV/Z8t7k4gqbaz8E2f/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjVBSAx2RJDJXsg33EbrdLZVDH5jkxZUAkXlEi7dJ86oQvfWMj
 iEKlGinVBUvq698exV4E5q/0bKX7yh8QRbbKdTlXdVLo2TGt+TlpDiz4ChXeVWw=
X-Gm-Gg: ASbGncudoC0wtOmvu96pAS2NC8zkmsgR2viJZI3+tRdt/egT7OkR9BphpxlIkmugunp
 43jpGAkZOzNgI5kuf6SS0GM9ptVUBh+2lL96PyJnf4iiChhZmstmUphiicILGuoZWDY89Y8aSeW
 XOcdBt8X8R6ZWs0eRGVek1ZXxpLoD06MvNs2tIt5jkomKlXp/XwMso3JcchuR1MvhvBmOlyIukx
 jRWu0RudMLKy4UygS6jmLjzH6LmJPQEri2M/pMIuSJxXvZY4IUzhXF4rHh1TGqtNE3DTfFBnwYK
 dnNoaD7dR6awmJ1f26Aos7wqEB7miatETkRC
X-Google-Smtp-Source: AGHT+IGQKU2FvLR9cA2rX0pjCPif1JwZJgsXfRJ7/tnNeUSB87XImquoxTJIlGTComk+jVqCQS1kGw==
X-Received: by 2002:a05:651c:50d:b0:300:3de4:ff57 with SMTP id
 38308e7fff4ca-304685f2d61mr135629341fa.26.1735562754937; 
 Mon, 30 Dec 2024 04:45:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54244e19cdbsm1240805e87.132.2024.12.30.04.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:45:53 -0800 (PST)
Date: Mon, 30 Dec 2024 14:45:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 08/17] drm/bridge: analogix_dp: Add support for RK3588
Message-ID: <n7xgy6v7txz56ew3mcinwhnln4jxar5uxtogs3om36ft2y4wz4@ln2uqsfaszbi>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-9-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:04PM +0800, Damon Ding wrote:
> Add max_link_rate and max_lane_count configs for RK3588.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
