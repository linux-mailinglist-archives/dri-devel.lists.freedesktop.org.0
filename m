Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6C9E691F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607D610F035;
	Fri,  6 Dec 2024 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z3zBNnn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA6B10F035
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 08:39:02 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so17265991fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 00:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474340; x=1734079140; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2pvfFf/6NDNSMoinPIggBLinWMjnUSRNWqgC3AbSwgA=;
 b=Z3zBNnn4yKHZwg3hwK1TLZtTi1FmREMLbPt51fmtfAWWGyyib+RRhP794p0gPSuEdc
 BU9IyPDEQ7DAOsqP9I08yzpU62i4IESOxnTm+UNlfD4M9olnTKHbWXkihC83S4H6/uvw
 /QecRoCZg9vogq/yJm27M2B44nMfPuGzN8bkR/zUUKt8QGjv31f0HSeAZLoSqqY15jos
 T6225bsV58PSifoxPcy1xByJZ8j7EOoEmOnH797Vpf9xWuxtBWr8KIXc8qYHtUeW52C9
 JufszEJGsCcT0JG0jjjvHCj7T+0hHrNXARJltf/1yqYhLCBOGWt+RvmJa8At78Ar4odf
 YBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474340; x=1734079140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2pvfFf/6NDNSMoinPIggBLinWMjnUSRNWqgC3AbSwgA=;
 b=m0U5afQ9fsSCIC3JhEPkZJdEFu77cS3t6VYmhokFHw0iUfBXkKT4URExUrpX1zv1KE
 ugVcht3EfataZg4r8mBZNUvqKYZsLPXtCgfdas82CbpnhTFpRF3XRom30bFC1Q7RQJmv
 cMs3UjwwcW3a7tEbuseGUAJcUS10OPfyjmPOIt8FQimFvB0Vs2vGjUZwoTqmUAhYS1a0
 6Uw+XsCB7XJT7A1ysI5GiCR3CjXxO4v2S+UtYrGtufj24H3EDOgUYLzAPWHOFJYIja9A
 koX4kxQxli0kYLpgpox2B+0NB/M/iAl03ntD0V3F5ANzyJG100053xy8b5EQ/Z68nR1q
 eKIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzlmRrUnBGizGJTDfayC3nf/smuOZ1DEG9w4OlJQDscLRDjrV3yDJi+zIq2F2mFSSEUu3id56dXqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze03ev4rhDg6d50rKuWCa3xE4Ir6nKPbo5/wCC2aFptQ94lhvZ
 pDDDpX4+t43fLyl4Wey7a1iiD3MRlQr3/JTTX2ukZYPpPlAekjoj9cDIONi3gSQ=
X-Gm-Gg: ASbGncv34M52AUjjLYsVVBXoqisxqdaQn39O4I08szTGkGzMRXtjkpSuQ/K8dAF6rci
 naDL3aznD1hBrNVkQ2BnSduxGUoJiFi2MmCcQo6XILj646lR8tmZnqK0FBpI50EVpQ0SCxzpY9n
 XmOzLSF5gpBVYa6G6I1s7hj7mMTpTCQ1EkiKNbHZngZZ1zN9fF8gzHdMo57K1IrBJNQ9hEmRnWp
 3aBKb27aseEKRjQu7/9Mj8KVNygVav2sBKBgYslBK8TT1QGksP7KLPprtvbzvAq9cgOCScTjZHy
 vZX1d2bTvUNKmZJ0Ae5svcUHrIhezQ==
X-Google-Smtp-Source: AGHT+IF6jOtbfo5h6K0/IZgJWEqqGaGGkKnUPirENty8sxWRk/6JZs4RfsdDJScIMrUIWenQ2Ic/pg==
X-Received: by 2002:a05:651c:886:b0:300:2dc8:41c0 with SMTP id
 38308e7fff4ca-3002fcf312cmr8313101fa.41.1733474340135; 
 Fri, 06 Dec 2024 00:39:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020d858b4sm4111111fa.4.2024.12.06.00.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 00:38:58 -0800 (PST)
Date: Fri, 6 Dec 2024 10:38:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 02/45] drm/msm/dp: disable the opp table request even for
 dp_ctrl_off_link()
Message-ID: <pouqn275ajaerpicruqepijjs4zuteid3ocqyczdja6o2zhpwl@dt3ckyixmzrf>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-2-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-2-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:33PM -0800, Abhinav Kumar wrote:
> dp_ctrl_off_link() was created to handle a case where we received
> a cable connect and then get a cable disconnect without the corresponding
> dp_display_enable(). For such cases the pixel clock will be off but the
> link clock will still be on. dp_ctrl_off_link() handles this case by
> turning off the link clock only.
> 
> However, the vote removal to the opp table for this case was missed.
> Remove the opp table vote in dp_ctrl_off_link().
> 
> Fixes: 375a126090b9 ("drm/msm/dp: tear down main link at unplug handle immediately")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
