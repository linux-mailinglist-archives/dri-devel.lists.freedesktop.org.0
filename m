Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0028CCEDD
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC510E0D0;
	Thu, 23 May 2024 09:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0Syku9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B9110E21D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:18:22 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e73359b8fbso41095751fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716455901; x=1717060701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
 b=B0Syku9qWcmuVqmF3IQ/sXh6DuQ0bPccRBKpVN/klMLzDadk/ZtDf6jKh67nCq6fwr
 iQYDMFI1CkfNEjVJyCy031McfiJZweomGLjYqAll+sdjhqquau5dCsdmyZPgmG+y71WQ
 UR5rnIV5z9Cp+r6qyKyQPnSqGvPTgtYtAed/vWek0itIYhFGQ/lBVp+ZCZg3DAAy/CGt
 12f4szKb/7LE947fq3WcTNFvls9oMZ9WEzcCzIJDppziUD81btfnh0q65u/zb6ZXmTTd
 UaA2AmWqRLagS1L3AUfHXC7kZgme/2oq8PpDY9+KvQ66i/vn/XbYEmN3UTiXkPqWa111
 cSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716455901; x=1717060701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
 b=cgfSNsJknzhuvzR5G/lpz4IdRlBmlx4Jq4j3ZaFvqCouquidfv3OQaSsggFI3rrJv4
 VT0MGacd8nWErOSwZ1wU7S4464y/ZGwNV2MjYMH3O6CMNKDehIlVJPCLca7FWy/AuykA
 v230a52ADRAeEG+gQGjr4OGp4cgJa6BLpudii2VWesybPM0xOexg+xuOgvrWb/X6nT41
 IfxvvBn4cy1My8cf7GKPXDf4ZQcobznqV9aEogdzP2QN7T2lnnW85F8ZsFIRPq7kgq55
 huaOvQk6DoGvyR/2Q5w+h5+yzHl69xVjY3hg+DWLTEoZ93Nkr1I8/v2/4uGB9wXm4abQ
 quOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy14TqddPSZRR2ipYvKjT7UMwca+p4sViyrPP3Oo18IOpy+AwS+vBKg4qZ2f+KAEFw3CjJqQkEOUGGzyDUelfQodXP5Dq7UMEvGG7Vyivj
X-Gm-Message-State: AOJu0YxeMe1toVtno1wDZVHu4H9gFpQkoShLriQuqEqZJsVFWl12L1Nl
 PvCGByoZ2UU3v9DEVqcGW29h8AWQlJzFN4HEu3LzsKE9ajSxWym1lEOfe+CQ4go=
X-Google-Smtp-Source: AGHT+IHtkzdUfQObjmEVprHkzFN8zKAN9fTh1YCm+Kcmac6VM9gqN/CwHy0s14ABNvz7H4Poi3qpvg==
X-Received: by 2002:a2e:a792:0:b0:2e9:564a:db29 with SMTP id
 38308e7fff4ca-2e9564ade37mr5621401fa.29.1716455900802; 
 Thu, 23 May 2024 02:18:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e5686b802asm36602901fa.95.2024.05.23.02.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:18:20 -0700 (PDT)
Date: Thu, 23 May 2024 12:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 08/28] drm/tests: Add output formats tests
Message-ID: <h4t3rsxz6yez5fosi6lyvob5mbngkjb7ad5e4euddhokcjimn6@dif2qzr2xjhc>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 21, 2024 at 12:13:41PM +0200, Maxime Ripard wrote:
> Now that we track the HDMI output format as part of the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 99 +++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 32 +++++++
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 
> +
> +KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_output_format_name_valid,
> +		  drm_hdmi_connector_get_output_format_name_valid_tests,
> +		  drm_hdmi_connector_get_output_format_name_valid_desc);
> +
> +static void drm_test_drm_hdmi_connector_get_output_format_name_invalid(struct kunit *test)
> +{
> +	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_output_format_name(4));

Nit: it might be better to use a bigger value here. It's easier to miss
this if other formats get added for whatever reason.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +};
> +
> +static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_output_format_name,
> +			 drm_hdmi_connector_get_output_format_name_valid_gen_params),
> +	KUNIT_CASE(drm_test_drm_hdmi_connector_get_output_format_name_invalid),
> +	{ }
> +};
> +

-- 
With best wishes
Dmitry
