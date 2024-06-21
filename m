Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC28912FBD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 23:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D637210EB29;
	Fri, 21 Jun 2024 21:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M0voqqen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2216810EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 21:45:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso2031099e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719006334; x=1719611134; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JzD9KRiePP7qUwVdbl4pi5G8gN8VbBVoo49624brcO8=;
 b=M0voqqenBY2o7xlCUpBmWT3gb3Kg54NmIMCwgz7OTb7RLZhR8cih7AJWV8ysefT7MX
 Iba3oHI6uDxWibVwxl91q+qZUUwSLe0vQn/s5RwS1BwtKsugVqc4o8wSn/LymbXohfmW
 dbbrndXWO/CzTX8ZICvMpNpSaeZRVwXufBOAoHIlZVgmB/EeWKdNTKRhztblzwWC1DRV
 Za2qkkVDhNj74Vdys5OrZqxQpkzaaAAF5+PNMKqCaXKHS2oCPDtDExWsz9ng6O3y9Owz
 zu8widG86eT70I5k0brsGwlCzTjs7JJ7aOxVEmnmsiCSK8G8GULgWJWOfP8GKXWLxNnt
 mS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719006334; x=1719611134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzD9KRiePP7qUwVdbl4pi5G8gN8VbBVoo49624brcO8=;
 b=pEYUkzUGpVGHjcNV1E8ztAl1ZtH4DSozwVy+9dF5BPoI26lLTvUH+b3pkSZNpkqJg9
 Z8xffq0gX5nunlg3tf/x7uKGreq0sjw+WvdrvtdE2RScbay8Gh2AIeKyUGG++uVNqhen
 Lv20FJmIRP2/UgDz+z9KXI5hPMuVZRv+jnbtvrpRBoGoZkzkVVBq9OGfobUFnR2MwDsm
 nCEW1ZNTx7DAKiAPYWfM6nfpS5U7rg38O4qgXWE5ArxSqkNhzZcpg7BP9UeR5bpxcHL/
 Ge2T5+10q0Z+FWZd1U5O9/VTyOOTqtn063dXafWjHTd6H6ac0/F5UpsRHEcKZ3AaCtaK
 DeOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgJQkYeg/4MclXW7V5oLh7gNtT18QMVhuvMcbqcguzUMEkrS1rzWU64gGPLgKy0l9PenbOzR3q2pugQ/RHwidH8iFAp0vnN9NCD/I280Jh
X-Gm-Message-State: AOJu0Yye7Hd5xjizJWqDt4m6NQg7ctlzPmmIQeBlj8ig9erfJgYrxPLk
 NWWBXW0KiG3p2ulGOF0VwOo90IGqA/tzDtUf4liKQbwoImQ5uzZX3M5cP7+22pQBFjVIU2Esm4h
 FOyM=
X-Google-Smtp-Source: AGHT+IGEjkmbRauRN60byxtu1+ntoVgQexF7ioxCO59JtaX4ZGjIs+ZxbGr7ZvTpq5M9hwO9bImPVQ==
X-Received: by 2002:ac2:5636:0:b0:52c:d5ac:d42 with SMTP id
 2adb3069b0e04-52cd5ac0e04mr2328670e87.9.1719006334225; 
 Fri, 21 Jun 2024 14:45:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6420371sm313048e87.170.2024.06.21.14.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 14:45:33 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:45:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel-xinpeng-xpp055c272: add check for
 mipi_dsi_dcs_enter_sleep_mode
Message-ID: <rgwik53edk3dipeg4v7hjsi73sqhsrpwtjrosnwfqyuicddcxi@dygh2mugchno>
References: <20240620074802.852544-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620074802.852544-1-nichen@iscas.ac.cn>
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

On Thu, Jun 20, 2024 at 03:48:02PM GMT, Chen Ni wrote:
> Add check for the return value of mipi_dsi_dcs_enter_sleep_mode() and
> return the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Fixes: d1479d028af2 ("drm/panel: add panel driver for Xinpeng XPP055C272 panels")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
