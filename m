Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCAF3695E5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 17:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896076EBFB;
	Fri, 23 Apr 2021 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EA96E113
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:15:18 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v6so21680094oiv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H20jNSQBl2MjyzyhkMYaw3Uy+F10G5cykrLW0bCJkBA=;
 b=pbgHZ7XQhrdOvbvAEjMyl0uK0HMUgeZJJF+ej6t7BPq/nAAOkrIUydX+1QHj4u3KvE
 pLJIkbIJwMGOu2yzI3poPk98hnq8bSFyQsAtWmghJefxSFUCF5GgUMakEzY/G52IecyX
 N6vnUWZQjFjsNFgoTDl14F24ZjuyimIj9GRrfxpXByaXYg6s8L10Jnibgr7D8hc4giuF
 9f9P1y+QA4CxKMKY70bvbYeAP0qqZg1jXldsiydJzBDv6EDSTapmYebrwv5u129V0FFd
 m648IZf/e0ns6mu6mKhFtYsSa+kbirPQhcKZNtXvnLauhKVBdnelRFhMWp3L6ty0K8Yw
 ck1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H20jNSQBl2MjyzyhkMYaw3Uy+F10G5cykrLW0bCJkBA=;
 b=OjqyZDBtVgBLoZKRSwwFjh9tXQc9do995EAEJ46krydAx1XtKOiLRrsugk32OelzM5
 OqTUgW1BtLJaZ0nBZu+hAdVWA4W5PqVfjvTjwsuntHskd1XuTRbN5i6aYj3YJBGkwZWN
 1HmDk5dZI9mkIXIUK0hAskU4NGYC5i6z5AOripHBt69bpGjgnSJP35l3PgbBeiW1dYa8
 y35kJ7mFypjeg275Qp0rRU75mZ42sTCfWoHx8Iy0uzVF0KgzqqMW8yuP6Jlw2sCuYNIu
 bWTQkmpVyrvd+15YKPtUhXh9s/9sHk3gCP7yqe7chy2BmN8nmmna2kC1dls5PQDnTSBH
 vGIw==
X-Gm-Message-State: AOAM53046/hjv4ukHYhx6XqUTOLiGCqDCfKGnibn/K7RJjg676WOBt+R
 6I0lNNMfRFRXEBQKhDolzPRSRw==
X-Google-Smtp-Source: ABdhPJweYNjzWUSWU6X45/xUm+r362Z1QMdsI+CBjPXjPS8ZOsGsSpPe5+cGwgePXKHxnPQi2QkCMg==
X-Received: by 2002:aca:75cc:: with SMTP id q195mr4322750oic.88.1619190917554; 
 Fri, 23 Apr 2021 08:15:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 88sm1422029otx.2.2021.04.23.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:15:17 -0700 (PDT)
Date: Fri, 23 Apr 2021 10:15:15 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 22/27] drm/panel: panel-simple: Remove extra call:
 drm_connector_update_edid_property()
Message-ID: <YILkg2ChCZChEqqu@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.22.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.22.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
> drm_connector") the drm_get_edid() function calls
> drm_connector_update_edid_property() for us. There's no reason for us
> to call it again.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> As Laurent pointed out [1] this is actually a pretty common
> problem. His suggestion to do this more broadly is a good idea but
> this series is probably a bit ambitious already so I would suggest
> that be taken up separately.
> 
> [1] https://lore.kernel.org/r/YGphgcESWsozCi1y@pendragon.ideasonboard.com
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 90a17ca79d06..c91e8aa108f7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -512,7 +512,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  	if (p->ddc) {
>  		struct edid *edid = drm_get_edid(connector, p->ddc);
>  
> -		drm_connector_update_edid_property(connector, edid);
>  		if (edid) {
>  			num += drm_add_edid_modes(connector, edid);
>  			kfree(edid);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
