Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF68A8FC7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 02:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0D010F925;
	Thu, 18 Apr 2024 00:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nkje7/gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A9B10F925
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 00:04:39 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so4316921fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713398677; x=1714003477; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xyMD0vdpJTGU58R4FA68GHuoRK/sk6v35n6AZg7jKqA=;
 b=Nkje7/gfZK/wqIY4Fda4MYPcQCZNByntNNB1rGeeSuHWtH1mo8+YwsKGWze3OnxQWK
 5iqJcqzrC0biaAOTa0AhIJ4YNdVNwjlwxpWKOqnMQdG2UMcrpapNdBKaH7WmALg+68b5
 rA37L3ojWVD6aWZZm6FWP8YcPRTRlPc5aosWLKbCRJ2uqSjnuTQa6cDcrezJlxachxAT
 ImDgR0At/gzbTQM0cEKDEfEQ/zjzKey4TUVLEIM0WVLW/vioMb19vpv8nv8C15yj8Dwe
 NdRcDTk/mDALt5nYHt/02xocqs0LpQGhW3OURxyNq3cMprjlZFhkTIEZiKHRRfLdkE7r
 HAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713398677; x=1714003477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyMD0vdpJTGU58R4FA68GHuoRK/sk6v35n6AZg7jKqA=;
 b=SMNYgioYeIHcGwXZpU0AddDXTIFJR97xroUvrwquoiTeWJaVckhys4tyNbvAvPfNSD
 38kdl2Gk8ZDL0e+L4GiEFJ/ZVvZ/fcgaQgeBSxXB80mEuki0Hm2E2u4UFckUzILTrQm6
 yDzYWac0uMnWNUYLLgnLeSbsiv/Gpy0n6kWw7IljsdUP1zUfRRcVLyjSpfG147o4Dymh
 ZTSGDKGL9PpuDmB6pP42I2G8V8zdgGcxGdIjYyjz8ewHB5nRHdiF5bTTHjGYCFUQCKhf
 v5TXxcvFnTzCxQ01GC11E4bgb9gL64sSuwfADAm4KNLw7QxZPJvFvalv8aNHao/4xIu4
 rVwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMoNaXQC3fRHLO1WnjsBkQeUoHCDyDhgpIzFL170twlJKA6LWPvHRKcA3ML7ZImrQkSH/9E3MIMIs1gmhIPhIvLqBPuT9uXe7BETl9ruLC
X-Gm-Message-State: AOJu0YztnJbBWKt0MVkrKDpBFjLH/lvhVy7V9CrAfEK1uszhL898lpk/
 lHktnQiRk2PDvS+ZhXeJfmuwF523/MzUn9CChBwh9ZY5AoMliUxx3wyVbjHSY2Q=
X-Google-Smtp-Source: AGHT+IEfQFM/00DQfWr4fRjU1vKMYz/rsbblnwdJZZ5z2LLaFZG8n06y4eExwX1km4x2k8m3TwgtOg==
X-Received: by 2002:a05:6512:32b7:b0:518:d685:9935 with SMTP id
 q23-20020a05651232b700b00518d6859935mr439018lfe.8.1713398677609; 
 Wed, 17 Apr 2024 17:04:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a056512218600b00516c580b640sm42807lft.13.2024.04.17.17.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 17:04:37 -0700 (PDT)
Date: Thu, 18 Apr 2024 03:04:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/panel: novatek-nt36672e: stop calling
 regulator_set_load manually
Message-ID: <v5zrd5u2g6lyn2cax3uatk3ukdj5mcii4b5ng4ec5oorw3wkfg@zlfdnbmw6kkp>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-4-9f56953c5fb9@linaro.org>
 <e89c5c19-7c8f-476b-a96a-a5bc330278ab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89c5c19-7c8f-476b-a96a-a5bc330278ab@quicinc.com>
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

On Wed, Apr 17, 2024 at 02:20:31PM -0700, Jessica Zhang wrote:
> 
> 
> On 4/4/2024 3:08 AM, Dmitry Baryshkov wrote:
> > Use .init_load_uA part of the bulk regulator API instead of calling
> > register_set_load() manually.
> 
> Hi Dmitry,
> 
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

I wonder why patch 4 was reviewed, but patch 3 was not.

-- 
With best wishes
Dmitry
