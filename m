Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589E2761C7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 22:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038656E9F7;
	Wed, 23 Sep 2020 20:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD726E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 20:15:19 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id y2so907808ila.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 13:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=deoXjiCPJcgqhdsTvaj4st28nR1WxDgki8dvwLYWvok=;
 b=poz1BKgRuX8/9cAZwEQ+88WediflZtSrTg8kQcEdFGIZGAD+dU+dTcKWHKlVE8XGYg
 iRe9s33atr7V/lQjCUgnxmPg/ol8f+FMGcvozsh+XDev+oFLBtoSl2TGWgkG5zunv/na
 togfllH51Goh+n0pjUtauUXII5vEwFz4HfkAthxp8pk436By27zrlwsjY2TIojjJFyGx
 uKpla9UN2XIHVArohF2H3i4jcXZHA/PJeI6HcCIF5cIRIHwZUuOMvAr+y5XFcVah6dxR
 f15As7QtTpQu0jtYGQWWcCd+3xnjfT2eOZActFN88deTgjBStm9pnmsqLAZarGjwdjW2
 fiqA==
X-Gm-Message-State: AOAM532vOUdyv8qWwG46u5cWhVpqpaZCbm/Jeav6WI7wyc43i8EWZY94
 HtJnKNB4jyD0F6An42s8wA==
X-Google-Smtp-Source: ABdhPJwaDK+zaodGN8kVQe2lXZuX+7m1JOY8bAoUaOFpvDMwzBbr0i3tjfuCtDUP871BlwHOy+AaKQ==
X-Received: by 2002:a92:bb0c:: with SMTP id w12mr1270941ili.199.1600892119215; 
 Wed, 23 Sep 2020 13:15:19 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id t14sm361989ilj.45.2020.09.23.13.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:15:18 -0700 (PDT)
Received: (nullmailer pid 1227032 invoked by uid 1000);
 Wed, 23 Sep 2020 20:15:17 -0000
Date: Wed, 23 Sep 2020 14:15:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v2 PATCH] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
Message-ID: <20200923201517.GA1226945@bogus>
References: <20200917073305.25738-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917073305.25738-1-jitao.shi@mediatek.com>
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Sep 2020 15:33:05 +0800, Jitao Shi wrote:
> Convert display/mediatek/mediatek,dpi.txt to display/mediatek/mediatek,dpi.yaml
> and remove the old text bindings.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 97 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
