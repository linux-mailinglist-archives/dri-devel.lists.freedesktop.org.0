Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71945453194
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEF26EA2F;
	Tue, 16 Nov 2021 11:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C650D6EA2F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 11:59:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d24so37121976wra.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 03:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/m3XZ+G755BzYmyP/Uv5a29EFHr5uHufx87wdpq4QvU=;
 b=j35shWlUzCoLEt6NJm3Km7KIwcCLoCsPAl2FbcCE5rg5j9BuEdgXsByDb8WakSGCIk
 N13VB0q93qRbwXKlLPh1spLzexYvGgXil4xEXUYnypQS2RkzpE7f8A0Yaj/aR6IvA+uR
 yKZUBDdlwloQRTTAV1+osJYWQ6cVQY5uWZ+dv/Z7GqG2IdsIJM4H8jXRvrUgpdglz5o7
 1mAS+l5e7bEqbW6iOML5lIl1MdRGMTTeTWBdXMwrP/jyK7uUkTJzbIXXihnf9pQMGlDq
 aXSXP/tvtk4LWJwCaQC75/2hOLAKXtq6OvaRJCDarN1q4WM1uA3kaPCdmKEhh44d7Tci
 7v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/m3XZ+G755BzYmyP/Uv5a29EFHr5uHufx87wdpq4QvU=;
 b=sKqbdfH7ncA3HO/QxQt2CeFU+5QbVWQXNwecjfGG/YH4xKTvSmdunp2o2y1VcVj3lh
 A+goa+T5sBjeYquzRwafVJTXJmhFMQRj8jJAf0YCmnus29QMwIwJD4Vt1iCp8hD5oo88
 60q0kkqolxcMHCO2I4Y9Y4jjNSAOiGlXgJKKTqjZnixeS6e+U1wCqa5YTc/+7f08ZEJr
 /PJF2Rqd4R7V9VF2y9yGW3GfYLTdu23kSCacvq22ysP9OsXg+UmwTNltvF6hDZztlOtf
 JTI77jl6xaMmodGY86v9UdRJRULyxdLSnU6xMLOiAb6+26/mXaZKw3XoPbjJYUsVAmIH
 NYmQ==
X-Gm-Message-State: AOAM5331n7sukOAq0d5Y6ogZPpkrOnQy8PaWxmNzBHelgo3EyjcRCsk+
 3EO+yRQNw0NY/z6Al0bL93pMfg==
X-Google-Smtp-Source: ABdhPJxICF1XvB5wZgxx9tEtO6Rvw+3x5bCBvlS1icpkxMJcnydKuWqlRc2CVsku3qMUBfUnFy1XYg==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr8731977wry.62.1637063971322; 
 Tue, 16 Nov 2021 03:59:31 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h15sm2253427wml.9.2021.11.16.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:59:30 -0800 (PST)
Date: Tue, 16 Nov 2021 11:59:28 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 5/9] backlight: qcom-wled: Override default length
 with qcom,enabled-strings
Message-ID: <20211116115928.yhabka5uaha3cyec@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-6-marijn.suijten@somainline.org>
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
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 09:34:55PM +0100, Marijn Suijten wrote:
> The length of qcom,enabled-strings as property array is enough to
> determine the number of strings to be enabled, without needing to set
> qcom,num-strings to override the default number of strings when less
> than the default (which is also the maximum) is provided in DT.
> 
> This also introduces an extra warning when qcom,num-strings is set,
> denoting that it is not necessary to set both anymore.  It is usually
> more concise to set just qcom,num-length when a zero-based, contiguous
> range of strings is needed (the majority of the cases), or to only set
> qcom,enabled-strings when a specific set of indices is desired.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
