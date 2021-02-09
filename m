Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EC3155F3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 19:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0289304;
	Tue,  9 Feb 2021 18:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16DF89304
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 18:31:42 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id c16so40600otp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 10:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGlaQiCrkS/pfmikGaky45h5FdObmTM7r7/TdtHHYjY=;
 b=ruSEXAmEBUbEcVEp+JCD5bXdTbfYsElbfYl4H0SndTBfGS3mV5uJ0SIoGo2cfXCDd7
 JXOulWLlRbDUiOenL/0WnbvXg+9vgEfu+nK5LF0bm4fG635dPU6Dquy9cp4AjBhFTmvs
 0TZgB49nKBc8DkRM8XWTQC8JMBSruTc51LRAiWBHZd0nsDtarZyq5ubDrOeFPqu651Yx
 7hRBVIUzwYGASK26NzD8fm/tpBt90AMW4+433y5FXZbfqSsJ5Xgm3WFFYIGkYnWmDTg5
 4Yo2a9V1PQXCqi/5ZStIUyLscR6XuCML+HPMRIHcoeIadBmHzm70fT42VekK5fSNvVG+
 fSzw==
X-Gm-Message-State: AOAM533F3vxBR22gLvMC/CHmumlEmOxyXVxzTfTB6pNXUlX5JRXD90+v
 QGeGxkpKyOgP8WqfeDYXYQ==
X-Google-Smtp-Source: ABdhPJzm06lWmZKudWGvyQBUFR55324LPYHa8dAIQmNX5vOCBWP1mwgX2hra0dPnpwDKnBFLhUXJnA==
X-Received: by 2002:a05:6830:1481:: with SMTP id
 s1mr5490608otq.206.1612895502055; 
 Tue, 09 Feb 2021 10:31:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r22sm4507917ote.12.2021.02.09.10.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:31:40 -0800 (PST)
Received: (nullmailer pid 4102619 invoked by uid 1000);
 Tue, 09 Feb 2021 18:31:37 -0000
Date: Tue, 9 Feb 2021 12:31:37 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
Message-ID: <20210209183137.GA4102564@robh.at.kernel.org>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
 <1611737488-2791-12-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611737488-2791-12-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 16:51:25 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Drop 'fsl,syscon' property. (Rob)
> * Mention the CSR module controls LDB.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> * Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)
> 
>  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
