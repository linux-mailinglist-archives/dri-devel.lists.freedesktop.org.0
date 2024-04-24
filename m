Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75B8B174B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F24112B22;
	Wed, 24 Apr 2024 23:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oOx2VSPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5358112B22
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:39:58 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcc6fc978ddso449295276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714001998; x=1714606798; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4lbiDAQdRMQUnTwkJFNqDelP8XC5ywPFYlZpytL71Sk=;
 b=oOx2VSPu6EtlR4Ir32jLYtG0ZafX5I9m4AZS88wszT+AK0jm0ea2f/AT/l9wdPNvLR
 P7maJbd60SaTeAknWvlHMTSs1o0Bh+AHkw5xFZV5nrfsk8UvscyKr98gS6wmJfED2UQy
 xolWR0Ji3wcXTT9nYmJskvlRwsumK20nYLqEytiBrWGe9YfqxnLKaAblTwtiMVx6pKJB
 ydIXrjcn6LwtbFXbaHmA+8wWL74OKbBKcS/xExWZqIxCagptATl+g8ZaSH0SfArW1yGq
 VTguMrA249+7Xq5472k/uh08Asi1ydanbYq3lw9Zi2fmbXupYxJFrAbATdtLcWItAtem
 ktZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714001998; x=1714606798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4lbiDAQdRMQUnTwkJFNqDelP8XC5ywPFYlZpytL71Sk=;
 b=uAo02BjlSTnbmx7lK/oGtI7o68Uhw69Mov29Aolx9SjdvizbB4m7RbxuushqMh3qa+
 fFYCTsMXcRqRQcWsB1sk8pWGVSyo1qDfeUU/3jWy+SzmptGBjEaHVZQqmUIo6sNOWpP8
 2h/8sJS4FQAnO3E/VWURmx110LZOulgnSzCnn7xqe2Yl/MjWYJdUrlVSvwIAk2lMYz0Y
 dDJt2vYVO/tHDWPOmNiNZqz7I3o1/xrIG25TIDsA6P8IfKi5JncrzvoVCDd98bgxS3Rr
 wYG8Phs4NxkOtAsKNUfCxJo+9/9ms+qu84Z0ZRDStL4DfHJSdqUee/bKCZX8+2YDaRcb
 UhHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQRUnrJbm5w/7F7ylsMhnu+eSs9LsgwbEbQxdxXD9XXZ1qbQpwFzpdlRugGHNh7f7rZUUqg4Q27l+btZQGysavBaFKUzHiKi26DN6VkleJ
X-Gm-Message-State: AOJu0Yz8paYT7fDWNQha9Gyu+qrcIrqHl1jN+lP2mxwISwCH5drs3HFJ
 Y29fD2EzUbMNFk4QGogXm9+0/AEkAkZxEt8l5Yok+CgBSng9YUYz8gbEC/tPz78nP+pSep9TEFo
 x9l0G3NDYbkDK07Yp8HpgZrFhod8LL5t8nrOnQg==
X-Google-Smtp-Source: AGHT+IFbCEKpEBJRqFVkfoarP6YfnOgjBQGtumnt+gwnMFyhoUY0mANCP/DL9e2l0oGwk5Nf7M7RID79c6RIpYBEm9M=
X-Received: by 2002:a25:c7ca:0:b0:de5:8427:d66f with SMTP id
 w193-20020a25c7ca000000b00de58427d66fmr1166099ybe.4.1714001997820; Wed, 24
 Apr 2024 16:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-6-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-6-e0aa05c991fd@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 02:39:47 +0300
Message-ID: <CAA8EJppXj=DyT0hEW05mAjgzHS+H2iiJ-M=MfJPgkWfztX=V8g@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm64: dts: qcom: sm8550: Add UART15
To: wuxilin123@gmail.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Junhao Xie <bigfoot@classfun.cn>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
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

On Wed, 24 Apr 2024 at 18:30, Xilin Wu via B4 Relay
<devnull+wuxilin123.gmail.com@kernel.org> wrote:
>
> From: Xilin Wu <wuxilin123@gmail.com>
>
> Add uart15 node for UART bus present on sm8550 SoC.
>
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
