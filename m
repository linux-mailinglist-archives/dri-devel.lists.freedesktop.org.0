Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2378A7534
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3806112E27;
	Tue, 16 Apr 2024 20:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FUemQUdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1EE112E27
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:06:33 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so6176001e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713297991; x=1713902791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5WM/kJl6/lgxNKvGcl2foDF49S8YDknOQYG0ZwPqeq4=;
 b=FUemQUdSLE5HvjxsRSC1mU9bgfLpx+D0SQSLPOqFALiavpIYdba6PmrUB1I6LKrDLW
 xUfFY9TGTlwhtTMjdFsG18rg3czBMkOwaPut99/fdBaUmIIdYY7/BNyDbLHQrMNXPqe6
 2ABuhEIJDITrzvVlai73xG+/U1KvMYu7Ptzz26XmhXJN3Zp5R/8RHavhL+rLJ6tFKvD5
 4Ow9tLSPm3kOXezbldQbI/UTrmgx+JbQ4/csGEmJRrB2osPawIBr6C3N/eQRDF32hbMV
 JNdBVixBDWn3AZUk0uSvVQYPNq89pV4iaeDL165pwDzCnxnCZblqjDDgBAsAirgB+G9O
 VnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713297991; x=1713902791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5WM/kJl6/lgxNKvGcl2foDF49S8YDknOQYG0ZwPqeq4=;
 b=WtOjrTXJbzQxFNXIP8n0Our+R+5O9GGvYvrLZee1GE2xoSeICExVNSMMlsjNQBqXWQ
 0h9Iz2i9O2U4BoKD+vrJUNyxuW2R0aY3KIAEAgWSNH6SmFLkfDt5JH6B/e2NrT5pPknb
 VHrEYtuE1ML4pX68vgMy27oCOqDN3qDwj+mJoj8vl2yJB/AD5cTlAD7+OdlgG4qaGyoZ
 K4BC7I8M5seqt4Xs2uVg+RDM4jk8vY9mYB3iahknRJP+lAIiyBN1SBkrk7COl7/mWfBR
 OE1basd/jj/sDEz+PDcewMNA0lytsBTIoHdu+QEACAsMkn6ssnDd6mmu3ewSMbDEAQha
 33HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4+Rkgh6HwfvJRzlMLVus1Z4v8g147MopOLmn1twkHVx1Qmja9JE0HrrImITcQipHAEvNKCKCsZq4qG22eHTkOE+stqKFWdiJmaqWJE4Kt
X-Gm-Message-State: AOJu0Yw2+5ZSfQSFOjTKMAGfocLSbJjvWGsAvbmAtlPm6NGtXIZjAVwK
 naz6NZtynUmstEljecFJYeBgXBuU45Fi93ikcvtnRCGaELk12NyUibxYh2ObKTU=
X-Google-Smtp-Source: AGHT+IFmHOkNwWKSnm1HBfTZnquMULqoBRj7rBVPJKHrN8vOG01l/YisFvkz/QvNtFNORfqb4oKlMA==
X-Received: by 2002:ac2:4ac8:0:b0:516:d1af:adc1 with SMTP id
 m8-20020ac24ac8000000b00516d1afadc1mr10003114lfp.9.1713297991264; 
 Tue, 16 Apr 2024 13:06:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 p27-20020ac246db000000b00518948d6910sm1254318lfo.205.2024.04.16.13.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 13:06:20 -0700 (PDT)
Date: Tue, 16 Apr 2024 23:06:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Wronek <david@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for EDO RM69380 OLED panel
Message-ID: <ni6kkq6brpnlve2nkcbsi3j5zmcfwurh2wj2nlypwpp2vqxrpd@ktgncxudgeu6>
References: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
 <20240416-raydium-rm69380-driver-v3-2-21600ac4ce5f@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-raydium-rm69380-driver-v3-2-21600ac4ce5f@mainlining.org>
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

On Tue, Apr 16, 2024 at 08:30:49PM +0200, David Wronek wrote:
> Add support for the 2560x1600@90Hz OLED panel by EDO bundled with a
> Raydium RM69380 controller, as found on the Lenovo Xiaoxin Pad Pro 2021.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  14 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-raydium-rm69380.c | 367 ++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
