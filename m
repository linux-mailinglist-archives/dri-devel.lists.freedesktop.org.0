Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A5317116
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 21:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68036E3C4;
	Wed, 10 Feb 2021 20:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC946E3C4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 20:18:59 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id k204so3523683oih.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1V8t5Prsyy8S7mj+k1iwfG7SFJZpLRdBoSrJSVmZLDo=;
 b=MlLVXt7l/0CWR390LGhe0SgcSaidiXB1xBcKHqJRqqLIqj6O/TjU6xmTuFmv2qyA7o
 9qFJ0BOv3L5Gx3cKi4GwDGifNVGtQxbDSwm3zym67AhyxnD7At/PRExU6LBo9uMe0McQ
 EpilrsF7CuV4L5zmMOyn5RQZ4RmPlSfqtJ5tYMf22pLELed+HSBQ/uLIWxMDkKaCLEqY
 F4PwV0Q+/7KfiB7b5kW2NekxwDx59AYsjYMKQntNBLygYEuG2GkT0eJuK99UMKWQxiup
 sRvs9XrEydOueEPblpKSW5d9ATey4xGQ/OrEcylDBsFtvkuTYg7zY0jGjYJzxN0/IW39
 b2aQ==
X-Gm-Message-State: AOAM533ZzP4XjEQQyafCd6B6ZiFDxfYWVcwlfDttkP1oA6CIhs/zJ8Cy
 kbdqhxQBQODRPjevDHMpHA==
X-Google-Smtp-Source: ABdhPJyuS7VjbrxGJVv3iJ/xTI1HQADlXtLQ4n+iMb/j+EHT3Wlzn5vWyImtbs3aFTQgWbK0PwMUGw==
X-Received: by 2002:aca:c545:: with SMTP id v66mr532401oif.116.1612988338560; 
 Wed, 10 Feb 2021 12:18:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l133sm654257oia.37.2021.02.10.12.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:18:57 -0800 (PST)
Received: (nullmailer pid 2690216 invoked by uid 1000);
 Wed, 10 Feb 2021 20:18:56 -0000
Date: Wed, 10 Feb 2021 14:18:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek,dpi: add mt8192 to
 mediatek,dpi
Message-ID: <20210210201856.GA2690160@robh.at.kernel.org>
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208014221.196584-4-jitao.shi@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, shuijing.li@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Feb 2021 09:42:21 +0800, Jitao Shi wrote:
> Add compatible "mediatek,mt8192-dpi" for the mt8192 dpi.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
