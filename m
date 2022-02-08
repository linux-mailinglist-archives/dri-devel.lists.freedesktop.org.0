Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5D4AD4BC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE89910E3F7;
	Tue,  8 Feb 2022 09:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC3B10E52F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 09:24:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1137551wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 01:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
 b=OjSkWWAHIdktAsoxsPi8byPQ2FeJ3bEHJsUZ77uP4OKAnFUO5xzu8gJgEUWd9BJvBz
 aO9juV01Jl+Jg51nPtatv0IZ7mhfSBtVI2MgFLAD7hRQhDhCKaCghTlC7XJOB4AytX2/
 UAC8qQsvDpuYIsar6dqeLQttRFVBOCGRSP/kOjCVp0iPeQVX5eWrBKnmGyMClgEKMPaQ
 uRN+U37PNeVifs+mA5ddKOWgc4VOK+8xIYZhqyAJQgcBY5ZQN+1I5Ajxr+QzVIjxBQax
 q7lAMPJoX4Cm4+OenG6xR9SaqiNfcTMbrnGzlg7YTuXhm7VnbLDUwDnsqIjtdsDoePeS
 agyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
 b=eXz7dtFygdA54oZoETCASQoJAdq+OU6N9jX0DkCtbBZpO5aIhMkmKhkVgMl3EObDyu
 6b4biJvj/sB/kUk+tasUihoegXafRGmkfmc7COiVrGhPlaKJEVRJd2rFDxQyOPRohX7v
 fftmKioEVTJcR0PD8vwGqn2aXMEQ+uXennbQw2tSwVyNJmuEgrCYx6zV/fQudzRM3HgL
 qW8+VNCT9/3DXK9+nP2feeNBvw2zlCK0stFrKlvQuljvvlbJC/ZMxHPYwGDORWYP8Tvx
 46Lb++LR9Pm2OsRd6AlWJsHE17GTOuJXv/yi3ypvkvUyoMJO0sK7Qix7T116mtfTPb4V
 kSaA==
X-Gm-Message-State: AOAM533Q+SNjKS0BXeEpurnofejCvvg/yUGKUfynBqQOn4AQ8A6bY67S
 bb6sjMtHAPwtdsw3+7c61b0HgA==
X-Google-Smtp-Source: ABdhPJyETs0h54mjP52R9i4urCVEkYxAlnNZHIWK+XSjvKFVpOSKSwgint1uilZINo2Imx/EJawJvw==
X-Received: by 2002:a05:600c:4e90:: with SMTP id
 f16mr274231wmq.175.1644312260622; 
 Tue, 08 Feb 2022 01:24:20 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id j46sm27994wrj.58.2022.02.08.01.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 01:24:19 -0800 (PST)
Date: Tue, 8 Feb 2022 09:24:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 2/4] backlight: qcom-wled: Add PM6150L compatible
Message-ID: <YgI2wXYHjrcsF40f@google.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-3-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229170358.2457006-3-luca.weiss@fairphone.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Jingoo Han <jingoohan1@gmail.com>,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Dec 2021, Luca Weiss wrote:

> PM6150L contains WLED of version 5. Add support ofr it to the driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
