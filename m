Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1041F495F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 00:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E26F6E34A;
	Tue,  9 Jun 2020 22:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207676E34A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 22:29:44 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p5so43707ile.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 15:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9eU1Sl59BWMKbsH7yc0Bp/cm9dp+5d5ACrcNSF2dGl8=;
 b=eF+feohC1LnWcHszkA0TpAsxxPsxUK1e2YIkl7MmTIrDHO9DctsOJ4pjcQdu2yc8Xz
 d6TTN06R3+oHWigarYzoy18vUhUdryyxoTExG0mK9Jg96wdf5/sxTltkAllv6LoAUsiu
 /orZXaIt1Iog2yTC8MC4ucPrPU5iIs1/QyL5Tnun4PJ2dF85DcrRjtC8jGlgcLajNitC
 /7AV0N1JQlhFVRSDGL9WJWJQ2BcEE8XeySiYDD7n7FydvLmUAacjC1s4J/lRfrx2WQWP
 ilTbG2ivbqj1Bgsd8iUSXnEw49EWuI9fErYoTR9dv9MAmpTvLblvrb3OPxOPFZ8zDtZf
 dEtQ==
X-Gm-Message-State: AOAM532adrjCNeQDcxvSCh17aJFyMaS0JRreg5os+o3msMAgykLylYXK
 6t5iTT6inS9SeUXaAwMu0g==
X-Google-Smtp-Source: ABdhPJy9gLy7HLB8sb8E6mMuJ54nlVrugw1RL8A1/F9Bo4vWIw8hU0kDTJ/yXcE9XNRyKoowjpueIw==
X-Received: by 2002:a92:d0cc:: with SMTP id y12mr215972ila.308.1591741783371; 
 Tue, 09 Jun 2020 15:29:43 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id d71sm10210309ill.9.2020.06.09.15.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 15:29:42 -0700 (PDT)
Received: (nullmailer pid 1615866 invoked by uid 1000);
 Tue, 09 Jun 2020 22:29:42 -0000
Date: Tue, 9 Jun 2020 16:29:42 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple: Add koe, tx26d202vm0bwa
 compatible
Message-ID: <20200609222942.GA1615808@bogus>
References: <1590991843-24231-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590991843-24231-1-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-imx@nxp.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Jun 2020 14:10:43 +0800, Liu Ying wrote:
> Add compatible to panel-simple for Kaohsiung Opto-Electronics Inc.
> 10.1" WUXGA(1920x1200) TX26D202VM0BWA TFT LCD panel with LVDS interface.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
