Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48A534874
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 03:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3D10E037;
	Thu, 26 May 2022 01:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A562410E037
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 01:56:57 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso652623fac.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 18:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JcpVIfrmuD7j2oz/sjN13IeGVl7vyxQiSgTn0EgwppY=;
 b=weyRrbb+VONvVxhx374cU+uiSnHdghYn2DbdsveYjreeNI0HvNMu9J1EyNmkrbREqf
 q/chYi9F+s6fp9vMd36gVVDXUUqlb8RvaFeyxeUBxTnuSrcOxmrOmp6zexWfw7ToEzLu
 WeZrXblsEOynK2vu1Dwrzyac2FrDVwOzsJr0uKE+Enp9YHaR22PaWnJ22DmJBX6D5gHz
 m9GoIHN6r6GQ/CxzQDjTsM9k8conf7AJoU4PH/9xoG6MOSkHLchcmnQOD2wRe8/QhHri
 ZZXau3tXR1hm3t2nptC8+SXIzHZsHglKhgAtM9uH6ns0Z8EIBlhinIfYt1Z1nPQhIkGA
 poqA==
X-Gm-Message-State: AOAM533VupWgmJe2OJyeXIA6PKCPpVT99fabokL9mVF2g54zMlfD8adc
 xkv47PA48zQGvPKXOahWqA==
X-Google-Smtp-Source: ABdhPJwABXwW7ZLL7SGMOnCVFZ0SqXJLeBo/4cYGzeKaFOPbF2WxlA0Z+faXi2mzKv9iY/uT9h4fjA==
X-Received: by 2002:a05:6870:8911:b0:f2:985f:e639 with SMTP id
 i17-20020a056870891100b000f2985fe639mr20157oao.59.1653530216737; 
 Wed, 25 May 2022 18:56:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z11-20020a056871014b00b000e686d13890sm161808oab.42.2022.05.25.18.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 18:56:56 -0700 (PDT)
Received: (nullmailer pid 2895310 invoked by uid 1000);
 Thu, 26 May 2022 01:56:55 -0000
Date: Wed, 25 May 2022 20:56:55 -0500
From: Rob Herring <robh@kernel.org>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: Add compatible for Mali Valhall (JM)
Message-ID: <20220526015655.GA2895259-robh@kernel.org>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
 <20220525145754.25866-2-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525145754.25866-2-alyssa.rosenzweig@collabora.com>
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
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 May 2022 10:57:46 -0400, Alyssa Rosenzweig wrote:
> 

Reviewed-by: Rob Herring <robh@kernel.org>
