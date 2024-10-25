Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB599AF622
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA6410E9BD;
	Fri, 25 Oct 2024 00:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LI0jrc3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE4410E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:22:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e13375d3so1758222e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815736; x=1730420536; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
 b=LI0jrc3AuciPrPUSyCTKUlsAS2XE5qpCB+ZMZCfECdga/mnxs6dFXsIXVKxoFBAsKM
 r1/yMtuJJ8BtYIMNDQYuVPWjyKpgYHX+2ilPUlLVqyqbt+3CDkTSfD29Nlhbz5jCwlnc
 UjhnFmJPaK08kXFdzrRxAibXqvjMa89yXOegBewW7L+gQnF45wkxcqc76pw0cpqLIqAy
 GJv6cqXg7/c/UkcTLLpZsEyRJrqoGpI/a4lJ562/J9aZu0VvnF10XhqJmv3S6KDauE4S
 yqvGpWcl8AjzLTagibR2T2YC1IJx0R50lMOVCq0gwUgrTDqyuEtsczVFuEJUFK7VYgcf
 rXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815736; x=1730420536;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
 b=e4UOwii5n+wOJk5VofBYMe/VXnM2HFThAIONajp4tYKVAFLyeI0pM/whHQgDqnIV3n
 R3zmbj1bkcqUXycIuJwt2zBNPS0TBhHmjslu6fYXkYDAEiriGYW9TijazqhNTyoFV4kb
 Yg0mBlauiyn0fb/YuyuPtFcT421OSLiGnyl4BzViqvixIQQiIvjllq4fJknHGbzcHFz1
 v4GYSECx8HqoTJSzoDzGtcdJzvvqbK/1FrHvKXcfNiTFFCV+kzDyOx+Sd+Za8ViM7Yhh
 265l7h98WlkkEqc75rZqUXFLQnQpvdbRy7l2/7l19/Lq1Q8v3CH1pOgn2MJMG1FgDa2P
 NNCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwgVoaTYpSDmiQ/uYpeBXe52LNkkiGVwMCA6+gaKw6bop7QvovogmoJgXVynSDKaO2inbjtFKLwnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBesbBuoDHLHu5T0rXd/wsXXn0fiCCYmKCUr5hLFiNZyADX0cd
 nASMYZ5BKqNywS8/dKeHikFYBd4xbmCEf9qTGuLQiFiJeW8ppb2L1/L3B8xg4GI=
X-Google-Smtp-Source: AGHT+IEwuZSNpMSc/jRW5N16zJFZH30TVd1uv/g/woovx2Ntbz3yvr/09wQ54BLmhll7f9heX5zoUg==
X-Received: by 2002:a05:6512:10c5:b0:535:699b:b076 with SMTP id
 2adb3069b0e04-53b1a31f1d6mr4467181e87.16.1729815736306; 
 Thu, 24 Oct 2024 17:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1afe39sm6621e87.140.2024.10.24.17.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:22:15 -0700 (PDT)
Date: Fri, 25 Oct 2024 03:22:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <dz2tfpufzgmvxls2stxagz73x3krbammkc2zdycqsiy62tnlog@ztg4yujvyeob>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>
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

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
