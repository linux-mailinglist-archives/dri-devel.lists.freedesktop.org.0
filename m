Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59EA1CEF1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ACF10E275;
	Sun, 26 Jan 2025 21:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zTSZuLAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35710E275
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:55:54 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-303548a933aso35086611fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737928553; x=1738533353; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NfdnOOEyTd9myZSyTE+Ph6cZad4r/9DgxBixeuMqf6A=;
 b=zTSZuLAhZHyYDVRKXJFW3O/OFBgw4iJJwhKYQqNeWXRaV6m/Ttsvme2O2RmcsxPbKG
 rtrEn7FDYtr9g5X4Lzfbz1IphSNKNa/+2YYGydE7dqkY8neWJCJDut+fVN9v3DQeyNqe
 RazW+AuhF9dlTRbAP8HnvmROk621zNo/pLvJOUu4XAQFkbreIsZMHrsCj//EBWnO5Bu+
 pw9yxr8DNAlUzVj0xUU/RySGkPAMteS51eT1gYrN3iVnXA5u4sVawYFwooeRgUP9ek4b
 HDphIBCdrSkFjcXD0KxYHQz+gmiomieode1WlHFyzOrr8VMatGlCuYMZ52jIomDV9SPK
 Sz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737928553; x=1738533353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfdnOOEyTd9myZSyTE+Ph6cZad4r/9DgxBixeuMqf6A=;
 b=IElO7u0J8eAdKIDFkwXs7URZkzX9qGn/3Q+cYUsQUj4k3uuTyysj8d/eHAeCZgaSzk
 vKWNLP+T1bt0egbcGM1/mY05YOnwOCUgbGs65MhJnTGupvm9geLJie+yhcwRyYHCFuvD
 YjVRjIc9n5mEhpb4zKrLss6Ua3Jj/oGXHxcPuqAqjmiT2TFNMHCIIu3FRp+w7BJzK0Wq
 SUSlQVY/Lze+IbAh7D0XxqOivbHq2qb8r3BPZe14/ZA/ghhJs77HwQKmTzzgjhpVXTt7
 qqciiuyCGGM2lvO9RPUXeS9KXdT5qxDr+yEAZSfY4NXU4hCjlgx7mUtjzopzMrgDLloL
 HLbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT+EkG9m4etVv8n/q8BzbNOuWucqXG/vcYzeG7a9GUZf4WIyPz75EHYgEMkjzJholZB3pT57RSSsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxajmUCsMiPQOEAr+/w3SntJc/LdVxQlGqfWZ9Zcto/AJHoggVF
 fqoCKnKnF6Sd7qHYtg+gq06EudmqNie10/OlQOZqGe1wP8b4uqJt3xLUs4wFHGI=
X-Gm-Gg: ASbGncsjCGlpxXRxKbtcZ1oQUD1O7YP51nA5jE6JmaZlga86c7A3E+6oHqPIcvroFE3
 aFk15A+KbXZZanUaklq20MQbLcFF0JmML7kzWh85GSK+ayA1CYu/YDMmhJy+r0bI///cIm/vS4j
 LmzSuj2cff6rvmwUzuAIhBwN7ox72kqyShfhMQConQBpoaQtCTME8YBd/Oa6EGj4A13+QdlZu3w
 ix6JQEwJtMzrOJT2I6px8qMt6alnsWeUTYuWQcBiO1xB0muAN7pY7I0W9N5gkj/OzhG31Pi+zMa
 8pimoe7mlJh7euVCDcRAU94b7mD3Twk50lo940chTFLGMTppRUjUGMSiFFaM
X-Google-Smtp-Source: AGHT+IH7koP9M6UuQkZjaFgVMg2vdS3cGbiaT/8v+2rLz4RRU+RhlctzxS1Z/eK62meft56ESvTxtA==
X-Received: by 2002:ac2:4c4f:0:b0:542:6d01:f55c with SMTP id
 2adb3069b0e04-5439c216ba7mr14591981e87.3.1737928552871; 
 Sun, 26 Jan 2025 13:55:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368425sm1035880e87.121.2025.01.26.13.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:55:51 -0800 (PST)
Date: Sun, 26 Jan 2025 23:55:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 12/13] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <vpm37mnvo4vs6wgllgcep4y5dbxdfsblkqeolds5guwc353mbo@soxufe4jfbo6>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-13-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126191551.741957-13-aradhya.bhatia@linux.dev>
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

On Mon, Jan 27, 2025 at 12:45:50AM +0530, Aradhya Bhatia wrote:
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
> 
> The sequence of enable after this patch will look like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
> 
> And, the disable sequence for the display pipeline will look like:
> 
> 	bridge[n]_disable
> 	...
> 	bridge[1]_disable
> 
> 	encoder_disable
> 	crtc_disable
> 
> 	bridge[1]_post_disable
> 	...
> 	bridge[n]_post_disable
> 
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

I don't feel confident enough to say that I understand all the
consequences of this change. On the other hand it sounds pretty logical,
isolated and can be tested separately.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
