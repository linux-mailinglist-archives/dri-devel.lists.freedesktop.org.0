Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F878CC8E5
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C0310EDCB;
	Wed, 22 May 2024 22:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="teYGOpGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB4510EDCB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:15:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e72224c395so44381851fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716416135; x=1717020935; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
 b=teYGOpGvz4d9DLxrPfRxbptJmYitJ9q20zWXgdK0EpEkazFzg3xmaWhxAeuW9ipn4X
 c4CEhxltLPODskhTzt7ZfBo3afpRDV/38F9tCJLlnHqF+o6r0toivijKZoDVcEJpfryx
 hCQ6tmv2ct58V0wunMUUvTuI6ODdu9o8DgS/sokTfrzLod8D0RI3JW1PDZXVe6qKMUB6
 s/s+ayCfJgllO27uXVU/+ZwXYJDx67Hr9XugKC7e3YSz1B5yQlWb8VPRdxo49NjPCvNP
 +/ZB5TimczLCJq7sVWccgnAYuMaBVi3lDsQp/d7iQSVYJNGlT4+EIf661obACzKqH0PZ
 ooOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716416135; x=1717020935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
 b=oKGZCiQ/+YrgbOf3zaH7YKc8gkPbgmAHTg7tcPmxiirCDeDSmSqZYx4aG+L+KgjTxo
 hlAgAjCEOBR3TP1XE4rA94JTBzr5ZPoObIBQUfn1jTiUTjxgfJ+dCtKu+x+4v+re+fe8
 RCKLCwlFr9+DzLPOhybL52s5V9OdktmSajXeeXDtP0Vk8hj8pLZ8o7Hix6qcidS2i6zZ
 /oIgY6TzJ/FjSWBeeN5UoQxTyy6fn9ZFs224JxsbhsZFh/DD7zcdYF33zfiHLp8+R5cT
 9P6MJqKfO1qqIZcSJqBadH2GYXaIPOndzYmAq8ha+n6I+wuMZsiJWf6lH3OilZfT/oQg
 2yAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo2U2C3cYLd7Z+BggTBkJRzrFnaWZIrx/UfDYDnyR661U5VCEB8BIQtAupRe7k7+SVOfWh5BUNvmbDqzfmsXRKYFyFTeYBSJTwaZJNS3+l
X-Gm-Message-State: AOJu0YwVcJStwdz1gzxtW1l1NGdXHAFFMP2pcaB9rfZOn1DysYqaSEav
 RPLAMyzyMi1dTfHl/CqRYXf7BCDGWEJFj6jsqNno3fv5/sUs1GaB4oLZ+yDPXdo=
X-Google-Smtp-Source: AGHT+IF/UTSqsmeasuf7NOT2sTbmOrMUL+I3W2MWiTAwWJ+7vs+IwOiiNIBy+wp79U/WJ252kb2Igw==
X-Received: by 2002:a2e:2c0c:0:b0:2e0:9646:8512 with SMTP id
 38308e7fff4ca-2e94959d2d1mr19932501fa.31.1716416135049; 
 Wed, 22 May 2024 15:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbc372sm41384461fa.8.2024.05.22.15.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:15:34 -0700 (PDT)
Date: Thu, 23 May 2024 01:15:33 +0300
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
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Message-ID: <nxcom4wqbviqipongd3r4ao7w4ik4pntq3jejhmb4sr2ymb5vb@mtyeaxtxlmat>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:35PM +0200, Maxime Ripard wrote:
> We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
> sure a given property has been properly created. Let's export it for
> tests only.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_object.c | 1 +
>  1 file changed, 1 insertion(+)
> 

If this ever gets reposted, it might be better to move this just before
the patch 6 "drm/tests: Add output bpc tests", which actually uses this
function. Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
