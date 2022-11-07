Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65761F7F4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E5110E1E1;
	Mon,  7 Nov 2022 15:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF0410E1E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:48:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id 21so18271814edv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 07:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BDYirpYZ5kfOHvkxSrtBuDWKGYWjPD6FnuUfORGWBTc=;
 b=N61PlqxwjqQnwv3OvI+EWHIUjyufpc88GAYSXe2k3Qb2N3zrydxbk9C60OjQBXKRzr
 9cUZtxpKU+mWXjf8A8mzB0H8eYEt/HoELb9CriiBFUEFXcl4sII0rw9wMMUsdg3HorFm
 qpbIyF0CJEkDKgyvbuJtLJV5s3DczZhbKPyEfZ+jH7ggc4K4hGucMma3Xiizhw5dv9N2
 iZ1iMd+hBBpVe7NX44xYJQ/E/JvOhdKFPLv2beaa3dIR3yHohsR5hn2/VmwAf/T9TjyS
 QI1cQ1p7Gko+33B/OnIfJj5GbxDRYufkrBUzD3nhgNdNbwS1sIMYFnVlIPQBlV/iHfjS
 vk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDYirpYZ5kfOHvkxSrtBuDWKGYWjPD6FnuUfORGWBTc=;
 b=Gy3/ttRVVkRrJ1KvRGUi98vmMi/aL5w+cIzV11Bqg4Ln5ZZ1qRlWNy6mmztch4ebgY
 Alt3luc8b/9C45QYdSBsL9CZUifZwYu/a1J7xqdihBJZjtzIqrYX+pKx9dcYy0BK9b8l
 I1aQhjBqKw2RYe0JhXWZhTmBbAXklobEByUBGn35F2yBdW4Dplo0O7pdy7EXbTusISLc
 iPNaZWv7yTim120JJsnU08lNtKPDlaHWWkKR59VFDcDcczVbrzVU1rDDjcZGhT62Dxsj
 xk1qnDhNRoocMWUvhW/PoBeCnTD5qIsHQ64pqu/XW2/GoQQjzxmh5FjJzAGE2atmVPoW
 SKmQ==
X-Gm-Message-State: ACrzQf1l5QP/gGmQaveuh424JwUZ6wKra2Y+wxn82r3GEglS34v5x/GA
 Gh9JPnayp6hs7iWl/IA0VzTxBITdBtWR7Y4aAABOKQ==
X-Google-Smtp-Source: AMsMyM7zOBjN+DY54GaOFcaOAZYJ2+CY36CiwWfiLKrZNLYwlFnSiyAZculK/38l8emxDE0svopFaHLOams2uMneWEU=
X-Received: by 2002:aa7:d7c1:0:b0:463:1dcc:5fbc with SMTP id
 e1-20020aa7d7c1000000b004631dcc5fbcmr47586072eds.250.1667836124340; Mon, 07
 Nov 2022 07:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20221104063652.82789-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221104063652.82789-1-jiapeng.chong@linux.alibaba.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Nov 2022 16:48:33 +0100
Message-ID: <CAG3jFyus_GX=9N0bYQbjuDENdjPurBmy1S_+0eFRsHsnAbCYAg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii9234: Remove the unused function
 sii9234_mode_valid()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Nov 2022 at 07:37, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function sii9234_mode_valid() is defined in the sii9234.c file, but
> not called elsewhere, so remove this unused function.
>
> drivers/gpu/drm/bridge/sii9234.c:870:31: warning: unused function 'bridge_to_sii9234'.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2735
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 5b3061d4b5c3..62b6bc8ca7af 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -867,11 +867,6 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>         return 0;
>  }
>
> -static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
> -{
> -       return container_of(bridge, struct sii9234, bridge);
> -}
> -
>  static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
>                                          const struct drm_display_info *info,
>                                          const struct drm_display_mode *mode)
> --
> 2.20.1.7.g153144c
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
