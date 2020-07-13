Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660B21E41C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFF46E83E;
	Tue, 14 Jul 2020 00:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E326E83E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:00:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q74so15490128iod.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r50jI5Epw0T7cDrBuYpNQc5/XyysqitF1Jq+t5e3lPY=;
 b=pPatxHmd+l9vwC/+ezmItqyxhMhgF6LeUDMxJJXyXpGSYBXNzrFpnDtp7Bff+9439O
 c3zWFwlQxzjY76aUomCVARggNmvMMOemK5HUb2YUhCVnDRYjqyBFcVyhT24yDS8DtDGx
 1k35fc56wMemXQGM5Sm7p3Pjq0UqOzdCSVB2C/T5Xi63kO1GUruySU1WLQX/K1T1NSJb
 n5hDzqsPuHDnurrPMe6fgW51LJIcFPOXvbO17dGl6/yZ1rT/FnbIWhNe02494DHOmo0d
 AnqmtQNDAFaBqUHWfxSUe96uOiNqiGrhW/Z6gUbJIPqTdwI1SBsYPgpKwpeKaEUHw253
 OYaw==
X-Gm-Message-State: AOAM5309gu3ErxhBEbN2OA08/UKUDdnz6cKHPSZ3nDImxQyrD41czMQH
 jdTAkoMD86aVQQweqRBNoQ==
X-Google-Smtp-Source: ABdhPJxcHgRruhguDGNu6k2qR0/v1KiIrq65FIx7ah15DIRiQ3H45qmsicLZaH3RL4vu2TL7IsCS1A==
X-Received: by 2002:a02:6d1b:: with SMTP id m27mr2880785jac.129.1594684801021; 
 Mon, 13 Jul 2020 17:00:01 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b21sm8375281ioc.36.2020.07.13.17.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:00:00 -0700 (PDT)
Received: (nullmailer pid 962515 invoked by uid 1000);
 Mon, 13 Jul 2020 23:59:59 -0000
Date: Mon, 13 Jul 2020 17:59:59 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: renesas, fcp: Add resets and
 iommus properties
Message-ID: <20200713235959.GA962466@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
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

On Sun, 21 Jun 2020 03:47:29 +0300, Laurent Pinchart wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
