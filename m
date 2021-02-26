Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8746326648
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 18:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6A889C19;
	Fri, 26 Feb 2021 17:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4D89C19
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 17:26:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u14so9328335wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 09:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bqhbgu1Yp7BWdaUz/Li+kTuQBD64JpudY4kka6cuYOU=;
 b=de/+gQcXIlBR8jVkGwRajly9Ur7JLImRwKdA+cqTXTZs2N9AXIZdKdqD63bPpunD4X
 skq0DwsLCISevZLfmV9iOR6B/XV8PPTB0urSK1KY3HiY0yFlCuOSPH1MXrt8FHbRz5dq
 qm9yXsuQ9A/7hySFuR9vYhZQXbjIhgI0PgCuHk+GmglnrOlbRmcijDueB9SRpR8saq8X
 Si6LEabKe9dqZqHszSD2dChA8chYp7GnBZgSNV1yPlWZYAX+1UB7xHqJLcqjV4ESJ+mW
 XmgfxsxOViwwKJgHzfnSA+RUuMgpP09C2JcsYvCwhZoLeuwu+l1MLZTugYxD1FPiG2gG
 YggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bqhbgu1Yp7BWdaUz/Li+kTuQBD64JpudY4kka6cuYOU=;
 b=qLelBCOgjUWIpRDDsXV4u6XrbB7n3Ykwwcw8Pwkrn4fpuhq3g3Jb111prHRJ0TGswM
 86O0kGhcYqPRUM2FmeYyFjziDuyVOJwEKyCOlO2ruZXNozW7wj70q85ZtQZ5xG6vdJje
 3T5oJFFlEIWlkDi/X3d1qxCigchlvspbzKM17ap4F3iCoH1F9RE0n3aY/P+/FUax8B6E
 Il19F5G9G3jSye/dVIvi+APqlwsBbE5uh4svU6uWAAbc3Ypc8ZaynEoeWtqWNn6qHPTi
 qjO+6QrCcfzxxM2LvHvb5aIb8FIy49BVNUBCn1Ji0BfKa8/kH49tdAioruUavNa/VwHT
 vdgQ==
X-Gm-Message-State: AOAM530mNGWg/7jYI/GnubCdtnaFsRMEXVIb457qSWccy3XJ6pKz+HAt
 TjZpiunVE9mLJlQduYNIJpfDeQ==
X-Google-Smtp-Source: ABdhPJxv59nbOS4VjGoDEpvCB0o1HoLwhHwNNBMlJkKj6HsOImMA6tQWRJDOfwNGqiBMHmLBgvAGBQ==
X-Received: by 2002:adf:e409:: with SMTP id g9mr4219176wrm.423.1614360363351; 
 Fri, 26 Feb 2021 09:26:03 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m9sm57861wro.52.2021.02.26.09.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:26:02 -0800 (PST)
Date: Fri, 26 Feb 2021 17:26:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V2 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210226172601.aknj2d4hghkkqjol@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614341544-5306-3-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 05:42:24PM +0530, Kiran Gunda wrote:
> As per the current implementation, after FSC (Full Scale Current)
> and brightness update the sync bits are transitioned from 1 to 0.

This still seems to incorrectly describe the current behaviour.

Surely in most cases (i.e. every time except the first) the value of the
sync bit is 0 when the function is called and we get both a 0 to 1
and then a 1 to 0 transition.

That is why I recommended set-then-clear terminology to describe the
current behaviour. It is concise and correct.


Daniel.



> But, the FSC and brightness sync takes place during a 0 to 1
> transition of the sync bits. So the hardware team recommends a
> clear-then-set approach in order to guarantee such a transition
> regardless of the previous register state.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index aef52b9..19f83ac 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -337,13 +337,13 @@ static int wled3_sync_toggle(struct wled *wled)
>  
>  	rc = regmap_update_bits(wled->regmap,
>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> -				mask, mask);
> +				mask, WLED3_SINK_REG_SYNC_CLEAR);
>  	if (rc < 0)
>  		return rc;
>  
>  	rc = regmap_update_bits(wled->regmap,
>  				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> -				mask, WLED3_SINK_REG_SYNC_CLEAR);
> +				mask, mask);
>  
>  	return rc;
>  }
> @@ -353,17 +353,17 @@ static int wled5_mod_sync_toggle(struct wled *wled)
>  	int rc;
>  	u8 val;
>  
> -	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
> -					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>  	rc = regmap_update_bits(wled->regmap,
>  				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
> -				WLED5_SINK_REG_SYNC_MASK, val);
> +				WLED5_SINK_REG_SYNC_MASK, 0);
>  	if (rc < 0)
>  		return rc;
>  
> +	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
> +					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
>  	return regmap_update_bits(wled->regmap,
>  				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
> -				  WLED5_SINK_REG_SYNC_MASK, 0);
> +				  WLED5_SINK_REG_SYNC_MASK, val);
>  }
>  
>  static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
