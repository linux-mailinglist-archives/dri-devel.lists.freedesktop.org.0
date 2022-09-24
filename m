Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC815E8EE2
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 19:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B074410E635;
	Sat, 24 Sep 2022 17:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1609B10E637
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 17:23:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i26so4791210lfp.11
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
 b=NsqKraFXmKU8sAJGtgFwo9uYMPsjN1jFgnCU/afP9s5cajyKX3oQ6suovZ3rHBrUkJ
 zzff0GTK22+9+g3bMIIflHXq1vPWRNY9v6Kuq9wrdwWH7qWo/5DDpAcMC42Jq2wWSyIV
 MlNtgoH6pFDHmcNBOK0+AfXEuChuQh+o5ha/Uy3M2QgBVL61OrhUgk/y5md/gnqEktpk
 6q7EhwC5oYFkUM6xbjnXi43E16IgKDjwACEyMISKKuj7XUXkssWveVeGWRJvNfJg9xv3
 9wGIXCLrLDU+3t9qwWY2Upvn8pPyo4/NCYaagAG+8WIzUXE60gEH+qnmSUmo3ufd4BpX
 g+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
 b=vm6OWZFW/7mOfHyoj7GJ0VuhFz4uDYlwzJrVYWBiclIyGUcINRo3zwCWeTOCuJaZJk
 OeCDXwaPUtFSxIjoIjwm/zFz75VWtHakpyCI9J0PUMawquGZcyMuaKraBEh5oQfX5ho4
 2C3g29X2huyRFeV398GUUdV3/Vs8+qyklg3vTml1Oxwg/sO3MDnBTV1/6Qulkv4dbw4f
 w1DBVsgolHo07C5PcM80MrFCZ8WwVcfmD/LTAGeRq9GULC3indhBaqt4wm9bpG1N2qjs
 dwY07xtgKnQs3mC+BcV3gKUvaafG/ucqdZ9U9i33MT4WG4wbbtCrOHZglE4Vn61pmdHi
 nhzQ==
X-Gm-Message-State: ACrzQf35hnMEx53+ivgyvUqFvPptrR5xBnv84iH70SKY0owoQYZPjR9S
 N2uz2TCiGoGHvipvQDi4CNHKeg==
X-Google-Smtp-Source: AMsMyM6L6jT5Wgp0eexIvy2f6PcmVIhOV2LU4f2eXI7kOcoBQHEDmhJrnRh4w+6w8DgwGgaLeqvxJw==
X-Received: by 2002:a05:6512:312d:b0:497:a3df:a08b with SMTP id
 p13-20020a056512312d00b00497a3dfa08bmr5209846lfd.462.1664040207079; 
 Sat, 24 Sep 2022 10:23:27 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a2e544a000000b0026c5dce1f9dsm1770656ljd.106.2022.09.24.10.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 10:23:26 -0700 (PDT)
Date: Sat, 24 Sep 2022 19:23:24 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Message-ID: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1681884


mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb
