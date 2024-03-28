Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013608902C1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79405112495;
	Thu, 28 Mar 2024 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jz5kpA9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB37F112493
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:12:00 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso1039495276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711638720; x=1712243520; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
 b=Jz5kpA9FRrkKjklfpwSRUxDVWECYHF9GCFpyoZkPM4tGBoOx49KrPQjS304wPUt9Zp
 4QSNLwgETOWYAVRtOluKQN7v/6l5UeI39l4VOE+yDjFa2QSUY4CjVHMpj0SHGkQPZYSG
 9rvjE3Skx37MqGaXudmYGDtf4iMuUkd8bYO3456kk9rnqfBkRv9rrbzI5fV0UcQO9HVv
 KEENt26AgdctUZD89huzMcg6vr3cElXGfFRZNgzCmq/5nCxm5Che64Fncda9ria6Mhtf
 aIBB3a8H1FHL0CsEkfcRIysU9Sk0g/Ym6UIeCC7SXYCKNWFYmN7E3CA5pcS6+y9MLlcD
 e9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711638720; x=1712243520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
 b=XpgcEFNlnwZOaeA+fx4tFDSrNXhTnk6XyeFOsFhGXSbFVXdYy9ln47ImbOydVL33nW
 f7NaO6F/7AVIEjeiDCby6Eo9YQ8k+t52G8/ZVASHrb6hummsexqm1NK4ytdRW46joohn
 SQKtV/zPYXO9Cdpkl/AnwfOE/GLhO9ZzC5Oa0s9Ki4tBQTjgZ+vRm87XaxGqsIcBvxDh
 Gy2zCnMCz5y7Q/DknF0whpt0/2NihgcI4UiGcBzk89bZYKZPZGUb3EPEUrxheQ57DqmL
 gST8ALfQEM7B3waJkgh2yctf96ZJOzbWRFhl71xLs/T2d0Feor80aQQLco7IYKEGaDCl
 d+DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiCjBjQ6zYw7M68VN66PbfPKpZvYZRL/YHL7vSgT9/+03tt8WdS/loU1fu0yHMPlSyieAnaywbZGUiWfnQTF0Vj5tJb1S6FRSxy6gKgDNF
X-Gm-Message-State: AOJu0YwYk+tP08Z2KHCz1LA3VPMjIcz4aZfqFwkMgGnVHDXzzsrEJEQz
 E5TbTzR2t4evWNH5//4gynHyHeloQYLz3Y533s4TgIJGoKPEL+q6HCG/2BmuW+39NdESs/xeNsp
 KmvcxJPun6jkhETWDIFcInsl9Zj2Qybw1/rjHTQ==
X-Google-Smtp-Source: AGHT+IGrkzP9Sxso9Vjo20YSLlSXYjup2Hg+RTtCFuuy76qY0UhZk+SCGzz1Uxer7GzjgHrcr7xJIaioiBDkEDXa2kE=
X-Received: by 2002:a25:db85:0:b0:dd1:7128:617b with SMTP id
 g127-20020a25db85000000b00dd17128617bmr3216871ybf.38.1711638719977; Thu, 28
 Mar 2024 08:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:11:49 +0200
Message-ID: <CAA8EJpp1XEh1CR8898HnStWizcgByREGk-2ae_Yr2xTvcrEbag@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 28 Mar 2024 at 11:43, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add the node for the DisplayPort controller found on the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
