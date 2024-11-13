Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA939C6EF1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A0310E6E5;
	Wed, 13 Nov 2024 12:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mxxxeqcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF5410E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 12:21:30 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e30d212b6b1so6360675276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 04:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731500489; x=1732105289; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
 b=MxxxeqcbNJzQnKqZYMynnuc5VgAfHdgEvjPgdkYIEbGiQjU5dBeDlXyngUZLcDKlMb
 BstmZmGdXUbMU5wQp5T6goInOLZWE8XV8Q0ge2iLULmPa1Hi6s28yM/UMf2mThLZW8Wm
 Yx+hDoFyq9bq0ZRqEJWElB44hgBFa8HtTB697+p2b8tQQsgaCg0Rzze2QnxkJDYFQEXd
 Xah+YlekLIE0w6RYYWMRcucm4tGc8xYLojC+OUSvEbkt7HHdD2P2cFIk3dfc8Fy3IhZQ
 PB1Mo2g84YGEGwphVwf9Hh2zZdBVdF32TsYi89o+sEySOaTCZ3IfBz3SpJ9nkDJKmLn7
 JTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731500489; x=1732105289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
 b=m8PHmYQ9Lnen4UyamIiuwwU+/PSkCTrhWYFYFgB1qITIBjIKOcuzSKkJu9hQUOAoS9
 ZSVvDPptlN+BQNsSpAiSrYAWTT5PyeW5BpaO1JonMIagtK2eBsdEQfE0baNaQy7mGTc3
 Z4CY15/+jdiopzw0axK9zd4aXkxqlnnuuhhz7Ce7wVVLqhnXNY0whjpH9BcEtu0xsRLC
 uiG/q0I2/wKxT5b7oFkywOOjYScKSJSxBT4NHMEO0BH2StBoGSOOhWROuA9Kwddc/809
 hwdR50yMl7RHMG4GUoOrQ7peYuSwUmZkOLu1jVQpTIB3BNUAyftycEMRskTVuS+g7bm0
 VsnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0+tjywLZTBYLGusU7Bxf5bMG93o/IYfVBVMq3YRe+6NfPmaEtC/Y6GOSGl+jhfapPN+BBPwY8cc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcbsOUxdVLI1gnWnPLgd2zLpBrTYWO6vHcFELnH4UJaWElnN7g
 9upsEyt295CTsmqBoIXrLxybrdKk7YE2JBliSGat0AlnIhCNLp0O+i+pvK+Em9CBewGUFequd7Q
 HQFqgI9fKKbJ4smcvTp5qeeWb9HAoEEQmupkRSQ==
X-Google-Smtp-Source: AGHT+IHlEW9Y6a6VKxz7Rj8wBbFwf85y1XuiF8DPZGiTfkNkpU73TSXFVeGlAI184r1k/vIlZa0la+oK03iLvn2Otwg=
X-Received: by 2002:a05:6902:1101:b0:e30:d443:8490 with SMTP id
 3f1490d57ef6-e337f8c6c9bmr18265860276.40.1731500489516; Wed, 13 Nov 2024
 04:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:21:18 +0200
Message-ID: <CAA8EJpok20-7HXJJbcJi8YZYCU68g_DGThR_ckjBEz0e+gGBSA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable SX150X for QCS615 ride
 board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> For the QCS615 ride board, enable the SX150X to activate the ANX7625
> allowing the DSI to output to the mDP through the external bridge.
> The ANX7625 relies on the SX150X chip to perform reset and HPD.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c0b8482ac6ad7498487718ba01d11b1c95e7543d..599a339a19435efbee7a5ef80c093b0e8c65f7ff 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -631,6 +631,7 @@ CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
>  CONFIG_PINCTRL_SM8550=y
>  CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SX150X=y

Your commit message doesn't describe why it needs to be disabled as a
built-in. You are trying to enable it for all defconfig users.
Also the placement of the symbol is not correct. You've added it to
the section with msm pinctrl drivers, while the chip has nothing to do
with msm.

>  CONFIG_PINCTRL_X1E80100=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_LPASS_LPI=m
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
