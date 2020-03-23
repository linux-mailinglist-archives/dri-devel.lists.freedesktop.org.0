Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5C1900CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0C6E3AC;
	Mon, 23 Mar 2020 22:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492B66E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:01:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h131so16115180iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=moatfj5jRXvxhlq8xo+ssOSqLVqKCjMat/spioxEHRQ=;
 b=o2LuWSMc2gZ1iv2JZIy6laAZ2BVsLHKPYv+nxsEhsPSbRvwUH2f+Qrqyv9MONHQ+xE
 rP3ec+y26460RsgEc1lr6Yq32+hz6eMRcFoNp7iS6QVI3IQeWskwGiHVJeAORGiec6Up
 XybeE3YPn828hyytYbJYmYFDVfY0L74CNzZow9QgW/BGcpNrim8y+5WLcowd2PqQjHKh
 n7ps2vDdm4WcjCodvJ+9HB4oN4EKk9YOIeXmbQWaNgIZHN1tKWdFTwZlwoG+/J8WR8AG
 U3DZqZrXOg0rlUvXUMfUQ9odsbzVvthwJThRL//mR7XapX/0y07htODofFAmknOikkNl
 8LTQ==
X-Gm-Message-State: ANhLgQ0rdpznbS//HEcgXu2XOdEssokp0+ckbARugqHCBfFAs9SadNlM
 GU/GnPnjZNhCLhsF0YV1FOg0UsA=
X-Google-Smtp-Source: ADFU+vs3cAIQeBmF64VbdwUuHkyB7YPqQzyPHXQtO+XeMGCPFEMA01amQdtzhjE6hL2OYktO6iZcHA==
X-Received: by 2002:a5d:9f4f:: with SMTP id u15mr20642459iot.87.1585000874691; 
 Mon, 23 Mar 2020 15:01:14 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p70sm5645056ilk.53.2020.03.23.15.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:01:14 -0700 (PDT)
Received: (nullmailer pid 11664 invoked by uid 1000);
 Mon, 23 Mar 2020 22:01:12 -0000
Date: Mon, 23 Mar 2020 16:01:12 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: mediatek: get mipitx
 calibration data from nvmem
Message-ID: <20200323220112.GA11622@bogus>
References: <20200311074032.119481-1-jitao.shi@mediatek.com>
 <20200311074032.119481-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311074032.119481-3-jitao.shi@mediatek.com>
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
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 15:40:30 +0800, Jitao Shi wrote:
> Add properties to get get mipitx calibration data.
> 
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
