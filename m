Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E74B6FAC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22CF10E4A7;
	Tue, 15 Feb 2022 15:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE3610E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:22:49 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id m185so24207730iof.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=XhzAWVt3fjQKRJz9q7eT7XZzXXhJRSw+HdG8hBMs3vw=;
 b=fz/+/BbG3AGOIe5I3oCv/MPmuuKqNPijcZ7s8dA+0llZD1hgrWj6MGreXm3aBdMR31
 V7i6Y5E5zDpHHYRvXFtuwSPRIP4U2kD6W3BK/mg1ZOk2r/JM3uU4BXNXMVlSKmYUY9Gx
 I6jWERHeSj7gbIvXytI5TmheBdcVRW81M7wH4oaadsTnwZ3JeQ+jf3t1ThE7dMAb6rwp
 Ab2fEwwIngNJR+c2JvPU1vZ8waKDOee/LvyvVx91IxmPHmwKIDBzDB/V+JNfr7ECxJ0R
 lB2fUriyeUa6uKlMADsSVsYtBIUpoWVm3D+MD+BvkePHobJkTSuDvlGXQM3vdCIqPT3f
 A/Tg==
X-Gm-Message-State: AOAM5302r/SH+vGPIhN/AaM5qh5KJzazUNnbLMx1MgRJVht6XPOUwcDX
 8uImEnhV2Cw5M/nbQ9ptOg==
X-Google-Smtp-Source: ABdhPJy9JFtwUbiq7T/ZLKKZHSXtiaR2kjV/Np9yM3ec7E+Tf5Z817N+bGtrTY1u3170v2yAn8/MMg==
X-Received: by 2002:a05:6638:2493:: with SMTP id
 x19mr3018228jat.219.1644938568584; 
 Tue, 15 Feb 2022 07:22:48 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id v16sm19583530ilm.25.2022.02.15.07.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:22:47 -0800 (PST)
Received: (nullmailer pid 3450855 invoked by uid 1000);
 Tue, 15 Feb 2022 15:22:45 -0000
From: Rob Herring <robh@kernel.org>
To: alyssa.rosenzweig@collabora.com
In-Reply-To: <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH 1/9] dt-bindings: Add arm,mali-valhall compatible
Date: Tue, 15 Feb 2022 09:22:45 -0600
Message-Id: <1644938565.038499.3450854.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Feb 2022 15:27:20 -0500, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.example.dt.yaml: gpu@ffe40000: compatible: ['amlogic,meson-g12a-mali', 'arm,mali-bifrost'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1591823

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

