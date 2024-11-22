Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9279D5D43
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173C010E02B;
	Fri, 22 Nov 2024 10:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ozvfSgYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E03010E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:27:13 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ffa3e8e917so11670901fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732271231; x=1732876031; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
 b=ozvfSgYP9B4YHXj0N/hswNDC/m/Ht6dJjP2vEcLlnHhPQ9S0CZ9SOQdNIIw1GAaStn
 ZYOhFTqJ9zR9pk/KjxqPKfdOQQl8LqVtYHDo4OeJokSODnLhWCC7j7tL6GthuwRMwnJJ
 rIYddDIhqQNYS3JMdGGr66KCp7ftYfHc8zUaX+rRCBvxA0Zx91bc6HuY6Yy2nfd7PpIt
 /LcHprp2SUfK6ctjyhl8zvdNwACsqOPduY9pPdD/7vnAONzkct249DX8KSt3OOQO18Vh
 4xXra4dgrHqCHtC/DqK34mg62hX2g7ji92JU/7TzVHktthAqy2qt15KpN4TRlsDvKojc
 WgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732271231; x=1732876031;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
 b=FkwqLm3S8YFCa4awYy+hBlivlOHv6PxCDH32UPph87aO+PzivrjwqBiTKQK9hSVKZ6
 hbsUpZutII0A3fx7RsocTBZPdWZo6szhyLyQdEWShMHnCAVR3vqn9Bz2NqIWIM/8iLmg
 B24AdOOEt4ukUxfzP5LS1dAJDbngckfX4I4erYAegyI7Bd7Gs1JWIVaWcb2+H4MDcsPa
 UvrdbvyRmV8IstpIlWFLYqenMF2qnaiRI6Fp/wTIzW7J/ODGj3DzoFiH4SQSJ6C1EUYu
 QiAc7ecBzqXY/HDVyOaeqoXSmr6yADzvSZDQdjlq6RVHFnHeeBKE8Is85YSf9Is/YkFP
 pkWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSfWavGk5IUmfVF+aXrekszaF2BQX5L88c6l5JOpjyBsH/b2bo6OWEc9r+3P/cwWY1rr06U1sEw/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze8x4CfJO6Pau5s76qnkLmGvqy7paXiDamgMSac2JlOuNmV7Yq
 VMsLihEeZhoc5OypcULBguGWYAbKS/DRgwgCPbkIHbW3LyXX/ZMP2uR0t7IqDNc=
X-Gm-Gg: ASbGnctxEUqYCVea897ARYzJjIhhn+DSRyQqTGanGMpRx2F6FWnVvZ7wFph99AV6dgN
 zp8DxsHVha+gHlbk9Wv0+HwUdMG3RVCGEVPA01gaE1g6S2rnjlO5DVMZG359ZroEQl/asAKNLY6
 ZHcI3+wJynLXo9/WYw5T45yiypIvu9bhctoqmYw5xzc7ip6cci/tka63ZJChqELMXwUIRIViV4x
 3XlC6UTde6GqCUdDBtrfW3dygkvvTb57yncDAUsAAT6L/w4/BspvgyIWXbF21EP17ZKVZZoXOw1
 twvvHxG9gaGEzYA5P/txlls871RR0Q==
X-Google-Smtp-Source: AGHT+IG3oQHashA6tpFb+9+NmJi4GpOI+M8h9JPqYyxeNcEzdxQdY5O2kg12XYaqyKtAV7A8h+5UvA==
X-Received: by 2002:a05:651c:198d:b0:2fb:5b23:edba with SMTP id
 38308e7fff4ca-2ffa712dcb8mr11465241fa.23.1732271231158; 
 Fri, 22 Nov 2024 02:27:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa7a65786sm2280291fa.63.2024.11.22.02.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:27:09 -0800 (PST)
Date: Fri, 22 Nov 2024 12:27:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: Add display support for QCS615
Message-ID: <n7mnldqd2td2cm4uup6mlnmbzyg7unbzvert6kyweopplbfssz@vm3egater24k>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:51PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 186 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
