Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A828342527F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 14:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7666F448;
	Thu,  7 Oct 2021 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91E76F448
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 12:05:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id y201so8725379oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 05:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZpeghEkpC1Pg3UdO1HwAb8FK9i7VWHQ5YdwnoplJxK8=;
 b=BZ2WR+5i4pUW0KaE5mgd86yJl8frz7hKlfVprAl2/waqf+fiSDa/gSGyLQXL0lJ84K
 hYcX6Tb8QWvWfTpI1L1YMeWBv4FZLDhqQT0iBjJIfjIjDroFXEQy/+bvf009SNm+Y/UY
 9CufCJsiEEA8F8TgzlALPYqeDH3NcHqrB4gsW0ei6HQb7iJCJcVKQOJwC+Qrffk9bda8
 TRqeQHIxam1HBEXdz80avhpnFmw7fsQIhfoBz69wcXyiTS9r5ym+y+HSkSK/aCMlEWuf
 GmNlrejho7pzNqAOEPTwtrHm7eoFwxDHHR0KAVW1tzW5t7Dw7C/WnpFGE/DVvqoVExoe
 8Hww==
X-Gm-Message-State: AOAM5306hNg4D4Gqli6cEc4EB06EgpSeLrbZ1wsx734E/Oyk5M/lKCNu
 axXYWJlxHddiX4A2lk70RD1s9ivKEg==
X-Google-Smtp-Source: ABdhPJzhiXeQo/eXhIOrAs7OPuhGigLU49G1jNhsaB5Ipypuu/N1nhLiSKgYOzsnVO0FqhVwFnc2ZQ==
X-Received: by 2002:a05:6808:1248:: with SMTP id
 o8mr11034031oiv.151.1633608337744; 
 Thu, 07 Oct 2021 05:05:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u26sm4655625oic.51.2021.10.07.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 05:05:37 -0700 (PDT)
Received: (nullmailer pid 121522 invoked by uid 1000);
 Thu, 07 Oct 2021 12:05:36 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, tomi.valkeinen@ti.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20211006135150.504897-1-angelogioacchino.delregno@collabora.com>
References: <20211006135150.504897-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: display/bridge: tc358764: Convert to YAML
 binding
Date: Thu, 07 Oct 2021 07:05:36 -0500
Message-Id: <1633608336.190712.121521.nullmailer@robh.at.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Oct 2021 15:51:50 +0200, AngeloGioacchino Del Regno wrote:
> Convert the Toshiba TC358764 txt documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/bridge/toshiba,tc358764.txt       | 35 -------
>  .../display/bridge/toshiba,tc358764.yaml      | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1537162


bridge@0: '#address-cells', '#size-cells', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/exynos5250-arndale.dt.yaml

bridge@0: 'ports' is a required property
	arch/arm/boot/dts/exynos5250-arndale.dt.yaml

