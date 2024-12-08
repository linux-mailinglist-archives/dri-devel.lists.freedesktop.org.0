Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3A9E8726
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 18:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDF510E335;
	Sun,  8 Dec 2024 17:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oFrH0KwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E47C10E32F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 17:50:16 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso2669524e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733680215; x=1734285015; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
 b=oFrH0KwNLvZtK3DaLGt4M3A3s4JR8em7AjgVIywpmwkuvfvy+2y4VpXh5+34yXIqJY
 P2C+Hdit7tNwFm7Ly+qnsGdtdK2bx/0PfkrAYH4wFZIiJNCDljnJNnbZ8pMBZyij54y/
 IsVJCHrHBjxCf1tXlsRpHOcydykwBPUbbZl1CeNrVgmx3lpHMywRTYcqotMbYTZgXjdO
 gcBL/DG4BXr3I8gSgMFMsm3Kg7uxt48jKI55OrD1g9yxBPyHheDW+WoKvb833nwyU3+l
 RjJuXN0XEwviM8DYkO0Ip5WmWXVXPB5PYAcfoXOh13L3OxJt6jM28iH0j11Zn1kqMMtd
 g90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733680215; x=1734285015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
 b=a5KLsB1VqH6oazJ6t93QvlLcefv3/cBVClxvIF4ruXSlDbnPepDQ7joDmSvzwYOxU2
 +C15fRD2lMWSO+7a3SNASV0RbroqxrWm7Qroux4E/iBcAMblY5YFSpxeRRYvwhJHuMUO
 KXuW8KfKMDX+5EegxvMjzW3hKrnJjYGtUxZi+kAlVwt0+u7jSWLb36SKTt7DCHu1+Npv
 GewW4583qGtTWa6GOFbn45mlqLQSlLqLlyVpK76TaJUQtHtpy3yFOV7e5SrGNJ5CMW1a
 vdb4FKxurp2vJiZJuCHDOBxFBTO96vaYHfpx5EH+2u5hsWcsyLMvlTpW8ETW1qkgTA0M
 POnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC+pfpSUpqZNvaJd1jCW6+E9ClW83yVmPGfmtYoLIPJY2WykamelNyvxaTAFSnMb08nLIB2tQOyQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGV4T4DvjA6pU9iH0LCwYtaodqw6DV9AA5fR5ULRhdajgC/3e2
 w8dVN2pMJmyOXcLW1CQmokcer35xfjAV9FywDNq8LTya9wnYCU0oYOx69zdXhb0=
X-Gm-Gg: ASbGncu2ubEcBYYOYLycYvBJPjQYLCTSA8JgyYeAF/HYtXPDxHade8Q0+a/A0cllwcv
 UzRFcQSTtOPCShIkJTLFj4ErAiN2p8SJXHaNImoHcazFaAWF1eFiCUv3v2A8za++PnFqd4t4v5j
 URuy9k4g+x2IB1393e63hC31hlZ4hkcykrZuc2iHPzKhCkd3k6T7H1XGT7aLkrLi3I9Qh+I6ecc
 V4OvO0coJ5SudmEqj/6JCzfMgk5cJ/ajgMMKDduIrwZ++jDXO/vNlN8UcmZ2oXi8rcaaHP/h12T
 ZdmE+cwciecODYcI3DWvmKHU6wyRpA==
X-Google-Smtp-Source: AGHT+IEVJLXOPnyFmKaPz9KPMKbv70YRlg73dziKIo45JVQh26G1HQVfDj7ebpdmC8hy5ZJT275q6A==
X-Received: by 2002:a05:6512:33d0:b0:53d:cfdb:c65c with SMTP id
 2adb3069b0e04-53e2c504c25mr3188513e87.52.1733680214661; 
 Sun, 08 Dec 2024 09:50:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3968850dsm659447e87.31.2024.12.08.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 09:50:13 -0800 (PST)
Date: Sun, 8 Dec 2024 19:50:10 +0200
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
Subject: Re: [PATCH 01/45] drm/msm/dp: dont call
 dp_catalog_ctrl_mainlink_ctrl in dp_ctrl_configure_source_params()
Message-ID: <vemardbn3siohtg74hgjsnugkm4adqw6ekc4xhvjq3fty2rfov@5yhhsvjsnp6z>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:32PM -0800, Abhinav Kumar wrote:
> Once the link has already been setup there is no need to call
> dp_catalog_ctrl_mainlink_ctrl() as this does a reset on the mainlink
> thereby tearing down the link briefly.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
