Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496B3E3150
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 23:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6DF6E198;
	Fri,  6 Aug 2021 21:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D976E198
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 21:44:57 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id n19so14326688ioz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 14:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OiJRnkJaUjfv/aLiJhC4+fz+0EuCXrsBg4+ADr+wcwA=;
 b=UQ+qUnOolMuyBWz/yBNFk8uU96TXs/hWXVvChVINFKRCiYGk9pXt02/jAnj4USljqs
 ymfq2QxzW+PiYX2Y3KaegcaZ1ElXjNF1ABcHbX5QZMMkKz6hRgTsawGWJluxo5t4i5Dv
 eadrCMtwDv9tZ5EyKfKpfdoRYaqoaaCdT/eAgaQVSa09QR8xt7dyaWF6Fo0AurfCggdA
 1XfgKjBw5eDlCOKGdtU4NwvG0Mx4AKF4Ic37sKQl9Z1cBlQjYmuhG1fGq1i7ay+1zezp
 0xbqvmZ57Q/rdR4iUyLkwNMC5AMdLGBdYEXn2q3ui1XwXr6nLr9dcHRb8mwyqe3LAYlQ
 JgWQ==
X-Gm-Message-State: AOAM530H7nD3EyqkP3uqubEHoNgZXGLoBPvR3NCxtBwxExOJREIHa16O
 PFeuOuXnfVl8WUC8DI4sTQ==
X-Google-Smtp-Source: ABdhPJwLfIBh9khfUI7Z/9TbGgFOAVVJ+cjV1JQDbb3YB5JIM5Bc430e/apfLRVKBcGRXjsQfcPU9g==
X-Received: by 2002:a6b:ba02:: with SMTP id k2mr575119iof.164.1628286296708;
 Fri, 06 Aug 2021 14:44:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f5sm5329303ilr.72.2021.08.06.14.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:44:55 -0700 (PDT)
Received: (nullmailer pid 1858212 invoked by uid 1000);
 Fri, 06 Aug 2021 21:44:54 -0000
Date: Fri, 6 Aug 2021 15:44:54 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add Zhishengxin
Message-ID: <YQ2tVnKsLNTn4tUF@robh.at.kernel.org>
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-2-icenowy@sipeed.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802063538.75583-2-icenowy@sipeed.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Aug 2021 14:35:35 +0800, Icenowy Zheng wrote:
> Shenzhen Zhishengxin Technology Co., Ltd. is a LCD module supplier.
> 
> Add vendor prefix for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
