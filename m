Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0232F6A97
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 20:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269789B7D;
	Thu, 14 Jan 2021 19:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DF789B7D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:11:24 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id j20so6211696otq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 11:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJH+/RP8cD+cn+XHnaVewTvw/PKu6pAE6tZBSia24UE=;
 b=hA2U4stJbwlGApDppu+Mc3J1oZ8RCRAng0G/zW/W99mRqi4X4KJaqzzlRcMLeVh16t
 3OHvr20sl60Z8EUNcJLI3EC/F83XJGzlyOEypuoscwdGsQhJmwksw3s4SL6QuY4WlecY
 8UXcrO1h70m22LyXTNvaAjTmGEiKNsKKGjz20/Qj9GH3dG6kDPqmTZXOaXOWa2wZLGnI
 D7JlLrfsR2Um0pkB+WaZWMyNANtUJbDFNJVwNWIW/JwmBvigpK1I+BMVeCRgBphqZaeG
 brZM0A9AK/6It7+q/v9fd2YukIFj1JD5NfhwcmypvdBn4iWdVDjReU6O1fQvy3q+cyLg
 vkPg==
X-Gm-Message-State: AOAM533TK4SDvrrWeq1xzCYo/ZTLalk4+sri/DWQ/LZLO4NLVAy0iQPz
 8gt1B/Ju8/e1VsgHYfD7sA==
X-Google-Smtp-Source: ABdhPJyzqW5jSgIwdHBBZZDHiZ6CkCOObxHInv5OjKe74ArGH+HMT7Poink2jRgipIR7enRQx+r5Fw==
X-Received: by 2002:a9d:4c8b:: with SMTP id m11mr396885otf.319.1610651484287; 
 Thu, 14 Jan 2021 11:11:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v17sm1241102oou.41.2021.01.14.11.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:11:23 -0800 (PST)
Received: (nullmailer pid 3394232 invoked by uid 1000);
 Thu, 14 Jan 2021 19:11:22 -0000
Date: Thu, 14 Jan 2021 13:11:22 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v3, 01/15] dt-bindings: mediatek: add description for
 postmask
Message-ID: <20210114191122.GA3394181@robh.at.kernel.org>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Jan 2021 15:43:37 +0800, Yongqiang Niu wrote:
> add description for postmask
> postmask is used control round corner for display frame
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
