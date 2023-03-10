Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7216B4FC5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 19:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289810E9D3;
	Fri, 10 Mar 2023 18:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9C910E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 18:07:21 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id a2so6484743plm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 10:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678471641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+5jGJYm0wL4TU+GInA55FTV+ma7xO70le58dL4DX4ys=;
 b=MZvRpi166r8cPLxmI4Wj2nTjboTVgIlUSNoTZ0GEKuD172rYOKmAnVQb5/nQYacoWT
 TovuiPpr7y2PnF1VP2kZ97vtg8bSK8YZ5yMoTO3ZTmP+LC5nxfLhYxpr+8YWDljyQFfL
 RjZ890CYGCRocpbCh9ZVKMs1L/UYwiX/CWVse4HJiH4QPkbXtNCKqXJrGbZfojm/F7ca
 A6N/nkZOj0E4UOwL3L7xhVmh6f0Yjk6iHCr2diO27gnOWhQZvbAZ+a4x//nxwoljrlGP
 qBCms2xT0VDOFEs1YxgjFlhxSirsnvnkpg87zsMHfutd11qmxoYxyOf4ff8s1ugbZnm7
 ycVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5jGJYm0wL4TU+GInA55FTV+ma7xO70le58dL4DX4ys=;
 b=K1w/nzseh0aNTd6IYv4wjymaYXqVBAjpMK8UoeAdq+7bl1cOWP31F5wjSpQsDISLA5
 4WVQJ220BzCSDA9DvrKVvcUastc8iQVRA/zOKP96UOMxoQYawxLY7byupiX7n8/dqAA5
 RJWNbAJDygdj+lu+DPVgAMFIofjPSBP+0zjDmSXXa3S7NChn5tJBxRHX8KQs2VZiigfV
 8izmbRwGI7jdkLKaXT/lPw5ptzEkC8Ybw8w14vZzBhUGD3psvMXk7FgydSwSTsLkdqhb
 SpQy03KlbW3dh+pmuultifB4za78BL59r4nxtQyhuj9LGRJRC/7d0YGWtzuhlfAU5hyy
 Xu5w==
X-Gm-Message-State: AO0yUKWOu1c+z7YwAED+RGrg7o+oGXFt2/LCK8AwpcqktjOvSNl36b6k
 vgFyY8ZwQxu5LJgOlil8EEg=
X-Google-Smtp-Source: AK7set/6HkbBFXtz3z8XyA+x6G75td2z6mPUHNDgY11R3c9ADc80r5wuC4UgzbgQZmk2Zktp4juJyw==
X-Received: by 2002:a17:90a:18e:b0:232:fa13:4453 with SMTP id
 14-20020a17090a018e00b00232fa134453mr26741085pjc.13.1678471641394; 
 Fri, 10 Mar 2023 10:07:21 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 jx18-20020a17090b46d200b00233e860f69esm201403pjb.56.2023.03.10.10.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:07:20 -0800 (PST)
Date: Sat, 11 Mar 2023 02:07:13 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAtx0c4U70DtMuyV@Gentoo>
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310132144.2241-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 09:21:44PM +0800, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
...
> +
> +static int nt36523_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int i;
> +
> +	for (i =0; i < pinfo->desc->num_modes; i++) {
s/i =0/i = 0/, I forget to run checkpatch, sorry. I will fix it in v5 
> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> +		struct drm_display_mode *mode;
> +		mode = drm_mode_duplicate(connector->dev, m);
> +		if (!mode) {
> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +			return -ENOMEM;
> +		}
> +		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +		drm_mode_set_name(mode);
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	connector->display_info.width_mm = pinfo->desc->width_mm;
> +	connector->display_info.height_mm = pinfo->desc->height_mm;
> +	connector->display_info.bpc = pinfo->desc->bpc;
> +
> +	return pinfo->desc->num_modes;
> +}
> 
> 
