Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F84885ED47
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3CF10E68C;
	Wed, 21 Feb 2024 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xgivbrmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03010E83F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 23:43:36 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6089365e554so7105827b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708559015; x=1709163815; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
 b=XgivbrmqC6j31FGZZXV8eXlmh6k5dKEXorHlRFQfJ7FrxgxAZG8QRpXgtQF+HPsLme
 /7RNNje6Ev1c381P9y//jmwdOj4jfdeCsJirzQvSEle9ZaWUIwjTn0vCT4gNPoHdzKwH
 NKmCZW3+coMcaNKzrtSrINyeCm0z2+lrjtrE1vaZoSjDbuaHQOW+OggUnonqVewHpl+W
 t/CsZdQ7LVCoNMoCq7dGXHtYGb2q53dHgzySQj3wA2i7QH1OOXycDpmV5k2ivTBFWpJO
 9JO7gco3PttcVVXvSKB+fAcJfWG1WCxAnmOm6NWr3w1Vs6qaFvl0EdTln4N9ElycsQnr
 hxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708559015; x=1709163815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
 b=sz8lLGyCy/F9UukEaRFHClF8MkouKDH3Yxo7XfXrE8PDW9VVjwlLPVDa2ZYD23BFo2
 3W1LjZNZ6CCG81wslPumIyS8p/7v0rOQ4ZHmj2EBpl8kJjMiyKS8j2r91tfipEwWB1tg
 WL7vvhuzIhZrQtaVYOtB12nEsNn/aFQfd2akimpQsGSgdS106z5oEfiFPEK61A5HHw/2
 WKv52wFuL6fJdd20/KuE9cbnBMt/SdoQoOSte4IZcq751Sq7HBbAt0LY2jqJZ5G9PTT3
 wQhRJVS2fp/326X0m6vz2vzehnrInT3vPH7AIR4q7NiDKZb090W0QRyDDnPa4QcMjvtZ
 fhXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVO0n1GgN0QBvovHGEyC+U3f+Ycr1ACsw63MkWMubDuvfRYITAj4meALipqkocI5d1tsd22VMH9wzNYbtunnoZAPqZZmNDdn4VpHJmClS8
X-Gm-Message-State: AOJu0YwxP2HjP0rBuJfBkTO8paTOZME7fTPWbDfKQxDRbTKT9263npJZ
 /o9UIWvKw5LDazN9NhfTZua3LvERLgAdy/07WIzNrKUva9LXidiyrG0gF+4oly94ymXFgwsaLT0
 NIPKMriP9kJxMouMZw8VKFfYc2TufEJh4O8CawA==
X-Google-Smtp-Source: AGHT+IG23RX3mHSoDqoErDFyzvZxTP87XzpGlNSEMdnMYBP/pD9KffhOLUtQrxf/OysVvdyJWsXBSnZq8SFvxdWTc9E=
X-Received: by 2002:a81:7e47:0:b0:604:9232:9df with SMTP id
 p7-20020a817e47000000b00604923209dfmr18226833ywn.50.1708559015381; Wed, 21
 Feb 2024 15:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:24 +0200
Message-ID: <CAA8EJpq7yhbyoJHsRxdek=3XJ154nt+e5OLAE9ucPV5p-FOrEA@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: defconfig: Enable sc7280 display and gpu clock
 controllers
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
> Enable the SC7280 display and gpu clock controllers to enable display
> support on the QCS6490 RB3gen2.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
