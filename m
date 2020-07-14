Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E821E42C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4722A6E841;
	Tue, 14 Jul 2020 00:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4F16E841
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:00:54 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i4so15422438iov.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wOPuVYur6h8tuyAKAZ1vKNn4igamlbQJNCJ8CthEK9o=;
 b=LD2cEnJZwhe6i1ovQIfe/B6fHmlZnZ35KByagUP2FhEOOy9UHdEyjBNdydBg8z8tla
 ABXSxGCEenSovQAJb4UTKFJln6C/WTjJHQ90TcAxtqQ9p+mcJ+fOePvypIiR+q0RZITF
 A6GksVMiAes4wV25URJEKyx/G0Gyx8+Upv8z/SzM04jyb/1g8e7nQFo9pJKYPeCrKPB9
 xOBKVgHp3KF4siG3ZRmIt9vyMRblClg0GUgNG8vP2EhZIMYFPJCkA3sTNVfCIL3mACx6
 e21+YfDZWQcqHytvLap6WS5vGR60uXXvjfNZc3+FFv/OmQBT8B3edubndYh5teXF3nFJ
 bhQA==
X-Gm-Message-State: AOAM532St1mRAbZ/QA4hyXl4H7s4V7DC4v+5AnS8IcrPY2GlIKbFf/eS
 T2wbkQOnVO5ADcbvr3+aTA==
X-Google-Smtp-Source: ABdhPJzqkzoJOe6HxuTu9/O3zaXXkH9kNdURxoB0nBYzqptKaxDCYSKjt/2MsFlcwPFoYckHKi8J8A==
X-Received: by 2002:a5d:96d7:: with SMTP id r23mr2300768iol.126.1594684854173; 
 Mon, 13 Jul 2020 17:00:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u6sm8919814ilg.32.2020.07.13.17.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:00:53 -0700 (PDT)
Received: (nullmailer pid 963897 invoked by uid 1000);
 Tue, 14 Jul 2020 00:00:52 -0000
Date: Mon, 13 Jul 2020 18:00:52 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: media: renesas, fdp1: Make
 power-domains mandatory
Message-ID: <20200714000052.GA963826@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Jun 2020 03:47:31 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in comment message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
