Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BC2D7158
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBE76EC99;
	Fri, 11 Dec 2020 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494946E5B0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 00:25:29 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id d8so6738030otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nuQJ0wHKc4Xsa6OBJpnfoeLl9XbZSnvK52TPE16gHMU=;
 b=hJNzQiNA1fnW7DmxuvY+4J7zo3a/f2+YdaXw/Jzv0+WHBQPTB8fPEcYl/SzKsUVFHO
 NooC9/wHd9xjn03TPm+Zuq/RMfT18MUqS56wTEmz8czUCtBTeSvxMu7dZKn05B3GnSzC
 FwY8sy9jBJy6H8f17XNUHfPHZi5efyN9i5sYhU1SCuepPnh5Xj579O1gGFytp8OYeKFn
 VrbVghUqptC5snob5+7Klb5+DHK42mQLpLnF1OsgWfVL9K0rgLauLG/PITx+XHbvHRxh
 sa3u8yj9m/VHcp/2WGMei3VJbJq32pyWYQfceitcf4CzHwpgyvN25TCy+Jedo3lyilGh
 KXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nuQJ0wHKc4Xsa6OBJpnfoeLl9XbZSnvK52TPE16gHMU=;
 b=ClW2bzyML8qTS/U+Jp+O4dj8GfAxD/NuJKFRjLdTPHaHZ4qpZMBXbrj5Mg5aeSS/zy
 51pPFKiiM5YSZGwzRqlPZhPVuoFnVrPPlJ+ino4PotDLzA4wpL/VBRoo6XUPMIqrIskl
 TzKi1XODQJfLMG/M83rafKTblp3CUZj3rzphq9iM8XDel2Kh5XX5PGeV2+U9F+JYKSxs
 eGTSvd3w5n73PYt7Ck3A94XxaG5gMFWCPW5h+ZBi8e3dP9pyA5KblklAYO92bSwBjYE7
 1fLMObpaXpr5f4FRFGIqu2mtm93ENkOVR2U4bvBCAId/LJavhxqbB31TKSDuc0ZS11T6
 XS+Q==
X-Gm-Message-State: AOAM532KvqIkDUPUM4wtf/dIRNHlqrD2chSCC4jy6MDO4oFDaHytHKnz
 6N9QLkqdC11wCDp7+wi+EZ5a+Q==
X-Google-Smtp-Source: ABdhPJwFAdTm0nWnNH04pOL3J6N+OUvCSzQq44RMZ3gLumTaldRKQ56B3UebIZlupj+Na0zQXBRwog==
X-Received: by 2002:a9d:1d64:: with SMTP id m91mr7780740otm.290.1607646328495; 
 Thu, 10 Dec 2020 16:25:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o21sm1473252otj.1.2020.12.10.16.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 16:25:27 -0800 (PST)
Date: Thu, 10 Dec 2020 18:25:25 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1] drm/bridge: lt9611: Fix handling of 4k panels
Message-ID: <X9K8daO5DrKC+Ama@builder.lan>
References: <20201123104616.1412688-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123104616.1412688-1-robert.foss@linaro.org>
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: Alistair Delva <adelva@google.com>, jernej.skrabec@siol.net,
 Vinod Koul <vinod.koul@linaro.org>, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, Anibal Limon <anibal.limon@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 23 Nov 04:46 CST 2020, Robert Foss wrote:

> 4k requires two dsi pipes, so don't report MODE_OK when only a
> single pipe is configured. But rather report MODE_PANEL to
> signal that requirements of the panel are not being met.
> 
> Reported-by: Peter Collingbourne <pcc@google.com>
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: John Stultz <john.stultz@linaro.org>

This looks very similar to what I had in the early revisions of the
driver.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index d734d9402c35..e8eb8deb444b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>  						     const struct drm_display_mode *mode)
>  {
>  	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>  
> -	return lt9611_mode ? MODE_OK : MODE_BAD;
> +	if (!lt9611_mode)
> +		return MODE_BAD;
> +	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +		return MODE_PANEL;
> +	else
> +		return MODE_OK;
>  }
>  
>  static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
