Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE33B92D4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 16:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFF36E02B;
	Thu,  1 Jul 2021 14:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4556E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 14:06:12 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id g22so7697700iom.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xxMOmmycUeqjkF6/9iAYY/xBPx+Z3Ak6vPJYeSn/FGU=;
 b=OgI3OS5roAlgNOwQS52J0bdGdaj5vw7pgsSoA2AR9iEYXt3RiirklJFAZMkdMGNGvO
 4RE8n9aFrj7+MyTwOoGNJ31yZ5JHTvlgfe5mA9wpZAEpadWYwYV6qiW2kBYuo9Kkxtnt
 XH4XtQPl8iT4Tjb494Aqi8pN3X8SLBYlYOrpNM6LxI9Ql5nhOPkHJOr1JiUPD2hvZ42L
 mtcwzER5YmBweycBMqH1c50MpPinwcjfl8Q03AngitOJEjb6GhhhOzimiAkS35DcjPnr
 6RBjeR4qwu3DQkibR3NZUJXlALwQkPTiafi2Q2QUDO7FeuafyrvPMOb41xn45vw74KJL
 ZOpg==
X-Gm-Message-State: AOAM531XP3q8NYD2LQtYZ4rVWhmPybdSJgdYuNUwPqUg1ztFMwBSYZg/
 J7H9+FgrLxdMkES7W5DFIg==
X-Google-Smtp-Source: ABdhPJx9rzkgIl+rsWHg19i2yFMTDtBgIlIZSmZtKkXMTMpHMTWA9yzsgev81Eq6wGhVWbaycaP2/g==
X-Received: by 2002:a05:6602:2be2:: with SMTP id
 d2mr12476469ioy.116.1625148371436; 
 Thu, 01 Jul 2021 07:06:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w15sm20298ill.84.2021.07.01.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 07:06:10 -0700 (PDT)
Received: (nullmailer pid 2284825 invoked by uid 1000);
 Thu, 01 Jul 2021 14:06:06 -0000
Date: Thu, 1 Jul 2021 08:06:06 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
Message-ID: <20210701140606.GA2284716@robh.at.kernel.org>
References: <20210623164308.2570164-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623164308.2570164-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Jun 2021 10:43:08 -0600, Rob Herring wrote:
> Fix the renesas,du binding 'ports' schema which is referencing the 'port'
> schema instead of the 'ports' schema.
> 
> Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
