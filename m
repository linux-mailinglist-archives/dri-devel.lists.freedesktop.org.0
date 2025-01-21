Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD0A17B99
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D4F10E540;
	Tue, 21 Jan 2025 10:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nUi3SqVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AD210E541
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:27:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-540218726d5so5212250e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737455216; x=1738060016; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WdFg6qGsZB2pkY+4R2oazhNNeEWqx3bzi7cFbCP/5Ag=;
 b=nUi3SqVbvfUPtQOs8fcHgcJ05xbAHT5VqC7rKWWY1TbI33SQtqjq8hM2Wi6X4juSir
 Z9W7Vbs7q5Y1qDcRg6NyRvUTM7/jQD4TU4Npz3uNIIQmNdyK5xiXTmHNb5XCplBrSOQ4
 aFNR5b1gJPFCe2YSmRq1LbSS67bvfYT5RZZCdjONZJ8/C8OCuLmxdAMqopALwytHN36l
 qE5PeVGaFNeZpTJaGiNg2ycggON81psskNtLDmO1X7iwfirRTQvIZSxJj488bcH/bo56
 ODdLxBZ0N7YhGPuT/KdkHelloH05zwm9Vzf6H7nFJOyM1tLSjmEWlvsy06BByVcbV35B
 XH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737455216; x=1738060016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdFg6qGsZB2pkY+4R2oazhNNeEWqx3bzi7cFbCP/5Ag=;
 b=DhFtL3SvHycNxf56ncGZZ+SMjjNimgIwxm/dT1RKWGlJTIpBpdIuItLFFXBGCQpX5v
 kTUgfa60in0Z7kzzUIU4PAcnEXTPD40VoQcnxQv+ArWtVTNeaQOs3Ja0o1X2SDCSWBm0
 gtc6s1zzT0His2eEzOjFZPRhBvWAH+SX6JUJw4QZyNPvS2mLkYSBi8OcfGnXQe7CBpo8
 NH0eOfDIR4QnkOm1G2Aogk5S3vgqQqVZAE0l3/BjemOxl3QyZW8Lgf+XAX8ChaFEw0IO
 s9cf7fAUXEYW+mA+phc3nYohmhbHu+s2BGTF/XwNZlbys2bbxszlohHy3isIapgVvcXb
 DReg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdcDDrmU7Gm5mS6QHKqZOmbJ+/BsArkD5KEEwigFV4szQAJleUqNloU8nL2OZYnuydnDdYBo0Ie5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLgAfban34XQeke37s1i3CSb1X+ZAE0QvXAEhHF2DLSiJMPKQz
 4hoDPfP+jbdfM3GosDMQ5kpjc1Cb3pL0+QoGPzvKfHWdOdMEM2eHY0l8/zFsd/4=
X-Gm-Gg: ASbGncv81bbTw2zkWYOwlCjcVRwBBxT8uryfR6QGqHE94PKsxCQA5W9wigCTbzehj6B
 YI4uKIfsGTrVxNgFswTLTW2lsW61rWfHldfqrwOQdHaKRglj7FJ2p7AF1B7u7Us1OgE4bq57ZNH
 iZa78SGCcr3Okw3kZxEUonMmdoJSP5d8wyLHAhe3JQOIHGz88VKKedFnxTZZ4MV8RsiZvUCvW2l
 m0aZVMen/3gjj/ULHDtmjr8nr6DM2yUUw1dpv88BAlCigPyt0whd9y9GpkHorx9wNlbdCIHNzdP
 KbfyqOLobnyO8gmS1VdyHGL8lydWVM/+b31izVJFZvhHNHD3Xg==
X-Google-Smtp-Source: AGHT+IEySPFsoNbsHUHDrpSBXRvZ5gncYGT564D1qY0SVeBa1kqAv1LDl7FL9hx74EV1p9ED9g9WWA==
X-Received: by 2002:ac2:4896:0:b0:542:2991:9407 with SMTP id
 2adb3069b0e04-5439c246316mr5171028e87.15.1737455215706; 
 Tue, 21 Jan 2025 02:26:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60965sm1800887e87.138.2025.01.21.02.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:26:54 -0800 (PST)
Date: Tue, 21 Jan 2025 12:26:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: ti-sn65dsi83: Set bridge type
Message-ID: <vzddret4ac5rsleligafbz4ubm2g6rdtegqkceljtc23wbkp5d@amw4yaj4stsr>
References: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
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

On Mon, Jan 20, 2025 at 02:21:34PM +0100, Alexander Stein wrote:
> This is a DSI to LVDS bridge, so set the bridge type accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
