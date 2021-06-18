Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6C3AD41E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E346EAAB;
	Fri, 18 Jun 2021 21:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7166EAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 21:06:20 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t140so12033605oih.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F22AKDNL3d07Kxi7bAvLGrzvtDt3Ggs0m0nDR4Vfnrk=;
 b=DmSVBEa00E2GcVFIE1Q/KPTkRMlkdxaEYK8fjaV6bfgCphLkfH5GlneptQoo3MedCC
 BMYZTfxW1/ExIpm/0XO0lxImwys1KiTVIJLsj+JwO3/Z79PN95vY2hE9ynxjBLn8S9jK
 5nfYHJaND9rP69INdh3yqIn8G8RqjK/mFqJVWXI4kWZleKAp93M8CRnP1gvhCxkTgoJb
 0Hx0DmKf8xfAGAAuF1+AmuIX2981ZB+8K0UzTY0q0iP5an5uLgsnBdvC1fYWTeCTzw4s
 wCjv3vbl2zD9M9g418qo8//sNSVKw5S7x2gFsTdIdAAI2nll1doITCgT+MlbYe+snq1l
 lxUA==
X-Gm-Message-State: AOAM532x1BaNKoqj5hAahxPQvz5DmOoHKvyc8p1w8QBXulzEydbpTV9E
 SRxieVh6weGgHhJXWSgkYA==
X-Google-Smtp-Source: ABdhPJxJZLUHgtZu7sTq3PAbrobAWO/1QnPSMepIbgPrF28rW+Vr/C9MDt7TspFK7/RwnzNGmtYu0A==
X-Received: by 2002:a54:400c:: with SMTP id x12mr15730026oie.89.1624050380272; 
 Fri, 18 Jun 2021 14:06:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t3sm1647263oic.48.2021.06.18.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:19 -0700 (PDT)
Received: (nullmailer pid 2873797 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:13 -0000
Date: Fri, 18 Jun 2021 15:06:13 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210618210613.GA2873750@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609121050.18715-2-o.rempel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Jun 2021 14:10:47 +0200, Oleksij Rempel wrote:
> Add Logictechno and Multi-Inno panels:
> - Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
> - Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
> - Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
