Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59147D0B3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3487C10E4B6;
	Wed, 22 Dec 2021 11:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6BF10E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:16:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so4218326wrg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2Mo32W8JTFCjLZ+EMibViyk9WSjJAZW9YRzpSwd3f5g=;
 b=b35DmtKSDnjtb6g2XbUSASAX6/7SHGKxQV6uWLwyw6310JQwkUH6R0rej6OFVHPYqt
 ZlWaRtb/LPwD5OCoNnObBuF1A4D63fPud4aldcdHBKDADvVbaTYiJ9sJWrzoahnnbVYU
 Y8XzAbXjaOzt95D42cUtf/pE9Q6KbfEdUa+DxqvkzB7MKSw6kGgcQ9pEAvzKrBBCfqbw
 gAXvD3D4vMOkfGBOl0Rj4gx5Jf3AuheDTAHD81bM2J6XbdJQLxfqu8xhLJMxW1DPaL9g
 N9cqWvydXYjwxv7xi/eiepDHmO5F1zwGNA8W6TXVwUIIzfOlhUsN8NyF+k1QtC2OkhDB
 bjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2Mo32W8JTFCjLZ+EMibViyk9WSjJAZW9YRzpSwd3f5g=;
 b=5ScRymhEnlLpXNz4UJyW3/MzgxD5/9AUVoYuBBLfpUsLxyFRwp+gQONUyP3GhNp/VQ
 bS/t/YOoP0k7ihR+/q2VjBTrURJQ9M78cvzX5ATh6LyPOetC3QgmeYvlSt0a32lZqMEA
 iuMS99G1JMCtRXgrdRoNPcxTzVre/AiJiLd1ceMY2aTwo43gcJEVoyFA0GEHJoPi1q10
 0003fzsewMXJ9BC5H5QUmDOcZ3OudiN0yZEU0kRrbNqbLJ72WOeLiuqzGGjuKh6BxZ97
 Yw6CXpmWVWcrRakBb2UEewpGoQItGjGG+BsKyuYg65EfigpaEURlrpBBq3qy2l2z2+94
 9aFg==
X-Gm-Message-State: AOAM530gQyhcfdWkfuOhw72fEbtgv8DQGBboYxurS8hozNbHGPwjXaPh
 xtBbRLNe4F3gZFPr61Pd/M2CNA==
X-Google-Smtp-Source: ABdhPJzzz4x3+XF/hgP5qqgQREYAHIjOt2datURQjBi/nC8bdYRav/zP4bLMzHZ1FBo2p6vV4L2+9A==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr1705042wrh.43.1640171808427; 
 Wed, 22 Dec 2021 03:16:48 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id p23sm1446946wms.3.2021.12.22.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:16:48 -0800 (PST)
Date: Wed, 22 Dec 2021 11:16:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 4/9] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <YcMJHmpheylD+L3l@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-5-marijn.suijten@somainline.org>
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
 Courtney Cavin <courtney.cavin@sonymobile.com>,
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

> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> of 3 and 4 respectively, causing out-of-bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by parsing the
> property separately much like qcom,enabled-strings.
> 
> This also enables more stringent checks on the maximum value when
> qcom,enabled-strings is provided in the DT, by parsing num-strings after
> enabled-strings to allow it to check against (and in a subsequent patch
> override) the length of enabled-strings: it is invalid to set
> num-strings higher than that.
> The DT currently utilizes it to get around an incorrect fixed read of
> four elements from that array (has been addressed in a prior patch) by
> setting a lower num-strings where desired.
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 48 ++++++++++-------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
