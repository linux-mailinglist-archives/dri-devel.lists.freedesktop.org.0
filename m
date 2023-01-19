Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B7672DED
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A60410E224;
	Thu, 19 Jan 2023 01:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A026410E21E;
 Thu, 19 Jan 2023 01:16:56 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p133so518262oig.8;
 Wed, 18 Jan 2023 17:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z3r1JR3MPSsFBpDWpSJ61vE3nIfb3dVZfnc0GIpbrWQ=;
 b=upnErD7JPbg0gFzAwmwHC9wEpySzjgTSUPtsIJMxibS2Jen/rZcbbirYl9+6GxJCjs
 14sr8XGt7zJB47ydzRKIM0ssGYJqwQIX9VItqdIS9hkOIDucLxzt3FERBVoiYvLvLZIU
 LT6pIhQ1WOY7F+krXqwrFY3f73ca00wyotK4TEvVxMSS1Yzm7GBSLZxv/0kwn3DlR1U5
 I1zO74xNILhY4Bw585teY2bFWlTKqBaBcIHBiA48GtZRm73fZD+pKfP4tDnTACuQ7Spf
 48ZzsAy52m7LBUsu7eGbFOE0yl3qs0Gzf9xwQmq98w2po5xdlWHL1M6C3srPRO7bVGRo
 s6/w==
X-Gm-Message-State: AFqh2krOXhQPtHXLWtJKwt8HRNW+4PDqhP0zQQxdhXlM41oMyENzZZP4
 8hznAHz0AC2xDn+vulppaQ==
X-Google-Smtp-Source: AMrXdXtzdGuzM2xjuyJk74WyjD1MxXFw6y69PVYfiCmiJk6lZ/KGyd6qJxoZ1ER0uDYmhmc0ENYnXg==
X-Received: by 2002:a05:6808:1a2a:b0:35e:66a4:1b19 with SMTP id
 bk42-20020a0568081a2a00b0035e66a41b19mr5883257oib.8.1674091015714; 
 Wed, 18 Jan 2023 17:16:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 2-20020aca0602000000b0036508145326sm5878098oig.9.2023.01.18.17.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 17:16:55 -0800 (PST)
Received: (nullmailer pid 12835 invoked by uid 1000);
 Thu, 19 Jan 2023 01:16:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Mark Yacoub <markyacoub@chromium.org>
In-Reply-To: <20230118193015.911074-9-markyacoub@google.com>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-9-markyacoub@google.com>
Message-Id: <167409094385.4360.15863185798758300987.robh@kernel.org>
Subject: Re: [PATCH v6 08/10] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Date: Wed, 18 Jan 2023 19:16:53 -0600
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arun.r.murthy@intel.com, marex@denx.de,
 manasi.d.navare@intel.com, abhinavk@codeaurora.org, javierm@redhat.com,
 quic_khsieh@quicinc.com, stanislav.lisovskiy@intel.com, agross@kernel.org,
 Mark Yacoub <markyacoub@chromiu.org>, quic_jesszhan@quicinc.com,
 ankit.k.nautiyal@intel.com, hbh25y@gmail.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com, jose.souza@intel.com,
 swboyd@chromium.org, robh+dt@kernel.org, seanpaul@chromium.org,
 maxime@cerno.tech, rodrigo.vivi@intel.com, bjorn.andersson@linaro.org,
 sean@poorly.run, johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com,
 andersson@kernel.org, dianders@chromium.org, swati2.sharma@intel.com,
 ashutosh.dixit@intel.com, tzimmermann@suse.de, bhanuprakash.modem@intel.com,
 dmitry.baryshkov@linaro.org, christophe.jaillet@wanadoo.fr,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 19:30:13 +0000, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromiu.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20211115202153.117244-1-sean@poorly.run #v4.5
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-9-sean@poorly.run #v5
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> Changes in v5:
> -None
> Changes in v6:
> -Rebased: modify minItems instead of adding it as new line.
> 
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.example.dtb: displayport-controller@ae90000: reg: [[183042048, 512], [183042560, 512], [183043072, 3072], [183046144, 1024], [183047168, 1024], [183308288, 372], [183373824, 44]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb: edp@aea0000: reg: [[183107584, 512], [183108096, 512], [183108608, 3072], [183111680, 1024]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230118193015.911074-9-markyacoub@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

