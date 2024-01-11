Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E482A8A6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A49410E6BC;
	Thu, 11 Jan 2024 08:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8610E6BC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 08:02:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e80d40a41so6421439e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 00:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704960164; x=1705564964; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKxxuD3H1/DIN5QRJJMMz94OQAGexuvEeKEGvpZ2FHs=;
 b=O1Z6a0qWDXCZpXFrSIhoNByzdJaie/Qdf9tZ8ak5Kmk+PaZyvJFsWAYrQS7ckrc11F
 OrY5m7llhe4sA2Nn13QK1UA7uIJXDGmwj6GuAXC4rnzKCppPVvg+zl+yNQALvg8PzKHg
 rn9oZe1jMuomMl26Y4Ox6kg6b/uL8CzKUwFvZccNpNIC6V9BU4giacQET1yrllYg04DL
 d8hhDAHYwyHhAUrgZX3YiVzv1LGZmmPGMcIiaIF9KwCszntz3RLns745fueCImnIVBXv
 40oFUO7heujBofJM4izk+6e86hlcuYn6/RMZ5ChmfLvOCAikKg79+mdcxlmSlm2tVjbs
 4j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704960164; x=1705564964;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vKxxuD3H1/DIN5QRJJMMz94OQAGexuvEeKEGvpZ2FHs=;
 b=wztflvNtSNLg7I5VcQEg/DY9UEWczFhO7/bS1dCMz43aA8P/otTb0vdy9voxbJFg+A
 f6MwWWorgzN+I0F2nTfwqei9zecRtj5y61zSSPrXNRfbgX8P//CXqEYAahyp4DFHtt1m
 ppc+n9dlQpaHdBw8/H8Ui15kfuSyeBKgAaU6WkdHtsO7431oBUPoS5fNd82rGGexabC1
 Z2Kq60T8d5dQKBTHFGhAOH2R/Y/ayTFi2UaQUIeUsmOUIxluYbe+lvO0wA7nRDuAjt2p
 6HcgPvygYZ3P4cU+97u/NLvSIweZQgIApM33MQ8eV6X0rER7Ckg/yv4d6R8/RF3kbPt0
 ADkg==
X-Gm-Message-State: AOJu0Yz6YIcv1LNsn2sM8mDAKE/idjaxDnuuyD0zSiYNXLeoBhvRJGjg
 Zp/3tdaVK6yaq61m7YkLLgA=
X-Google-Smtp-Source: AGHT+IE+cflWxnqrTu8nKruzZQZ+XhqCz9LY20j6/G+0yYyso0tQ1rLPm6HgDdtJYv8dUH0qT0Be4Q==
X-Received: by 2002:ac2:5221:0:b0:50e:2551:c8ce with SMTP id
 i1-20020ac25221000000b0050e2551c8cemr378337lfl.119.1704960163317; 
 Thu, 11 Jan 2024 00:02:43 -0800 (PST)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05651239c500b0050e7bb8c7d9sm104793lfu.239.2024.01.11.00.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 00:02:42 -0800 (PST)
Date: Thu, 11 Jan 2024 09:02:41 +0100
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: GuoHua Chen <chenguohua_716@163.com>
Subject: Re: [PATCH] drm: Clean up errors in cdv_intel_dp.h
Message-ID: <fhuiv5zj4t746eqn23puj7uog2uqdx7erzlsiwgrj76y7qjgx4@3rlihcbwacdf>
Mail-Followup-To: GuoHua Chen <chenguohua_716@163.com>, airlied@gmail.com, 
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240111065648.9170-1-chenguohua_716@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111065648.9170-1-chenguohua_716@163.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 06:56:48AM +0000, GuoHua Chen wrote:

Hi,

Please use the correct prefix: drm/gma500

Also, the change is made in cdv_intel_dp.c and not cdv_intel_dp.h. This
seems to be wrong in most of the patches you sent.

Please send these fixes as a series. That makes them easier to process.

> Fix the following errors reported by checkpatch:
> 
> ERROR: else should follow close brace '}'
> 
> Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 27cfeb6b470f..135a1226df1a 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -735,7 +735,7 @@ cdv_intel_dp_aux_native_read(struct gma_encoder *encoder,
>  		if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_ACK) {
>  			memcpy(recv, reply + 1, ret - 1);
>  			return ret - 1;
> -		} else 
> +		} else

This doesn't apply. Not sure what happened here. You're removing a
trailing space but the error in your description says you need to fix
the style of an if-else statement.

-Patrik

>  			if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_DEFER)
>  				udelay(100);
>  			else
> -- 
> 2.17.1
> 
