Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C19E062D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889D410E791;
	Mon,  2 Dec 2024 15:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+7XcBNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5DA10E283;
 Mon,  2 Dec 2024 15:03:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-434a742481aso35385005e9.3; 
 Mon, 02 Dec 2024 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733151827; x=1733756627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
 b=T+7XcBNRWuMrN5dmxYuTZPo/OWfy8Hfox5UmYP1yzzvJnVDT1xMSDw6TVwVmLsSXOv
 p1W4Lm4I+uj3BxxhqG1YXFo88YrZEdBB+fKyfqPcCNFz0518W/l6WZp7cEK+8pZPEV6+
 OFR5M+eouJl0etUCwXOo+S8yVR7tAOe+tOK/qz8L57Vyjb9aAjS88xk6UviT6v6a/OHY
 QEv1iC+385KIuGOj0DxzTS1QrCwMUlRDjJnVlvKI80WnmupnbCqeht5NpEd3AcjcF+Zh
 80hcHKHdHCSgzD+RrWEtzrxiMK4eABg+Eqeyx/iRias/wq0YjmuANwAX8oief2WDM7zz
 dY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733151827; x=1733756627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
 b=HY3Lug/LQttgXvkFAe6zN5EiQCmR2qJXZNcqxXKI1je2qVzef6mjeoDhHLEEW6bZ3s
 B8CFRVrL3bVYZ4vNidwkVE2Qi6vLC6TdjeUXO1U979jI4Rf/Hpfkt5zPXz5p/7mUIJmO
 wqZQBQA7NBvR/93/4tF8f0/IDi/8BMzgW7u7S98yqcH0qJ4BO2qD4VeG3XSGB1DFBPv3
 O/krlaAbu853h9yaoS1jXbjjVKs/geD0/XezhKYq2vDpSGQhlJaGyaL1o1os4gwaY7xv
 Qjr16mPk7qOa2F0AKZc3/GvU5HzZ77XoNbFqEdhtjYwpZ8OGYk75uzy4SXQMk6DZtJdv
 PH0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPARCcDdV87+x6+JcQ1OtGA8SmNTdnKi6mUF6ht7cU4CsNp+nhPtfRNtyBLhy14loqqmA4SFsYMH0=@lists.freedesktop.org,
 AJvYcCUuCa5RBPO+l/cgTin+SafUgpetmjpeK5jD684ce0/v37LcfYiPswQh05hSbjp63fafhYJzWJt4h+EG@lists.freedesktop.org,
 AJvYcCVeu9yH3AtP1yKZZv7ncRgVBNGTiRvwq6PvongqQtCJKHDQYI5CblYa0/nGpMdlDWvWg26Sp1vRCz7D@lists.freedesktop.org,
 AJvYcCXOt1U7l9U1lDcClyJyV5Ud24wdq6JAJNJPZT92kvDDrMdGXgA8UQJx9PeBzWQsLEcDgUtmw6//@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHjGNioabcM13DRD88pSasny1gwZ7k/hLLoi1kvKazYwxTTsXb
 EF8HUxm8zohEZxEN2b1sGTHjHaRURD8QqYR4a5gaE9fUZcUtnXFr
X-Gm-Gg: ASbGncvKO+1XIHXeEPyajkKRaBRWnRS2BHF8yoql5LikIDjY8QGCjRelnxz1wZkxD9c
 2YIY1394NsDWTRllN+SBgv3gGae/CvB7ucGx+Y9OlOH40y7S73u5Q6jScHZMAEGPrNSfxKDnhFK
 FRlKe+imLuzTeDDOOpNmGVDb/gAlanRjLVZcX5wdcDLmwHXFLpbSPydpkRH5yxLIq6lBtWB2/AN
 GcjJPmOafLq/worvQgIjazf457353WzzBfJ9Hwpy1Mf59TpQj6Eu+HB8OObMisSBKWIB4wdgkd0
 fojfWwqh3yaImeaLRE0=
X-Google-Smtp-Source: AGHT+IGDnqoQPM9S2ZXAYcJFrCBwMFmcYVdD5NrlXMVFXBAOrzgALnyLT6wqVMw+fFjssl311bGusQ==
X-Received: by 2002:a5d:64cc:0:b0:385:f092:e16 with SMTP id
 ffacd0b85a97d-385f0a153ccmr4698133f8f.55.1733151825042; 
 Mon, 02 Dec 2024 07:03:45 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ec6a3d8fsm5080310f8f.101.2024.12.02.07.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 07:03:44 -0800 (PST)
Message-ID: <0eb908f2-2304-4a91-9c91-e7f291da9dcd@gmail.com>
Date: Mon, 2 Dec 2024 16:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 01/12/2024 à 00:55, Dmitry Baryshkov a écrit :
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Raphaël
> ---
>   drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 847470f747c0efad61c2ebdc3fb3746a7a13a863..3c8f3532c79723e7b1a720c855c90e40584cc6ca 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1225,7 +1225,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
>   	struct drm_connector *connector = hdmi->drm_connector;
>   
>   	DRM_DEBUG_DRIVER("\n");
> +	mutex_lock(&connector->eld_mutex);
>   	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> +	mutex_unlock(&connector->eld_mutex);
>   
>   	return 0;
>   }
> 

