Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D42F3330
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46B6E23D;
	Tue, 12 Jan 2021 14:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E9B6E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 14:49:24 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id j20so2473470otq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 06:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IWLlMkimtheXRJNfeaVYATyzETTt3j5yVq4Hw+rVSck=;
 b=Ovv4L4Vn3sGiPiQ5+zA886HcqV/YHK9WOs0WhOmAAvH9C/2iImyKtmyeJR08zTe3hx
 wikvbdI3HeZDZQEg1lBqr/7kPJifIIMQ5uYqNSHs1p3nO3FQK7EUzwu8u1/fDwlivKpm
 bbHe8NYiAlN2WBdh2OVAh7zFyQ9VPKswtKc1gQlVZwfOojMtopvAIL8lpQ7k5Rd5AnR/
 NwDz1ZKeXZfXk7K/nGZ0i7QSAz4RoLQ04bf5u9Fw2pgN9vsNRAjKpFBVPDNM4NwCvIJV
 JDRsoPVqUeQ8yUBuNiPLCYaeZNbpdaEvqqb41s9EoBK5C8BxzIS58ZBoCPldfDCYMWXs
 JBhQ==
X-Gm-Message-State: AOAM5300g2fIBO63DHNdJMswI84vwAESyqTEzXiXpE1Fj71P/ZxSNd6c
 yoBOTiytg7j0Ci/zj+TeNA==
X-Google-Smtp-Source: ABdhPJy/6PT7DRQYGCTDug44TC+HCUic82SM9VAH6YLosWT87BKziW7GDMmDCgyuqvhV6ddUJ7BRzg==
X-Received: by 2002:a9d:4b19:: with SMTP id q25mr3080599otf.124.1610462963625; 
 Tue, 12 Jan 2021 06:49:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m29sm607648oof.20.2021.01.12.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:49:22 -0800 (PST)
Received: (nullmailer pid 330261 invoked by uid 1000);
 Tue, 12 Jan 2021 14:49:21 -0000
Date: Tue, 12 Jan 2021 08:49:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
Message-ID: <20210112144921.GA330210@robh.at.kernel.org>
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Jan 2021 11:11:11 +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
