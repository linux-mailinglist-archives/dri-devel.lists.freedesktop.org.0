Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98975EC770
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571B410E3CB;
	Tue, 27 Sep 2022 15:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED77C10E3CB;
 Tue, 27 Sep 2022 15:19:07 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id q10so4651121oib.5;
 Tue, 27 Sep 2022 08:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=wXRxHNgmKmKanl4l8Eg0fqOKtTO4UZYjRiXrYlMvlIs=;
 b=QfACLi6hDq8E1XAhHy6b3jdHO910E7qeTsLM2ajXGM6ofR2WXLQ+zbralp3HWyxl6H
 Gu0ntlQydJfp6uPNWzC+fqRZxPWHb2Oz8/sBdLIjNum7QpNvX8eiMLKz8OYesBvCjCRp
 MrbsE4pbvYhtQLZ0TjSz/ugGKTnzfRaC6KIyWpuNvSwSkWKE+zuyInMOFDTzUFa3D8wb
 kACFqazkTORV8rej6P/i7MOse++K2qsvGnudpwzcI9TdxI6L0HWwFm0N1tv4L0RGE/dL
 M7kV5SZNkrQdtWD75CadayBr38szDGjydxFlk9Y8m5EmNWbGRQUFRXwYAckIBFihGimc
 cG6A==
X-Gm-Message-State: ACrzQf1NpbZUQkXdccEzolE9x2jKY8aZUFi23PRjiAVplDDm4+2dyQ/P
 lQlKk70fUmXFL5PVPhMstQ==
X-Google-Smtp-Source: AMsMyM7Tq6EI9RI+e6p6itE+pIviLGESsSPKqa2eDsEQSeRij6qJxEIF50+Itf26CrjppCHGUK4y9A==
X-Received: by 2002:a05:6808:282:b0:34f:6d11:7f68 with SMTP id
 z2-20020a056808028200b0034f6d117f68mr2093203oic.237.1664291947082; 
 Tue, 27 Sep 2022 08:19:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056830410f00b0065689e13f52sm787327ott.71.2022.09.27.08.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 08:19:06 -0700 (PDT)
Received: (nullmailer pid 4054434 invoked by uid 1000);
 Tue, 27 Sep 2022 15:19:05 -0000
Date: Tue, 27 Sep 2022 10:19:05 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220927151905.GA4052559-robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
 <20220924172339.bebekrawee4ubogv@krzk-bin>
 <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 24, 2022 at 09:27:10PM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> > > Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> > > yaml file. Changes to the existing (txt) schema:
> > >  - Added optional "vbif_nrt_phys" region used by msm8996
> > >  - Made "bus" and "vsync" clocks optional (they are not used by some
> > >    platforms)
> > >  - Added optional resets property referencing MDSS reset
> > >  - Defined child nodes pointing to corresponding reference schema.
> > >  - Dropped the "lut" clock. It was added to the schema by mistake (it is
> > >    a part of mdp4 schema, not the mdss).
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
> > >  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
> > >  2 files changed, 265 insertions(+), 29 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> 
> These are the errors generated by the dsi@ node from the example. The
> DSI schema is handled separately (by Bryan, added to the Cc list). Can
> we have a lifter for this patch? Or I can revert to dropping the dsi@
> part from the example.

It's fine as long as I don't see them in linux-next.

Rob
