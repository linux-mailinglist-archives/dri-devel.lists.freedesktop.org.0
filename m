Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012778CCFE2
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700510E28A;
	Thu, 23 May 2024 10:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u7R6Ct5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327F210E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:04:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f2ebbd8a7so9061344e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458665; x=1717063465; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
 b=u7R6Ct5qL5iTR4dX+NT3E5wcZxywyG9mwNeS4+zz6K8UgjcolDVG0ZZ2SAhxPJJqw3
 EAYMb3TxVYMPIiXuLC3BodA9ZG9/WopGYMUYqfs0eEQkcKqaSwttZ72u45n1cc82f269
 pzcf6L1dvRWU+8yCBT0K6E23xtmq1DgOQE97cWWxwQQ4NAS2b0zQtcdibmxMx28H7OC9
 xCX6MkCRLBV6pOcQVHjEEp7Hvxp1hdzuShlUudK5JYPMI3tzroEcF8snACTlDLuH4rRX
 sYgd7DOIJd3/ZxgdEAVTDPQjGqLOCTw0Wb68jk7kL1n4JqKZne4QPoxtnU8v3QegbmhP
 PqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458665; x=1717063465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
 b=BqZX7o0U5ShjNI33x8zfbzAcZLi6asUePzG05rVcPgORuzZUGJ9XwaSi82GWZV2ibX
 k9j+U1WruqltcuIwUqk2ctyy1KvQC8D7k7CSL33f4kQqbmFaK0q96L/ZosewcAtNfD1v
 H/Qhk+SBi6B910Dk7N+4R/KxJV5bUzrr4XFeSmZ8GOGmfjQPiH+PXWSbMx+qNZJ9rQ1P
 gHA9rBHo75x6vc9T7tSawBR0X3jpS3DqANk2Vy9YZIOY8vmeqa4sqk8y7NDrfmcNUVu1
 dpT0hEg22tVZ4NMFtyXNM8O8jl19B3R+c4fUUeVfJtEaaRy/EBQXKFOer5bRS/PSGagO
 C+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2u7h+H3+06MZuKGbDAtpw8ncNWOzD/oNMZIPiBV4KftBwa3C4IAEfJooa3tfGiFHxnQj87f9IPl7L4UrTpIXINl9/yy9FC2RaHXRtbdz5
X-Gm-Message-State: AOJu0YzxkpGFVxIIPv8qYvAlOiwnzGcO+zofC9q/y7uqAEY2YyFNsTWq
 lX2lr3WpL/kcw39g0UJpra8DKKk+BKhBmhxgCbi6WGkmsE0N4jWKGbcEErZcVgs=
X-Google-Smtp-Source: AGHT+IHI9JqXzb0Cyfhcs6KeNERwPEvQfkeVQfr9ZS+SMw0TkOUBh/ztRskPl/+x+XS30MmAlFxklg==
X-Received: by 2002:ac2:5044:0:b0:523:3be3:cbfe with SMTP id
 2adb3069b0e04-526bfc02bbemr2577217e87.65.1716458665403; 
 Thu, 23 May 2024 03:04:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5236d2e9ad9sm3382898e87.178.2024.05.23.03.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:04:24 -0700 (PDT)
Date: Thu, 23 May 2024 13:04:22 +0300
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
Subject: Re: [PATCH v14 14/28] drm/tests: Add HDMI connector rate filter hook
 tests
Message-ID: <zds53yg36qf7ft7mrvvgv2k5avbjib3zy2pdd2azrnvthppngu@2bep5gso3wic>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:47PM +0200, Maxime Ripard wrote:
> The previous patch adds a new hook for HDMI connectors to filter out
> configurations based on the TMDS character rate. Let's add some tests to
> make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
