Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C04EBB98
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7684910F3BE;
	Wed, 30 Mar 2022 07:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD0710F3BE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:18:10 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 772943F744;
 Wed, 30 Mar 2022 09:18:06 +0200 (CEST)
Date: Wed, 30 Mar 2022 09:17:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 qcom wled backlight and link to panel
Message-ID: <20220330071759.ftcs2fhr7ehrfsqs@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Joel Selvaraj <jo@jsfamily.in>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>
References: <20220330065639.245531-1-jo@jsfamily.in>
 <BY5PR02MB70091CBCF76C99109C72E7C8D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR02MB70091CBCF76C99109C72E7C8D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-30 12:26:39, Joel Selvaraj wrote:
> Xiaomi Poco F1 uses the QCOM WLED driver for backlight control.
> Enable and link it to the panel to use it.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 798fc72578a7..3ebb0f9905d3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -231,6 +231,7 @@ panel@0 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		backlight = <&pmi8998_wled>;
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
>  		port {
> @@ -314,6 +315,18 @@ vol_up_pin_a: vol-up-active {
>  	};
>  };
>  
> +&pmi8998_wled {
> +	status = "okay";
> +	qcom,current-boost-limit = <970>;
> +	qcom,ovp-millivolt = <29600>;
> +	qcom,current-limit-microamp = <20000>;
> +	qcom,enabled-strings = <0 1>;
> +	qcom,num-strings = <2>;

No need to set both nowadays, the driver will even print a warning in
this case:

    https://lore.kernel.org/linux-arm-msm/20211115203459.1634079-6-marijn.suijten@somainline.org/

Sticking with qcom,num-strings is probably the right choice here.

- Marijn

> +	qcom,switching-freq = <600>;
> +	qcom,external-pfet;
> +	qcom,cabc;
> +};
> +
>  &pm8998_pon {
>  	resin {
>  		compatible = "qcom,pm8941-resin";
> -- 
> 2.35.1
> 
