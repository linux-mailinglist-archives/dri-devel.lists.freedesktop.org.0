Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D0621704
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D110E28A;
	Tue,  8 Nov 2022 14:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C84B10E28B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:42:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j15so21321122wrq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 06:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8UcJ0GaU+CjJ1uQZKnrPv8ndJ2BS66qRNxxSEafyKE=;
 b=muz8Ab86BqaMTfG0PBWYuWzWU7rZMNLpVa+2bN/hRSDGr+1Pa/ucWfB8p0ROCZb/Ev
 m35meCmJUyv14YfFOecebgNcU8vntDoSr6C1I01iAsyP4u+C5qFVpxWAB696bdRsgU/+
 LOUoKnW6OW0qY/JG+WcNskD5992R0VJApE+RsCkRCx08Tx+Gsn6sC4y0wJZEArxLzZBy
 nbMnKOWeJYtKzyME6LF97/TLGqqWDX39KFx6KqAYHprdac7XHWyONvgCXxjs1Rbr6qBu
 GKsiKth9abImAXeUsFYs7uHCNlspBTbOfRz1vu8SwBbWGAy5aW9Cv1Oa5yBMn6h/9Hsp
 R10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8UcJ0GaU+CjJ1uQZKnrPv8ndJ2BS66qRNxxSEafyKE=;
 b=kcokJsx00IumQcUYIfZZthyuHztjpbcTQCcT2eR365Jaa9M/WnkMHrj6QgmgFCCbia
 TtaRsHcTTilo+romw4beywggpgv6LQNwSKfDQ+uLjX40PfA+X13FXjc5khWC5WgMmuB2
 d69ssj2awTLTSRBVwoDBfzVITrPhkRjzVX0TYD6lyEvBI7AVvs4nWLduT3zeLywAIwMC
 KKEub816Ysy7hw0TfWND6VPnOoC0brdiMr22ILJ15KfNavU+HMxrjapSZxn94Mu+29TZ
 MSOFy5auHFR0fxS4hUQuruy9b0P5msBOC03faHmvDYKD2MKYqgOFdU8f4pnVMBLR8aiu
 vKGg==
X-Gm-Message-State: ACrzQf26nz7vYJkMFDaTW8LYPFC7T1VazkQU1ELmBN9nrHMT5ClZ1By4
 s3W8C2ntJrxVVv8O2eWUbtYSew==
X-Google-Smtp-Source: AMsMyM5oMvEjL2vTJwXTlTKP2P+NZu+skMaqMeBR7astV6rsRFfYVY7xi0BdMj1Uwee6UHnFtlR5Qg==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id
 g9-20020a5d4889000000b0022b021438ddmr37505143wrq.32.1667918523474; 
 Tue, 08 Nov 2022 06:42:03 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47ff307e1sm12228666wmc.31.2022.11.08.06.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 06:42:03 -0800 (PST)
Message-ID: <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
Date: Tue, 8 Nov 2022 14:42:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
 <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 12:59, Dmitry Baryshkov wrote:
>>
>> Warnings about missing regulators can be resolved by updating the 
>> relevant
>> dtsi files to point to fixed always-on regulators where appropriate.
> 
> Ugh. Are they missing or are they optional/not used on these platforms?

Some platforms either don't implement them or worse possibly do 
implement but don't model them when they should.

> Can you possibly list all regulator warnings?


Downstream we have

arch/arm/boot/dts/qcom/msm8916-mdss.dtsi

mdss_dsi0: qcom,mdss_dsi@1a98000 {
	vdda-supply = <&pm8916_l2>;
	vdd-supply = <&pm8916_l17>;
	vddio-supply = <&pm8916_l6>;
};

Looking at something like

arch/arm/boot/dts/qcom/msm8916-mtp.dtsi which references 
arch/arm/boot/dts/qcom/dsi-panel-jdi-1080p-video.dtsi it doesn't appear 
to delete andy of the vdd*-supply references

apq8016-sbc.dtb: dsi@1a98000: 'vdd-supply' is a required property
msm8916-samsung-a3u-eur.dtb: dsi@1a98000: 'vdd-supply' is a required 
property
msm8916-samsung-a5u-eur.dtb: dsi@1a98000: 'vdd-supply' is a required 
property
msm8916-samsung-e5.dtb: dsi@1a98000: 'vdd-supply' is a required property
msm8916-samsung-e7.dtb: dsi@1a98000: 'vdd-supply' is a required property
msm8916-samsung-grandmax.dtb: dsi@1a98000: 'vdd-supply' is a required 
property
msm8996-xiaomi-natrium.dtb: dsi@994000: 'panel@0', 'vcca-supply' do not 
match any of the regexes: 'pinctrl-[0-9]+'
msm8996-xiaomi-scorpio.dtb: dsi@994000: 'vdda-supply' is a required property
qrb5165-rb5.dtb: dsi@ae94000: 'vdd-supply' is a required property
qrb5165-rb5.dtb: dsi@ae94000: 'vddio-supply' is a required property
sc7180-idp.dtb: dsi@ae94000: 'vdd-supply' is a required property
sc7180-idp.dtb: dsi@ae94000: 'vddio-supply' is a required property
sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: 'vdd-supply' is 
a required property
sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: 'vddio-supply' 
is a required property
sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: 'vdd-supply' is 
a required property
sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: 'vddio-supply' 
is a required property
sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: 'vdd-supply' is 
a required property
sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: 'vddio-supply' 
is a required property
sc7180-trogdor-mrbland-rev0-auo.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-mrbland-rev0-auo.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-mrbland-rev0-boe.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-mrbland-rev0-boe.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-mrbland-rev1-auo.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-mrbland-rev1-auo.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-mrbland-rev1-boe.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-mrbland-rev1-boe.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-quackingstick-r0.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-quackingstick-r0.dtb: dsi@ae94000: 'vddio-supply' is a 
required property
sc7180-trogdor-quackingstick-r0-lte.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-quackingstick-r0-lte.dtb: dsi@ae94000: 'vddio-supply' is 
a required property
sc7180-trogdor-wormdingler-rev0-boe.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-wormdingler-rev0-boe.dtb: dsi@ae94000: 'vddio-supply' is 
a required property
sc7180-trogdor-wormdingler-rev0-inx.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-wormdingler-rev0-inx.dtb: dsi@ae94000: 'vddio-supply' is 
a required property
sc7180-trogdor-wormdingler-rev1-boe.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-wormdingler-rev1-boe.dtb: dsi@ae94000: 'vddio-supply' is 
a required property
sc7180-trogdor-wormdingler-rev1-inx.dtb: dsi@ae94000: 'vdd-supply' is a 
required property
sc7180-trogdor-wormdingler-rev1-inx.dtb: dsi@ae94000: 'vddio-supply' is 
a required property
sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: dsi@ae94000: 
'vdd-supply' is a required property
sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: dsi@ae94000: 
'vddio-supply' is a required property
sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: dsi@ae94000: 
'vdd-supply' is a required property
sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: dsi@ae94000: 
'vddio-supply' is a required property
sc7180-trogdor-r1.dtb: dsi@ae94000: 'vdd-supply' is a required property
sc7180-trogdor-r1.dtb: dsi@ae94000: 'vddio-supply' is a required property
sc7180-trogdor-r1-lte.dtb: dsi@ae94000: 'vdd-supply' is a required property
sc7180-trogdor-r1-lte.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sda660-inforce-ifc6560.dtb: dsi@c994000: 'vdd-supply' is a required property
sda660-inforce-ifc6560.dtb: dsi@c994000: 'vddio-supply' is a required 
property
sdm845-cheza-r1.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-cheza-r1.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm845-cheza-r2.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-cheza-r2.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm845-cheza-r3.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-cheza-r3.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm845-db845c.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-db845c.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm845-mtp.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-mtp.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm845-mtp.dtb: dsi@ae96000: 'vdd-supply' is a required property
sdm845-mtp.dtb: dsi@ae96000: 'vddio-supply' is a required property
sdm845-oneplus-enchilada.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sdm845-oneplus-enchilada.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sdm845-oneplus-fajita.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-oneplus-fajita.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sdm845-xiaomi-beryllium.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sdm845-xiaomi-beryllium.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sdm845-xiaomi-polaris.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-xiaomi-polaris.dtb: dsi@ae94000: 'vddio-supply' is a required 
property
sdm845-shift-axolotl.dtb: dsi@ae94000: 'vdd-supply' is a required property
sdm845-shift-axolotl.dtb: dsi@ae94000: 'vddio-supply' is a required property
sdm850-lenovo-yoga-c630.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sdm850-lenovo-yoga-c630.dtb: dsi@ae94000: 'vddio-supply' is a required 
property

apq8016-sbc.dtb: dsi@1a98000: 'vdd-supply' is a required property
msm8916-samsung-a5u-eur.dtb: dsi@1a98000: 'vdd-supply' is a required 
property
sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'vdd-supply' is a required 
property
sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'vddio-supply' is a 
required property

