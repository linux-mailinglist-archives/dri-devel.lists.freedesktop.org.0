Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6C4F79AB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DFF10E4BC;
	Thu,  7 Apr 2022 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234710E4BC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:29:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u3so6719792wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j2Kem2UHWwWtT1XQMF4+RRZCgeb8SiVpqswTkaM965I=;
 b=n0zghx7LjA9vSgwDkHv9YFtBHCHIfhUd0NgVt5lYxOnkYFjorTyqyJwXm/AT84sjnL
 DIH9ykBGaB6wwlsAGA8ZxmCrFA4RV6IPRlTV+GqLCBxRn8HDOEnJoFOnT82et5MKjC/Y
 HjC1k9L/U6QmtgiKrZpT3yH/S2RCmTzn4rJD+BwqSIVdeAlhpo8sUkwK4eCnfucmcBfc
 aUI6qH5wGJnM9XFv89z00qM6lsm8qKo+OpoeWG8QcxGi+X1MKH8dNzJ7gtvaqGfD8OXT
 W70x9l5wSEeRvDqj2RmsbhiYb2gykMnHbTbTch5iVajXKe4o05du0XETljCqMthmXvjr
 pVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j2Kem2UHWwWtT1XQMF4+RRZCgeb8SiVpqswTkaM965I=;
 b=gIjCM+Bq2dKhpQM6byJjhZEpNG2vriqH2dKC0cBX41X/4IesKAB8/Zc9BQAsrdfaif
 VFcf0SxeUxqsqptenRBgr1c9vSDTTQwagEepgKPzBw8dxVmpyXNpxeV6J5SlJD8tPHh2
 sE0Oa2D4ev0TmjKz+SVKPw8G+lyo6Md6R2t+q9Qx/DcvU8t1XaI36DA/ZZLs48kd9aoD
 CCRwMAY0SQa1OQjUE0lKquSy+ZM/ADmO4khflj1eNhOtH9zwpRnuMJyHRP5FKQa1TcO3
 i1+ipzDUsYR6AZ0z43fwiqJxj2AjvMhXvmrZq7ntFJjOJLqLPFu0Bk/T7rhzHcbAxRBW
 lmow==
X-Gm-Message-State: AOAM532gfRWLDc9znco8n4Law3lLTD5KeqBzXIPy55/Tf4c2T8uEU3fW
 7NB2+MRX6mEvGEwOelv+xX7WQw==
X-Google-Smtp-Source: ABdhPJzslswTLBwz8bASq5ZhoM6pQ0HR0M0Q4WNO3dHYkVPWtR2YQYx66iDbjuqGaVINSGZvnlusVw==
X-Received: by 2002:adf:d1c6:0:b0:205:dbfb:7892 with SMTP id
 b6-20020adfd1c6000000b00205dbfb7892mr9935170wrd.193.1649320157924; 
 Thu, 07 Apr 2022 01:29:17 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm16453043wre.22.2022.04.07.01.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:29:17 -0700 (PDT)
Message-ID: <9d3f8bfb-74f7-cbd9-a6f5-1e8acae4c13b@baylibre.com>
Date: Thu, 7 Apr 2022 10:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 5/6] drm/bridge: dw-hdmi: add YCBCR formats only if
 CSC is available
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1649262368.git.hns@goldelico.com>
 <d5801eb7733a616df30fef1d192e88ad147afc1c.1649262368.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <d5801eb7733a616df30fef1d192e88ad147afc1c.1649262368.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jonas Karlman <jonas@kwiboo.se>, letux-kernel@openphoenux.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2022 18:26, H. Nikolaus Schaller wrote:
> otherwise they will produce a black HDMI screen.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b5a665c5e406e..ec40dd8865065 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2628,10 +2628,12 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>   	}
>   
> -	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +	if (hdmi->csc_available && hdmi->sink_is_hdmi &&
> +	    (info->color_formats & DRM_COLOR_FORMAT_YCBCR422))
>   		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +	if (hdmi->csc_available && hdmi->sink_is_hdmi &&
> +	    (info->color_formats & DRM_COLOR_FORMAT_YCBCR444))
>   		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>   
>   	/* Default 8bit RGB fallback */

This patch shouldn't be needed anymore with proper filtering in patch 1.

Neil
