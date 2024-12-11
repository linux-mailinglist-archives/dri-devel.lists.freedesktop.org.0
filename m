Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA0A9EDA67
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D455210EC45;
	Wed, 11 Dec 2024 22:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZAy9FsK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287810EC45
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:52:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so3900977e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733957560; x=1734562360; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NY0DaHYgseRDWZY4d4IDidbyN2YiOVi5DaD5aAxmd4A=;
 b=ZAy9FsK1+xReP/ba1c2bffLg+PRFFBiw4vUf+YBQEmAhmhJpB5Lri4r2psEnGO0nPF
 SwBpEz4nYtVsfYkGY5G0glHIbD+cghFQ2YMmvwLrE8r9wUhowqwRX52INeI46cYWjAn4
 a6XSWuY9A+I6aWj4h17CaSa9aA5UfA25k1/pgQoyfzcR6RYt5TjPzqEHFEeqfd4TrIeY
 VTEzHLvTOzOdIblxgL40cECraaqs1cqpMZITfplm8h1RrCKdcbOgqqUxiVdq4hipVHbu
 3CDyVZi2/yvuNmJbdbp4+thkc2Pu8oF4MBHNWfxc0q0wswHecWotOlnVrsb/sjXV/90Z
 RfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957560; x=1734562360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NY0DaHYgseRDWZY4d4IDidbyN2YiOVi5DaD5aAxmd4A=;
 b=AbqTPArKd1yQTJBLb5ZET4PTuzhUHM4d2+G2yTRDCIQPqNWbMYsVda6TQntCjBxINT
 vZZQXCtBfrfRCEt3+Wli5ng++r8hDk4bHnrNHK0W7yHo3gSabqe/uAw+ZExvxcsB9fGO
 Pghvc6JhSFUjx9vWai4fM2WiSleZvHT0QhVbc390TUU8DCEVtDYGJWJSHJK2lKqd+Fve
 AbWmBZCQ9yQ47JVywaIRhlJRd7PYE9p7VYQuPXqmuXG5cCd6doVKjY0ulotRJEAuexMb
 N3OiKQwXKRUYXj81ZGik0w2PabuXdlpkYkcTBh0L56hltrZavRbPl7HyQ71gMnETEJlm
 zXsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcIygxf1G9z6yw2MtL7QBOxR365kIYIywdRpwERI/ZPogmC4/1iatgZdP4DIM369PhBit+Yrw0SvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1yHQmwwXgQJkfdKadHiFtdtIsRDTU/bYrZ/8OxF8z3A92xByc
 ++NBgBa9hcws2ci30qzJB1PbDNRWmCtblEQ6Ieoh4tXWoSFx/Yp2swhqxiiTpm8=
X-Gm-Gg: ASbGncs4fH4RIbRA3vpgaLa5rb5gDEHpmGyBXfs8OyfifFH2WfSwd2lPIFvDyUiB65H
 hSpvCbutbVmiqLlaiV9g2s7L5zS15vuPEXYRJVXYZoJCMkaFDelE8IzsOqUEjcStLvtKIePtacU
 0rajGetsDy6q9XfKRWRmFwSNOPV24CaIOhh8NMaNyp+dM2bdWCj+qYGmds80xLIJclcrLPCAIzX
 bfc3F67b2p9LrlFJytmNYSy8nLBZfRN/H/GrK/xgKqBdbMVUkJcYnr+/uk8H2EvcJp2Wh0icUz6
 MJ1hnGyfkWZh3V58tHgfr/pUymnds5Ei6A==
X-Google-Smtp-Source: AGHT+IF9HHn7otIsRRSetNzaUeXvxCJbkji7UoBVMa3gLuVqW6w3nM5oSY6llrPi+iNGIGJkdw3BTA==
X-Received: by 2002:a05:6512:3e05:b0:53e:350a:7298 with SMTP id
 2adb3069b0e04-5402a5e4b93mr1104975e87.25.1733957559885; 
 Wed, 11 Dec 2024 14:52:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401a5360bcsm1378038e87.174.2024.12.11.14.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 14:52:38 -0800 (PST)
Date: Thu, 12 Dec 2024 00:52:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: bridge: adv7511: fill i2s stream capabilities
Message-ID: <rilzmak24odk34q3rglnkmi23e7warmd6dytx2opkhjl3kjujm@fqxqydwhcluy>
References: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
 <20241210134254.2967524-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210134254.2967524-2-olivier.moysan@foss.st.com>
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

On Tue, Dec 10, 2024 at 02:42:52PM +0100, Olivier Moysan wrote:
> Set no_i2s_capture flag in hdmi_codec_pdata structure to report
> that the ADV7511 HDMI bridge does not support i2s audio capture.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index 61f4a38e7d2b..28ae81ca3651 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -234,6 +234,7 @@ static const struct hdmi_codec_pdata codec_data = {
>  	.ops = &adv7511_codec_ops,
>  	.max_i2s_channels = 2,
>  	.i2s = 1,
> +	.no_i2s_capture = 1,

Does it support spdif capture?

>  	.spdif = 1,
>  };
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
