Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7904828A3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 23:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C205189BAE;
	Sat,  1 Jan 2022 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BA189BB2;
 Sat,  1 Jan 2022 22:01:50 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id i5so36894894uaq.10;
 Sat, 01 Jan 2022 14:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EIYlX0fg89iThHN0zMuGWjZdyWg72w1vf2v0+D7SNtI=;
 b=5pAUcvGxmFKcopBw3P63Vkut5uiMB+YENjgT2Ty74+U6w8EbXdTrfJge+mKAWd85B1
 f03Nvd0kgKwgjX936YMxYUAc+3ZN/Lf509HJqfqjchH7yuUz1ptn9d7yXJtHvTlan3aW
 ZBT5iLRHJtcEI9FoPlGmDI8FZKay2LqU2jXI+jrmyYbGZ1P9iagz4ECp2ZuDwIB46R0Q
 2gcdNx0EuILD96Kc3XzHvagGmifimNNdtvetieJCXAW4mEoy31zv6DbvX3+9/2HBSWS4
 hGZ+g24IPyUtmA1EJiubtkKCQsWcD3UyU7vAaauEF2rtfPiFvZeUTZ8Z2Mpl5zI6ndAN
 x4HQ==
X-Gm-Message-State: AOAM533ZPTLKvKBU/wNk6vn2jF4I6HxVBaUxeqsan2R2m1gGX68AwaB1
 xDQh8zoDaNr8Ti3hLXcr+g==
X-Google-Smtp-Source: ABdhPJz2XEbM/n1d4hzrwv5hiRpcGtsXAB6QuViudqMOLi02VAkPU3bX7OP/UX05O/2eLvlC42/doQ==
X-Received: by 2002:ab0:6956:: with SMTP id c22mr5104855uas.51.1641074509649; 
 Sat, 01 Jan 2022 14:01:49 -0800 (PST)
Received: from robh.at.kernel.org ([209.91.235.3])
 by smtp.gmail.com with ESMTPSA id i62sm6165690vke.33.2022.01.01.14.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 14:01:48 -0800 (PST)
Received: (nullmailer pid 839548 invoked by uid 1000);
 Sat, 01 Jan 2022 22:01:44 -0000
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
In-Reply-To: <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
 <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
Subject: Re: [v1 1/2] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Sat, 01 Jan 2022 18:01:44 -0400
Message-Id: <1641074504.063577.839547.nullmailer@robh.at.kernel.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 quic_abhinavk@quicinc.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Dec 2021 14:54:35 +0530, Rajeev Nandan wrote:
> Add 10nm dsi phy tuning properties for phy drive strength and
> phy drive level adjustemnt.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:phy-drive-strength-cfg:type: 'array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:phy-drive-level-cfg:type: 'array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: ignoring, error in schema: properties: phy-drive-strength-cfg: type
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml:0:0: /example-0/dsi-phy@ae94400: failed to match any schema with compatible: ['qcom,dsi-phy-10nm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1574124

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

