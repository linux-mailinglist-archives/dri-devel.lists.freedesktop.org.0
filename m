Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5AA45530
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45F010E21A;
	Wed, 26 Feb 2025 06:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="omzeKeQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC95210E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:00:35 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30a69c1a8d3so35549271fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740549634; x=1741154434; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
 b=omzeKeQGejzU2pKvgDiPXN89PO7jr+LmpVfdMfzv7OwOm7ehdJkIOE2HM3oq5l0Yde
 KxqLCTYwwlQWmTCnv8fNZir9rZAyPMrvCHDvP7j+9vacGs9xmMUB7rnCgtS2GzYSVT9L
 bqje6YVVNteGXtqOfSFuj+OhrVpA9LE/GD8HXkwUjQrViiEj2VEz4LTD5cGURn/ff0pZ
 6mswBhtP0Z64ENPE3A7oaeuAVIh8rl6rmY9BmfVlq7WBfb5gQW2sRxAd4FQS2hK1aS9d
 0Fu5qsWsUSFvKNKjYqYcP3LvldzVae5SB4u7Df+v53ieX3BPybJoxQsIvjtHw+KZdaaY
 cJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740549634; x=1741154434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
 b=vc+9RcUq73cuXtju/4IIlGAoy/14X5ksmn2js7scoTXUU/mUgLuTxyjrFdHnFQ+ovV
 n23mnG5XsGTparnmxEI7R7n5hyY9lyQudriZ3/iVB2V+xNpQJHU790OcwhMJApkwmXJm
 ClddA/pN0F+jls+Hei71XRWkoKAyPG+D/Jw3JAJGv0XeGnLEzigDbviAtVRaRO8UQ6LT
 yaeHBaFcAoWuAFnrhRUXmYZqx9juCSWdWsXDwoDXqel1jPW/Vt0KaNYw6CJlOrE3hn64
 3ZaG4JUuob8bJenVOBOg/IYSlTz5r6yrc2fGLQUZY8lWN8vYQmJWMIApihCjv7mjXIg2
 Jn/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNrtehDmfe4NnechmU0pVctZjiiGx6qMru4cLvKvclj4hZ2CcLA+OmZv1JjTOuXqfpgCEWG0PHZ04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4BFUJxUvEfxZMWUeCKxUz13dZRAHdUPPbhdYE4DbQaE8rqe6P
 cv5TJ/NUWqWU2utht4A14f9DIWdAFDJfjUrndciqmpNaxHRuV55mOIaNnC14dEs=
X-Gm-Gg: ASbGncvWjP80O038OvzYUmNeB+ruO4fz3zzR4LhEI+dDQWERFUzSvLsGaeOA4S6fRP8
 uG0X443vwnBRYDUk8AkoPRJqNAw1hPbR8TUea7oU2aZbzG5xh8nIR8B+lwTb9A4ikBux4kmAQQE
 GrPR4bGZgmuM8pl5KVv/zjml6HXtFNtwzDRAaAMuvRC4E9zKTyLUuJAHhTDBT25n42bqGC3c5Xk
 wM/QeCOxA8Zjst+OJwoiVdrkKeskVvhgf2mRlr+Sy1i8/Uvkonzhui2ei3SlfiTmbOu+nWO3ViZ
 iSnqCJa2r/asvY1CUu9hK/YAe+2R2AXRICuW8OouPQVJ1/rLmQM0KpxVQUtVjbnyakw/0iKaFXy
 CElcuRQ==
X-Google-Smtp-Source: AGHT+IG8CWS6G0bTARrClr5YZ5iAJEIALey0T04/2PiGrwpS70hRtWkWD+U3cdrkKaDh1s5/wDX5Bg==
X-Received: by 2002:a2e:914f:0:b0:308:eb34:1012 with SMTP id
 38308e7fff4ca-30a599702fdmr79176461fa.30.1740549633801; 
 Tue, 25 Feb 2025 22:00:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819f5b2esm4247241fa.64.2025.02.25.22.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:00:32 -0800 (PST)
Date: Wed, 26 Feb 2025 08:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
Message-ID: <wohqhsuu35m2ghd7a5xgsy7ktxvqn5id7nuzox536dyllczobc@vxyzse2wrlwu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
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

On Tue, Feb 25, 2025 at 10:14:32PM +0100, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
