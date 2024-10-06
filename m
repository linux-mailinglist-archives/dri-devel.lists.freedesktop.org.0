Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2F9920F0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 21:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4476A10E281;
	Sun,  6 Oct 2024 19:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xbrl9OuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0F810E281
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 19:51:50 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fac5eb10ceso34125981fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728244309; x=1728849109; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HLQ0qGbobuBRSeV4tlw8iWIHrFfzRjusLkYkkaznzmM=;
 b=xbrl9OuXN3Ior/9jIXqvycijKv9SODr1Y0XVOPyz439DpWG9ELGXP8f9N7oeugVK5B
 TrmRPwdrfMT3tMCDHO2GFS0/vDA5szW+MwqgDd63mKtERLNcCzFg7i8stass9NS55nR1
 1mgBN1ex1GNKM8tfflKbRFVS32kY5U5C61OO9NrOpK7r27XNwndlFBe+ENr8bIkMFlUY
 sTr1xUc3rfedhgoJICjijUhIkeMNNnydeZmPxL0HqgAcBYXGoGhEc3hlfHVu5MIue65n
 VbXAy0Vi7tMBBVGmsLRhsG8T2ggnqTFLl6dOrTXgwLBPEno62vyw9WpBEVp9VmnEYRjg
 8nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728244309; x=1728849109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLQ0qGbobuBRSeV4tlw8iWIHrFfzRjusLkYkkaznzmM=;
 b=HwjWhbR+UPdAzUCmprejwoJU1gNggCnoaNm0z4Yn4+oT8PFi+GIC5Ql+yOuP6wjUsV
 RpEAor48InJd+8d7wPFgkbichOW1UZs06bRktUf6T/G6WKmlXyhxfVqnwYtQM1jDyVxt
 xVCrcm70XPkSnqlbMniyhPWaui0jPsDHDZFZ0hPUPvVpvmbVUgEWdQh3C2W6eyupLNyp
 aCdZbSwRI9o6ySLkjBEy5R3eHJuUaaleXRgLVDu9KrD0UUO0wlMP6jx+3GR9DBplwjg7
 uSFt3VCM++85gbDuDnHWFt0/sWve4Z3dxgoAmARaLwmspupZLr9yaNd8iaXrzfJwOKay
 Qk8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtxva3Hh2pj6b4Hkk9XyjAwh+3tKCRxQaxohYNxWxOqPSbbrYz3/K/qLsQ+jv/SJoHfy6QFp4NSkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvSlo+1JDEbhw0PS7qkaoGxrEXKNxAkh2PCxe1BzccBD64YuHc
 LyhXubGlRe9I1oQ8jmtWj4kHp388JqDMULf1pxvjcImqo5n1bQSsEmO7gYXB3BE=
X-Google-Smtp-Source: AGHT+IGRatu8NXdtFSTYD4sGTrAK8KQ3y0hxb5hgGzJcApZ29zymfe86p3XYxT0wL94dtWg73UlkWQ==
X-Received: by 2002:a05:651c:b2c:b0:2ef:2c40:dd67 with SMTP id
 38308e7fff4ca-2faf3914675mr32011581fa.3.1728244308751; 
 Sun, 06 Oct 2024 12:51:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b329dbsm5920091fa.105.2024.10.06.12.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 12:51:47 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Message-ID: <wdslr77zwyyyesf47qmem3wmextrjfh5do4ckrk6vvzeqwi5gu@x3sxgiusspqp>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
 <20241004103046.22209-6-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004103046.22209-6-quic_mukhopad@quicinc.com>
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

On Fri, Oct 04, 2024 at 04:00:46PM GMT, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss, having different base offsets than the previous
> SoCs. The support for all 4 DPTX have been added here, and
> validation of only MDSS0 DPTX0 and DPTX1 have been conducted.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: Fixed review comments from Konrad and Bjorn
> 	-Added all the necessary DPTX controllers for this platform.
> 
> v4: Updated commit message
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e1228fb093ee..2195779584dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,6 +118,14 @@ struct msm_dp_desc {
>  	bool wide_bus_supported;
>  };
>  
> +static const struct msm_dp_desc sa8775p_dp_descs[] = {
> +	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },

Please take a look at other device descriptions in the file, note the
difference and fix your DP description accordingly.

> +	{}
> +};
> +
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
>  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{}
> @@ -162,6 +170,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>  };
>  
>  static const struct of_device_id dp_dt_match[] = {
> +	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
>  	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
>  	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
