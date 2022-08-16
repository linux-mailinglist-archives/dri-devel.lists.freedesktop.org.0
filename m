Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449EB5960FE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20BE10E85F;
	Tue, 16 Aug 2022 17:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57611B5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:22:36 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id 10so5285131iou.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/xhUo44Zl18mAMZXi1Y6It/0tN5VB4Fd1x/4Rex+VMI=;
 b=BzudiQT85xoqiUc0hT8pmaAUkiA3hzY+WvTvFHF1ldjgchGWamDQmQrbJC13OChEns
 /yneTA4QBixu8bl5aCfd9veBcRE8vYZyoUZ+5qAYm7QT8ZMR/3CY8pxTF/lGcnQWKyF7
 B6Lnzb+Zs50GwhGt67y3F8na9P5uCQJyE6tSopm0sqswRbrW3quxYGe+isKzka9Cv+Us
 IKlSan6oKCy8K4JWJjgp9ET6tvjoxBTRCyHXFdDGSESMqv38qinWXXE2O9B4/QBz3l+2
 vQugWtDf49r6kWN28LE6BRo9qA6JiMd/2eJPKRN686ifiYfOwhQiLNeV0MVGcy1GQcSN
 +kEg==
X-Gm-Message-State: ACgBeo2kT1PJ2uhg5nLEcz5mKBHHLVqZza8dmWCGeT9aRD3tKCkkFI7K
 AJ3Euc8bDr8M0Fw0oASFncydosXC1Q==
X-Google-Smtp-Source: AA6agR6hai1iYY0BGT9NpHe4tBpKi8DBQVs6OJHwV+WiBW3KtHVEUBGb218+cvyq6Xk1Fsgg0ZZCHA==
X-Received: by 2002:a05:6602:2c0c:b0:669:c1a9:245c with SMTP id
 w12-20020a0566022c0c00b00669c1a9245cmr9354129iov.218.1660670555746; 
 Tue, 16 Aug 2022 10:22:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 p135-20020a02298d000000b00346ab331d24sm929055jap.73.2022.08.16.10.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:22:35 -0700 (PDT)
Received: (nullmailer pid 2407468 invoked by uid 1000);
 Tue, 16 Aug 2022 17:22:33 -0000
Date: Tue, 16 Aug 2022 11:22:33 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [RFC 1/4] dt-bindings: display: rockchip-dsi: add rk3568
 compatible
Message-ID: <20220816172233.GA2407435-robh@kernel.org>
References: <20220812143247.25825-1-macroalpha82@gmail.com>
 <20220812143247.25825-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812143247.25825-2-macroalpha82@gmail.com>
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
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Aug 2022 09:32:44 -0500, Chris Morgan wrote:
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
