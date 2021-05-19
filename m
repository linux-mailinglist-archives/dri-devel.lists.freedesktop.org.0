Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FB3897D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75256EE89;
	Wed, 19 May 2021 20:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24E6EE89
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:21:17 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so1712570otk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvlLvoBclCDrgerZoN2kUifuo6+qRvAzD4p+vHWf9lw=;
 b=e1S+E6A0Qw7Vh/Yfg4nCsJh+rdkgUwHqYf3+SZWHS6+ttz/dBgo+JFwct2CBrsYRcd
 53xCsnd7CKd7Gdxi3Rf/sVJkEbIZsUJC3xDNoB2vVZFDqdc6l6XR4b0Q3TsZO1L/l3wc
 byM6weQz4Hqtv5BCM9Ja30cOCQZnTqYlNmiEbBGA/B9IvpgI0YlvBfKIWUdaahjbn5Wv
 N3UMxc6BUlMiM1yUPmMHpEqmb8dRRtB9KTJip38w7vWwX0+SNRleRepSmaLFirFq0fFe
 MmIIX7+eE2r5N2EcsPhYpcAlgU8hFevy4KLJrEkFkRdI50Joez7mCfPqEhjpOczsgnYj
 FXNw==
X-Gm-Message-State: AOAM5332Nhy1wsLVOgNMt1A5+q0RSDDz6hsULzLTDo46gN/UtkbVIIQ/
 rKP1l+p80VuATgwhmhIz4Q==
X-Google-Smtp-Source: ABdhPJx++yl90zVKRdi3iZxZSviC1LWSXM6PVj1zj9ra7Dq5mSBR1BKrsnV/efeQLRqPmz8Zu4b1KQ==
X-Received: by 2002:a9d:269:: with SMTP id 96mr1061313otb.222.1621455676488;
 Wed, 19 May 2021 13:21:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q22sm158231otl.11.2021.05.19.13.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:21:15 -0700 (PDT)
Received: (nullmailer pid 3582732 invoked by uid 1000);
 Wed, 19 May 2021 20:21:14 -0000
Date: Wed, 19 May 2021 15:21:14 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: simple: add Innolux
 G070Y2-T02 panel
Message-ID: <20210519202114.GA3582681@robh.at.kernel.org>
References: <20210518071555.9785-1-o.rempel@pengutronix.de>
 <20210518071555.9785-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518071555.9785-2-o.rempel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 09:15:53 +0200, Oleksij Rempel wrote:
> Add binding for the Innolux G070Y2-T02 panel. It is 7" WVGA (800x480)
> TFT LCD panel with TTL interface and a backlight unit.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
