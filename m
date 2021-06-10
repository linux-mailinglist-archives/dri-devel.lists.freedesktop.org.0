Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B413A303D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CE76ED85;
	Thu, 10 Jun 2021 16:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5236ED85
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:09:42 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id v22so2674988oic.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GhsPTw5SnruFBaMx+M1r90LoKZoI0cqIaAa/EWKANFU=;
 b=iSgyiIMi+4W2BscSfzWLuDI5XFZcD7qZbReNRpgYOvXS19WTKVg1U8ilXJ//R25+aP
 aPRXNxjJNZl4oMplppddruOOmeuHdepNwans7xHYh6NEJSy42v0VGd2qKA3tnpZ/pvy2
 LJ0ZRAFssaQRJhbpBDrClNjGh3BLK+obAI6M51SC5X15sen8ehcXaldFazIT73wUHHav
 1lPaGqwNOUHFoGu5NFIHog53KkfiV6kcohLQ7Mtye9Yzs2zHIDxiZ6ANI/RB3xJJqVb1
 OA3CbLwy/2BiVPftglTTGYvfInTV7geI+AEwrud/IbF2d0/7BJlaND3unL9H5CVxISRl
 UT4w==
X-Gm-Message-State: AOAM530/9lEDf5wC8sLKXMxPQ0uS6wyf0kQWfTJrvuXdSA048rE/4aMQ
 /Lox78SxahG8jIK1MnpwVQ==
X-Google-Smtp-Source: ABdhPJzijwvKaGNoxrqiumLhAiSoTM8eRnIU14P7RCNKjv9VMAPg2uOgjRkqg1TCeOQoy7kCTCAb7Q==
X-Received: by 2002:aca:4b93:: with SMTP id y141mr10926946oia.86.1623341382059; 
 Thu, 10 Jun 2021 09:09:42 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id k14sm606556ooi.21.2021.06.10.09.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:09:41 -0700 (PDT)
Received: (nullmailer pid 1898690 invoked by uid 1000);
 Thu, 10 Jun 2021 16:09:36 -0000
Date: Thu, 10 Jun 2021 11:09:36 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V5 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <20210610160936.GA1898277@robh.at.kernel.org>
References: <20210602203608.419192-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602203608.419192-1-marex@denx.de>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Sam Ravnborg <sam@ravnborg.org>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ch@denx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Jun 2021 22:36:07 +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> V5: Move the pclk-sample into port@0 endpoint
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
