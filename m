Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109C36AE07
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DB989CE1;
	Mon, 26 Apr 2021 07:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5987B89CE1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:43:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e5so26033296wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Fin73hcxy3kBBfVgnkmMWT6xQYSFk6lSSZMuPRL9LA=;
 b=RH+o+1mp+wiqCJ7YrwwwRMYZd/LobHVRQYCoanA6cmddoSSQx+v97heWBT34+0QiwS
 ZcjjSiWE+0t3pvVF3LLTHcDltiNOIXmI3w9cBxMlync5idVrjLWYx6y5UXFdn48UMqfa
 9QvNfHQB3EU8tLrxMkKpAtV+2lkQfg6FLre4xw1icvogh/SL8q2PgRkHMgjuim1D+2W0
 MhJciPUsmX1TuyuxmkNTu4HTv+SXWfp7UsmJb1g6FXFxMiE38YJ/V/gnQELhkfGAySP8
 G7kMSD335Et9Q1eEoAi5XCmuV+9UCFYDTkmoDeJqnbibhhYKCtNxEDGschx8vEoVaev5
 5MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1Fin73hcxy3kBBfVgnkmMWT6xQYSFk6lSSZMuPRL9LA=;
 b=iAkq7MeCn6k/Ew/n+N1KNAFnaMx2vMoSuQ3D/Re0aYPYDbfz/tMTlquweEJ3vWKkg1
 hTb+697eq3YZhzrKGt6CJTWGwtSiz+fbxzCGqmtrSaMzPDnD/uh7ccFibIF0AC6g2JX6
 cwe2DNqcD8ABJKgaji8pF9aBB6As3te2eN6WFRAhpmDzIfz6Wd9x0q9iGsDcOkBHc1PG
 zN2zQJH6SZT8mlufc2Or/MT15CsIik0Guoi7Kk9jQRiRtaEdhdwJVgIlqnXEMAZbT6Lh
 BkSsMOwNlLugmvUZsHBTaWIbO3Gvx0NVPH4miQJBgLAPbMHsNCnASIT3e+7tfF4AGlSe
 eGWg==
X-Gm-Message-State: AOAM530gi/qK1KbXxYVkmidxnLf8/n7245GvHuk0IZD890c3df+y1PYi
 tMSKBn//ZB2R8VJUbnQGTzrnUqHyYxi3iPq4
X-Google-Smtp-Source: ABdhPJxQigD5WWLBHcOUSAPkTIYQ/Xp6yUEhNoyUXXVle0tD9Y3bPwggSuVCqVXZLcMyXR8iba6CnQ==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr20677893wrw.289.1619423006494; 
 Mon, 26 Apr 2021 00:43:26 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id d5sm1731692wrv.43.2021.04.26.00.43.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 00:43:26 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] drm/bridge: nwl-dsi: Get MIPI DSI controller and
 PHY ready in ->mode_set()
To: dri-devel@lists.freedesktop.org
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ba9a73d3-09ef-9cf5-ccf3-5cb6ab764cd7@baylibre.com>
Date: Mon, 26 Apr 2021 09:43:25 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

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

The patchset looks fine, I'll leave a few days for Laurent or Rob to eventually comment.

Thanks,
Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
