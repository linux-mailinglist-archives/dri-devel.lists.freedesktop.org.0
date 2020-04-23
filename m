Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3491B61AA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 19:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ABB6E4F3;
	Thu, 23 Apr 2020 17:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50D36E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:14:38 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t16so2601912plo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ImuquuX0o7pPZ9bGea3cOCMdcWyQffNkeX4qWUmGnVg=;
 b=Fh0fZr67sNv4FZXbdb2Lcuj0w/6m5469ARU5b3Jv/J3awFsgvnHW3GBDZFtirwtTBQ
 VEnYdEMOXA7GOEJ772QwCTyKtnMRkhQGc274PhNw5eueSePwxSpYDaiovIpiQwbjJpk7
 A+JstF5rX7YaXE7oR/EIxsG2+WhCAhxk2uvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ImuquuX0o7pPZ9bGea3cOCMdcWyQffNkeX4qWUmGnVg=;
 b=YdHCfcUj1b7+zpx0D3z+ZfFGBnnpR5Rc9Sh3bTRWe4WISHit94jIoUYTNTvbtEO+VT
 u/gaWO6pQlP5Kq00+C5DenJWrOWz2bJdypKlbH15BDd+zQajF1HSuM8DDGxrrp/0EwqS
 jH0P6bnGgP5qDEizb3udTfouWct8HjsplxZ1GwOwMw1VPj8k1HXMjPMBeo8r473LIbB9
 N8YJuUXo3cCMHtlV+B6oSqu7cupddlB960NYfTOvxfaA5kc5qtMjf7zUxia5p2pzO39Z
 Rfcl8MW7L/2MytCOEIlKDeLvjNTSpqBPpnQuH/W2VQa4l2CnYWuHtSF8MOTbbVGHGM/j
 l6Ng==
X-Gm-Message-State: AGi0PubYIs5En7M5MFLH6ZSfJdVVva2p9GlZujvSHrSMMV5P7KjUyAdg
 bVLmJ1j9mTAxTa9TFFKSew1kFQ==
X-Google-Smtp-Source: APiQypIk9MvasGQWk+XnO6jWjIG+YouGIGQ62gjIE7RPw9r/JY+62QVCBe9Tpk5sU4R2pFA0IkyAPQ==
X-Received: by 2002:a17:902:70c1:: with SMTP id
 l1mr4519146plt.298.1587662078207; 
 Thu, 23 Apr 2020 10:14:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id d12sm2950227pfq.36.2020.04.23.10.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 10:14:37 -0700 (PDT)
Date: Thu, 23 Apr 2020 10:14:36 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp: Convert QMP PHY
 bindings to yaml
Message-ID: <20200423171436.GJ199755@google.com>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org>
 <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
 <158689927748.105027.5367465616284167712@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158689927748.105027.5367465616284167712@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 aravindh@codeaurora.org, Sandeep Maheswaram <sanm@codeaurora.org>,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>,
 Andy Gross <agross@kernel.org>, hoegsberg@google.com,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandeep,

On Tue, Apr 14, 2020 at 02:21:17PM -0700, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2020-04-01 23:38:52)
> > Convert QMP PHY bindings to DT schema format using json-schema.
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 332 +++++++++++++++++++++
> >  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
> >  2 files changed, 332 insertions(+), 242 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > new file mode 100644
> > index 0000000..18a8985
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > @@ -0,0 +1,332 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm QMP PHY controller
> > +
> > +maintainers:
> > +  - Manu Gautam <mgautam@codeaurora.org>
> > +
> > +description:
> > +  QMP phy controller supports physical layer functionality for a number of
> > +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,ipq8074-qmp-pcie-phy
> > +      - qcom,msm8996-qmp-pcie-phy
> > +      - qcom,msm8996-qmp-ufs-phy
> > +      - qcom,msm8996-qmp-usb3-phy
> > +      - qcom,msm8998-qmp-pcie-phy
> > +      - qcom,msm8998-qmp-ufs-phy
> > +      - qcom,msm8998-qmp-usb3-phy
> > +      - qcom,sdm845-qhp-pcie-phy
> > +      - qcom,sdm845-qmp-pcie-phy
> > +      - qcom,sdm845-qmp-ufs-phy
> > +      - qcom,sdm845-qmp-usb3-phy
> > +      - qcom,sdm845-qmp-usb3-uni-phy
> > +      - qcom,sm8150-qmp-ufs-phy
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Address and length of PHY's common serdes block.
> > +      - description: Address and length of the DP_COM control block.
> 
> This DP_COM block is only for one compatible. Is it possible to split
> that compatible out of this binding so we can enforce the reg property
> being either one or two items?
> 
> In addition, I don't quite understand how this binding is supposed to
> work with the DP phy that sits inside qcom,sdm845-qmp-usb3-phy and then
> gets muxed out on the USB pins on sdm845 and sc7180 SoCs. Can you fill
> me in on how we plan to share the pins between the two phys so that all
> the combinations of DP and USB over the type-c pins will work here? My
> understanding is that the pins that are controlled by this hardware
> block are basically a full USB type-c connector pinout[1] (except that
> D+/D- isn't there and the VBUS and CC lines go to the PMIC). Either way,
> we get the TX1/2 and RX1/2 pins to use, so we can do 4x lanes of DP or
> 2x lanes DP and 2x lanes of USB. There's also a type-c orientation
> flipper bit that can flip the DP and USB phy lanes to the correct TX/RX
> pins on the SoC. And then the DP phy has a lane remapper to change the
> logical DP lane to the physical DP lane. It's a complex piece of
> hardware that isn't fully represented by this binding.
> 
> [1] https://en.wikipedia.org/wiki/USB-C#/media/File:USB_Type-C_Receptacle_Pinout.svg

Could you please answer Stephen's questions? It would be great to move
forward and get support for SC7180 landed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
