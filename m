Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963F9E5EF0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417C010EF8F;
	Thu,  5 Dec 2024 19:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oDvjL6A3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68910EF8F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 19:37:50 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e2121112eso1842546e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 11:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733427469; x=1734032269; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ffMfzaWl4ZxhGzNXZBnVvZ4mLesiUwKAMA7C3eofRvY=;
 b=oDvjL6A3dyf8QHs9BVTtgsiBINOAKfkXQq2qieZZKMeRpisKZ4K1pvVly7LoXbixqv
 UlZpbniITlwS9T0ThiD+bKRFYqlscPXejIPH84VXtdmlSoz3yIjmEzONVEUsYKEpIxUK
 8PfffpWSuVUtd01N7JFpOtfKT9mtQyeUSkTHABRDEfSE0zqTud+HEYALG6+VEhA5xBRw
 lQu6L4gORNWs5oUkUoNM2pFlRB5Ag9X/DnMNgGhP7f+sfy4I+hCJld/zOrsV9i7EHufi
 +TThwKs7EpWb2EyDL0b7YZdegyeqBwtlDYm2YE+EVBPwF1JlVnEA1tf4ek5C+Y73XXQp
 98aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733427469; x=1734032269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffMfzaWl4ZxhGzNXZBnVvZ4mLesiUwKAMA7C3eofRvY=;
 b=dzHGMSJomdli/qvDFZbDOYwlw5G4rcQJF5BXhoJ83g1y+e+q1h+RpRxCpyJoKyxSye
 LcEJux1S6Bctvy7lvpzdBtpLiaGenuS3YGaPIH3qsM1TDnXGYOQFKBxvYVP1hShLGK8K
 sLIZi34FHmbMOy11uH0JvvuawRhhQxfs6MEqaISORZ2LBrmS01m30MA59TDzAN2sN9Of
 KrUWZ3Y5123R0tFbTFfLMzLt48RfVD+nnfrHU2pi5bxuSRITblE9E1BhBKlm2d/Q924z
 60FrxoqgVH3Q37VzjKSwvCCxGMSrVuEOBfsvRwWY5JToxZ/7wYS04Qv1l39hV+bpT8jl
 KZww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTWX3404sn/cJUGxVTpEXmX4oAoIuLjCOXW4bfKr/zR+n1XavzrgU8I6QZeYWBtcqILEUDMlKkfKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG6dQVwXGSPS43WeuH/Ph1TgdtktluORTpj4+h999vTqpN0if6
 VYz92AfJM29BNJ9EWFBBhfRJZUi4mOaEyCMIeYOCTLkDRQIIQPSSBplg+ZPbl4Q=
X-Gm-Gg: ASbGncsZQ+0HAvUzQBEV/GSo+3h/IlVzeOBDLIp4plS1WLT8mJs/X1ZYoxkw05le5aF
 u5Cp16VQBGDPHYHyb+6EmvYz/YEVLRD1REhP0lxoXzkidolqwE7lJxhB6Q0LdlBjaiQzpoS5IYW
 YxJeo0Vs/Y6l0IewiO7QU8PjIX5C1/7T1ZWNdnYLzovZZDzOqv4+deXO1LWMu3ZQU03y4tEsrZx
 Hx7kwvGEBmNXOFSivjKkDyLSa/721TlY0+u6vdYrCy3oChtizYCkr6Xl3g56cUmngKRP6R9vVGA
 ViyoJlN6u42zZy36k8CSVAJ4iUWSEg==
X-Google-Smtp-Source: AGHT+IHouSk4z+9DUIpuLa/xoDTs/njDFQllLy+4Rry7lGgtHnn5l12emLPBbFN+f3zxai1eSi/qpw==
X-Received: by 2002:a05:6512:308c:b0:53e:2789:f0ca with SMTP id
 2adb3069b0e04-53e2c2b9004mr88734e87.21.1733427468718; 
 Thu, 05 Dec 2024 11:37:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba7d0sm318153e87.143.2024.12.05.11.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 11:37:47 -0800 (PST)
Date: Thu, 5 Dec 2024 21:37:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Remove redundant
 assignments of panel fields
Message-ID: <uar66c2tl6esj4ecce3nwskplpphuarq43su6nwqriv6tmvkl4@gyjqcfahhpto>
References: <20241204093942.1374693-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204093942.1374693-1-wenst@chromium.org>
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

On Wed, Dec 04, 2024 at 05:39:41PM +0800, Chen-Yu Tsai wrote:
> drm_panel_init() was made to initialize the fields in |struct drm_panel|.
> There is no need to separately initialize them again.
> 
> Drop the separate assignments that are redundant. Also fix up any uses
> of `ctx->panel.dev` to use `dev` directly.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Also fix uses of `ctx->panel.dev`
> 
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
