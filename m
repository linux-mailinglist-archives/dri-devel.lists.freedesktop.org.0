Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329862DB13C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 17:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918416E406;
	Tue, 15 Dec 2020 16:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E226E419
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:23:05 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d20so1955345otl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zZISEQ6HaMntdpVz1WaDdYPo6C8kVf283YLFSzfriUM=;
 b=aGhsu+R6PoTatiY/2mnKwNM6rELofqH7HMidkIdAPyiLPZVHQ6JS0sNLAKjV/jkJ+8
 XdbqU4LtFbgWDgh/fW2SdIAuF/BVx8G/ZBSLUD4L4VOHnwj1wlVtxFkUiQYCKJ8s8U7Q
 w8dSs4mtmwlZRDzNqnDYutM0jS4tzFBi2/RUqSdsTc/A42Ln3tmGRsSbPh5BMIenFGFr
 kcThaYLeOk4y7eO5GK7sI0HpW3DvwlsTjR0VGQlCS89D1d3SSy/tNXN1+Fe8LUC/x8Lb
 lZUhAuNNg8IJeQ3LZB/0fcrVKaiv1B2/krb6583r8r3J+fNLnfxKE/lZRIsdWzTcecyg
 c7HQ==
X-Gm-Message-State: AOAM533zvTQrB/5eX4+u2v3Yi3UNb1RUfe81mGOyObGEQgCJYRsatlQI
 MqgF+KTHrdmDTPn2ucfG4Q==
X-Google-Smtp-Source: ABdhPJycVMPcM/R+xT7/BKd+G6ZNUDi5ob1ruwngO2yqWJBZtYqftnv/DChHiD2lRHcGRL6DK+aT7g==
X-Received: by 2002:a05:6830:1501:: with SMTP id
 k1mr24289010otp.12.1608049384744; 
 Tue, 15 Dec 2020 08:23:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s23sm105865oot.0.2020.12.15.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:23:03 -0800 (PST)
Received: (nullmailer pid 3965708 invoked by uid 1000);
 Tue, 15 Dec 2020 16:23:02 -0000
Date: Tue, 15 Dec 2020 10:23:02 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 03/17] dt-bindings: mediatek: add description for
 mt8192 display
Message-ID: <20201215162302.GA3965660@robh.at.kernel.org>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
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
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 12 Dec 2020 12:11:43 +0800, Yongqiang Niu wrote:
> add description for mt8192 display
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
