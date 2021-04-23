Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE03695E8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 17:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0DD6E113;
	Fri, 23 Apr 2021 15:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A46E113
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:16:15 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso34957961oto.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BjzbYvHGDqNt1YrSCIFKFkhQqyjNhWk2rxPsi+B5Z3s=;
 b=UzkHH4Za2rzrIPCUbRuGbPYHM4r9JlI4pOryZV93zkkwAN7aqG2i26EObLU6VO5xUL
 eZzSjnwKZrDgKpkPR7aEHclOaavZGSKmhSw6MNRclEK9MTCcqJ/wbMpa2iJayhcllkx3
 80fvTG4YREIStTYLYqJebwHp9baZtG5GbsKLMTlOg4lekOg6vq7aPWc31fTvkiNMqXmj
 J8jobDoUcybkm6/WLG/SKILg4X2ogYknn1U+3AWt/EKHObA1xzN91PITatYhWz3niIfS
 wE+7zMrdgklhMKbnVcVdbWSz+7/1nUE4rVp9yvNR3yVNXtoz58SuYF4kaOxKaEG5q+rr
 +Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BjzbYvHGDqNt1YrSCIFKFkhQqyjNhWk2rxPsi+B5Z3s=;
 b=Iwz9l0iB9kmEAMxowNiFA84C4nWSIc0VnPKeJgkH84PWXqbhadUguP1TLPdiQMEdqL
 hLCtNOMHy6WsOCwe0yE/fBLHJW1a6wsAVr+0Wve1NMta3GdJLCX01EGLbwFM/Ud5ghAz
 maj1Q9TDpytxFouI+h1pQkq3R3yGTX4cZ/KvdJCvC8WxEW053Q9UHdsU/TOJKT/UxQcE
 xgxpvj9hzgwuRhAaLYYor7bZn5LWwYHDh4kMcpW4varjF0CcQhN1Osiuz/FSF2NJsb+r
 7y/rdtXbnQeruxKLoy16Z/zGL3buKMR8wl9h0YrplFhqrsv3nr3Z06s/MkV5/cSV1R0h
 q7yw==
X-Gm-Message-State: AOAM531jBLWirsh35FTIIL9PLKCAaELf+onKdtHPE3PM+yfERi+czD/5
 EDHaQoIMDqiQLAQ4yv669ynKmQ==
X-Google-Smtp-Source: ABdhPJx2mA/UkPjKOQEWBZn8yjTss/9rypijIbSfKKeR01z01ECtO/FDlU2BQR7ZN9tTWnK5pHWk7A==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr3876923otj.351.1619190974920; 
 Fri, 23 Apr 2021 08:16:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s131sm1300317oib.14.2021.04.23.08.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:16:14 -0700 (PDT)
Date: Fri, 23 Apr 2021 10:16:12 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 23/27] drm/panel: panel-simple: Power the panel when
 reading the EDID
Message-ID: <YILkvOs1abQ7WzdA@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.23.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.23.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
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

> I don't believe that it ever makes sense to read the EDID when a panel
> is not powered and the powering on of the panel is the job of
> prepare(). Let's make sure that this happens before we try to read the
> EDID. We use the pm_runtime functions directly rather than directly
> calling the normal prepare() function because the pm_runtime functions
> are definitely refcounted whereas it's less clear if the prepare() one
> is.
> 
> NOTE: I'm not 100% sure how EDID reading was working for folks in the
> past, but I can only assume that it was failing on the initial attempt
> and then working only later. This patch, presumably, will fix that. If
> some panel out there really can read the EDID without powering up and
> it's a big advantage to preserve the old behavior we can add a
> per-panel flag. It appears that providing the DDC bus to the panel in
> the past was somewhat uncommon in any case.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c91e8aa108f7..40382c1be692 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  
>  	/* probe EDID if a DDC bus is available */
>  	if (p->ddc) {
> -		struct edid *edid = drm_get_edid(connector, p->ddc);
> +		struct edid *edid;
>  
> +		pm_runtime_get_sync(panel->dev);
> +
> +		edid = drm_get_edid(connector, p->ddc);
>  		if (edid) {
>  			num += drm_add_edid_modes(connector, edid);
>  			kfree(edid);
>  		}
> +
> +		pm_runtime_mark_last_busy(panel->dev);
> +		pm_runtime_put_autosuspend(panel->dev);
>  	}
>  
>  	/* add hard-coded panel modes */
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
