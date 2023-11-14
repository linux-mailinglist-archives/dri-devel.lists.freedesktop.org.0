Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D27EB117
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 14:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7F110E45D;
	Tue, 14 Nov 2023 13:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DB810E460
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:53 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3b3ec45d6e9so3459461b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 05:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699969492; x=1700574292;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PmEgb+EV0Zl7D8C3uAM8E/H1l2y9vB0lqB3Tm7vb8U4=;
 b=ruLln0akbGrQFFfD3vhNOi1yWnfoFBmBACAxhqR9idddClT3e3Hx1EFAA0mapGX1A6
 5MaXZPt+OIAcbmRwZCOTGUeopoTUxHDCOnRFlz2sA07dxbhPNz1K5dbggIdup5tFqIiq
 5xVL33CbEp/HvSKA7IFxKmkBQknl49Gf/oefdGGx6r33Q8hDHVBwXopJ7LbK0r7aDbCF
 EWkDmSpomv5jTCPvOawsOvHuKmSWIZue/1h8KRdUH7/qY9X5R5BWFHx7XJqH6DIkZOsz
 0OilS6FHX3NO4KXX8D84o8l7cI0vVCAPV90TJ0i64TdUR3aA6RN4Y30SSF2HYnj6KRJy
 8QZA==
X-Gm-Message-State: AOJu0YwNtsPollQso/aYMONcQXLJmf6ANrf40jKLh+Ju7jwKqxVXQpU9
 6f/+GIRSJisOT1/roInXbg==
X-Google-Smtp-Source: AGHT+IEoAU1Lg6SlYx8VqG5eB7OWyqoEYSPcEMHmWoXzIY4/iBbuR3rMHc1ozP3vv2heVSdCnLsY+w==
X-Received: by 2002:a05:6871:7291:b0:1ea:85a:db2e with SMTP id
 mm17-20020a056871729100b001ea085adb2emr14076992oac.45.1699969492557; 
 Tue, 14 Nov 2023 05:44:52 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 wh6-20020a056871a68600b001e12bb81363sm1394830oab.35.2023.11.14.05.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 05:44:51 -0800 (PST)
Received: (nullmailer pid 1652367 invoked by uid 1000);
 Tue, 14 Nov 2023 13:44:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
In-Reply-To: <20231114112841.1771312-1-andyshrk@163.com>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112841.1771312-1-andyshrk@163.com>
Message-Id: <169996949102.1652338.14967893657318401842.robh@kernel.org>
Subject: Re: [PATCH 08/11] dt-bindings: display: vop2: Add rk3588 support
Date: Tue, 14 Nov 2023 07:44:51 -0600
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
Cc: devicetree@vger.kernel.org, hjc@rock-chips.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 14 Nov 2023 19:28:41 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The vop2 on rk3588 is similar to which on rk356x
> but with 4 video outputs and need to reference
> more grf modules.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dtb: vop@fe040000: clocks: [[4294967295, 221], [4294967295, 222], [4294967295, 223], [4294967295, 224], [4294967295, 225]] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dtb: vop@fe040000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2'] is too short
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231114112841.1771312-1-andyshrk@163.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

