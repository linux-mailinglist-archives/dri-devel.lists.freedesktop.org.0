Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E29DEF60
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD3B10E05A;
	Sat, 30 Nov 2024 08:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mx+uFI3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBF210E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:38:42 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so25862011fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732955920; x=1733560720; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NXAcZGkWBHX25QfRBDyi8tlFp6pK1qwOt+Zj/h2BOrI=;
 b=mx+uFI3t8xRqUL00z0qGp4g5LUHsGUOH9NVuk77rZl7Sx/oBv0FW8az/pbbIHj5F4m
 hgqYxvda/fBnhZn5isAPzxOTPaeWGZH6+zlVl5gvNVfAAfDdAjb3//In4jyqzyD9zyhV
 3y++AfMcoIHu26t3lSM+fPisLees5Xgf/BLs4mLwqz3RbGVxtVfaB4OICKbhZog+uTCq
 UfpCjAufEtNsuXfTdDXn1pSk8hkNvmw8BePI+ZOzzVXqU9/IwgKapk1adgE3dhfG8pFO
 pqYJmTIWIzlE4s0boaCigzL5/uVwlIoyMSfKn7r4lbZ1MH33EmCAfNSjlS9q2Xdc1esh
 5f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732955920; x=1733560720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXAcZGkWBHX25QfRBDyi8tlFp6pK1qwOt+Zj/h2BOrI=;
 b=ErieEFoLFSRLGiPZ5TiaLpQVIRGiSsyV6uGeKnp5la5LyeLhYIrDio3+VigJGjl5sn
 /Kb+a03tglq40BE3FUzc4c3ekwXrjloy+CXr7IHBTOSXTDSnI1EIZEtfuTBbdNSITBME
 h1KlHUc8KCGS2TlYvEtYeqhldhMkQXzlC1OYPWgbYVM6QBGEbslx8ytxAkWyt64PEWrN
 HysWXFuEvk6YXt/SCc8DG7OORd7baDKIrQRBbkx6lxV4hmPJCcFr3GwBL41tGjtD02lc
 tOQuQWzsyhh+SZ75Ph9XMqynaHOqPi1bHzO0am+JJZ5UGraNzJ9jy7qHghNFwE2FdD6i
 oVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/dDvkUZY2rwOjRyhfvT1KbvGrkgLQMDQf5FHmzHng2JY1gtCTjvlJh3Bc+62iE3cZy728Q8joAOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjgAxpoqxfUJ7YsIBQKk29fGqq1ATVfKkH3ZfirxFZKih8mQmf
 4UPGcLT+FPO9TV/eISogG3oWKDcwP7+5RRJxkXX3RUS22boUEe4t3KOjbQRPdVA=
X-Gm-Gg: ASbGncsv+qrWE2Xa7TsXaTeGQieepTZv8L+hhOq3OU5F9KySRqtHyAfwen5kvFdOc10
 0En/x2hgu3cdIbE3DCFoYKSowisS58zbIrAlwYYfOQAtxmP9fCyQ/RS/ShoYeCrP3iaC3vs2jmd
 18FnVThJS+TT9XxtEAXCMscfqVqXcFyjHgOoQsKMcXVVo2aSnISFIShf8f6QybORnixZynpZBHF
 tHQtd9s/1VbXjLrP9C7jGs5fTHJIBmO3Bkk41SMK41Vz5DK6SAvguba2k8aAuR/HiFvv6zYZWto
 XLsEOXTSE7HY9qC5Hjq1vN534VbcWA==
X-Google-Smtp-Source: AGHT+IFp/JR40e+9hDYErdoRaIfhKywKkgp97604Qk0oyKGBNI/opThDDUUCyOtQ8USzlicY6WVnRQ==
X-Received: by 2002:a05:6512:3b23:b0:53d:e88b:ebc with SMTP id
 2adb3069b0e04-53df00d7bbbmr9468255e87.24.1732955920272; 
 Sat, 30 Nov 2024 00:38:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df643121esm700415e87.56.2024.11.30.00.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:38:38 -0800 (PST)
Date: Sat, 30 Nov 2024 10:38:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/connector: hdmi: Allow using the YUV420 output
 format
Message-ID: <6hcjgagu7hvbnn6rp5znwjxeaa6wqkeecgvvqkzvtma2ni6mfz@lrbmtbogkzgm>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
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

On Sat, Nov 30, 2024 at 01:56:31AM +0200, Cristian Ciocaltea wrote:
> Provide the basic support to enable using YUV420 as an RGB fallback when
> computing the best output format and color depth.

The HDMI Connector functionality has pretty good KUnit coverage. Please
expand KUnits to cover your patches too.

> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (3):
>       drm/connector: hdmi: Evaluate limited range after computing format
>       drm/connector: hdmi: Add support for YUV420 format verification
>       drm/connector: hdmi: Use YUV420 output format as an RGB fallback
> 
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 55 ++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 10 deletions(-)
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20241130-hdmi-conn-yuv-e1fa596df768
> 

-- 
With best wishes
Dmitry
