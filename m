Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306485ED41
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C8010E83B;
	Wed, 21 Feb 2024 23:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="glIR0tjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1EA10E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 23:43:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcc4de7d901so6504839276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708558996; x=1709163796; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
 b=glIR0tjPHcjOPcYYF7UOXanIOB5tpM8r8xmJGpAz1YRBTMuDIe3AUOuQEhoMAAbHGW
 Q+TKDs8wJQhzt8fo3mfx6DJ0a33AbuxpF01tyvIteg3UE4NjUU7jvosu39y2WsdD+uor
 0oS/tMzbx51RVJ1cvqk0l43Cod2fFZufwm5cR9S/k8cX+uOP9EH0psRE5K+OpEBoYLZf
 FYgNaoe3MFiHU/FEQ0RY133QQWa5EX9kvrv/n9kzb6jzxW+s5Bj4jNNd8aXL3lX1TrXU
 0t3xjV3B84yrwkduFbu7K6z6NhGfnzFBFQu0DbyrBcZ445o5jmJ0RaWcEw4D3ADO0W5v
 n5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708558996; x=1709163796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WFR+rdCdcNXgjwmjuY7WFWRvujdikiPSr9iXFhu+1EA=;
 b=th4q0+HpApWRZddIgEsShQ2HMSwuDLquIURFiMkzuYgc061Nrbifbq8IQvJ97pjWnb
 LyCeeMic8uqoPT97xLdnITsESEP8qx1c4o8Kw7o1ylWaJfhH02MIoxwkwMl4nl+lL4QH
 WWEzR1ZvL50Jt3F59wSIWYZl8bOpBtpup2OQ1ipy5H54mGZaQPvnhR/GJucRHxZ9xhDn
 FZqDyQGsId2BkBu7BjQY/+N6VXU3sWATqfPn34WXXacYDnAZLexREOMTPWblzfrE1y6u
 WOSdlUxpiAZ0PW/LvDewONR2jPB0KTqdgu7xM304S4mQYtTveego1YWUDyAHRdVQBsfy
 m9/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVES/qA18K8oJzEjHKB/wiL6J6u1CE5y0ULWs92lPr7KCwPbw70MaXxNNYHvnZzGZhCJ4W4MfHp65+wclYNY7e8hxyvgQfLwuOAJDj8ajxo
X-Gm-Message-State: AOJu0YwgQIFx8USThnkgIHJsuJjzX7l/yMqnKnI2rt1MGRBA/5zL35Bp
 /8rFYaE286P1fb2GWpGwv9+LRNHkVam9XLKMV1c5xlRWmjzheSBBGh0gpdnqolhIb5GIEDw1DX2
 YLOjtiM2FxgDEL9vD+Pn7t15TntpJNMjJA5+PMw==
X-Google-Smtp-Source: AGHT+IFjJBtN7MtXNcf/QQ3e4+26sEK2XOSpTmqDfd6w2TNPck5yPGYCu8CgXttPPvLLkfQppUj/9j3CGsKu8RzEuYE=
X-Received: by 2002:a25:b1a0:0:b0:dcc:693e:b396 with SMTP id
 h32-20020a25b1a0000000b00dcc693eb396mr916615ybj.2.1708558995841; Wed, 21 Feb
 2024 15:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:04 +0200
Message-ID: <CAA8EJppPM9M0Jsb=GtqE4sdzWsKewEwkgKtF=Kb+n0tXZNSHkA@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
>
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
