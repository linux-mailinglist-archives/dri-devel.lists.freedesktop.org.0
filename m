Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5341BE734
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782796F38F;
	Wed, 29 Apr 2020 19:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338A46F38F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:19:52 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w65so1525259pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3yS3SDIAxgoI+OCUuH6+Xx3tuGso0aTCeG8T3YqniwU=;
 b=kAW87UsWv8BfldJU8firQKssmmNKdHSJ/uH0CxVGXED+CIBf7O7HPb682q9RG2cheP
 CqUALbpH8DNabf8/TtXUlH4a6QD4JuzFqdwO98QklnOZrLH3SkRkeapQ3l8zxB91lW+c
 jUxygCHAQLmS7p2c6aUXvTLH2ix1MjrA8Ej/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3yS3SDIAxgoI+OCUuH6+Xx3tuGso0aTCeG8T3YqniwU=;
 b=pmrGZtb2uXbVm+Ex07lD0BYRlVuwAL3sv0Q/o4kFBfG3tiHVFIA3luZ4cVSn0YL9fP
 uxMvGkf2/OTfA5cdnTo4BpCBLv8axvAMJYcfcj9OhjpLBUFPtSBkHA7JUwnhtUy86MUf
 niA+Rjhcndm/SGuUEUdr4IXZa54m4wKWHeB2vJWDXvmS2ltH7s4Jzqu23lp1g9zCBN7/
 IDRtf88UjgS9QSonZ52DnlMvQ3iZD1Qmt0VvCfZmjFDAMtwOpU+uJoQq5QDTveibnb+h
 ejtwlSzST/DDYqcpaxmB9NBw8Nb+zE/rSeJmcsQnPgk5ONocrsf12AaDyOt0y5H/prgO
 7EIg==
X-Gm-Message-State: AGi0PubL6OQ3+7kVONW5Wzksof0XkcNO4RK34aqK4E7cEBuGlpDfO1PN
 l6ug8N3HaWOwR9GSX8s6DB4bZw==
X-Google-Smtp-Source: APiQypL1Gf97EDr2VlhCZCv3oqFpzbGvV9eP/VHq+9IO0hxAjTqes6LlM/GSXv+aDrJ1AbJJqROWZw==
X-Received: by 2002:a63:495b:: with SMTP id y27mr3550206pgk.218.1588187991710; 
 Wed, 29 Apr 2020 12:19:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id d12sm1731525pfq.36.2020.04.29.12.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 12:19:50 -0700 (PDT)
Date: Wed, 29 Apr 2020 12:19:49 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp: Convert QMP PHY
 bindings to yaml
Message-ID: <20200429191949.GV4525@google.com>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org>
 <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
 <158689927748.105027.5367465616284167712@swboyd.mtv.corp.google.com>
 <20200423171436.GJ199755@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423171436.GJ199755@google.com>
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

On Thu, Apr 23, 2020 at 10:14:36AM -0700, Matthias Kaehlcke wrote:
> Hi Sandeep,
> 
> On Tue, Apr 14, 2020 at 02:21:17PM -0700, Stephen Boyd wrote:
> > Quoting Sandeep Maheswaram (2020-04-01 23:38:52)
> > > Convert QMP PHY bindings to DT schema format using json-schema.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > ---
> > >  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 332 +++++++++++++++++++++
> > >  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
> > >  2 files changed, 332 insertions(+), 242 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > > new file mode 100644
> > > index 0000000..18a8985
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > > @@ -0,0 +1,332 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Qualcomm QMP PHY controller
> > > +
> > > +maintainers:
> > > +  - Manu Gautam <mgautam@codeaurora.org>
> > > +
> > > +description:
> > > +  QMP phy controller supports physical layer functionality for a number of
> > > +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,ipq8074-qmp-pcie-phy
> > > +      - qcom,msm8996-qmp-pcie-phy
> > > +      - qcom,msm8996-qmp-ufs-phy
> > > +      - qcom,msm8996-qmp-usb3-phy
> > > +      - qcom,msm8998-qmp-pcie-phy
> > > +      - qcom,msm8998-qmp-ufs-phy
> > > +      - qcom,msm8998-qmp-usb3-phy
> > > +      - qcom,sdm845-qhp-pcie-phy
> > > +      - qcom,sdm845-qmp-pcie-phy
> > > +      - qcom,sdm845-qmp-ufs-phy
> > > +      - qcom,sdm845-qmp-usb3-phy
> > > +      - qcom,sdm845-qmp-usb3-uni-phy
> > > +      - qcom,sm8150-qmp-ufs-phy
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Address and length of PHY's common serdes block.
> > > +      - description: Address and length of the DP_COM control block.
> > 
> > This DP_COM block is only for one compatible. Is it possible to split
> > that compatible out of this binding so we can enforce the reg property
> > being either one or two items?
> > 
> > In addition, I don't quite understand how this binding is supposed to
> > work with the DP phy that sits inside qcom,sdm845-qmp-usb3-phy and then
> > gets muxed out on the USB pins on sdm845 and sc7180 SoCs. Can you fill
> > me in on how we plan to share the pins between the two phys so that all
> > the combinations of DP and USB over the type-c pins will work here? My
> > understanding is that the pins that are controlled by this hardware
> > block are basically a full USB type-c connector pinout[1] (except that
> > D+/D- isn't there and the VBUS and CC lines go to the PMIC). Either way,
> > we get the TX1/2 and RX1/2 pins to use, so we can do 4x lanes of DP or
> > 2x lanes DP and 2x lanes of USB. There's also a type-c orientation
> > flipper bit that can flip the DP and USB phy lanes to the correct TX/RX
> > pins on the SoC. And then the DP phy has a lane remapper to change the
> > logical DP lane to the physical DP lane. It's a complex piece of
> > hardware that isn't fully represented by this binding.
> > 
> > [1] https://en.wikipedia.org/wiki/USB-C#/media/File:USB_Type-C_Receptacle_Pinout.svg
> 
> Could you please answer Stephen's questions? It would be great to move
> forward and get support for SC7180 landed.

You posted v6, which does the split Stephen asked for, but you didn't answer
his question about the pin sharing. Since this is an existing binding there
is probably no reason to block it from landing, but it would still be good
to clarify this.

Thanks

Matthias

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
