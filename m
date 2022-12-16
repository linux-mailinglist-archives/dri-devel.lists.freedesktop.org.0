Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFC064EE80
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208710E601;
	Fri, 16 Dec 2022 16:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF510E5E8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 16:05:33 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-12c8312131fso3807857fac.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOSCsqaoeoIju0eLDf3WqxL6Do53Bv9D82WTM/iySek=;
 b=8OfrdKYvqRyRvyzVOOO6IK0WId3r6efSugBho+D+vLVcDpq8O/DFik4/++ktM7XkEX
 hmmfAZ/GkScFjcObaogEXsLcby2DqqFGMhG168pDczEK7M7A8eEWcELGlNQC7e9HUCon
 y1cWbVcwkNj2sW3hU3pv1ofYowdx6dlm2TvOW1PeIFYhpDb6A3YilbEa/MPWBo993guB
 jmAlBxReNNmzrSHnmxKyIrAyLr9cd1Z+nKNSKAeY39nb332V09Ta4NB/vD/zD/iVnldv
 5ue5UxB5UTUOlptd+NEs98Rjfo7xkNgRwny9baUbV8sHT1U7u3oPWi2Xa6KoO+sJ6k5A
 dc1w==
X-Gm-Message-State: ANoB5plybwUEPZ2UmJoZAXMTDP4TuEgVtwzyDkfqyC5qWoYqrnnZJLIq
 tZHKW7zezPjIlWWnca4sdA==
X-Google-Smtp-Source: AA0mqf6fQAQQ0eOGxAWHGt+fS4XPjjQEzyVhHbTXOdayWO2k0T+9QkpLSd0OFY+e0tZDdpj0DZznqg==
X-Received: by 2002:a05:6870:f29b:b0:143:d9f7:8127 with SMTP id
 u27-20020a056870f29b00b00143d9f78127mr16644708oap.42.1671206732605; 
 Fri, 16 Dec 2022 08:05:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z21-20020a056870e31500b00148316f78fesm1124816oad.2.2022.12.16.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 08:05:31 -0800 (PST)
Received: (nullmailer pid 2826511 invoked by uid 1000);
 Fri, 16 Dec 2022 16:05:30 -0000
Date: Fri, 16 Dec 2022 10:05:30 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V6 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Message-ID: <167120672298.2826350.15042409228492859514.robh@kernel.org>
References: <20221215185211.1560736-1-macroalpha82@gmail.com>
 <20221215185211.1560736-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215185211.1560736-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 15 Dec 2022 12:52:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for Samsung AMS495QA01 panel (with Magnachip
> D53E6EA8966 controller IC).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
