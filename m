Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF21454A98
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6789C61;
	Wed, 17 Nov 2021 16:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EA689C61
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:10:28 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id s139so7330734oie.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yK9vNOeDGETW73QHrV4Z7zFhBBcsvZuPNoOhylQULKY=;
 b=DT62IUGB4NJw6XD5OywW73bAz9ffF6zDvgDO1wNVjXC/HV/wXzsjNNEhMUysiimmZF
 VdMkOVpYuK9bY7z1GjwfMMLO7zKh4PhZlpEFCoVAfBLqWO5mJQQSkx1VAQw6+ZuTy7if
 35EgFEr3sbHaLwuJkGq1z4G6kVQajt/o3+rQnt7Dv6c95gv8Ix1kwjK/Lhny45mxBAUL
 joIDq2Jr/bjZXy31vNMC1UB1rh8FvX3X56NjKa/jKl7LtdQrc/gzD3kHDvUPPWUmIb5u
 +mEe0WprU+cvjiFemod026AVgBkDwgmkCiFgkbuHGHNJDh/PtumqYGTy2LPJX7UQaf5F
 cVsw==
X-Gm-Message-State: AOAM530vgZKDNM31iOo7nFYFUFasYIZf2N8EwOp94XcqiRssM3zseHtb
 /RKQcgsGw9phoGjtVm7NFw==
X-Google-Smtp-Source: ABdhPJyrvKEPCkhIoZwSBkshVFLBitYyWTpayRf+S+fvZB0vU2SS86Fg8Y3yEhzBvppiypC6OhYajA==
X-Received: by 2002:a05:6808:a08:: with SMTP id
 n8mr770523oij.148.1637165427341; 
 Wed, 17 Nov 2021 08:10:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w4sm47701oiv.37.2021.11.17.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:10:26 -0800 (PST)
Received: (nullmailer pid 2614352 invoked by uid 1000);
 Wed, 17 Nov 2021 16:10:25 -0000
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20211117143347.314294-8-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-8-s.hauer@pengutronix.de>
Subject: Re: [PATCH 07/12] dt-bindings: display: rockchip: Add binding for VOP2
Date: Wed, 17 Nov 2021 10:10:25 -0600
Message-Id: <1637165425.821111.2614351.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Nov 2021 15:33:42 +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dt.yaml: example-0: vop@fe040000:reg:0: [0, 4261675008, 0, 12288] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dt.yaml: example-0: vop@fe040000:reg:1: [0, 4261691392, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1556199

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

