Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17137908A00
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D071010E262;
	Fri, 14 Jun 2024 10:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tsiMNtdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE810E099
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:33:59 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so6807061fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718361237; x=1718966037; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nzzrXsvYFvoKMaClE4C1QUvbpC22b7f20EhDi4vOiQc=;
 b=tsiMNtdYTy40KJJF1RfhM/0alg/YpuB8I2NNArpgluC94Hpq/EvnTPp/4zvvW+YOUo
 Q/mSszlOl6H1OnHJK67W0PaiTypfNmrgv6HUclE0wAbRc3b/WqweW3HiWF+k9mqcHo99
 K+A1jKmMEzmVpuaTP9b2VCOMMH5nORQA4UEoJE1VyPPvGYw738Q3J7f+fE2eEu93J9ez
 GfgonJt8/tgxdHe2UI/n/ycRwQ8hnmXKCeYi55PX5pSxfbGYhWLh2TW0+GkcQCHCMmRI
 k6SYTIBstmepoY1RkyGZuntGZcr+s4uzvxfothh7Kc08Paqp9AZ5AFXCZYSABd25VnD1
 8tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718361237; x=1718966037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzzrXsvYFvoKMaClE4C1QUvbpC22b7f20EhDi4vOiQc=;
 b=Rpb8ykLZ+MkOzPF6vkY0YOnGn/+sRpUHN6RNHcD8pBo/JVJNm2k6XJ1m90+3XWgPdI
 Q0jGeSL5rBw3px4j+LAoRyNucrVdPkkRpa6TVc4KEWBKB+MM8kEcNYENA1Xb91vfuOge
 gEY8rsfOqXZXg9vxrCVwoVX1IR6F+RclUmZDkENTJo+55onhg8FTJTD8lwD6qL7mD69d
 QZhh0Ii0+wwuHRlUvjsP4eKgM12d+T6icwULOmSG4gtb3mobw/VtcgEyGR6voBnUq4nn
 9VFrvkAOAbDTTp3hs7BRmlR8E73romSrYiT2Ad0gFek8P3AkoYCDzb9jtTq4ku+YAR3Q
 f0pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Rr0E3UjbfwWX53bLMhmL0B/n/VTIDAxtxwV62W5xveP7LHzijzWMkDZ9Y0A21pF5NlWaLpnq4lgtOzwlFPxTbvkIzBIcUPznWhbcrQJM
X-Gm-Message-State: AOJu0YzTGdTNjiMJ8wQBtwKMxxO9Ze/qrbOk+SSocZWpZ6GqU5rIF7qk
 dYlm2RrjdXdif3EL3C5+gbvoeJ8oKluad7mGZNRUTleLIfMFdhkEWyNMmfQ6B9A=
X-Google-Smtp-Source: AGHT+IF6mEEorcmc78Jh2JqE/2g+YCduyT8m9BvWcoXYiiwCnJYwE/grVOArAgCLk+3BywJlJp44Og==
X-Received: by 2002:a2e:9d05:0:b0:2eb:120c:1a59 with SMTP id
 38308e7fff4ca-2ec0e5c6614mr15445521fa.16.1718361237579; 
 Fri, 14 Jun 2024 03:33:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec0596521bsm5135361fa.0.2024.06.14.03.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 03:33:57 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:33:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
Message-ID: <pprbxhow6gl6bqlhzoiozz7ymwqk5uwuyuwclviulie4ucyjok@xv34zrzw72oz>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
 <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
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

On Fri, Jun 14, 2024 at 01:55:46AM GMT, Konrad Dybcio wrote:
> 
> 
> On 6/13/24 17:15, Marc Gonzalez wrote:
> > From: Arnaud Vrac <avrac@freebox.fr>
> > 
> > Port device nodes from vendor code.
> > 
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > ---
> 
> [...]
> 
> > +
> > +			hdmi: hdmi-tx@c9a0000 {
> > +				compatible = "qcom,hdmi-tx-8998";
> > +				reg =	<0x0c9a0000 0x50c>,
> > +					<0x00780000 0x6220>,
> > +					<0x0c9e0000 0x2c>;
> > +				reg-names = "core_physical",
> > +					    "qfprom_physical",
> > +					    "hdcp_physical";
> 
> The way qfprom is accessed (bypassing nvmem APIs) will need to be reworked..
> but since we already have it like that on 8996, I'm fine with batch-reworking
> these some time in the future..


Yes. The whole qfprom / hdcp part needs to be reworked, but it should
not stop the platform from flowing in.

> 
> > +
> > +				interrupt-parent = <&mdss>;
> > +				interrupts = <8>;
> > +
> > +				clocks = <&mmcc MDSS_MDP_CLK>,
> 
> Not sure if the MDP core clock is necessary here. Pretty sure it only
> powers the display-controller@.. peripheral

It might be, or it might be not. DSI interfaces also use MDP_CLK on
those platforms.

> 
> > +					 <&mmcc MDSS_AHB_CLK>,
> > +					 <&mmcc MDSS_HDMI_CLK>,
> > +					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> > +					 <&mmcc MDSS_EXTPCLK_CLK>,
> > +					 <&mmcc MDSS_AXI_CLK>,
> > +					 <&mmcc MNOC_AHB_CLK>,
> 
> This one is an interconnect clock, drop it
> 
> > +					 <&mmcc MISC_AHB_CLK>;
> 
> And please confirm whether this one is necessary

Let me quote the discussion on #linux-msm

<lumag> jhugo, do you know anything about MNOC_AHB_CLK / MISC_AHB_CLK? Should they be enabled for HDMI to work?
<jhugo> lumag: MNOC AHB, yes
<jhugo> lumag: MISC, probably

> > +				clock-names =
> > +					"mdp_core",
> > +					"iface",
> > +					"core",
> > +					"alt_iface",
> > +					"extp",
> > +					"bus",
> > +					"mnoc",
> > +					"iface_mmss";
> > +

[...]

> > +
> > +			hdmi_phy: hdmi-phy@c9a0600 {
> > +				compatible = "qcom,hdmi-phy-8998";
> > +				reg = <0x0c9a0600 0x18b>,
> > +				      <0x0c9a0a00 0x38>,
> > +				      <0x0c9a0c00 0x38>,
> > +				      <0x0c9a0e00 0x38>,
> > +				      <0x0c9a1000 0x38>,
> > +				      <0x0c9a1200 0x0e8>;
> > +				reg-names = "hdmi_pll",
> > +					    "hdmi_tx_l0",
> > +					    "hdmi_tx_l1",
> > +					    "hdmi_tx_l2",
> > +					    "hdmi_tx_l3",
> > +					    "hdmi_phy";
> > +
> > +				#clock-cells = <0>;
> > +				#phy-cells = <0>;
> > +
> > +				clocks = <&mmcc MDSS_AHB_CLK>,
> > +					 <&gcc GCC_HDMI_CLKREF_CLK>,
> > +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > +				clock-names = "iface",
> > +					      "ref",
> > +					      "xo";
> 
> GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
> It would also be worth confirming whether it's really powering the
> PHY and not the TX.. You can test that by trying to only power on the
> phy (e.g. call the phy_power_on or whatever APIs) with and without the
> clock

I'd prefer to keep it. I think the original DT used one of LN_BB clocks
here, so it might be that the HDMI uses CXO2 / LN_BB instead of the main
CXO.

If somebody can check, which clock is actually used for the HDMI, it
would be really great.

> 
> Konrad
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
