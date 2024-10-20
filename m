Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F49A5472
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EA410E2B8;
	Sun, 20 Oct 2024 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XaTA3Ybu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867DB10E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:54:56 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so36625021fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432495; x=1730037295; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T0qkFQv52MaG0flixd0cDZSqCxwmqX/oMwO94T/ae90=;
 b=XaTA3YburHARihTLYs/4xTCC1FxnPlJmDTH+oBfoJOwAOsvuy7rvi9I6vegM2KS149
 i5A+UgMyMLgLiN9C5BuKT4SZ9aA52id6R1jQEnGrsDoLYiTM8eyJ1Bc7zXeiKztrHz74
 orTwHT5l6NuLdwe5fD1JnkgADLN14sUUb13/g+qIMIR9hxQ3vcl7haScp9qotFQ/WRiA
 cOQGQNSxcuc/fNzHTUEQfTOacIdgE61HaV8kLTBl592U/PsZURJIBt1cSkzq2tC3TvFN
 lIi2E0qR5kSXdzcIoEGMCO/kbY0iRWDem1lJbSC9/hee3/mZcD/B0H0NmhlleWiZ2o4d
 esFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432495; x=1730037295;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0qkFQv52MaG0flixd0cDZSqCxwmqX/oMwO94T/ae90=;
 b=sf92T+h/GEkpt7jSUPBzcXNUkBGkQVJctiDwL0VU50SHLvtYPkTuIH7gLJbXZzMRr1
 292b35YGWLcY6g5+w8mDRRHE25T1w2t/A+BcgVyIitgh08uI9w+90mRyU6J3tcQF/rpf
 wdJZiPS0NPqFe56vZsT+Xtngz5TLNoxElleD9njEC0r0S+mnmtInUtvUKDVuMfl+qyjC
 IfFdJJM8OhnBOQxyC0dTZ9xrVLbb54j8JQGnNzasU/KHsk3M3jB6hKqvVNP1USbYEUE6
 u4YBPPUssjM1pt/2uXrA6FWF+0rHWbTmX4enGcPiMKhcyJ/lcnZMdhLEImVfW843u9t5
 VHug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWze7iV2eYJd6TV5rlYRo8Chkf8vTgzh81UEzST3C7g2wRbGI8TR6gjDS94NVaHYy1ppapdEbs+8SE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx34Oy3/uYzrgZRrZ+ATDfjj22tmMEXk+kk7tDzszr7hJZVvLLW
 czkctCKQDNQ/+IFD2kOvKufkb5usEHoTtrco5rIBX1BFxrTEj8m9bnND4cYRS5A=
X-Google-Smtp-Source: AGHT+IGDStdGKgyHv3SXIy7e4+EzWShj2sn4w9wUPHCPBaolRgoB037SeyWy5j9MZhh6/oL+pTHWsw==
X-Received: by 2002:a2e:a78a:0:b0:2fb:8df2:13e6 with SMTP id
 38308e7fff4ca-2fb8df21412mr21354681fa.26.1729432494574; 
 Sun, 20 Oct 2024 06:54:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24b58sm2366511fa.128.2024.10.20.06.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:54:53 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:54:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 10/10] drm/bridge: it6505: add I2C functionality on AUX
Message-ID: <kiuhxqulo5eatymma25k7za5ca3pjaof436poqhy26tlyatrsq@dez6joc7gddv>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-10-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-10-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:22PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> DisplayPort AUX protocol supports I2C transport which is capable of
> reading EDID or supports MCCS.
> 
> In drm_dp_helper, drm_dp_i2c_xfer() packs I2C requests into a
> sequence of AUX requests.
> it6505_aux_i2c_operation() is implemented to match drm_dp_i2c_xfer()
> operactions.
> it6505_aux_i2c_transfer() adds I2C functionality
> for it6505_aux_transfer().
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 177 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 175 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
