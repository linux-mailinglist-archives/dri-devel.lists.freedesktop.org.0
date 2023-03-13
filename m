Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E16B72B1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA5C10E010;
	Mon, 13 Mar 2023 09:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540EB10E010
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:34:33 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q23so6504848pgt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678700073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OI7Db7BHeqVEz8L9hVGNwbJcVk46KjMrg/IvivHmeU0=;
 b=dzdnfahlvokvl0+fMpuS0JMeiuX8ty68pK/cITnN9rlO/l+0tuE3mlmAnwfWV/osI7
 3vSLfYBH9PGTECDWFyJLy81VDQcFqr1g6CbC+v68gwSHpwvCncMMBmCsjO0wheaBsNkr
 6rDXggn69h3mOlqzYGfxX0rk0o17xEw9ATjr8R76Ci0Sqs/b7aHn/9Nr/Fg/YqRpMAM6
 x9G8L0R5GjWv4LAuF32BeFZd/FEyNXdTXri9T0uAgc6NzdLdWlQOl15yieRK7POcmql3
 VJ/xQDYWet6E2GFgBHyoW4tH0zna+QyrqmvwuM/DwD4Cszm2SzvfQewP4QPaHnrcO3+T
 LwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OI7Db7BHeqVEz8L9hVGNwbJcVk46KjMrg/IvivHmeU0=;
 b=FsCbS+WmgZUOsXrPRL4Jcrv7rU87SzpeLu4Ku7BJzn93RFyGenQS9CpUMTgMXMMXWo
 D/OMHfM2IGbt4+DDe1nlV6fHW21qV8uFI4N5+38pZq3FUgcAOhvHYEIrERvVjQg8PLnK
 WBcpdu/HM/xqpFM3ZKhA9iZY2nPtYYHOiQU5QSRZ7+Ede1PV3SBHKk5THH8kNVvuW4J3
 rhyDpOC2gIL62NWWloobtMTOJuaVqpzEFnu1WaOILFCUuB7RHVaFsEBbPkMGepjbJs0W
 pUVPatLxbIjlyIq2KiDSWJqlH5RkcbKM5JQMQtzJs1UiE0OloCuRGD0Vu9nCjuc7/Xbv
 u0lQ==
X-Gm-Message-State: AO0yUKWeLSyidqIBMZFyNd9jA2wvg3mR8jA787fr6e0nw3pPhEgipI1a
 C2pAFuw28Cc/7OQUTvAhFTtdJB4siqU=
X-Google-Smtp-Source: AK7set+YvKu0xE5cKX91dxboKMZosjDQqSF8ZN05inC82xLe1eG6h0f6ThJti9wYHTG+A0zZT5FLTA==
X-Received: by 2002:a62:1a4c:0:b0:623:79d9:a8e6 with SMTP id
 a73-20020a621a4c000000b0062379d9a8e6mr3154233pfa.19.1678700072883; 
 Mon, 13 Mar 2023 02:34:32 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7800b000000b005b0853a1a3esm4006367pfi.159.2023.03.13.02.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:34:32 -0700 (PDT)
Date: Mon, 13 Mar 2023 17:34:23 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZA7uH173ZmbGWzv8@Gentoo>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
 <ZAx4KqXw+an555d4@Gentoo>
 <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 09:06:50AM +0100, Neil Armstrong wrote:
> On 11/03/2023 13:46, Jianhua Lu wrote:
> > On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
> >>
> >>
> >> On 11.03.2023 13:32, Jianhua Lu wrote:
> >>> Add a driver for panels using the Novatek NT36523 display driver IC.
> >>>
> >>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> >>> ---
> >> [...]
> >>
> >>> +
> >>> +static int nt36523_get_modes(struct drm_panel *panel,
> >>> +			       struct drm_connector *connector)
> >>> +{
> >>> +	struct panel_info *pinfo = to_panel_info(panel);
> >>> +	int i;
> >>> +
> >>> +	for (i = 0; i < pinfo->desc->num_modes; i++) {
> >>> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> >>> +		struct drm_display_mode *mode;
> >>> +
> >>> +		mode = drm_mode_duplicate(connector->dev, m);
> >>> +		if (!mode) {
> >>> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> >>> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> >>> +			return -ENOMEM;
> >>> +		}
> >>> +
> >>> +		mode->type = DRM_MODE_TYPE_DRIVER;
> >>> +		if (pinfo->desc->num_modes == 1)
> >>> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
> >> That's not quite correct, as that means "if you have more than one
> >> defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
> > This piece of code I see in the other panels, so I'm not sure if it is
> > correct. Should
> > if (pinfo->desc->num_modes > 1)
> > 			mode->type |= DRM_MODE_TYPE_PREFERRED;
> > is correct?
> 
> I think only a single mode with DRM_MODE_TYPE_PREFERRED is preferred,
> so:
> if (i == 0)
> 	mode->type |= DRM_MODE_TYPE_PREFERRED;		
> 
> would be the right thing to do.
Thanks for your explanation.
> 
> 
> Neil
> >>
> >> Konrad
> >>>
> 
