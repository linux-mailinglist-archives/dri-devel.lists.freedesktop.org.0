Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6A1F82B7
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038FB6E443;
	Sat, 13 Jun 2020 10:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5366E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:57:02 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id d6so2171153pjs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=CzkQpCcoRC0sJMa0pR1sKpPdtKMP/PyiTFgiJafcnYY=;
 b=T1zuyaDTfoAv+to8FZCdUiFLlcjnOFk6V3IaNNgO+XGZmN1ehhha22D9yK6A4xzD13
 NamAU3IyaEZhQxLQQCtEcuGdXDp9EFgSyS11KLORVlt7RVplueLPudJ/LlFd/YiDlwP1
 DUneDn4otiEC2gPcNUJzdNDBpsoJK1SA149kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=CzkQpCcoRC0sJMa0pR1sKpPdtKMP/PyiTFgiJafcnYY=;
 b=nHImhPXaT3fV37pLxqN8tiOwd7etCGdekSCclB06N6QaKzon0ZPNM84LXYWwI6m+NO
 d8RRnJqZq8TtV5Bb5XC1go3UhtkwF/EdB6mROCkMttLBJh0L0Pes67pGKq0jEUBYykiM
 wM8u+hA6XBUTjwSQ7ETUdw4+MqibskbqE9YzRbm+T19STRV6a9qNKyhUsKq0Ld3QmdQ1
 z3F8+J7yBGTqlXCUtbtnYJlHsUqcnGbWW+vbHy0Tn7SRi4gkRNP6xb7iOohHjby13xep
 p3frrFWzyLZEYrHYeeKtsnsdV111spJKmQnkkTBtXRVPqFsoa+Dlr5HU44gU/CRoenmH
 tb1g==
X-Gm-Message-State: AOAM532GkKeU69NVVEBfRBs2be4BUa3X1d/HO75WwhppQUA7rUAwQ+6x
 cHIEjy8eP1bK9HAtfZ5xhsKXag==
X-Google-Smtp-Source: ABdhPJxLjw0gaPc4oCJfx5+8kuZMUUtob14rBwCjjokf0iEIJHPLqK98EAnH8w2jeRriDItthQR/vw==
X-Received: by 2002:a17:902:b7c9:: with SMTP id
 v9mr6598219plz.34.1591869422531; 
 Thu, 11 Jun 2020 02:57:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id cu9sm2160918pjb.28.2020.06.11.02.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:57:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200608104832.2.If3807e4ebf7f0440f64c3069edcfac9a70171940@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
 <20200608104832.2.If3807e4ebf7f0440f64c3069edcfac9a70171940@changeid>
Subject: Re: [PATCH 2/4] drm/bridge: ti-sn65dsi86: Don't use kernel-doc
 comment for local array
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, a.hajda@samsung.com,
 narmstrong@baylibre.com, sam@ravnborg.org
Date: Thu, 11 Jun 2020 02:57:01 -0700
Message-ID: <159186942131.242598.6194861800377753563@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-06-08 10:48:33)
> When building we were getting an error:
> 
>   warning: cannot understand function prototype:
>     'const unsigned int ti_sn_bridge_dp_rate_lut[] = '
> 
> Arrays aren't supposed to be marked with "/**" kerneldoc comments.  Fix.
> 
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
