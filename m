Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0C9A42BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EA910E960;
	Fri, 18 Oct 2024 15:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VW94nkJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BBF10E917
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:43:14 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so26879221fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729266192; x=1729870992; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i/v9F36+wCfWTJvKnnFi5Fi92/EQ/UbzdjUVtyo+GVs=;
 b=VW94nkJsanbTdXrgqN0XdqScrZhY7wsoPQxkMiUzTV00zdWtbd9+zsBrwQVVEbISqS
 wpdKhFUVaxU7Ag5HqrSpN9ICEZAmKP5uAsXiH/nBVLkYUKcuXK+si3VSuhb4sSgtQuS/
 JXlcq0a0DIhHQ6iXoawUB0GG/r3jlTayGbTgOGOSAmv4T6RYEYIxlysiTfl31Te5pua8
 3KDGzKM3svzsQOixroXzYERrHXx066PIu9WybVBKODvHd61cm+2Uz82JE6ca+bxmtHSK
 gmNrXt/S2MEDYlLc6eGtQk0/6sAMBa1WkfkaN7Gh5SgfvGD/Ns4Ers5Zb1iz6IVnU6DH
 FrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729266192; x=1729870992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/v9F36+wCfWTJvKnnFi5Fi92/EQ/UbzdjUVtyo+GVs=;
 b=Gz67VbiOMiKbLvJPmCJJU/zO5GqLmYiYw5BfFrfGvBh58qfgzEtnoWZ2cAgSsMue7+
 A4HwGYuI2bFefADjudH8rP86YKNiwlvW8BpCQC2rY+9+ccNlqN5T89EU2U89xeCjoxIA
 ZJR8v5P6AOXXWEDAHruyPY61swRXvvHr7ReUlnIjso4T5XXwJqTVp6fBg+plS7ycv9qs
 hddVhyyTFolsPuxc+amZMF4b2pAzICtppclj5p/9L78qD1KDtmfdyYSbSsSGCxwBR2mA
 wc4izN3tvWaycktBs7KbpREcOpt5PUpaS1H5hl+hzkMYQ7tJTE2BkcbsOnL1IUVaJFOy
 7tWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJmrP7XkXAS3EzLCeto2P+D+maXPeHpXye1mDGC3OIn9V29dkVgQ7/MNZZ3+5d0raQHlvns+geGrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE0rw6RPp7MzPwds0C1GJIBJHMCjK325nrbQnmpJTHnaC+ODEz
 VquilRZUO3o0DC35cvroI+Yfm/3+YJkzlV95KCr8lKuwjGKA5OQhQboqxvpHc68=
X-Google-Smtp-Source: AGHT+IGPiDRkwHnl+SqRQmTMCADDN4QAteA+dBcwkasQ1KTbWV4DVUcPcCzqNj5AV25OW6qHaXwpQA==
X-Received: by 2002:a2e:b8d0:0:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2fb82ea23f4mr18378251fa.14.1729266192256; 
 Fri, 18 Oct 2024 08:43:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809bb125sm2247151fa.69.2024.10.18.08.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 08:43:10 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:43:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ux2lfkaeoyakulhllitxraduqjldtxrcmpgsis3us7msixiguq@ff5gfhtkakh2>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
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

On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> The assignment of the of_node to the aux bridge needs to mark the
> of_node as reused as well, otherwise resource providers like pinctrl will
> report a gpio as already requested by a different device when both pinconf
> and gpios property are present.
> Fix that by using the device_set_of_node_from_dev() helper instead.
> 
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: stable@vger.kernel.org      # 6.8
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded commit to be more explicit of what it fixes, as Johan suggested
> - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
> - Added Fixes tag and cc'ed stable
> - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
> ---
>  drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
