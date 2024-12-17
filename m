Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A729F498F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA13810E939;
	Tue, 17 Dec 2024 11:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KTC0oPFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652B610E91D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:07:08 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so4922557e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 03:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734433627; x=1735038427; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AfuoU4NCeZC6i1F3LvimU1oXmmt7Zka/LPketmVAjnQ=;
 b=KTC0oPFYT3gXPslQyYjKHZ0+5j1UD/t/F6V5upoJA1/M+DUyzI0tHttB+R5egWm2sI
 5Vw60pkzaUfIrwBvipiWQkSFvaywdu3cCOAbjMn2fyVcVCrmqQW5LwxDEGFuWB41YNOj
 WoCKouQeqq2p5yZD7rbpeGQml6rDYOvxgb5qY8OdIl6/1qWrb/ShynQn95XlZi+H93w9
 doQYpOz5EggKN4yQ5h1gWXpWY5F02u9MaHgms1SSgyk3Hg8XCVOT9Xs6hewPtzEQupnK
 xedZRukf1nyc+DNcsYFU1YrBxJpoATSO9iO4sXQG6LiC5osHCixK+LkNYocF2WW6jEvB
 JdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734433627; x=1735038427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfuoU4NCeZC6i1F3LvimU1oXmmt7Zka/LPketmVAjnQ=;
 b=qWFKORikdR+fC4CXlabobDbSNkh9e1mOFFkxum2Nv1Zkoy5lH997UAMs3EOjn0FV3s
 MnFPBJelrG9Z0Bi1dx0dI3hnGs2UlZKwc3xr2HOcDm1f88Mnhy/pEp7Cw5HJIuoVintH
 wnYvjjkRPYgyU1As1m3xbNtBPcm6lJ/oavTjbSL8ckUjs5DWuOUXniwd9gCykZCf1CLj
 NTlokLPdy9OMywplupwd5L7CkiKK5uOg9TpdNgT0FRze6iTJX5EwZUVHHBUjlLseJYDK
 7ktxWs5aeVqR/bkYT5R6kzgHO744hdiqbsVcYvra5Xnqtpf41Vlzi93aoJQKCHsrm54M
 9+TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVQPn6oxN+zaQ8XFse857MtHbccGiOO7QWBI+1EadydbCtfq3DE2ecfcbgYB3qc4YzgoaFUdy1mtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHuuMx9Xpxnnafni/nib9AQMTVcZRbTrPuWdA8Vs/6rcsPOm4U
 wgSVpiAcg3f0aOocezKGpsnuTVJE64jn7ltJaUr21ebnxqhyDm8YkUSXU07FbQU=
X-Gm-Gg: ASbGncvI368es+Z65bGbHRxgIDfwL/IBMzGWXOlgxswLwjH4v/xEZ96L85/ByiFhhgD
 1LZacu6XSwp3spGUyYCnsR0znlwoB/4UKb2W4BYX3QxqfHhOFpjKY9NIV8Nazoyj9Y9DOOT3ySO
 iryqADLANeqISg4K8RsukZVESYt3tRqrCSzX7RY672oGQXkFkYsTIvtlsfXlRDnlHg6rGjOxsSl
 msFr4t9q8dERcvMTAxx4HhOaoIDhKBPXuGvCTpmc9hqYIZC0NiXWcAMUjWSVG+mgdi1PaiGJuMK
 UANiN921ImxJ315G8OVXZ04HGne2trfHhKoz
X-Google-Smtp-Source: AGHT+IGORYjhudTQdAvMdm8g3LCUxmZy1h6j52DQHamk5YqQ8TrNPXiGHtV+PtxV/2H4doZcZuIeCQ==
X-Received: by 2002:a05:6512:2392:b0:540:20eb:80c5 with SMTP id
 2adb3069b0e04-540905a6f84mr5483487e87.37.1734433626614; 
 Tue, 17 Dec 2024 03:07:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm1118592e87.217.2024.12.17.03.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 03:07:05 -0800 (PST)
Date: Tue, 17 Dec 2024 13:07:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 1/9] soc: cadence: Create helper functions for
 Cadence MHDP
Message-ID: <rew4x4qxemig7rq4kossrn7cybihrgsizh43wnllgv2daf75gm@ziqsakm7gm56>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
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

On Tue, Dec 17, 2024 at 02:51:43PM +0800, Sandor Yu wrote:
> Cadence MHDP IP includes a firmware. Driver and firmware communicate
> through a mailbox. The basic mailbox access functions in this patch
> are derived from the DRM bridge MHDP8546 driver.
> New mailbox access functions have been created based on different mailbox
> return values and security types, making them reusable across different
> MHDP driver versions and SOCs.
> 
> These helper fucntions will be reused in both the DRM bridge driver MDHP8501
> and the i.MX8MQ HDPTX PHY driver.
> 
> Six mailbox access helper functions are introduced.
> Three for non-secure mailbox access:
>  - cdns_mhdp_mailbox_send()
>  - cdns_mhdp_mailbox_send_recv()
>  - cdns_mhdp_mailbox_send_recv_multi()
> The other three for secure mailbox access:
>  - cdns_mhdp_secure_mailbox_send()
>  - cdns_mhdp_secure_mailbox_send_recv()
>  - cdns_mhdp_secure_mailbox_send_recv_multi()
> 
> All MHDP commands that need to be passed through the mailbox
> should be rewritten using these new helper functions.
> 
> The register read/write and DP DPCD read/write command functions
> are also included in this new helper driver.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - new patch in v20.
>   The patch split from Patch #1 in v19 and move to a new folder drivers/soc/cadence

It makes it harder to review, but granted that we have already past
that, I think it's fine.

> 
> diff --git a/drivers/soc/cadence/Kconfig b/drivers/soc/cadence/Kconfig
> new file mode 100644
> index 0000000000000..b668790660fa5
> --- /dev/null
> +++ b/drivers/soc/cadence/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config CDNS_MHDP_HELPER
> +	tristate "Cadence MHDP Helper driver"

This symbol isn't supposed to be selected by the user. Please leave just
tristate without the menu entry text (the help text is fine, please keep
it).

LGTM otherwise.

> +	help
> +	  Enable Cadence MHDP helpers for mailbox, HDMI and DP.
> +	  This driver provides a foundational layer of mailbox communication for
> +	  various Cadence MHDP IP implementations, such as HDMI and DisplayPort.
> +

-- 
With best wishes
Dmitry
