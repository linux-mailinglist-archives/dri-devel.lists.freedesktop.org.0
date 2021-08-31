Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606683FCAB9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614A6E0D6;
	Tue, 31 Aug 2021 15:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563C6E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 15:21:22 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso23268551otp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 08:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iydkFq95FEpeivoCRrL3REow4ynVkrvAtNhFWXbXqTc=;
 b=guv4zM6zzJYzEMWlR0W3kgvrTMm0RSiyZ+XHU/bK9RS62SvV1HZ2xJaaraGMvlAy3C
 w82+3gjCVUA1gkx3UvM/2PU5F7pyWlFuWqEL3vPuP8FD75Re+FLhormnKh6TXTNiM+mP
 +zRZP8t8mc2SMH6BKF3d1VPp06BiMhtqUu+B2i1t3H0+i5RPdmrEZI80v5oIac+BSEDJ
 KeI+bJ3do43x3KCVxsDbP5x1w2KbTs/psYgU8FHB1bX2MIKZA1nt29Cb/DeXNjvDWRPr
 Mjhm5ypUcGd2m0I8XyVMnodAob1sLJ4HI4cLjdY1MuGadtQzE3g8MMdPrrRD1oeUpBZd
 uw3Q==
X-Gm-Message-State: AOAM533dW0QUrkXinTmxeWa4Av9Vk0cI66fpEtB2vZdO+cVr5RTkdL9/
 VP0gZxuKO5pFhdzX4vpaag==
X-Google-Smtp-Source: ABdhPJzdVROAeEU60vayUamOQJIwnsjKstVyAXj2+wmKDPAnvUXvFgPYR3Q3dX73SimpxZFuMmoWhQ==
X-Received: by 2002:a9d:d35:: with SMTP id 50mr24066094oti.22.1630423281834;
 Tue, 31 Aug 2021 08:21:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f126sm3711466oob.9.2021.08.31.08.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 08:21:20 -0700 (PDT)
Received: (nullmailer pid 181416 invoked by uid 1000);
 Tue, 31 Aug 2021 15:21:20 -0000
Date: Tue, 31 Aug 2021 10:21:20 -0500
From: Rob Herring <robh@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel@ffwll.ch, Shawn Guo <shawnguo@kernel.org>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, wanghaibin.wang@huawei.com,
 robh+dt@kernel.org, Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: remove zte,vou.txt binding doc
Message-ID: <YS5I8OHKifmH9N/O@robh.at.kernel.org>
References: <20210831034924.86-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831034924.86-1-yuzenghui@huawei.com>
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

On Tue, 31 Aug 2021 11:49:24 +0800, Zenghui Yu wrote:
> The zte zx platform was removed in commit 89d4f98ae90d ("ARM: remove zte
> zx platform") and the zxdrm driver is going to be removed in v5.15 via
> drm tree. Let's remove the now obsolete binding doc.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  .../devicetree/bindings/display/zte,vou.txt   | 120 ------------------
>  1 file changed, 120 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt
> 

Applied, thanks!
