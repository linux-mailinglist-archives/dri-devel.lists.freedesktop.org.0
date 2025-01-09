Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0FA07614
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553410EDAF;
	Thu,  9 Jan 2025 12:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I91yL4/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D930A10EDAF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:49:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso668198e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426947; x=1737031747; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ISAvUvnxrJppDS2oaPXGBaXepNKXj9gL7beVEXrneoM=;
 b=I91yL4/XRdFCko2ctUcAM9pWCpiAh/yzjaFaedviipIDdzDslBO3Wn6Bn2AK/XcIuI
 ilGg0+5EEri0vRvP0z1cM6isCHO9ZuoDDOOrcsAsdTYTYJlwEXaiaSs4EoeECOOjK/ZS
 3buHiIKslvuoZ/Nuw43lCNep3XOR4xxCClxA0cbWEBDKRVxiAVpx4bmmI8iOipeQEmpb
 4JyRnbfyKQS0Fg+1cobX+BmhD3+6jgJ7rj17NZMP06zHFknAcmY4huiK7Cu0mp+abYfL
 UQYb4drlujL2FBlka6Xykfk3Hn1wpSI7jg0KfbRxKhc/GO4LjSkkZNt3MsBjTx3wpxuf
 PlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426947; x=1737031747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISAvUvnxrJppDS2oaPXGBaXepNKXj9gL7beVEXrneoM=;
 b=UaHrRm/jNL8e+uX9QVkWz02nblQtKMVcoTH8eMuGn11rNskX6CRNGHbreM7BWMcnwh
 wmUnwf7NwuUeCbzBnZ8DTJf8Gl5NUsQYXubEQFrnIq6ljasYGPk5CLfhgfp774EY233E
 tUfVnRXick/yOOaLEP6V/JtloQ/TnphccA4sV79JlfvTX7R4MdVTWZzuqY4z6ZWvWRfF
 FmnssgkKwMGAmT82/VXrBx6/rtgl4uzZfSVEQfzwxlDg3Gods7Lbx8g1FbUivJqoRC13
 pYPtGKQiyF4/sMyxb7kHlARZFwD2aBh9mbM6C+XTUhPHMiFh93v1i9kdoKQzBDtzuGc1
 CAYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaWShyH7ElY8yJjS36NiNTsZNOeLFBvj09WKFXwv+hMFI/6hDF5dfRQTqqkyQ0Z2xFSRrKjNw75ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtE2QcCZNdnk4gh6g7ANYBdhatXwx0PCNqEEqqUjTft5A2VHCH
 RLhOLpXIGXPIfOPVNPgkRfiCPaQKfy421HsRvfiTBQS2y9gVolh/jr93RuZB4Ik=
X-Gm-Gg: ASbGncuF0ZQOA9WLyyKUuAj3kvGLrE0MAaaRnS6c18Qo/hPaNxZfJXN+tn6FmxvoXQe
 I/97qh5olql5Kly2p6Ox4SUv+1g8lXIJPuowMlVOkKzVZ1T3wpiYUohWrccCgXH0tdbFFYT79Ks
 IKyxh3qr9jeJ2oS/zAs/axAHXb/BPZUrOeG5Tr56KZXvpeva8KAVl+Z/ytwS7Ah1pxy6u9XoPnK
 p5lyBeRnNAFoGupMkCvt624Dr0lOHdCmQMqycJGlIdeBA5tfQ7zGIBpR7TfsVzmJF34uI6rkFzI
 XjwA1SKhUz8bMt2CsEPaZ/eg7a500qhYrQCh
X-Google-Smtp-Source: AGHT+IFtzPf5r/L8vL1E/ZArSF/N5lVRhLbGlgYJHuErJi9BwgLOD62Gve10/GJMoU02S8ksLbRDSg==
X-Received: by 2002:a05:6512:1281:b0:540:30df:b3ea with SMTP id
 2adb3069b0e04-542845b972emr1634434e87.15.1736426946964; 
 Thu, 09 Jan 2025 04:49:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be496c4sm193126e87.24.2025.01.09.04.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:49:05 -0800 (PST)
Date: Thu, 9 Jan 2025 14:49:04 +0200
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
Subject: Re: [PATCH v5 14/20] drm/bridge: analogix_dp: Add support for RK3588
Message-ID: <q522hpxpoxwierd3uwtijvnmaia5tec3gzazuzblhxeqgqgavy@d6yhljsiyvrn>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-15-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:19AM +0800, Damon Ding wrote:
> Expand enum analogix_dp_devtype with RK3588_EDP, and add max_link_rate
> and max_lane_count configs for it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v5:
> - Add the RK3588_EDP related modification in analogix_dp.h
> - Move this commit above related commit on the Rockchip side
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
>  include/drm/bridge/analogix_dp.h                   | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
