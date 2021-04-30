Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E150736F736
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 10:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EBA6F458;
	Fri, 30 Apr 2021 08:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5A6F458
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:35:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k14so19684326wrv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Xn+KDZ1hNBBYXuNpXrEWWhuM2EQc3gWTNVgIKK2wDg=;
 b=TXow1sF/QThOFfrsD8BjNqhVcrz6rkPFDJFQ/mgmEFd5sVoncRUaC4fIZ9GyOF4Wit
 qcqkTGxXIym6P48ZRKuX1E5L7LbTu+ynEOo1IM91iXPPdFcUn2b0TTRRNY3pBsMZZc16
 thQOFo3aJn8sqKj8RVliWu/2yZ/VcKjcmggsoGI8oAjekvhIKP7d4tELkpujYwCmaNBh
 F1MblNjGw4tS07ACM4HV7mDY0ZtnBYEUPb5HZfyL9lyNrbkY3xial+dQNMGeN+8xqIx5
 YqXg9AUnRFwXmrmbhyx7xz3fnuWXd/gnZ5q4YZThxNnoN+RkL8/6LZPv45S7EtqKtK3x
 8I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0Xn+KDZ1hNBBYXuNpXrEWWhuM2EQc3gWTNVgIKK2wDg=;
 b=Ocv1q2XE0vnLx079XYHGSxvSQFA9u1doJZIKQgvPKsJQbEvP/hBTHfcUtFOKybP5Ri
 jCPzjl/jVqgZwlVPgc9y8lPjiVF1j5tuzJJ85PyJSnuXLTb1A9kSR/cws+h1Qap9cGKw
 d6owYKgwe3uQ1RcIHsHPcVtseORlnlCtmPr5yhv57biAz4hoNFewnF6PWSU/yV3dUFUp
 r193yT2C0C+t7z2JXa8pcDV98UNaHqLU0wpg/8TiLs5VhpB7/Wr3TCIenEUwagFCGRPO
 ZAfHHXmLraHttG5cRcr0QywtQSk2KrDDRFHz8TBfyCqMD5VYYrDbb1K2jC/bs9KVos3N
 MgfA==
X-Gm-Message-State: AOAM53298k/RsdBb44csQPiCkFie17TcsnsDcQx/RwXHZXI/3Fu/bzgz
 7bAgBIJm6SuH11oJoZbREp33MA==
X-Google-Smtp-Source: ABdhPJzcUSXLkLOLvpCukvUVXymQ9PtTmf9/a9LT8PMH7XFE2jhs9qfYHmTi10DiT/0WcPX33DSOfQ==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr3530550wru.39.1619771750428;
 Fri, 30 Apr 2021 01:35:50 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4a89:8c32:4adc:fc67?
 ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id b12sm1471523wro.28.2021.04.30.01.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:35:50 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] drm/bridge: nwl-dsi: Get MIPI DSI controller and
 PHY ready in ->mode_set()
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e877868f-c5b4-ae8b-9871-c0633781e8e4@baylibre.com>
Date: Fri, 30 Apr 2021 10:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
Content-Language: en-US
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie, agx@sigxcpu.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/04/2021 11:26, Liu Ying wrote:
> Hi,
> 
> This series aims to make the nwl-dsi bridge be able to connect with
> more MIPI DSI panels.  Some MIPI DSI panel drivers like 'raydium,rm68200'
> send MIPI_DCS_SET_DISPLAY_ON commands in panel_funcs->prepare(), which
> requires the MIPI DSI controller and PHY to be ready beforehand.
> However, the existing nwl-dsi driver gets the MIPI DSI controller and
> PHY ready in bridge_funcs->pre_enable(), which happens after the
> panel_funcs->prepare().  So, this series shifts the bridge operation
> ealier from bridge_funcs->pre_enable() to bridge_funcs->mode_set().
> 
> Patch 3/3 does the essential bridge operation shift.
> 
> Patch 1/3 and 2/3 are split from the original single patch in v2 and
> are needed by patch 3/3.  This split-up helps clarify changes better.
> The split-up is done in this way:
> 
> 1) Patch 1/3 forces a full modeset when crtc_state->active is changed to
>    be true(which implies only connector's DPMS is brought out of "Off"
>    status, though not necessarily).  This makes sure ->mode_set() and
>    ->atomic_disable() will be called in pairs.
> 2) Patch 2/3 removes a check on unchanged HS clock rate from ->mode_set(),
>    to make sure MIPI DSI controller and PHY are brought up and taken down
>    in pairs.
> 3) Patch 3/3 shifts the bridge operation as the last step.
> 
> 
> v2->v3:
> * Split the single patch in v2 into 3 patches. (Neil)
> 
> v1->v2:
> * Fix a typo in commit message - s/unchange/unchanged/
> 
> 
> Liu Ying (3):
>   drm/bridge: nwl-dsi: Force a full modeset when crtc_state->active is
>     changed to be true
>   drm/bridge: nwl-dsi: Remove a check on unchanged HS clock rate from
>     ->mode_set()
>   drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY ready in
>     ->mode_set()
> 
>  drivers/gpu/drm/bridge/nwl-dsi.c | 86 +++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 40 deletions(-)
> 

Applying to drm-misc-next

Thanks,
Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
