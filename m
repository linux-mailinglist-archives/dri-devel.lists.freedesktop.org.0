Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4A48433A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3C310E229;
	Tue,  4 Jan 2022 14:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5CD10E229
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:20:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s1so76507696wra.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WeeQCilTFNE7Nh007wpxMFboWE5lVX/qeHUt4Da2x6c=;
 b=KJiosB/89hqKX7GXGJC0SgqE7yLt3BnJ+gWDCoQ3Eh7n9pW11tyn5I2ygUov09Z4f+
 HvyzWkpUTZk89/jv9FhjAUHp0240JCKYZFML/yqGzz6seu2ob65gpk4jgkpE58p3PZ0X
 nU5NcJ7+8cBv9X94p+fp6GJcNwqzkuMbzi0l30NMfvWEIB3lRIImEP5SgZD9rSfBacbU
 64+XimNRphqL/JQ20UagMgU+h5dzPH+Ci+EicYq942IgGs2nkxiqWhvfxX18q58SoUw1
 lweURD7cElEXdJt+auTId7ok7ZlHT7jwiRNnrm08gJWgcsJsYDTjxUngOVm/ulV1KZIX
 OWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WeeQCilTFNE7Nh007wpxMFboWE5lVX/qeHUt4Da2x6c=;
 b=B5b80xsh0/AczzeIYBNSWVlxjWvs2g5PQxFOXnILxJGrpte1QiUOyU6DFhnw+KdjAS
 7k83KlUNDkvSwXZ5fxsv8KQdW16tcy5rvAVJVIrF5D1c/lz0GZvUI+CikeSMQ8klaIJf
 sl0UU7cbuUDXY3FwktW1YUdI+lAjbMdsG0xNhvblm4naO0/lEEY/kxyEyWA1cvvis1kP
 Q5BTwmU//oR6pXaMxx6cBDfwYaPsjucKx3YW3ekPMFBb86NGxOaXHRN/1OBekn6av1mg
 v7h0UB7wDDWCqdsrnPo2DDJhsu0SdM9QMINcJgAEBpfPELd3WrZAMhBEj8kbq4B0nPeU
 dsEg==
X-Gm-Message-State: AOAM532bG33IpSrpLkYmuu6FN5NmQ1yUZwbA2qPrkGXwMlD8qnNa4mKA
 nESz7Ljx3Hu/IZafklgz0QUa6sR7Eoljxxr8
X-Google-Smtp-Source: ABdhPJwMrTzASSAtuAeHD13Uah3zwGwzHwTERozrKIQfJGj44BxpQ00MYPr62K/vCy7LTPB3/EduVA==
X-Received: by 2002:a5d:4c47:: with SMTP id n7mr42360529wrt.322.1641306046777; 
 Tue, 04 Jan 2022 06:20:46 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id j39sm35717478wms.0.2022.01.04.06.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:20:46 -0800 (PST)
Date: Tue, 4 Jan 2022 14:20:44 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 2/4] backlight: qcom-wled: Add PM6150L compatible
Message-ID: <20220104142044.iit5wnsrgzngu76w@maple.lan>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-3-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Jingoo Han <jingoohan1@gmail.com>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 29, 2021 at 06:03:56PM +0100, Luca Weiss wrote:
> PM6150L contains WLED of version 5. Add support ofr it to the driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
