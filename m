Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63B345852
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4F6E558;
	Tue, 23 Mar 2021 07:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE096E558
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:10:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id t18so9665489pjs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=ZvTzLCdLPjV6sP5Di5nlO5mOmXJgD3ejWOZlWZGKiiI=;
 b=IcyvPv1ZgDHA6AxCZDxgZAJx5zoNZy6JEWhnk25DaBcPaqvZn5es1U1kKssqQ2LjYA
 LEOVWt1VA6F4TLHYUpn02wUHrmhXQBM/IB9lKGzE2BVymNQUz1GaCeNlkWK0V8NIT1Yb
 UvSiEBCeeKkUow96bjK6I03aZ7+SuP+rSld2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=ZvTzLCdLPjV6sP5Di5nlO5mOmXJgD3ejWOZlWZGKiiI=;
 b=KzryJkfDRE1fmQuB/OkWfZqDF3OKcinx8ctBQOU4iMYz+NWniLGBBzmquRVLlFjzFA
 p2IUG0TAtfCdWYLgC+ONtO6Mmfeh48p0ALKk8bHR/E1DgPOv45udiq/kaM5nKvsX8Y+x
 giMz85NAoJxxEVUVeMoadPTyXlCgFtl3f4AJJ2fzUsbQQweMJZIFzw0hN0DvjwPOTVSC
 1tqLdCdoOB2dNZkqH4lQRURdyAmq6A0TlG7yKHzuV2hqd8LnV/ypSfResS86QzlM4s7M
 gFBSJ/t+xsiqThoK0Yi7mncWeGyzIsqUvHfoPysqYf1RIWRYJZZDLEvJaxGFbYQBL95Y
 loeA==
X-Gm-Message-State: AOAM5322kEKAqSWuHiKl+riT5DOy+zA/dyNyZjl5cB/GXKzloK4GfT9a
 tFQ0/igcZRpRLZEPr42CIAGGqQ==
X-Google-Smtp-Source: ABdhPJy5OaFHCieFuxyB1zp72GYOQUuVp2Xx8UJd3BAyrzhCoOgzRAT7gO6bO0J/EJhLyJfp7Jul7A==
X-Received: by 2002:a17:90a:458b:: with SMTP id
 v11mr3032512pjg.189.1616483418081; 
 Tue, 23 Mar 2021 00:10:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id t18sm16901438pfq.147.2021.03.23.00.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:10:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO
 optional
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:10:16 -0700
Message-ID: <161648341624.3012082.18051339783564610283@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:19)
> The enable signal may not be controllable by the kernel. Make it
> optional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
