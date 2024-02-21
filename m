Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F985ED3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4CD10E833;
	Wed, 21 Feb 2024 23:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OE5a03Gn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74610E837
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 23:42:22 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso7662531276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708558941; x=1709163741; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C/dj756VosTuwMpPJNGyW3MhpcrxAFO76cK11lx7rxo=;
 b=OE5a03GnNNcsHneVBZv0JdNRNZXh/rPiRcQhCIVA+a/VhfMKRhyVxnySxLi0sv/Vgq
 olG0MC4CzuNUVreMeQoISziA1gBAifRna7Ml1QqK6ywok+/1VT8erWJZTp7i5quZLlKM
 HR3CRsfDS/ouzFxwOL6U++es71cNMQpOv3MbK/lHAqxFF2+Cvi83RDjndkgeZzwRkMPH
 TCTIZQtOXU/mKqnAeu/NJv9o0NCJPyGuftetLl49Lsjf410B3oJmJfce7EcJ7kNRKQlu
 /IPHTy9YZIR1VzN/9Gmix52f7l93o0ycy6leaAP1rDKD2REdLyqgZ7+e28yFxlfl9yib
 bbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708558941; x=1709163741;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C/dj756VosTuwMpPJNGyW3MhpcrxAFO76cK11lx7rxo=;
 b=vWrH4bthvAtR+JuRnIOSqrqAY5x+K9DKvFsp96FUIU48Sfdoo8zUYcx0bvY140Pm1F
 Thh6rB3QuNBrgpXcCm35ZhCn5QS1L6pgFOD0HxdxmGyb3uHWdmwY9KmHq+et+o7XUQvU
 5fuUwTJvAWqXB/YldRTUXZs/XfsTLWaXgzXdID05qkmoCnGhAFcc6NFyZCTltStPRtWI
 +mhtl2skzKMcTe7T9WXm7j8f88fkecgCOobCPlY0C58uLgBEzArkB0bvkro5jIk3RcZN
 YyiZzyroyiXP7bvXAFtH77DLbZOg93x4aACCjbTaz1AgmVdMSAFWnXVmAB4AXlCxIokA
 zrXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8KRjzuq8cEVJ0wvCAaY9LuTEi3GlLGIznqulZiycRj55Wl0AhQWnZKO/jim24gRTdAgRfx0KQhlx5rAE+6n+JoeQu/3hETreWhjTX57Gx
X-Gm-Message-State: AOJu0YzT57iDA9f4Av+RHiV0v9aFMPPUNy1/CMvzYGZ5iOH5PaSEEV7y
 jZb4bXj9/vU7S0GhNJgirGB2aLY7JHdIEjcY91WXgWsl9/SKiVHZxiqowWE3uzbXf00mkylPlF9
 cAUBMQYDXb3+4nwJ/A0U5PMUd6lxiKfo5o9j4wQ==
X-Google-Smtp-Source: AGHT+IEPTkax+cblPH2B3OK6zkJGmVKi10jTkKNhhoD5CPKfbwC59MAyFljD4sz8HRB3ajKPgQOsU016PTTq8M/17rY=
X-Received: by 2002:a25:1e41:0:b0:dcc:67a7:430 with SMTP id
 e62-20020a251e41000000b00dcc67a70430mr834243ybe.15.1708558941152; Wed, 21 Feb
 2024 15:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-5-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-5-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:42:10 +0200
Message-ID: <CAA8EJpqtj-+PaUWeXH32_jfNaOUM+V-H0j5mZSW+rcaAQTdMzg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable adsp and
 cdsp
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
> Define firmware paths and enable the ADSP and CDSP remoteprocs.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 32313f47602a..ab498494caea 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -451,6 +451,16 @@ &qupv3_id_0 {
>         status = "okay";
>  };
>
> +&remoteproc_adsp {
> +       firmware-name = "qcom/qcs6490/rb3gen2/adsp.mbn";

This should be either

       firmware-name = "qcom/qcs6490/adsp.mbn";

or

       firmware-name = "qcom/qcs6490/Vendor/rb3gen2/adsp.mbn";


> +       status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name = "qcom/qcs6490/rb3gen2/cdsp.mbn";
> +       status = "okay";
> +};
> +
>  &tlmm {
>         gpio-reserved-ranges = <32 2>, /* ADSP */
>                                <48 4>; /* NFC */
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
