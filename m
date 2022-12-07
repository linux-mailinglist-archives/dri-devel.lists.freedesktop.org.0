Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD3646084
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 18:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B915810E40E;
	Wed,  7 Dec 2022 17:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F9D10E40F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 17:44:17 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-1445ca00781so15543079fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 09:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/8CiTJV9ucFQbeePUlzvXCbWokuGfhKoiuYFuI3St0=;
 b=k7YRiAqKKPVEP3QqIsIMiCvkoH/rQ3YxGGPN3DwMSRyUAOhd45Av3Dkd/vMe1zFblz
 HlJB0UqEWnzE7blVtqx/YW+VNOBcu7G2FfpbpKAr2vE4w2Gu0vhH9o6I0xAPKHZEQ5hQ
 ocZYQnHwG31Uq/OLKhM9N5MR1psqr9tT7LujzCl7mszur0lx9RsGUicMMGcTOQxmq1h0
 MNn6/7wHq3qQVFcHtN53+xjkc1+WbQYhKBoA3O+LpvfAgf2fHSyyhw9fTWJGse2OobtE
 gMjb7SvFISIZ+gUBs9va7qWYJV7slK5GfHF6+V02dR/2BQmb3cwhu/CiAx2x2ckozoj0
 dn7w==
X-Gm-Message-State: ANoB5pmerQybTOKz1uFtUvVNLFN78Go3cYRVkUDY55w7dV34Y232P69S
 4rKtRqRzbmxFJX59OYoINw==
X-Google-Smtp-Source: AA0mqf7yzwcq443GX5MxHi0Hh4y/QyySkeQ148hJ60MONDowgCyxSvAdaU9jVjH/XctFGfNPZWS1ig==
X-Received: by 2002:a05:6871:410e:b0:143:7889:c525 with SMTP id
 la14-20020a056871410e00b001437889c525mr29926687oab.171.1670435056616; 
 Wed, 07 Dec 2022 09:44:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a7-20020a9d4707000000b0066e7e4b2f76sm8137389otf.17.2022.12.07.09.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 09:44:16 -0800 (PST)
Received: (nullmailer pid 2464259 invoked by uid 1000);
 Wed, 07 Dec 2022 17:44:15 -0000
Date: Wed, 7 Dec 2022 11:44:15 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Fix clock constraints for imx8mp
Message-ID: <167043505517.2464220.1273885867090905581.robh@kernel.org>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 16:13:59 +0100, Alexander Stein wrote:
> i.MX8MP uses 3 clocks, so soften the restrictions for clocks & clock-names.
> 
> Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
