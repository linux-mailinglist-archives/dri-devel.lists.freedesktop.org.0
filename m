Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E39316EB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 16:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86710E3EA;
	Mon, 15 Jul 2024 14:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X4SHJBj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A90A10E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 14:36:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52e9c6b5a62so4530599e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721054169; x=1721658969; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhK6B8fnVuBZXI+stRE0bq58ZD3WpTMaKXElDZjFlSQ=;
 b=X4SHJBj+1hkbo4r2Qf+92LB6bbctkgKhPYEo7t3jrqPszxjgWRbrTOEs6zc7uFdrvD
 Bb8SftSe8DDX59OyEknLK5jHsQLJ9FcpL9/5oCzo8TAxKwTj2L4WbbzjEfECouzqSk9U
 ngFOds5ZlEHX+ApiesMPuTbtwwttUGY+NekaVhBCiVYVGXmuAXcMdiVkXvnQzG2Z2XdR
 nvAaTaGoMLt3BIAOJZi+L+MMToxInYrv8ULYSbiFt84rdh+L6XzkSvdl5Ri8aQCFQo5k
 kSCHx5NS6EQ/6C5IBMpZtSDYTjT/X/CbNPCXfoZpTfqoZJl6Hvj864vOsWaIQipSGH3a
 yciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054169; x=1721658969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhK6B8fnVuBZXI+stRE0bq58ZD3WpTMaKXElDZjFlSQ=;
 b=Oa4Wm6SfHnEaQ2ZwQwndVWL4K15afNz8SLFuTpbe8zXp3ImGxC3P/4PHVvGE7nNo1O
 JWW6cxkeTIU0vNkvzrVhszioODAi4D50jJJ4CE8L2/ltDRwC9g0ZEPdIPZQZ7jwwXNfu
 rpMMaSRu+299tA0AiFh1d1G7lQNKkSBeJp5j7HaNMJIb0LUlHOVkhThrKrm305nSrbTe
 Vibrjkwte7MNeakhLIf4sFB4A6QmpvaJV1fpTcgXSoT5mgyFcATpVAHv6cTKbU8yLX3R
 KCv6Ebdftlp5TkrPfyfg0RZQUe4UUf+UIMPikcESYqOA1rcBy/HrPDV8bmtbbhR0Va5Q
 7kmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVppey0u/sLK4MnIUlI++dnGIanz4tfzu3mmET9FTd2W/lzaUhzY+eD9mbxdx6LDRGMne8r2M59u4cOig7w8Juvw9nUk+iuhOn+eBGmbVH7
X-Gm-Message-State: AOJu0Yzrh3h9UUs39OHWNqUhq6fcGoVaMO3sD+KonsX0Qpg+w0xn2tew
 oLbCLJm6V76AYX8/HaRf1yyAuMxJuX/CPhz9+z6Tr7iW0AjVdWwW2esGPFcJjNI=
X-Google-Smtp-Source: AGHT+IHQaW26d33y2OpIl5UXv4ph5bElCHhjJdkDHS33sPTOxMjq2K8VIlrynJfDLVnvzGFn/+XEXw==
X-Received: by 2002:a05:6512:3ca8:b0:52c:d8cf:d4f4 with SMTP id
 2adb3069b0e04-52eb99919bcmr14484436e87.11.1721054166859; 
 Mon, 15 Jul 2024 07:36:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed25324e9sm875405e87.198.2024.07.15.07.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 07:36:06 -0700 (PDT)
Date: Mon, 15 Jul 2024 17:36:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 4/6] drm/msm: add msm8998 hdmi phy/pll support
Message-ID: <hmqp53xuq6yghdk4gpwosjquvfdguukj2jivhnzp247noyjtiq@p2f2ymywtqd3>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-4-d27f029627ad@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-hdmi-tx-v6-4-d27f029627ad@freebox.fr>
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

On Mon, Jul 15, 2024 at 02:21:17PM GMT, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Add support for the HDMI PHY as present on the Qualcomm MSM8998 SoC.
> This code is mostly copy & paste of the vendor code from msm-4.4
> kernel.lnx.4.4.r38-rel.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 779 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>  5 files changed, 882 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
