Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0F992159
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CBF10E2DE;
	Sun,  6 Oct 2024 20:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qRf9MIK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E786710E2E4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:47:03 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fac9eaeafcso38579581fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247622; x=1728852422; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ELm2L1HPpE5ypl6LlzrRt90wm4RKfaebBSz09tts3O8=;
 b=qRf9MIK8HdufgtHX1CKZaFf5Q1+Z2ritKkbwc1RnHzk5oVExbLhK5hgo71s5Myhx+W
 rS1BO/XKLtZ3FJv0XOEsrhsF8DJeK4KzJWFLg8/X2Rw+3yqlj1m/rhc18VmGGQ7ID8gg
 OrH/ubrlA3lp/ouZJ5BcAGCUzVPsHgDVeJvMWNKjOLqBmYEy+qLtLURs9vtQtuyfYa1z
 GIjsc2ex2OtQj2EXHtGaOoE3G43pHev8DcoM/ObzPCaGTaQ+H8wobAyVapVzi+zRWQCq
 b6UsyDYy2huf2EnQcvI9fCmTz6/AT2AbwnAFTQrlPF0XWAmeGq5W4yy0u1tEzg6GZImO
 OEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247622; x=1728852422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELm2L1HPpE5ypl6LlzrRt90wm4RKfaebBSz09tts3O8=;
 b=TGdL/BIpyWNX9Nd9gJdlyNAISzp7qfWCMdXuqtc42p5Ufk0safQj1Lvf3mJuwHPMqr
 WjnxPIxHkH8L34b8qKx1zrUvC7L24hE3EWwv8jgdr04xH3UopBS9Xtv3u+dPjNhFFOu9
 uYVWdUT6FiLI/7uuxqIVTBZe9vbx1i0vj37Mofgx3nqRxkE6Fd1y22aTTNQWJDfOmw6S
 OijXjLR1jJFsmOdoBSdhAzen46KkSc2pNpTT9bRpyzXwVQAkaVN69djK8QMdbDYLlpVH
 KuDaKd62hq15Hzwui/+TPBD31YJ/jdOC09nbfeAfwDukkh/hcdxw0yCWiveOq1fN5sPM
 A54w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhan7n5nXmFnQ8eHoydgKHq1PPxk0MsKDAUlu+PJgbalZmVX3Q0EaRHBOYlUsfHgAeNPzu8nFhu98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRQ4rGb8wA6HaxuKXnJFiIfkqOMSBCNER0HeObLjpo+pZ70L01
 IfVuhzQo2TDVR7qWgZ2xnAHs7eM+hkLBIZARM8C2q5oAy3oYyLC5D7AuMpX+jHs=
X-Google-Smtp-Source: AGHT+IFizL0+yw3wWnoLC/qC2QKl4scr8PrjAX1mGGjyOahajrbJr2qi2cByCq3VzO0DrQt7mwAcDg==
X-Received: by 2002:a05:651c:2119:b0:2fa:cc12:67de with SMTP id
 38308e7fff4ca-2faf3d7084amr37219431fa.32.1728247622006; 
 Sun, 06 Oct 2024 13:47:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab12e2sm6570341fa.8.2024.10.06.13.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:47:00 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_mahap@quicinc.com
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
 for MDSS0 and DPU
Message-ID: <bwqrqamudbonslvmhmgdkb33e7464zywff7bvvklbcecdlxpxc@ir3r4mkb6srl>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-5-d23284f45977@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-5-d23284f45977@quicinc.com>
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

On Tue, Oct 01, 2024 at 12:11:40PM GMT, Mahadevan via B4 Relay wrote:
> From: Mahadevan <quic_mahap@quicinc.com>
> 
> Add devicetree changes to enable MDSS0 display-subsystem its
> display-controller(DPU) for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 89 +++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
