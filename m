Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA3447235
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 09:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329E96E046;
	Sun,  7 Nov 2021 08:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9D6E4CA
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 21:59:15 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu18so26733000lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Nov 2021 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8ZpjfGSK4vIM/cfMnH80QnYs0yQ3ED0+NHAp4ep3VvY=;
 b=nv3sgvdcx14iO0Mut41EqlrPOPn5ZPSIt/wWDKVci8a9DQ8Muw3hBWYdlKTRUNPNum
 C3gh9rA43wTr3N1FZxc4LOBTUipVYWBFMkoStvzd+Kk+lS2Z015wH22HJUemeGg/7XiW
 VrtZMIdj6Xkd99ANMlxOJ37wNikpefxcFHLGhe1hDbS3HnWrzv1dPMaVpp0igj2bhBUQ
 z1CC2yrKyEV0NbUzwYtO0QtoOJLGGF8+fQH2DxCOSsYrisjoAwevceGt2gDTYlERSISR
 mbldEtUpcWZmkWViy72oIINWOX2ad37nZhrODCNgnDnmCIm36lKhD8MK5t/b7up2vgvc
 nI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ZpjfGSK4vIM/cfMnH80QnYs0yQ3ED0+NHAp4ep3VvY=;
 b=Uer7/nKbL5U28vvyVhVcOr+CBEqMpIYKdb4WwY1rGV0tEJeotebdp8lElmH/JegHCe
 7ZyIKux+u0l6NrlasCXuGiFQqtlLJ/qoJ3LWjW2+uhEXbEfhRJTX8ySEho5si4EYP6Z/
 wwBa4ealwvSGcC5eJ4kKEEMiKxftvxcbInrbgfalitLA/Gioe9uCbJMUH9XTPDySvmpT
 rGEcpCHvcne1uXmLJipZahDVXasTSWe5BtHY6FIcTx0P536ZOcjLO9JSrlad9cGTV5oD
 pp/LPncmcNk6XA13Qfh5Bgu6WreT6ZZ9VeW4/jHAbbt1dsOiheeIX+ryD+wG1j3L2yW9
 4xcg==
X-Gm-Message-State: AOAM532msNgo51OpDTAXvgIuBzF/+/aGhNSTdkLeFutEfRy+s21YGHMV
 MiW7/kDZPuKC3sqaZWfBP/s=
X-Google-Smtp-Source: ABdhPJxvEete5614hF5VEO4b2bc7P70ICRktRIDC1GLPuwR3f3eA7tG1xwxPP42Ns234je2P3+vY1g==
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr17875123lfn.358.1636235953610; 
 Sat, 06 Nov 2021 14:59:13 -0700 (PDT)
Received: from localhost.localdomain ([37.45.143.17])
 by smtp.gmail.com with ESMTPSA id f9sm1271992lfg.148.2021.11.06.14.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 14:59:12 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.95)
 (envelope-from <jekhor@gmail.com>) id 1mjTiR-000CNo-OI;
 Sun, 07 Nov 2021 00:59:11 +0300
Date: Sun, 7 Nov 2021 00:59:11 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Lenovo
 Yoga Book X91F/L
Message-ID: <YYb6r8+aw1bR9R4z@jeknote.loshitsa1.net>
References: <20211106130227.11927-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211106130227.11927-1-hdegoede@redhat.com>
X-Mailman-Approved-At: Sun, 07 Nov 2021 08:35:30 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 06, 2021 at 02:02:27PM +0100, Hans de Goede wrote:
> The Lenovo Yoga Book X91F/L uses a panel which has been mounted
> 90 degrees rotated. Add a quirk for this.

Tested on my Yoga Book, works.

Acked-by: Yauhen Kharuzhy <jekhor@gmail.com>


> Cc: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index d92b9408fe48..2cced702d225 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -262,6 +262,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
>  		},
>  		.driver_data = (void *)&lcd1200x1920_rightside_up,
> +	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
> +		.matches = {
> +		  /* Non exact match to match all versions */
> +		  DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* OneGX1 Pro */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
> -- 
> 2.31.1
> 

-- 
Yauhen Kharuzhy
