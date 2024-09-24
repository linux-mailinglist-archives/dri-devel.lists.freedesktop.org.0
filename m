Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5B984F17
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7B10E77D;
	Tue, 24 Sep 2024 23:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AnSpo6nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DBD10E8E6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:44:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso7135286e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727221488; x=1727826288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NTnQcaz+QGqGQ+VZWuLMX82hxnpgAqAgeULVZprajdc=;
 b=AnSpo6nDCTvby0UEdUSZXBK9++8rq51TzdKenDNxFpBvha2qu8W2MzNkxXdNZIZfYc
 bsb0HpMTVjRQnkSJAU3ZY7OdlK2HzjQdg2tAQroJTmKhFvwc47Hph7xUC/hAQu/FJe5I
 OBWGwFHMK7oE/KVpif/KrCcaYU1ndCRtEsJ0+KxRWNb7v7odS3BhU3GZlsgEZZ3QCeP+
 Ws4YschQnNFt3kyWnDBNmglp9Ngy3Eqw1reTHQnMv/pNenreXBW/fRwDl4E6OZ/S3l6V
 Kx6UPha5RjmCWVUrQaJwjiu+U7QzBO8xvOT0kzH33pjav9pObMyxSSYxM6kJ79NwqBzS
 3ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727221488; x=1727826288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTnQcaz+QGqGQ+VZWuLMX82hxnpgAqAgeULVZprajdc=;
 b=wxGr9Jk0sOjtM5brzNn4Y4/2gg8M7r2RqtJULxJxXZDm7ihFDWDx4qeUQQsCEgVmuZ
 VZU3/6LxAEzNwHr3rQBN+7+v9X1gM9mtoWIJVEVzZgkEAEkoEui9D39aW56v5jueKug6
 /ihY6Sh+o2eFCzfpS1lf7fr15gdw/+2gwc7kiSYV8MSkcDm476betFMNlPuInx5yl3mV
 L12MdLYoUN/J6qkMM88Hgsxy+U6ZjI7CuxiCALMYCw9LoMqCMPDJwB0nsQIUwzppZ0tp
 DJMozsOY1dTeVWrbFczdh9DOu3XJp99c8RDVoJmjGvRWgSusUOmyO/OBXtljwo+wBOws
 jiMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlFt8dtcAJvr7LJJ3TMRNrZJ3NAlSQxuNxq7BqM00RTkzFWgCZCHMWBQDnWgfGvfcF7FnYtvlAo0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeZ+SqizSlLaUYms2LgE+aRR82E9ixvgRZP0S3D3hHB2hWoJph
 ShHn+nzZJhsDVP27cp0/NtvYsASJeY4NjRRmwc4pz8Lcz8T+9Ml81DNiCKlOLOI=
X-Google-Smtp-Source: AGHT+IF6TG6ilcpWrQOEI+i8x0eM464ASRf7xWLlUBr7ne4UAlr4fYPfEfPSXmd2A/lIL6NquNGb7A==
X-Received: by 2002:a05:6512:e9a:b0:535:6935:7869 with SMTP id
 2adb3069b0e04-53877565c58mr344952e87.55.1727221488560; 
 Tue, 24 Sep 2024 16:44:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e12dbsm358681e87.58.2024.09.24.16.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:44:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:44:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 22/22] drm/msm/dpu: Set possible clones for all encoders
Message-ID: <vvycrbbrxcjiplkfsvonqdvhxrlntbiavah3sr5ak4bcy5kb75@7cfud63zswfn>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-22-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-22-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:38PM GMT, Jessica Zhang wrote:
> Set writeback encoders as possible clones for non-writeback encoders and
> vice versa.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
