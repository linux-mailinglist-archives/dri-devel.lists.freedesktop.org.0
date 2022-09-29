Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02E5EFF54
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 23:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324B410E0A8;
	Thu, 29 Sep 2022 21:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DCF10E112
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 21:34:26 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 z9-20020a4a4909000000b0047651b95fbdso1002299ooa.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eYvJmG2DezK7WO/Bmnou+uvozjcPMGth8jsvm80c5Ek=;
 b=QWU0i5JLeUHWbh9mgxN4nR3xLySynYuFTRl7sWvCknpU4ghNbjzxbKa3JONo/I5Los
 oNfF7p+k60EQRU1HEh/zYAsk/+teK8/USyeSLGkcZw1S5HxwGHa3S6yX9pAo8INriGRC
 tG3FrGukZPpr5MjJ4PBQCtCGbmP9rCTAqBlZb0eGnH9Tmqsf4sjHtm4ue0x/bMSa3h8u
 0RauVCN905teJnWjhKjK30Z/s16gdJZ4JC0fxJ+qF9ZUx+AVaIe4k+O4SCu7670Velp9
 QTBMlBMAdx8AyVO/5cHHxRPIhgIfDOvt2o6y0vfgCl86pswOqrNelTre+90+8n9NmvVJ
 4tiA==
X-Gm-Message-State: ACrzQf2toKOwyhfK/xOT1Cq1iHcYPvNdJH6p6UE5pqdCIZIe0l9xR47d
 V0DL+RLpZT5X+KlAfOrknw==
X-Google-Smtp-Source: AMsMyM42oLN4Lsz9nA0FiglN+3/h2Vck9CaLP4Kz+0lcc3iP6YyxEmq4271U8YGHRRybBtuefJClIA==
X-Received: by 2002:a4a:4847:0:b0:443:347d:6617 with SMTP id
 p68-20020a4a4847000000b00443347d6617mr2179371ooa.94.1664487265644; 
 Thu, 29 Sep 2022 14:34:25 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w92-20020a9d3665000000b0061c9ccb051bsm184987otb.37.2022.09.29.14.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:34:25 -0700 (PDT)
Received: (nullmailer pid 2750589 invoked by uid 1000);
 Thu, 29 Sep 2022 21:34:24 -0000
Date: Thu, 29 Sep 2022 16:34:24 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: display: panel: Add Samsung
 AMS495QA01  bindings
Message-ID: <166448726388.2750529.4671119627643773426.robh@kernel.org>
References: <20220926164333.7485-1-macroalpha82@gmail.com>
 <20220926164333.7485-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926164333.7485-2-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022 11:43:32 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Samsung AMS495QA01 panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
