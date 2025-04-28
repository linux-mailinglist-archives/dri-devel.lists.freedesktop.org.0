Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6DA9F594
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02CA10E601;
	Mon, 28 Apr 2025 16:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pA3/1EGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1B410E601
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:22:07 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-7082ad1355bso42345187b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745857326; x=1746462126; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kjtfgNYAyQgaIv+6+gwAi/DXzlNfZQv9vmE2wR+LnUU=;
 b=pA3/1EGnEVXP74TEjZSmfvSQUM/E/TzAuaAQ3Q24hzGocBAZe7715NebYWiUDPUT9i
 vYZaY7QyOwvFHmpi80DCl0nqYvIPHXikGqc5zRNYBP972PfjHTJgZxIWAq7XTJUj0p7t
 ihwWdwuWaefKJhMtSowhXmI2BhaHOpNSCzCYUTPEMDbkh2JSJS3OlXGvT37zv/nuod8Z
 WtEnC+q3GD3iRXn+nxuWTAVDuBwyKj9se+tl/VIlMaXI57imKwIW2oUvvXw3dX26MTKr
 NmnOTcdHUiD/XMMEonVc6EYp7+jyJ26CiEptaaAl/EYOdh88gYWPSz4U3o2rEM4ps42O
 +GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745857326; x=1746462126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjtfgNYAyQgaIv+6+gwAi/DXzlNfZQv9vmE2wR+LnUU=;
 b=RPjccskaTzEXpiWpKuqIErl8Own0+oUIHO0DNcOAMEYQORV3ySIxgr/wL9EOzVdBQ4
 6twwzymklqw/s3g7D+A9zU4eVlzJSNiySnAbLROP9kzAK2ZlAWGFIoUwrkQv2M1r4iqa
 2ibS4pE/eD05c1yp9Gix/LhNeeMX6LW942joVN074VBQSG3nw4zEoAeNwN4k93BIzeHP
 T0z/gF6p61oR2d2X1ln2E8xakLoCyBVRzRFCQL+i0klS1zhV8hSXq0htkoiZHaLYr3zD
 B9OQAbgkQD7LxOGMDKP06WwjN56DbIImhb5m1zYV4zOvu0Tdx4P3UwCi8/WxnMzDiYp8
 7MwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc0cNhDelGs9Q6QfVe3eejWBKCQe2osrnhv1gSpshwwkT6o33k+C8NjGxT3C6dwByBAk7gi48B9dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvpEVSpKlG2APXPXcQadZmeOMsI3D8JZR7kKE6ko2PA1qwWhY1
 r70QZ0MX44nZbbfFjSgPsJcmh7nU4Xn72/qG5fc1xT2+GuEHuAT0u8/1TP5UYrRUF9TqtuW9p+x
 yRua2rx9Kr1W8Cpd570604mNSOOVBYlQsMm5ZPg==
X-Gm-Gg: ASbGnct1eOQdCiXK9t3Q7Yq+OHNRtUxsoZplW6DzhXOWZgZ8usC1BYH00lKR+w55w3I
 tCDbwBOCtA73Lp4lMa4jGQyIL2xP4d55RQx537PSEaCE50cyy+uDMePl8e9cQrBraINTf2nm9/v
 gyfmUnMViztUEfrfPeE2ssUuxUZIDIgNk9JQ==
X-Google-Smtp-Source: AGHT+IHJ8fzCsar22nWRrLuqubA/nW5PD6Isexezh6U72gKuIl5N70HEwT9JTNXKPWmpqHrpu7bpAGC2DT3kmga/dpo=
X-Received: by 2002:a05:690c:67c6:b0:708:3532:ec94 with SMTP id
 00721157ae682-70853f752e9mr174343137b3.0.1745857326167; Mon, 28 Apr 2025
 09:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
 <20250422-sm7150-upstream-v1-11-bf9a9081631d@jiaxyga.com>
In-Reply-To: <20250422-sm7150-upstream-v1-11-bf9a9081631d@jiaxyga.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:30 +0200
X-Gm-Features: ATxdqUFknbhFgOKvNVOI3-s43pP4YH55pKLNf_KwLrUaeaEizalUr2MLUM3sfs8
Message-ID: <CAPDyKFqPpqDj+DKT=nJrTS8iDUx_8scnLreUQ99byDHEdBeiww@mail.gmail.com>
Subject: Re: [PATCH 11/33] dt-bindings: mmc: sdhci-msm: Add the SM7150
 compatible
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@mainlining.org>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-hardening@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

On Tue, 22 Apr 2025 at 22:24, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> Add compatible for the SDHCI block found in SM7150.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index eed9063e9bb352b5c8dac10ae2d289c5ca17f81b..2b2cbce2458b70b96b98c042109b10ead26e2291 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -60,6 +60,7 @@ properties:
>                - qcom,sm6125-sdhci
>                - qcom,sm6350-sdhci
>                - qcom,sm6375-sdhci
> +              - qcom,sm7150-sdhci
>                - qcom,sm8150-sdhci
>                - qcom,sm8250-sdhci
>                - qcom,sm8350-sdhci
>
> --
> 2.49.0
>
