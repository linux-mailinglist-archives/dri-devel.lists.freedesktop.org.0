Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AA2D51C1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8546E54C;
	Thu, 10 Dec 2020 03:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9936E527
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:46:29 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id x16so4280501oic.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0lIoBaHOJrOY1VplMmKl27/uPfnqTjcXmVosBasviL4=;
 b=BGlZLHfnx6dwsPl7/Amp88AI2Juz+TTULUBshfC732L6lxlu9Zm3EPc26ZR6l5gSfZ
 NZt0vK22SynknWQwK/7OEYCHPVQTb+UHJGDGJxZ2yl3lsqr0aVFFU0lK2lScridsT2Xi
 aNpP1qQtvI4giqKvYsf3wvWShhCZiEv5k727OcpTTKiPb1kTG3ZxDeBeqQJfgSZiZYLp
 qd/ytpkN7GbfT2byncctn11JUj9cYi9OOJ3LvoZwqfvB5Dsbj3/OQ8mY5za3r+hbxCfX
 oEG5Xh73L7RMmgdCjMGNivPIjawTKBbiT6wGvGNse/TIhsl18TG5epqAHUWL9AGmBlZo
 ePYQ==
X-Gm-Message-State: AOAM531CpKIzxgCwggjO8KPmMvUiLU609TWpqQAZBc+qq6hlIWHLCVz0
 C89LMNo+CykPaxj7s50UrQ==
X-Google-Smtp-Source: ABdhPJyGZlnSNvYCwiTe2l1IEwRNiLgMj7T9+rC52qQq2RqKMS/ajKGbFA2joi3/M+4z0TDO0uw2iw==
X-Received: by 2002:aca:b9c4:: with SMTP id j187mr4175918oif.157.1607571988880; 
 Wed, 09 Dec 2020 19:46:28 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 100sm893058otm.27.2020.12.09.19.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:46:28 -0800 (PST)
Received: (nullmailer pid 1619988 invoked by uid 1000);
 Thu, 10 Dec 2020 03:46:26 -0000
Date: Wed, 9 Dec 2020 21:46:26 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 2/8] dt-bindings: display: simple: add EDT compatibles
 already supported by the driver
Message-ID: <20201210034626.GA1619939@robh.at.kernel.org>
References: <20201207140939.31297-1-o.rempel@pengutronix.de>
 <20201207140939.31297-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207140939.31297-3-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 15:09:33 +0100, Oleksij Rempel wrote:
> Some EDT compatibles are already supported by the driver but will fail
> on checkpatch script. Fix it by syncing dt-bindings documentation with the
> driver.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
