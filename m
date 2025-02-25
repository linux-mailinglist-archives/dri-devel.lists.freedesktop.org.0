Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A896AA44911
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0CC10E1E4;
	Tue, 25 Feb 2025 17:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zdkd0eYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F810E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:55:42 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5461a485a72so5696955e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506141; x=1741110941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
 b=Zdkd0eYRcNFwWqp/m8hSj8su0wkrx0DcT67YYxpHh740xqAvlmOEDPgoEJ0f3j8XvG
 GsnnPpO7usT5Tcara4aU3U+sCVyXmdS6hhqVjzeNyDkxDbaFi8QyuAL3q/Iz/CaYe5DZ
 kA9NkqqufBQtrUiMNCMTVK12gAk+0oHMpH+A9Nf+ociNPIWuowgRaJhVBXJcdHKIhrYs
 BnNRrsV3dJbhIztPXi7Emx6S1WAJBeMFOizxGX+7aOuQj2X7d3gy96dDI5rFQPAWhRr6
 h4M3LI0d7BEF/ogUG3eN/vvt1lSp6jZ6Fk0vEeMHD3gntdol8qU4ISt1PZ8IRb+/XSCt
 czDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506141; x=1741110941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
 b=i9T/CzYWAQIh0C+YtYJZX00WssHlt/A0kPfKDiJCfBytC10UYQrWX+QzPnAgZHLdQy
 2m4IfLNPPmXaxW7TfFhalWtIH4PMlCOtNyN8kgwZCJ2yL3HW4aLZzzruj5RzllhSYzZ1
 3nqmofVLHxIEzzeZLNRDmhea0sPiRCb/mcXT9O4Vg5V+fUAGUK6biH6MmToO6T/KrAOw
 Pn64aq14SMatL3xsVd3yBaxXTS8rRJL6872NHdkSRHFTyJcdtBwyiBGO7MpkX9NqIXs1
 fxS6DOMmo+Af9gp+nDjFzQH8oBqZbEGnw3HgX/rz4F5zbWTPcIEHf9eUOkZlpsy1zJdB
 AmqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVATacnMpw+5hu/iDHc7hJD2MQj2scyHJF8adzlUhF4RXcy76dpLBDTZAzWfm2cmclLapsFtLKrnAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKYrKAaqToi+9Zi/Wi72dRu3kmntLp4YCQ+U681is5/bTevRJl
 ud2sNO3S5pyy9RDrczTtrFwTM4vwZKtNpBY0oggpbqCDKaYlKmGHeUT8lmsmsdE=
X-Gm-Gg: ASbGnct4Ikbdk+mAtZv5taHIw2Ou3vVdoaF7TOjyUAE8bNqWqc+MBa51xhoirgeS2Xw
 4Kog4plU9WU1n3T49RLiQ2xDKi1K3X8i2ToNYqW4Pfs5KWsKQX9KD670oiCuv2K8mD8XDdz3EqT
 1pH0u99vOOrjE9a0fYNEl/hgHoY1uMab8ShNUbWaX+NO3WML9ISvOl6+nGQCQC5kcY+bgvAbLnp
 TX7TNfhXNFBGQoEyq8D+TyjmJ9OsvRZwcmtO0ytjh8OW8nRycWgVFtEItwZnevNzmTPtAJp4om7
 ynpMeD6AhEIXMfP3K9Vm5Uu+LL+6RyC8ZbTkTYWXDyEDEzlZtrA62S+qqNchEfOPziiwM8WGD8G
 +BsYEUQ==
X-Google-Smtp-Source: AGHT+IEtBPGhJEFmYORVcpbY565FvoQ1gkddd4xE4WqD8kbOZNOXiopkLnrRw1ytEuGRZvYQRQselw==
X-Received: by 2002:a05:6512:3a82:b0:545:271d:f92 with SMTP id
 2adb3069b0e04-5493c57ef04mr234185e87.25.1740506140684; 
 Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514ba1d5sm243569e87.98.2025.02.25.09.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Date: Tue, 25 Feb 2025 19:55:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
Message-ID: <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-9-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:21PM +0530, Ayushi Makhija wrote:
> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 2 deletions(-)

Please squash into the previous patch. It doesn't make a lot of sense separately.

> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 151f66512303..02d8a9c2c909 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dsi0-connector {

dpN-connector. It is not DSI.

> +		compatible = "dp-connector";
> +		label = "DSI0";

Is it an actual label on it?

> +		type = "full-size";
> +
> +		port {
> +			dsi0_connector_in: endpoint {
> +				remote-endpoint = <&anx7625_1_out>;
> +			};
> +		};
> +	};
> +
-- 
With best wishes
Dmitry
