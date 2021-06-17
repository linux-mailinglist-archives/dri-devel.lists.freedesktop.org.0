Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601B3ABDF8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 23:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EA36E819;
	Thu, 17 Jun 2021 21:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFE6E1F1;
 Thu, 17 Jun 2021 21:26:40 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id b14so6663155ilq.7;
 Thu, 17 Jun 2021 14:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=S2QnEMjPyLJ51Kht1z23VYTeVyxh5naJwxQU5uQBV3s=;
 b=Q6iNsVafFTiKPTkv4rtk5QHkIQFWHn/oAY+cLiionbaHeOVy76Y1oE0X9KRFAsFUwq
 Br51O2Zv/ZzdRCFvyAUl0QCsIJ21jnN2xfFeEq42KHGKdp4g2GRgIR9/Ovqk+ASW6IeU
 lT9C/yHoGvbHapqppHYv2S36ciKGdP1nXNhSQNFthMW/FnlJlWSANH3D0p9NJY9liWCv
 +s2I7+detT0sZ/sY9iAB0FFWfdeIx6LithwgCnFZ+icB6X9NVCpzGFcpALNZUREW49r7
 7CU1P7/Z9TMt5W9DOPdQBq0qNk8TbgPQcC6lJQDUsE3KkMZgbj2pSeUMRsWbRuKKJBJp
 LtNg==
X-Gm-Message-State: AOAM533BeSzQ6QQKRNqJVwv3f7mkgenWHRJxbDJVEg5ItceS/srEemTg
 nW74dk5qH00ctJwmE8YD5g==
X-Google-Smtp-Source: ABdhPJwx/O9pKEetV4vbZYQ02eGDkjwiDJt/qlFofKiX/u2XNE3H0grx7CaSNbe0xBL5h6oggqcfNg==
X-Received: by 2002:a05:6e02:13e5:: with SMTP id
 w5mr5050540ilj.112.1623965200227; 
 Thu, 17 Jun 2021 14:26:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q6sm95080ilm.45.2021.06.17.14.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:39 -0700 (PDT)
Received: (nullmailer pid 3336121 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-2-jonathan@marek.ca>
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.580046.3336120.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Jun 2021 10:43:33 -0400, Jonathan Marek wrote:
> These got lost when going from .txt to .yaml bindings, add them back.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/msm/dsi-phy-common.yaml'
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493583

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

