Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810332DDBE2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 00:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217CF89174;
	Thu, 17 Dec 2020 23:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ED289174
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 23:32:55 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id j21so138560oou.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o4L0zUoStNxiDtZzdNvMrXS5I8joaFoyrOYrSbDzU7Y=;
 b=Xg6iQl9pZLXq+Kc5caL5RBxMUnvSAJScWezTF3hPma9ry+LsuopqkITiS7rkaIucI5
 IQzuuq4G872vcvv4Ck2RAayqu9x4hjgk2Wo43iBIdY40p9ShFjJ9xyNqIbNS8AFCt46g
 +7rriaWBjyKkzfWPgbLcCi95GXRyzNHK9XsP/33+/kcfaY4m2VVasTImQ9ECvcEQSC5G
 T8Auy1JE6m6eM5tC5kgQV7cGiSUIvVqbbT66AV4Y1YWtnNksFo1EMbCzl05ECJgv0Bnu
 oxOVRHDqiZsSirIq562wh4y+y5H8qBGgzf3FRr/Hu0LUEWRh4Io1CVIthkRaor0f+Cwr
 Onww==
X-Gm-Message-State: AOAM5325NFuqBkLRYZsqFahJz9sgvptvrauKsFeqXd2zfj30ckECv0nu
 RsPEC8kXlGrd3oHOjR/IQA==
X-Google-Smtp-Source: ABdhPJzaBWJNWUTtE+/q4T84oos6G4Nn+YvDFEQnYXoZcyVBoreAhzuzCgsUr1Co/9gdgApUzXk1mQ==
X-Received: by 2002:a4a:a289:: with SMTP id h9mr1050535ool.86.1608247974608;
 Thu, 17 Dec 2020 15:32:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm1562806ood.35.2020.12.17.15.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 15:32:53 -0800 (PST)
Received: (nullmailer pid 431228 invoked by uid 1000);
 Thu, 17 Dec 2020 23:32:52 -0000
Date: Thu, 17 Dec 2020 17:32:52 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas, lvds: RZ/G2E
 needs renesas, companion too
Message-ID: <20201217233252.GA431179@robh.at.kernel.org>
References: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Dec 2020 00:59:27 +0200, Laurent Pinchart wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Document RZ/G2E support for property renesas,companion.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Slight reword of SoC list in description
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
