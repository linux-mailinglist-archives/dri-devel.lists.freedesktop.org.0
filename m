Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1763E97CC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 20:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941E6E1A2;
	Wed, 11 Aug 2021 18:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7E56E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 18:40:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so11144553pjs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YgL5QZA+nttpaayeuohalxKILerIeWnfwKqrpAxGEV8=;
 b=RbkihDirh22oVNSReXYhvj6QU3Or3IHs0L/fIG3O23e2mPGvLJHdErn16cHir9uTZ2
 MYObhPO7H83/D+Qob4ef3bj9t6xL2afPjPPo/xIqLyzYlVnRnt5sEO0sX5zndfxzUbxh
 60iu+wORTb4RK3ujjFsbIqTH4f4xaaP89+g2A33w9pi2VqYJiblYW1rk76da3E6l9XbR
 Jx+l2kIe5OenXLufQ5+Uxzgi0T/xG+r95dPELyOmfvK5Nqs2PZFpGgEQM2JuCSHYXFNq
 sck94YkvwUeWdUQwnzaQ2pfCLMzCt/WRSlTtO8iHG3/ZrKIlJG3z20atbFiPfT+4Mk6a
 TuoA==
X-Gm-Message-State: AOAM533W7ZEwifpRn7Jcea61Q9zVX1Kom/dAAwRpBfRdQugJhzgNnIdW
 q0Hb5C6gvoPWv/YnJ7J6dK1nYkevDA==
X-Google-Smtp-Source: ABdhPJwnahoo1EM8pHpP+QSc3xuGsCPXqSQ/jRidO7xuzVac8Xmgh3XG//7qIy7NBtmcjC/sj/1XOQ==
X-Received: by 2002:aa7:9906:0:b029:3c7:a6a1:c73d with SMTP id
 z6-20020aa799060000b02903c7a6a1c73dmr199239pff.1.1628707241447; 
 Wed, 11 Aug 2021 11:40:41 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id d9sm224216pfv.161.2021.08.11.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:40:40 -0700 (PDT)
Received: (nullmailer pid 67452 invoked by uid 1000);
 Wed, 11 Aug 2021 18:40:36 -0000
Date: Wed, 11 Aug 2021 12:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <YRQZpGn/+XfDy4Gj@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-3-o.rempel@pengutronix.de>
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

On Wed, 04 Aug 2021 06:34:38 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
