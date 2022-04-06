Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C34F6416
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A710E233;
	Wed,  6 Apr 2022 16:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F53410E233
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:05:12 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-de48295467so3410515fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 09:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpA4CfNVqRRzfNI0NZazohhpjC3Wdx9B0oPB6HfE+1c=;
 b=iELr2Lxx/kL5bdtUIpUKgGRO6KuPKgOPLDaUPaZaiJtYsseBjKLWSiZFbVHQQGK1/9
 jvLlq1sYZm4Rwt7Qa/kZRuyvsGhbMpD52rUPvTplHg5Kol8h41q4VeHzIVkNTW7C+bdv
 KykGlHMG3kz87KOmq0ietzYayreDPcjc38HGkhMTdYnuBA76YsNZe6Rh3bHkXpoVuyvJ
 t5bOtC9e6A1mRC1QPB7JFPKOQYyK8RDNjJvDiuyUVhuuZdwhg9uDbSHosWPM8pP3OuWV
 DFgkjDmG9DPwCvkJTR5hj1Vn/geIJ0gA6szqkWSH0w/kXS5pqgXEGKKBae/6evCrK4Vb
 RB4Q==
X-Gm-Message-State: AOAM532L5HCAbISPGE9wAlUbgqS4CnfaKS7pkB3mq0/0zF78wZV6L+O3
 y6sbDej1eg3vEcaizHL/HNrvDnJqWA==
X-Google-Smtp-Source: ABdhPJxWnogmTkLiwRUqI1DLFzJoxqP9hindg9vBS92SZbO9tvjdBwxEVyklhAyB6REgphp91XXYvw==
X-Received: by 2002:a05:6870:5b9e:b0:cf:f6de:3e89 with SMTP id
 em30-20020a0568705b9e00b000cff6de3e89mr4372076oab.94.1649261111777; 
 Wed, 06 Apr 2022 09:05:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w39-20020a056830412700b005cda87bbdcesm7033390ott.6.2022.04.06.09.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:05:11 -0700 (PDT)
Received: (nullmailer pid 2331636 invoked by uid 1000);
 Wed, 06 Apr 2022 16:05:10 -0000
Date: Wed, 6 Apr 2022 11:05:10 -0500
From: Rob Herring <robh@kernel.org>
To: Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: novatek,nt36672a: add
 backlight property
Message-ID: <Yk26Nli4RXgV5KgK@robh.at.kernel.org>
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB70090BB5D8C7D655BEE0642FD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR02MB70090BB5D8C7D655BEE0642FD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Apr 2022 05:48:09 +0530, Joel Selvaraj wrote:
> Add backlight property and update example to include it.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  .../devicetree/bindings/display/panel/novatek,nt36672a.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
