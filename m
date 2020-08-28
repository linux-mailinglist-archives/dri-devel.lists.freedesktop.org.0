Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A938F256290
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 23:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC936E0F5;
	Fri, 28 Aug 2020 21:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4966E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 21:41:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l8so534217ios.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mS4Zu08qQZpZXMImrRzIfdT+5oFEqMPjqg/4ZwW6vpw=;
 b=PgpBegfIZTUSZjVR8WGsb0F+m+GP3xUkhtLYZlxgVWouD7PuRwEfMDhDli0jWo7Pay
 quhvV25Ea5y2mlFtOmcICeysl8rw+CnE4CySyelIu0OxUnddp+lnmW8AmCUD8rtBCPIa
 G11D27jgq7Cc2Uwh5hz5vemqhCr3s/uBrWLSie6SStABIEwVHp4tODJoUEigdj5tOd9N
 wpp73mlbSAx2p8QThdz0UnRvEripsL2WurZ+nZtLSuu/PnmNXwXZxDaUhRSx7AQg4EfB
 rmvo1BoaC3jiC7n3yMyVwBoqnqpSKO48Z8j9lu7skaE3q+0MjIL4BcEp2itF+R/dECfH
 qCBw==
X-Gm-Message-State: AOAM530N6OlrrUgQARPu/TdiqRiHr10wwY3M+kjhKCUZ1KgmkrdAEL7d
 l+mWo5gZjOzIX7PbQ4uoOg==
X-Google-Smtp-Source: ABdhPJwOj6BZZBaf0EDaLZohN5F7o1+QFYl6wqAXpILr7Io/VbZMByRExEnFwRSZL8c77C+W1L2ScA==
X-Received: by 2002:a6b:c997:: with SMTP id z145mr613456iof.136.1598650859348; 
 Fri, 28 Aug 2020 14:40:59 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id i10sm198351ioo.49.2020.08.28.14.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 14:40:58 -0700 (PDT)
Received: (nullmailer pid 3448918 invoked by uid 1000);
 Fri, 28 Aug 2020 21:40:56 -0000
Date: Fri, 28 Aug 2020 15:40:56 -0600
From: Rob Herring <robh@kernel.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/bridge: nwl-dsi: Document
 video_pll clock
Message-ID: <20200828214056.GA3448236@bogus>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
 <1598613212-1113-3-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-3-git-send-email-robert.chiras@oss.nxp.com>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Aug 2020 14:13:29 +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add documentation for a new clock 'video_pll'.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: mipi_dsi@30a00000: clocks: [[4294967295, 163], [4294967295, 244], [4294967295, 245], [4294967295, 164], [4294967295, 128]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: mipi_dsi@30a00000: clock-names: ['core', 'rx_esc', 'tx_esc', 'phy_ref', 'lcdif'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml


See https://patchwork.ozlabs.org/patch/1353197

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
