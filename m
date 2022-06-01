Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C253AE69
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 23:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCC510FBE3;
	Wed,  1 Jun 2022 21:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF1210FBE3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 21:07:22 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id m82so4201181oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 14:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EgAWTkUmqGAnkiE2aLxnJMzWI8jM/VYbLhJYY+UzZ80=;
 b=18QdwopLtBNVaQNzS+QkM+Ih/sUp1GnfL8Zk7VecGm24QB5HvuoAxoFTb93BQRPwYw
 y1Xia26Fdm2TobjY9MMZ8wFp7do2XZsugRrjNIj/ngoU50N2HmBucPZoubavzb4VF4SV
 cFH9PmY/S1bBqJ4vEcX9FtmDtGoQ7Zcakg1cTzVvulXkmZp0Ltmogo3NCQLxvBD/rLx2
 qgUL5rMBZrrmnXmXl/BQUOSsYt/J0268m7aw1qW/qXG55rZjtaQD83QzoShgqAp0hY7U
 /0O4B0xX1lDLLfBDmT9lk8+miJ7kJJO9GKGkgxosX7HXIahqoDgPEjykYdyUjXhLG6h7
 L56w==
X-Gm-Message-State: AOAM533LmgFNVThd58R1l+iNHdRGKPuETIOjLjMtqRa9ig2UYfVWDm8v
 9bxJLiaY5rFPrSehiMPPtw==
X-Google-Smtp-Source: ABdhPJy9a/TpoRFRLjro4OOH95o5CU7UkJeH8c+s7epUnV5gpT30Wh3CCrHSPrZmipZHjFqJazrHrg==
X-Received: by 2002:a05:6808:2129:b0:32b:f7fa:be51 with SMTP id
 r41-20020a056808212900b0032bf7fabe51mr830004oiw.42.1654117640238; 
 Wed, 01 Jun 2022 14:07:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 kw38-20020a056870ac2600b000f32c6b6871sm1224550oab.10.2022.06.01.14.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 14:07:19 -0700 (PDT)
Received: (nullmailer pid 453614 invoked by uid 1000);
 Wed, 01 Jun 2022 21:07:19 -0000
Date: Wed, 1 Jun 2022 16:07:19 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: lcdif: Add compatible for i.MX8MP
Message-ID: <20220601210719.GA453556-robh@kernel.org>
References: <20220519114849.69918-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519114849.69918-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 martyn.welch@collabora.com, Alexander Stein <alexander.stein@ew.tq-group.com>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 13:48:48 +0200, Marek Vasut wrote:
> Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> and is completely different from the LCDIFv3 found in i.MX23 in that it
> has a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space. However,
> except for the complete bit reshuffling, this is still LCDIF and it still
> works like one.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: devicetree@vger.kernel.org
> ---
> V2: No change
> V3: No change
> V4: No change
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
