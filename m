Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29E596102
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE210EA60;
	Tue, 16 Aug 2022 17:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB22B99F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:22:48 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id o14so5692984ilt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ZHnZl3ym2vIb1DqfF41kB+hOU6xwc5iPv4rLrgAJ00k=;
 b=UvWV2Es4gX0gFpnsXAstr/V/Brlrt6rbx3CdNe4GJfza4d7qMXLQDuZ0sBRgcE3EyB
 VxAfTYrtHSQsAIhP3c7FnNgjFay1V8XCyA+dNizWtUhj6y3FsReTsBJ5rU+ZVRM5eOO0
 +yAQkSIgrJMbw+W3EKuJIPbtyl0E3q6vVN7FsuvmEdTIWmw4l2dY4YCKHCbTIGV8tNTG
 /DEcLXUQFCb7tJNd3ud7q5U3mh32TiRRtRLRhItj45IATaZ/MqOuYZy2GJAOTODW0wxP
 T0LHwKcvnGKuJDs6CExi04R+gJ0GLxs4D3ipmZpToldwYt0kk4faIeH5VxaMLpcPV8Ap
 zfOA==
X-Gm-Message-State: ACgBeo0IH8UCDteMlvudu+qZE5OT3tCmp6rW+ZmDUIlXFfsOWCqGmLLQ
 wN7eRaHCf32SWwJXM62qeA==
X-Google-Smtp-Source: AA6agR5b2ckymTX+22qn74lBza90/3D4mUGYoitkuvx5tJHjF24DOixmA4nX+DorvbKrPOApYJ0+Lw==
X-Received: by 2002:a92:cbc4:0:b0:2e7:147b:6f7 with SMTP id
 s4-20020a92cbc4000000b002e7147b06f7mr1157509ilq.174.1660670568228; 
 Tue, 16 Aug 2022 10:22:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b0034343fc4fdbsm4698925jas.44.2022.08.16.10.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:22:47 -0700 (PDT)
Received: (nullmailer pid 2407941 invoked by uid 1000);
 Tue, 16 Aug 2022 17:22:46 -0000
Date: Tue, 16 Aug 2022 11:22:46 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [RFC 2/4] dt-bindings: phy: phy-rockchip-inno-dsidphy: add
 compatible for rk3568
Message-ID: <20220816172246.GA2407886-robh@kernel.org>
References: <20220812143247.25825-1-macroalpha82@gmail.com>
 <20220812143247.25825-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812143247.25825-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 kishon@ti.com, linux-rockchip@lists.infradead.org, vkoul@kernel.org,
 robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Aug 2022 09:32:45 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a compatible string for the rk3568 dsi-dphy.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
