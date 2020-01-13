Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BF13A2DA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D127A6E32B;
	Tue, 14 Jan 2020 08:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BECC6E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 18:45:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id s21so4156140plr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 10:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ma2e5QYJYr2+A6y40/wWxo50e76HZ6NsW8KSbxEHjSo=;
 b=m+SbGLEhSGBwvvFJbDSHlMmJomNfrgDq8qjOcFCm8B7zoxv7EKK1gzWUONFYo8OX/W
 08rMpkBfroMiE4JGp9r/tJZFHnsARi8orZHss/E1RhdsKBycHTuxlVFZjDan7xfObqNU
 x3nw0x7PXDL2gS+qxOh2stpOLg5RJxAOIEQa+j4asWIm2VI/vkd/WW3hpIHNTP6twJPu
 iqL+bZ5fdfvoSfWJBQGGsSs+seYjYOJjA48qEmIrkeqXerbaevThP4alSG+cZroztMw6
 NwQ9ugcyRVRGvERYR+wgH7wLrrmUuJynpXa55IfKW93CwvPd5DlLIPw7B6vM6VpNlZIt
 IoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ma2e5QYJYr2+A6y40/wWxo50e76HZ6NsW8KSbxEHjSo=;
 b=ioTGtK/Eeq9vgQcLTUdOYdaepHpNsEjIHUy5AZCvfqWrKL2iWZSgIQ3sOsALFcq6Nt
 zM2ds5fDdXkkxHX3d6h/eSlgOkyj2pEp8AwYFR7AKCCbVd5AgzVjtHhSUgq4oNPdpXP4
 NrjuDvm0YtvBvQBrCBUAzYuPKzhRS48CxM6Bb0QtmBLynODyJx97fELL4q101x4EfxUG
 PzotTQOsKe1pYvYF+lYyneIJowMyq5zOQkN5vTjpA2gwtdbVtMSsHZwRVQwPLJzmRA55
 nuC91EwlMQ5BPe3nC5s/oOt1RBWOSMPoETYcsPVF7sIUUCPiKKoChaUBerTqzQc8v48E
 J7lg==
X-Gm-Message-State: APjAAAUGCIVtA23mZNE48rVWwUfEo+Uw6Jje61INxr8JGRDzWnzfTArm
 x9Cb6gFNT2tBxtB8E+CZ2ns9jQ==
X-Google-Smtp-Source: APXvYqzHz76NihH7xSMfwYbiUU9+Ra4XYRiSYA8sn78I7UDiQzEwqFB/ZeMZpOI8LWIDNUUolUUMNw==
X-Received: by 2002:a17:90b:8ce:: with SMTP id
 ds14mr14763316pjb.57.1578941114957; 
 Mon, 13 Jan 2020 10:45:14 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id u18sm14254825pgn.9.2020.01.13.10.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 10:45:14 -0800 (PST)
Date: Mon, 13 Jan 2020 10:45:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: sdm845: move gpu zap nodes to
 per-device dts
Message-ID: <20200113184511.GB1511@yoga>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-5-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun 12 Jan 11:54 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> We want to specify per-device firmware-name, so move the zap node into
> the .dts file for individual boards/devices.  This lets us get rid of
> the /delete-node/ for cheza, which does not use zap.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> v2: use 'sdm845' for subdir for devices that use test-key signed fw
> 
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 7 +++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
>  5 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9a4ff57fc877..2db79c1ecdac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -165,7 +165,6 @@ panel_in_edp: endpoint {
>  /delete-node/ &venus_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &cdsp_pas;
> -/delete-node/ &zap_shader;
>  /delete-node/ &gpu_mem;
>  
>  /* Increase the size from 120 MB to 128 MB */
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index d100f46791a6..6cd9201ffbbd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -352,6 +352,13 @@ &gcc {
>  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm845/a630_zap.mbn";
> +	};
> +};
> +
>  &pm8998_gpio {
>  	vol_up_pin_a: vol-up-active {
>  		pins = "gpio6";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index c57548b7b250..09ad37b0dd71 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -360,6 +360,13 @@ &gcc {
>  			   <GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm845/a630_zap.mbn";
> +	};
> +};
> +
>  &i2c10 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index ddb1f23c936f..601c57cc9b6d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2804,7 +2804,7 @@ dsi1_phy: dsi-phy@ae96400 {
>  			};
>  		};
>  
> -		gpu@5000000 {
> +		gpu: gpu@5000000 {
>  			compatible = "qcom,adreno-630.2", "qcom,adreno";
>  			#stream-id-cells = <16>;
>  
> @@ -2824,10 +2824,6 @@ gpu@5000000 {
>  
>  			qcom,gmu = <&gmu>;
>  
> -			zap_shader: zap-shader {
> -				memory-region = <&gpu_mem>;
> -			};
> -
>  			gpu_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 13dc619687f3..b255be3a4a0a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -245,6 +245,13 @@ &gcc {
>  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> +	};
> +};
> +
>  &i2c1 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> -- 
> 2.24.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
