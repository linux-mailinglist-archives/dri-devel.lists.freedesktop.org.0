Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49999F1FA7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 16:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B862810E26B;
	Sat, 14 Dec 2024 15:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vqu1bVXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7810E26B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 15:22:51 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401ab97206so2805134e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734189770; x=1734794570; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6KRYjy85uHVSvO/Bq/gSblaESBr0BR4LGU1uvJVvV+Y=;
 b=Vqu1bVXzKxUNYQ0iXFsuoFDv7KHimz45lGoUbg2Bru/pMj4CH7hi20R2Yob+XMkvot
 e15ETwT0iACzg8GyXF0iN0IEs/vZIhjX7VEMdlN3ds5NcChJ4A5Li9TNJtcjCb4qyOl0
 9WQp5ACwbR6CET7SraQSeCnMgFYnVHB/1lgJpTkm32NObceOij6tEfC8J0L38qUXybMS
 485j1Z0lrjkkoylRdZ4jt1lv+8R082hMTCwrBRT77M4KKyz0H07dNbglyQayvsHVT6iL
 gtoqfBl78jxWVGZgInabFu84RCkCKfkzjC2iMFZKj9DGs/TIzIcWmWZGqegsdfEA0Fyy
 SKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734189770; x=1734794570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KRYjy85uHVSvO/Bq/gSblaESBr0BR4LGU1uvJVvV+Y=;
 b=ddkn3G1Umj9ib1h0Q4iRc12XzwMYALadbHmASaAnnrX2l4mZlull2Aj46W905RVdBC
 ZZ6vLNdmY54TyobR8YH7Z6SuJgvCjl/fdDJ2X1Cslx3mQBiXURGS7MDaIqN1Oj8nyVA8
 cFgjck0KP/gh9TBLCPrQbvtLGHkUF/zrULGbik6D95QgU/VMgF7NbrnkHdNDxC3pPeBd
 MolZU2R37Cwv4/XmlYceGZqm8MI6URxj5kxFL6lv7pdyJU48RXYWTNcC8aXKbOJG2Gyo
 qDMcjU0lj1L8c6cur/Sggi/pN0lC09qwui5whjZm3i45pfiloHUfSnEVukLGeCyUUrUD
 i9Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiYfK2ziNgZK48oXScJIbj4wmO7VRh5rhUDkhvB2QdbIZyJUWr134XXWX4A1QAc362EfLgSQdD/r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywewp83e23MAOs+GCS4evRUr5dJR8qTJvXjlLGMLLy74QsQGCA7
 l33Lf1LIVDztxahDgVvRBcibfJ4aoILwp6rxRF+h9X8peRQ5fG8sQUu6HUu5Jk8=
X-Gm-Gg: ASbGncv2z0IPXvJZQc4LAxp7u2U5Of6tM3DBslZyyi686fxjrQ7QU24+DSWImJNsyDN
 0LDo7yn8bNu7VTi20e3fPursEVpnxHkFzsVsig0Hn41LNClV4OBM+eKUpaiZj1nFFnZbgNR/6IR
 dljKH8CGJh2OEI6IRWHjM7W8He2mb7ewELJ1SRUXEFBrZbCp2yRY16i8d1gWNwSwizBahsRwpA7
 sBb2BryJ8dHlmOp9VvksSVGxQmE1HBIIjQPzecpSmaA76oJCy/DfZTBsrMlQGFKvVQVIW0n6HdM
 biFIucSZvtg3PmGsVijeMFIcdB6lNsDlXFd4
X-Google-Smtp-Source: AGHT+IERA4wVjzRd2vm5V/3Ch1QltASprXMX8I542yjWVHhi2F6oh4lKeuUhQNSq1G414T/Ylty4og==
X-Received: by 2002:a05:6512:3b89:b0:53e:24fa:ce2 with SMTP id
 2adb3069b0e04-5409059508fmr2240818e87.38.1734189770144; 
 Sat, 14 Dec 2024 07:22:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9db5sm245253e87.88.2024.12.14.07.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 07:22:49 -0800 (PST)
Date: Sat, 14 Dec 2024 17:22:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: display-connector: implement the error
 path of .probe()
Message-ID: <qdmiiq2ia2s7cdv6s3fjxr5nbs4q5gabaimziy737n2onkr2ng@humonlphwvmj>
References: <20241214012652.2104807-1-joe@pf.is.s.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214012652.2104807-1-joe@pf.is.s.u-tokyo.ac.jp>
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

On Sat, Dec 14, 2024 at 10:26:52AM +0900, Joe Hattori wrote:
> Current implementation of .probe() leaks a reference of i2c_adapter.
> Implement an error path and call put_device() on the obtained
> i2c_adapter in it to fix this refcount bug.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V2:
> - Omit the null check before calling i2c_put_adapter().
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 27 +++++++++++++++-------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
