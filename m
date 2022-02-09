Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608754AFC27
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621810E465;
	Wed,  9 Feb 2022 18:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245EC10E465
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 18:56:47 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 4so3431432oil.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 10:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TxAZL+Z4U6mKN9dq47U4h0290oyGCuVo1sScd7iLOoU=;
 b=X3N9VWOCxq7OTUNSiqykHYoHUBeG3lfYe21TaSeAi7/XiSR+TXuHfsDNw3NQOYGGpv
 aqG08GfQlmAotY6OUqFVDYMVkL6oHth3kw6DWNgdK1EWMYAk3/oSlBgZk8u9g8m6eN/h
 lWBvroMiTsv1VFswEy2DlQVWxTOF8VLBvkuc2aHD77+Kpnsmf3pyXYzBVmTUkhYEPENM
 erSOpfCsePu3f/75vuiUhou1dkGE26W/GTHdPe+3zPHlZM1aRsrPayngyBGlaXyOi/c2
 acbFsYl/bls1011loOy3+hB5Zxsk52CgfaWyB7RSAfY/46Zs2UR/aHq9GKkJYsq/S5iC
 uZyw==
X-Gm-Message-State: AOAM533PkrgpRYEnwEGGQCrCo1LykEVIRssE4UGwl2MX3ttm89Hz6eS3
 tl+49ciBhtxivaH57KY2lg==
X-Google-Smtp-Source: ABdhPJw/7/qsplIF5pD5/KeocY9o3JW0TwPPA4t9x9UVOMPR101hcfMAT3ZxtFzyI+U/a+55dfm4VA==
X-Received: by 2002:a05:6808:3098:: with SMTP id
 bl24mr2016266oib.312.1644433006374; 
 Wed, 09 Feb 2022 10:56:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o14sm7084298otk.77.2022.02.09.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:56:45 -0800 (PST)
Received: (nullmailer pid 690287 invoked by uid 1000);
 Wed, 09 Feb 2022 18:56:44 -0000
Date: Wed, 9 Feb 2022 12:56:44 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 23/23] dt-bindings: display: rockchip: Add binding for
 VOP2
Message-ID: <YgQObAT7WB9U4MMB@robh.at.kernel.org>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-24-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209095350.2104049-24-s.hauer@pengutronix.de>
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022 10:53:50 +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v4:
>     - Fix clk names in example
>     - Drop unnecessary assigned-clocks, assigned-clock-rates and assigned-clock-parents
> 
>     Changes since v3:
>     - drop redundant _vop suffix from clock names
> 
>     Changes since v3:
>     - new patch
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
