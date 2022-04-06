Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AF4F62B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4F010E178;
	Wed,  6 Apr 2022 15:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4610E178
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:15:34 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-dacc470e03so3229601fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c+ED+sR+qRf0zwLS0gXqp8dJnXQFBqtZvdW8ue++BTs=;
 b=EjXtgpIZKv5iNuIvnHUmbBV//zbPxia610Cr6BHMzo19x4p6aBuG8S1mJPNiN+gbRY
 UfeqZBE6KTm10C9idrZO+eGxMyYnHs4p0FbXjluRWJu7g1dGgYNH9FOKODl1bZ9juiQ7
 hplgCHJ9d4nkPxt/rlA99LdFgOfpMQ4sFf+kZnKjOI8f0tiiiRN1Qe2WzfTm1Reo0EJJ
 NW/muuRA7F96Q5YBUlJnhb8QkkPfRskpySoYT8S8+7504dOHFvUQehAVHeLBIxA7JiS2
 CqZSwOeflOWrZE7Sgm9kvuJuMCJbDWCxldHwX4sH51hAbGWdLnMFeZVj3sxiICAJ6Q37
 kmlw==
X-Gm-Message-State: AOAM5314JMbAaqh+gpqJkSc+Wn6YITWvYGn5FPhAM2ICP0EOs+0wQ3PM
 SWEOAfprqRj3Owy3BCeTrg==
X-Google-Smtp-Source: ABdhPJzgBHcySaaFvNECTinQeNeU1dgeUNA45/xoDtws5ZDF6hnlDSoHsqpL6P19iakXO7w7cj/3fA==
X-Received: by 2002:a05:6870:e0d1:b0:e2:1c3b:cca2 with SMTP id
 a17-20020a056870e0d100b000e21c3bcca2mr4072699oab.163.1649258134207; 
 Wed, 06 Apr 2022 08:15:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e7-20020a9d2a87000000b005af548abe73sm7129649otb.4.2022.04.06.08.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:15:33 -0700 (PDT)
Received: (nullmailer pid 2263515 invoked by uid 1000);
 Wed, 06 Apr 2022 15:15:33 -0000
Date: Wed, 6 Apr 2022 10:15:33 -0500
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
Message-ID: <Yk2ulZODO9cHRjN/@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, chunkuang.hu@kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 19:58:36 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
