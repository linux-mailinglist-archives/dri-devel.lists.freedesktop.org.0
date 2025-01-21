Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8DA17B4D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E66110E53F;
	Tue, 21 Jan 2025 10:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OwGrH7JW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1910E53D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:21:55 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a6bso57831821fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454854; x=1738059654; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I2nFbxWQBsokcGgY7hPWhlAFzM7Qmu0ovahyH14nkRc=;
 b=OwGrH7JWiyo0Abv9O457FxbDRgYk8TlO/UDjF7CjNDRJCcS7XG4ZO4klWGG4Dl7anE
 Ma4eQzMLzOc9qNEYl6wa/hBlSudX4sOMl0Yl6OJRhE6cmw4KtfFNAkfgw9EfFUDg3U4W
 N6aSHZrXGk6Vpsv+xJBeRAAedZNxBmG2kMpXGLETWxLpsdU6csPY41PRW5IX7MXANMe+
 PpvjD6XsS9KvkeBZHz8vHPF5LqrahCGZ0YUHF9hiGHmXiK4RuSRkdX1I5fgEkVQ0dwBq
 4PbHSDHcNspLXuNfQSoIlBelXHpH1M6WVCJPD4yNr8Q39lV3VTMbstqmUKuxnxD2S3+W
 wphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454854; x=1738059654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2nFbxWQBsokcGgY7hPWhlAFzM7Qmu0ovahyH14nkRc=;
 b=jUXstcOnsYem1wVDf866nxjGqrk8PxUAOex2U6iGIUbammQMNfLs0WXurma31SNhYk
 9LpT1hLShRY3yJ6WptwUVh6H8h+EnKs1nKMyA86iJtmNgZ1MwQu4gQRSN3rABoexQTGO
 KtHhzOwofw4UcSbygTZYp82R8fCOYCZEozLik1DFnI/W00qzD+XRrGbfKDxEFPNpKlvH
 +QfjXmZw5zqrc5NbAG0wYa7Ee555/2onWXpglkxQXxcEmGFOK5kRnOy1OD+Ww/Q8fLny
 GHME20sQK6OQ/03LIJmpbvBp0cbWZBpBedBTTje1AzshRnxuGKbF/JsE8uEuHeSqFVAx
 +dhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCsIzPOOk9jj4tNeAY3pEE/GKM4UX663AEiitMNJz5neOX5yda3tgOUwtIAa1+j7HyxTIG1ucojzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyulA3FTVdl5qmXoXpuy52OgTgZ7Vtun0ERAPM8hC3AZpxN9XmO
 vMZkPWSrWoi5PhbgApOkjp+D43zfm29rpB+VLuqGkkiOsEaOanDYOxpZ65mXA54=
X-Gm-Gg: ASbGnctIVIVnEFVaci/DtgTn87V/1L7BlnMltpFuFamLSUsaeCHOrYlsLZCSmUM0aB6
 OCEMw1Uw5kU/dT6N958zPbRB3OD37ft6sguw7pWxqN4dUE4cDRO/j//in0l98/ksvThiMjF2B52
 hjg1q3otc4+SSwUipyDkW+DVxFtN3HxM62fHFMTJAOMpw8iupf50azkS+RDSE7YCvuwkEenefac
 vCIqBS5dUhkth67ke0+H+26rjag7jmKphFWq5cwbzNKCQcY4mjSv0SuMD7O8IAVjTxQWjiP08JL
 VKboWPJGsM8XB/285PLOjLZsDpRRPmPq3olw5zM032MSnFAAfQ==
X-Google-Smtp-Source: AGHT+IHjV5PDMcp54JhabBC1f0IqVkNBpOfsnJgpDLlax67qDrtQimC17ffsjCIjglRpaN2NGP62Uw==
X-Received: by 2002:a05:651c:896:b0:302:1b18:2bfe with SMTP id
 38308e7fff4ca-3072cb04523mr66011901fa.25.1737454854232; 
 Tue, 21 Jan 2025 02:20:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35b893sm20821891fa.63.2025.01.21.02.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:20:52 -0800 (PST)
Date: Tue, 21 Jan 2025 12:20:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH 2/3] drm/display/dp: Define function to setup Extended
 wake time
Message-ID: <czglpcoij5po45xhidmpmeplcqbu6rrmjsipbng5p2a6tygi7a@cfw2qbxe3zqa>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
 <20250121060522.1296166-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121060522.1296166-3-suraj.kandpal@intel.com>
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

On Tue, Jan 21, 2025 at 11:35:21AM +0530, Suraj Kandpal wrote:
> Extended wake timeout request helps to give additional
> time by reading the DPCD register through which sink requests the
> minimal amount of time required to wake the sink up.
> Source  device shall keep retying the AUX tansaction till the
> extended timeout that is being granted for LTTPRs from the
> sink device.
> 
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 47 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index da3c8521a7fa..9eae5ee85b13 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -459,6 +459,53 @@ void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
>  

Please provide kernel doc for this function.

> +void drm_dp_lttpr_wake_timeout_setup(struct drm_dp_aux *aux, bool transparent_mode)
> +{
> +	u8 val = 1;
> +	int ret;
> +

-- 
With best wishes
Dmitry
