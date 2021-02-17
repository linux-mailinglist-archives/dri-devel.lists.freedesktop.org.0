Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F331E025
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 21:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60806E0AD;
	Wed, 17 Feb 2021 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B156E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 20:24:54 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id l23so13207104otn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=s6+jiEiqCZSmw0WMNbsaPBiNOtVW1ybg9lWNP/Vo0aY=;
 b=a6DOv6+9pNzDRznJ3pb57GWBPnNFSNnmG8+pZsF/n0uqTWMxVWTjuCqKND9jd1mkrv
 coYOs/hldNHgvK2WBdszqFHkp1AxhmYMXMckWk3Nnuyj0AgMso4QAP9aSGq+WUHC9BiW
 yIAUiuC7oJ5XUCb2KNnB0LPBEVzEdaQ+69GL7LGvxxvh9JNh5TUNSzkvr0197URluXkH
 qIWzt180aZjBV11z/P4AWaRT8Np+Vf4YR1LuZQ0uPNSRv09MZKuZuwfkM6wyP5NFykdx
 TmwBmrlcRjwUVHpcbzJQk9SSeecs3dmtsk5V26Hwb/HdBMN8o0itps8YkzsTuTERkq8E
 8k2Q==
X-Gm-Message-State: AOAM532VtV9DYoglcB2FuTI7WkLmu/XEKdbvvaa9puOhW5z6fekkPLYm
 ycwJsgeGWh8OePAU0ZCIoQ==
X-Google-Smtp-Source: ABdhPJxb/kwWM+0rGGbP7NNjMiSRCWUIh9XpWfTxKh8s9XYiNqqRpDWijLxBslAleJdVs5vdjhmLww==
X-Received: by 2002:a9d:6c4c:: with SMTP id g12mr647306otq.53.1613593493067;
 Wed, 17 Feb 2021 12:24:53 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t2sm619827otj.47.2021.02.17.12.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:52 -0800 (PST)
Received: (nullmailer pid 2681056 invoked by uid 1000);
 Wed, 17 Feb 2021 20:24:51 -0000
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
In-Reply-To: <20210213101512.3275069-2-mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-2-mperttunen@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Date: Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.434667.2681055.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Feb 2021 12:15:10 +0200, Mikko Perttunen wrote:
> Convert the original Host1x bindings to YAML and add new bindings for
> NVDEC, now in a more appropriate location. The old text bindings
> for Host1x and engines are still kept at display/tegra/ since they
> encompass a lot more engines that haven't been converted over yet.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:90:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1440164

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
