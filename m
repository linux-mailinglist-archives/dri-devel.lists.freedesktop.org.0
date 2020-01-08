Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A74134E4C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6222A896F7;
	Wed,  8 Jan 2020 21:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9FC896F7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:01:31 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d62so3927887oia.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 13:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cfgEMc+35hwGrpRDO6jOoEHppPRh3rhAd34tDj1m5RU=;
 b=ruRXKWg7DufKP+hzbYrBuBXJscgqiCkcqrW+N3KYi5Gq88UsEdJ9bZz+SVEW74if8k
 csCGuubVLq77D7dDCIcZ414zL4pYTRuf9e4pSuwvrzEAIt08b8MUC0TDb+vyFPZqC8Cs
 vFX8mmhwAppsXLm5HoJZmlx4jzcks1Yxnz4ETea1zs2c2qH5Xmy3LWD9iU/Dq1P0g3XB
 g9CRz+Etv4eJNG0NZAnFU7mg8N612h73kDdeI6sDm8F8uThUusmV/1dsM4pKRGi19baI
 +aSQujVL7xo1nL0x3wsckvnNiBcaK81DiSmefXoxIAuEOBMirLFlMny0Y0WfVM1Cckcb
 7Xog==
X-Gm-Message-State: APjAAAXWt3PTHaMKH6ZnQ4s+nKG+Z9mL3aduz0PKOPkksl7SeIOmuOUw
 v3TxX0AtbGonCy9VMNegBWY6Hhc=
X-Google-Smtp-Source: APXvYqx3IZ1xSAlu7Es/KBrvpzOYyJANvdgzYnzjVvazd9QBVchX3PN7Few17duI74j/TyhCwHxouw==
X-Received: by 2002:aca:d502:: with SMTP id m2mr413894oig.41.1578517289606;
 Wed, 08 Jan 2020 13:01:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o20sm1456230oie.23.2020.01.08.13.01.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 13:01:28 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220333
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 15:01:27 -0600
Date: Wed, 8 Jan 2020 15:01:27 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20200108210127.GA17138@bogus>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 07, 2020 at 04:59:56PM +0530, Harigovindan P wrote:
> Add a compatible string to support sc7180 panel version.
> 
> Changes in v1:
> 	-Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	-Removed unwanted properties from description.
> 	-Creating source files without execute permissions(Rob Herring).
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt

As I send in v1, please make this a DT schema. See 
Documentation/devicetree/writing-schema.rst.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
