Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1F96F084
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60E110E9EB;
	Fri,  6 Sep 2024 09:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mKbt3EH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD610E9EA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:56:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso307653e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725616594; x=1726221394; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
 b=mKbt3EH9H/rANzq0Vcvy0vNLWpHxMlJzeBp/tqzHVr+ERQZXeZr6xBp+x0U0HGUmUm
 pbz+w6Lv7kuCWEyU/XeH7T3B6gntr8PPkMI6Ns9wc9Gjri56u1nxiVDphiG8MiIvkQEZ
 mMOR+tC8U9fQblmHmM4+1/FNxtCBXc7pkvRhfJupONLPwVxBnaKRYJdNaxZye1Kfxt33
 QiQVMSvg6oDn76iUqAX81WbG28X438cJftKIiyFv5RIvl7aN3CO2oXhM9LHfWCEw6GbR
 f/fSiA8kkVuuC0FA61NEB3NdJgdUqN1sBU6jMW0R139x1HDxIJNeEh6qlL/vUlDS5/6S
 HTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616594; x=1726221394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
 b=ZugXDUAgpAvZCmoZ071Upf89RZSgyx4i8y2qEcoj7jYOvBrqwI7/QvEgpagrZ42Uve
 pFJ62K3E7Gs5sP4UbQowzTFjXxOZkpEf5GC0PTCgAoo89Hy6FKSlzg1s8T4/elidgE+X
 mqjas3dZhm0XfMXlcOG3YIsxfDU5J1jwPArG6zDrqjvv2DnWYwRp0Cmt/y3aaWjSaoC4
 ixc4nbCUta2cAD4Z+vsJmDSYNKCjrUzSt5lBOn3BcuS1+Ds54LpEt/+hAC/xKdW/2ynT
 17DLcki9f4hNMU5NseFU+CYsnKynBGG6hbkG2cdApR3hLJJ5KsPX0abULkWtwAuEkhpx
 KFMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWySQwUv21JwwDzPfI6WofeeE04+VIgpmS6aNPuGNEN94tQYM52K2yj01nxJuZve0qv6W+XOEiVEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAAjahkdiCcGm773Qz7TXYSDkGJMUo6kE5oad7KXpS5W6XkU12
 wKd22SA62KBh19PTkwDNUd51o7se3iaJHxmajoE1wHbLGD364rTrVoVP/QCByUU=
X-Google-Smtp-Source: AGHT+IG4NjSKk9CJsxL7X661oGVWb4dJGK9kAqeeKA2OE5R1RdOgN5Xic7eEYM/SdgbXf1sQD+KCfA==
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id
 2adb3069b0e04-5365880bbbemr1607806e87.48.1725616593689; 
 Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084edc5sm2826881e87.279.2024.09.06.02.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
 robdclark@gmail.com, 
 sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
 marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
 jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <dgrmcsmqjqukta226byebvbdopcxqapq6kaf62nmttbbgcb4vk@ptkkp3672v5k>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-3-ruanjinjie@huawei.com>
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

On Fri, Sep 06, 2024 at 04:23:22PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
