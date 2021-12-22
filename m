Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20347D0DD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE9810E86F;
	Wed, 22 Dec 2021 11:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D7410E86D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:19:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so1264490wmd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/reVXFbwGvPtptFEcS4POHmCemx6nGpkPPsCHK0zcq8=;
 b=J5WWWvc3IuUjHTnsVCR24J6M6u9Kij+YAFcbqiLiwRsCR3JK6zKt1kUoLW7hfutiFp
 bjHdydoVbizMsaxlerROgGyk8ySUOE98cWEOSRSGIQ7hT9qDrOBxhoOQI2h1nVu2eRSu
 CjVizaNQZbKf0QXl8/XJACmJHDimmGHIn1jocmclYhrGj4VES2uGhaeN+iFM6+uPj/Rx
 jYeZBScOaSi6em7f6XS+pVQVklNbmfl09oP3zsayg3tUX4Y8SoKu9ghCyQxJrVi49/VR
 hZ+y+JxQoeGMBDf6hiXzkW+HUr4TOeD1gLJJllkFmWAz72D/owIg1JCV6qYoGF0PWyml
 cHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/reVXFbwGvPtptFEcS4POHmCemx6nGpkPPsCHK0zcq8=;
 b=yGzLj0im41ZJDZebNgXaSPRDCkKU/DKv1dkGcclA+D17Fy2a1NMwIQ5nOdp577cGs+
 0HcotVectzewL2AJqQ52eukHu08EmDL87+Lca3HBpnKPOrJ6d3uRwRiyiE/nolzf40hF
 e/At7Oysm+UylCVzYr5AablNYpiZnCwQU01EXBGLXCwn7Bp9ymITCMr5SEO7Chy2IOWV
 nzX9MXvEn9xuPyU2Qhri+rU0YBQul8mhzgBKXp4FJ9ScSDP2DCCHm9YfhF2V9CNZbkpR
 wS1lmHn6cvBc60huPaxwcC8DikG9aRLckOcW+h8pSEzpRgyro6od9Z7jVCyJogyib2of
 zl7Q==
X-Gm-Message-State: AOAM531kMXu7l1m9bHyDdKJ0N41zdJGnUAE8iPDOg6/ulzc58k7HGfkL
 tRqzelXRF31bPaMdlb0vrdc2nw==
X-Google-Smtp-Source: ABdhPJwZmMqp90ob6RIH01SOsHCsXi+jUYNxlqmIKZvvGMW6B9dTSDKKs8jRlE62lkhrubrAM9iLjg==
X-Received: by 2002:a05:600c:6009:: with SMTP id
 az9mr626439wmb.32.1640171942136; 
 Wed, 22 Dec 2021 03:19:02 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id i8sm809626wry.108.2021.12.22.03.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:19:01 -0800 (PST)
Date: Wed, 22 Dec 2021 11:18:59 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 9/9] backlight: qcom-wled: Respect enabled-strings in
 set_brightness
Message-ID: <YcMJoyVF4n8yDPUY@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-10-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-10-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-fbdev@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> The hardware is capable of controlling any non-contiguous sequence of
> LEDs specified in the DT using qcom,enabled-strings as u32
> array, and this also follows from the DT-bindings documentation.  The
> numbers specified in this array represent indices of the LED strings
> that are to be enabled and disabled.
> 
> Its value is appropriately used to setup and enable string modules, but
> completely disregarded in the set_brightness paths which only iterate
> over the number of strings linearly.
> Take an example where only string 2 is enabled with
> qcom,enabled_strings=<2>: this string is appropriately enabled but
> subsequent brightness changes would have only touched the zero'th
> brightness register because num_strings is 1 here.  This is simply
> addressed by looking up the string for this index in the enabled_strings
> array just like the other codepaths that iterate over num_strings.
> 
> Likewise enabled_strings is now also used in the autodetection path for
> consistent behaviour: when a list of strings is specified in DT only
> those strings will be probed for autodetection, analogous to how the
> number of strings that need to be probed is already bound by
> qcom,num-strings.  After all autodetection uses the set_brightness
> helpers to set an initial value, which could otherwise end up changing
> brightness on a different set of strings.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Fixes: 03b2b5e86986 ("backlight: qcom-wled: Add support for WLED4 peripheral")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
