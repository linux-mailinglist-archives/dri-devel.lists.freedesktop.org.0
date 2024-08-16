Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF899544BC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CE010E0A1;
	Fri, 16 Aug 2024 08:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kj7S6Z/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17F210E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:48:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-429e29933aaso11887595e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723798103; x=1724402903; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzEKzZjStMCmeFHAsJP/R1JM2+6vJvnRZ4aYO0fFizU=;
 b=Kj7S6Z/uLwhWlczv9+MYrSy6ErN+fmAYoM/hMFBwAB/9H+oj5z1QHHDf2hU2FTCsIs
 4FvIbEkj7vF1ktp3eDMf9wwQQ/BO+NNHlY784FZp5adUast8ju42xdC8HesdVI/mVNl4
 93k+5y/FoJ7JtOC5qN+eZHYGHi9z5Dyf+KYLiSm/Kskgh5LDYxEMZdTVfF1rVyhu5uMd
 Wjd93sWqICDZmFajGZjS5kDcG5R1cYle9zFkdU0vwqIJZ4CKjLe/tWVyFk77jSXtNFdy
 DNk+LVW5KY+zY3Y1EmhrPgO+TI4D70ZzmMWGUnWkLXQKtdQZeighfnpw8ZRBnk21wiCs
 O/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723798103; x=1724402903;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzEKzZjStMCmeFHAsJP/R1JM2+6vJvnRZ4aYO0fFizU=;
 b=OqKju2134RmbAPZXXgHQ7Lmp3gVXR3LGwAKRZB9lXJBL+omBy9DtYaUy5hdrxNN60o
 PeKXpLky7ZerElNvDdskaPuoHiycqJXOy/tRzJrumGZke/Whuj27tRfzGetwchvujFb4
 I7Gt/mZ6+nBEJ4qhAliN01u5MBi+ZgOAmRlo5/LWnm0jLr2BjIvGEYC2ezIusyu1XFZp
 04JxcYtPkLO9YKg80QCwDSTfQLj9zp1+y9SzBTkLwsEMncFmXd0w4OmuhDyNNlz3AcPT
 nxWhNcghH1+UJ0X2zwjwCHXYXvzJ0cF41wgBAM91obnLxWdfkO3lheoamcAFqKqc1PC6
 sO3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvYdk3edG2+lMd0LStSpR+hrLZl+OtZxDeydPMGFKlKDxLY5ZSNjPFIRBk1y3Diyt/jZc4+8g9qNLDNbtYlWqJPKUone5uVIvIBCG3z/JO
X-Gm-Message-State: AOJu0Yzb3kl7EpMG+FJEQt7p1AKZ05T27AOGRDzsgRbt8o0tcTVSYhwx
 fN3LvNXWteZYPaGbUswpw8ex2nLkoMjbzq9gz8Tmt1lPJe71/SUJviErfF6JXcM=
X-Google-Smtp-Source: AGHT+IFPv0yq6NX6L+cXWVvN2XvKmjQ+KJdc+y+gSJFqzCqOGbEFL3nruXs5RxgfKGmI/6SzaOhwkg==
X-Received: by 2002:adf:ea8c:0:b0:371:828a:741d with SMTP id
 ffacd0b85a97d-37194455f9emr1130106f8f.21.1723798102580; 
 Fri, 16 Aug 2024 01:48:22 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189897034sm3160819f8f.67.2024.08.16.01.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 01:48:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: sa8775p: enable
 remoteprocs - ADSP, CDSP and GPDSP
Message-Id: <172379810100.49056.9142213363913093777.b4-ty@linaro.org>
Date: Fri, 16 Aug 2024 09:48:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Mon, 05 Aug 2024 19:08:01 +0200, Bartosz Golaszewski wrote:
> Add DT bindings, relevant DT defines, DTS nodes and driver changes
> required to enable the remoteprocs on sa8775p.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: misc: qcom,fastrpc: increase the max number of iommus
      commit: 42a21d00aac515fad1f9a10052c6e9710c6f7813
[4/6] misc: fastrpc: Add support for cdsp1 remoteproc
      commit: 590c42d9e278f8e6bf6d673f3101ac102369efc7

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

