Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB11A940F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E36E867;
	Wed, 15 Apr 2020 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9388161
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:21:20 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p8so496508pgi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=qYUxUinpAV+jTdIPlQ2ftanC+VH4TYtMDBpvx6CaE/M=;
 b=e6D9UKxRfuRB6Vg27Qve4+YFdRAD4xfEU/6fiSyFULykIaaqQmkoKD2e9ao9hIBax8
 BIg3X9WuPUCvye8P3WyERQJJmZ4no8QQNxBFjt8wy/gPFWEL+qcpQOi0WWSA3MVnH1gN
 nxjTcN0XIJfb9nPMSkfPXl4vSaCFCt8Z1f8so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=qYUxUinpAV+jTdIPlQ2ftanC+VH4TYtMDBpvx6CaE/M=;
 b=dJUkKfOyfJdhNkNmvVjprwkMGFVqCAXq638uTTlcDKJZJqG/tj6tPPualgLwRx5uFt
 rRTHso0VscOAqGGEnTdONB+iw4L17OBK5Xilc4CeK2sR5igXuD8Wyyea20l4GwY/YtYI
 rbwi5+UIbUArSZkZRubgM6jRmcac6Ovr4dB9OhExU5K6F3vE98oh1peQNNlf4IZm67tX
 kT+rPDZpnL7XqONMzIyLAoNvaBlJW3YPmXCemdJHBAUn6Cvvlv98+PpsS7J+5yPRXrPA
 nVuNPqJ4PjuJm7LY+h9DMTdXqhfaYIik6dqeEknKQZC7tzu5ObCOi9U7N/sQv62h+yJf
 YFzA==
X-Gm-Message-State: AGi0PuaSTslPszpazq4siXG7jDOD0aZ2uDAXcbFDseENFy6kLEvGQNVJ
 VcoQ2Vi72p0WI3uJTHzNMwe+1NyNnO4=
X-Google-Smtp-Source: APiQypJvfbBsusLiO4aMQUZyDZaiL2beLstkyOYsDAsnSSXRrCDtVIAiTW4XcNJVdxbo/iotiywFWQ==
X-Received: by 2002:a63:c101:: with SMTP id w1mr10203522pgf.126.1586899279542; 
 Tue, 14 Apr 2020 14:21:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i13sm11701085pfa.113.2020.04.14.14.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 14:21:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org>
 <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,
 qmp: Convert QMP PHY bindings to yaml
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Doug Anderson <dianders@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Kaehlcke <mka@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sandeep Maheswaram <sanm@codeaurora.org>
Date: Tue, 14 Apr 2020 14:21:17 -0700
Message-ID: <158689927748.105027.5367465616284167712@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>,
 hoegsberg@google.com, abhinavk@codeaurora.org,
 Sandeep Maheswaram <sanm@codeaurora.org>, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sandeep Maheswaram (2020-04-01 23:38:52)
> Convert QMP PHY bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 332 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
>  2 files changed, 332 insertions(+), 242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> new file mode 100644
> index 0000000..18a8985
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -0,0 +1,332 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QMP phy controller supports physical layer functionality for a number of
> +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8996-qmp-pcie-phy
> +      - qcom,msm8996-qmp-ufs-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,msm8998-qmp-ufs-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sm8150-qmp-ufs-phy
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +      - description: Address and length of the DP_COM control block.

This DP_COM block is only for one compatible. Is it possible to split
that compatible out of this binding so we can enforce the reg property
being either one or two items?

In addition, I don't quite understand how this binding is supposed to
work with the DP phy that sits inside qcom,sdm845-qmp-usb3-phy and then
gets muxed out on the USB pins on sdm845 and sc7180 SoCs. Can you fill
me in on how we plan to share the pins between the two phys so that all
the combinations of DP and USB over the type-c pins will work here? My
understanding is that the pins that are controlled by this hardware
block are basically a full USB type-c connector pinout[1] (except that
D+/D- isn't there and the VBUS and CC lines go to the PMIC). Either way,
we get the TX1/2 and RX1/2 pins to use, so we can do 4x lanes of DP or
2x lanes DP and 2x lanes of USB. There's also a type-c orientation
flipper bit that can flip the DP and USB phy lanes to the correct TX/RX
pins on the SoC. And then the DP phy has a lane remapper to change the
logical DP lane to the physical DP lane. It's a complex piece of
hardware that isn't fully represented by this binding.

[1] https://en.wikipedia.org/wiki/USB-C#/media/File:USB_Type-C_Receptacle_Pinout.svg
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
