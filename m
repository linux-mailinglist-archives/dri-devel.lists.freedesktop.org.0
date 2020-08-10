Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA8240651
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418B289F6F;
	Mon, 10 Aug 2020 13:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC0B89F6F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:04:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so8260692wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mO+63cHnpn/CD6sWb5FzlKBnV9Wgn25mS58C6gzpWNo=;
 b=NVNUyj16zIuaMBmfU51nrfEQgJ6wCIHdW6JV7Hrm3Ax4n63mjSP+noZyh2UcpLs2VM
 DXXfBR6GJM8L6hAsi7rTxAkjzkpKf16y5u7vcywRVtFpnXFWO1uTkV9PG7vJmbyUvnh/
 Z81B0pKwVlo6l3QE1EfxtF0b+tJuGNUamWGNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mO+63cHnpn/CD6sWb5FzlKBnV9Wgn25mS58C6gzpWNo=;
 b=Qaryz8jwH5dQ3eFh41WjoN6MmPEOvN8p+7KSSGcWnqcVCyuM1k6mxsNwnnglXr0lHr
 fCHCuh8RN2GNBPYPS9jH1LlrxqeyDTVLPnKR3Fin6JiqfvZy5WMdHEcgg0TAGaY25JZ4
 /jRkv5si9o0LBi6ZOiFtUFuJfVYaeYBMFcxGcDuwBpAWwfLIzhY5CWo1Nov0Dfzm6n0U
 ooOV5J5GPsCd5Xxa6jHYdjFtC6fSwajwtL8j0cqBMmCc5b8Y4gkJdidY3oCSDDtJL4Mx
 mN/bFoe1qBvrK1Fv4TI/xLIS7o2USoFuLw8NrC1reGhGuScbYFR6tvJWVJkiAnSrDp7H
 1Zbg==
X-Gm-Message-State: AOAM531m6LvMmafww7FhJdDmMgXBOHj4+tahXZr5fo6DtOmTJHlySA0f
 CELfTgb5udGLnoPkFldz1IEqaA==
X-Google-Smtp-Source: ABdhPJxjv8HRd+3Q/rqY9JDdMCykbFvMEnRH2NK0BjwgvnlBIi1eHjSRq3U+MZRXuE93wswbfussqA==
X-Received: by 2002:a1c:7f17:: with SMTP id a23mr24244981wmd.28.1597064692001; 
 Mon, 10 Aug 2020 06:04:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o30sm21050274wra.67.2020.08.10.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:04:51 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:04:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel-notatek-nt35510: Fix MTP read init
Message-ID: <20200810130449.GR2352366@phenom.ffwll.local>
References: <20200808224322.1507713-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808224322.1507713-1-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: newbytee@protonmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 09, 2020 at 12:43:22AM +0200, Linus Walleij wrote:
> In order to successfully read ID of the MTP panel the
> panel MTP control page must be unlocked. Previously
> this wasn't encountered because in the setup with this
> panel the power wasn't ever really dropped. When power
> gets dropped from the panel, MTP needs to be unlocked.
> 
> Cc: newbytee@protonmail.com
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to be merged together with the mcde changes, or things
break?

Either way looks reasonable. Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index 4a8fa908a2cf..d0cd2128df1d 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -376,6 +376,10 @@ struct nt35510 {
>  };
>  
>  /* Manufacturer command has strictly this byte sequence */
> +static const u8 nt35510_mauc_mtp_read_param[] = { 0xAA, 0x55, 0x25, 0x01 };
> +static const u8 nt35510_mauc_mtp_read_setting[] = { 0x01, 0x02, 0x00, 0x20,
> +						    0x33, 0x13, 0x00, 0x40,
> +						    0x00, 0x00, 0x23, 0x02 };
>  static const u8 nt35510_mauc_select_page_0[] = { 0x55, 0xAA, 0x52, 0x08, 0x00 };
>  static const u8 nt35510_mauc_select_page_1[] = { 0x55, 0xAA, 0x52, 0x08, 0x01 };
>  static const u8 nt35510_vgh_on[] = { 0x01 };
> @@ -698,6 +702,18 @@ static int nt35510_power_on(struct nt35510 *nt)
>  		usleep_range(120000, 140000);
>  	}
>  
> +	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
> +				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
> +				nt35510_mauc_mtp_read_param);
> +	if (ret)
> +		return ret;
> +
> +	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_SETTING,
> +				ARRAY_SIZE(nt35510_mauc_mtp_read_setting),
> +				nt35510_mauc_mtp_read_setting);
> +	if (ret)
> +		return ret;
> +
>  	ret = nt35510_read_id(nt);
>  	if (ret)
>  		return ret;
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
