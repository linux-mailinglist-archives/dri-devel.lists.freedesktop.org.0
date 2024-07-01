Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A203A91E95B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 22:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274DF10E13A;
	Mon,  1 Jul 2024 20:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aPINgFRH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800A810E158
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 20:15:58 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52e8cdc6a89so1201942e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719864957; x=1720469757; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m9/8mIy2Soy1rT0VBZ0KovI3gB0F5GIqwuAKjma/NsQ=;
 b=aPINgFRHXttP95lBP0F8eUBlXAbrP2D0/EfZ8grgAKpDNrRM9N9K8JwLC0eWh3dMST
 T5mVgme8n32i/FASsdiwNgcXoZQDwn6MhtQyDRJVFJKEdW+XKAAr7P+qfww7PzEktO1i
 6zp+dUwEfkhADB6mK2ZMDpbFueunMtULqzQ34UxHqjEck8p2jCRQPp43datu/yrdzHEr
 O7DBS1qzQyKMqVV6xc40VS11gKXztkXb5t80w3BRLCubZL90sGvVVUDXUsm/ez34SUK0
 rsnnGjNuikP+p+FdsCTxhtgdXchO56Lar8LZhUC5b9Nm3t8SAQ2zcKSVUGS7DS5V+sMI
 ta8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864957; x=1720469757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9/8mIy2Soy1rT0VBZ0KovI3gB0F5GIqwuAKjma/NsQ=;
 b=bxIlhy4l+JykdXpUgt2PgTwalC0d8KsohAVZiKgJw8/v17nKPSjcDR5QsbIdh1j/gi
 rRxnOAY7v7DLEAovvsHST93p8Khi/mUFdpNZBrE1BEc61ljhE4RRby8mZA8Nkwu+3GW3
 mH3P0HWDXjtMuoTvGTjb4FXO4BqQxQ/JIpA8bxL3UftB9RzJxL2ElOW9FeTKdQ4PnBq9
 QwHOP2g60FbmDFxT00tmhoC7Xq8kDcEwf2ha8xw7IjXhjTysoFkdr0EN5LRuy/YDPB1A
 EDZ2YmxGWzjozWWNe7TscTr2kNWqY2N4SPhAVSgJ50IbUppoIV9pBQq+cCzMDghgcZvj
 VwCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXkQh9mW5vNDs8mD7WKoOaQRA02LAW1kQ8qVOtoJ1CymFQamioSwKLIfxMK6nFY4prBQFu+FbLYvAk2thswJXUaU8VKM5JH9eO2gIVZDOy
X-Gm-Message-State: AOJu0YyilmbtOcy+KBG1oEHa5wqbijTSid9tazUcIHqD7CNZkmqrhgHY
 IR89fJaC1SMAsA1u25Qb5PlCPcD4/a5gz2dHJk+g8/LBzmUnKsOefd+cLMsYJ/c=
X-Google-Smtp-Source: AGHT+IFxn3+GVHpCKWLFmtvjbAhKGJt1X+Qt6/RrWK3J3/PhaV4OJn52mux+6Y+DaNLf76MWaMizZQ==
X-Received: by 2002:a05:6512:3da3:b0:52e:713e:697c with SMTP id
 2adb3069b0e04-52e8267b8d0mr5580487e87.25.1719864954692; 
 Mon, 01 Jul 2024 13:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab100f2sm1522634e87.69.2024.07.01.13.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:15:54 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
Message-ID: <6bbvfyh3pgbx6cgzvgvxszrlm2eycpuqf2lzjppvlfnojwr4sk@koppspbhqins>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
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

On Sun, Jun 30, 2024 at 08:36:27PM GMT, Caleb Connolly wrote:
> Some panels like the Samsung AMB655X use long write commands for all
> non-standard messages and do not work when trying to use the appropriate
> command type.
> 
> Support these panels by introducing a new helper to send commands of a
> specific type, overriding the normal rules.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
>  2 files changed, 56 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
