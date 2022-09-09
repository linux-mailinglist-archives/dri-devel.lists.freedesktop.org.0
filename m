Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D4F5B2BB9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 03:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAACB10E131;
	Fri,  9 Sep 2022 01:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166C10E131
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 01:37:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so202658oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 18:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=9P7SbJHsQcB09ZNCROJ+/JJl6FCz/X01hfKdSqlhUDs=;
 b=28c5xx0cnctmt4KEsRyGGMkGhIARp8SDE377bFsyc1KZaSDA098W/6wC63wVrld6d8
 ubVOTpjpHwvXuK8bQebVDtU3iUkGjs/Pvu2WgwPb1q1steGTd15HYpuMePwM7648ogbv
 rYeQOajdHoNC84HH9mF43T4ukg7+WgYCEstpLBsugkE2BEnd0SouBRCpc0aap6j9ytJ6
 PeTfu/fDVhQbK85qAz2DKPDTnfJSj5iIQOaSb8DxrSHKFkjFPy87WZ7HqmfXrFoZsJoQ
 CqZvMxsykA0a//uvNdgGb9+dEvTxj6ho1v3dIkeau+eM7QGigYIDjxJ/MsNMOVq0lY0w
 v7Cw==
X-Gm-Message-State: ACgBeo2D3D2HYpdOPdrCO5nESjXTo8EgRtmfHCz7AenCI608m6aVJ3ek
 wf3+WE9AOHzfPHPBPgWIhQ==
X-Google-Smtp-Source: AA6agR7FHZV8qpLG/7i/J5AK8MbPTh7kdIjK0mzVUG37dxSM2DfWv7GpTEqDN7btr436lYC9Nmd1cg==
X-Received: by 2002:a9d:17a2:0:b0:63b:1f99:86ef with SMTP id
 j31-20020a9d17a2000000b0063b1f9986efmr4227212otj.213.1662687476611; 
 Thu, 08 Sep 2022 18:37:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y3-20020a0568302a0300b0063696cbb6bdsm322175otu.62.2022.09.08.18.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 18:37:56 -0700 (PDT)
Received: (nullmailer pid 3736918 invoked by uid 1000);
 Fri, 09 Sep 2022 01:37:55 -0000
Date: Thu, 8 Sep 2022 20:37:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rockchip-dsi: add rk3568
 compatible
Message-ID: <20220909013755.GA3736867-robh@kernel.org>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
 <20220906174823.28561-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906174823.28561-2-macroalpha82@gmail.com>
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
 airlied@linux.ie, s.hauer@pengutronix.de, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, linux-phy@lists.infradead.org,
 pgwipeout@gmail.com, cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022 12:48:19 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The rk3568 uses the same dw-mipi-dsi controller as previous Rockchip
> SOCs, so add a compatible string for it.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../bindings/display/rockchip/dw_mipi_dsi_rockchip.txt           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
