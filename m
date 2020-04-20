Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40391B150D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 20:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468B6E105;
	Mon, 20 Apr 2020 18:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776D26E105
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:46:41 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id q9so2427942otf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dJDN6ZSVBrwBuPPhD+aSfFRw6fiy4PnYxRMXPYH5eJE=;
 b=m5mEqpK5C4FTo9EbMjy9JUFULmlcrU4OLy+7OuibNBESgJrreibODhQdnRWq2YV3Iu
 t7cwACE+kbO5MQ3rKy578zK3Gbu0dZ3Xil7bGOvUGD0ZOBgak+CAsZfOMQr3rxV8zPNX
 fS6/wVzklA54K5usy2GOe8iKeHgx6UlmmLpFh/oXoC8iTFkWzTnFjNvPZehjDT1ar1sX
 uvsd+nTanbPKNoR+W8Bp6KreW3RygNlkUmDYLTrV0Lz6EHV6wDhbsqS/wJqffL/sdbU3
 1nznTrAm774tYSfkYhlFcBWxVbXSZg7MRlOibwmz7J0W7/Yat5EFISE6keOJNABx2D34
 S5Eg==
X-Gm-Message-State: AGi0PubmYzCnCt/k5z+ZmSp7XOBL5aojdTKHTH3AgxJ2M0Cb8dwDRa0D
 ztR8arkXhFKo1xLOVaUnwQ==
X-Google-Smtp-Source: APiQypJKBNzrWvr1SWwVwphT9YqgirBWXMbyZeBvPDgavXh+P8/XkilfFXtYjOgYCLzIiuXOqrckdA==
X-Received: by 2002:a05:6830:1e45:: with SMTP id
 e5mr10543687otj.236.1587408400603; 
 Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q11sm61919ooc.19.2020.04.20.11.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 11:46:40 -0700 (PDT)
Received: (nullmailer pid 27429 invoked by uid 1000);
 Mon, 20 Apr 2020 18:46:38 -0000
Date: Mon, 20 Apr 2020 13:46:38 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200420184638.GA27394@bogus>
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
 <20200411074408.38090-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200411074408.38090-2-jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Apr 2020 15:44:05 +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "drive-strength-microamp"
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
