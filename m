Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8D48BCB7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 02:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F92210E11F;
	Wed, 12 Jan 2022 01:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3810E11F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 01:52:09 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso921199otd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 17:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kEVlVJ4Edkop0dSQY1nK7II8j1hgTuqgH87pIrg722Q=;
 b=OV4/LErpxQD41Nxz9M19t4VQeXhWp9FH4GNwLvjsIo0UvcRaSdkO0pO1nA+DXQd5Qz
 n0MiGI+G62bCLXx64Foeg2g/6kP4OrNHz2/vNkMnkHBKPO4PrmbWOA1BLlX2Pewpqw6A
 IQyjb4PJdw3QJvX3T5CFzjeVrOMMsetyjkS1vlUvrGk9GR7bNR46YlsSHuqNocL0CT+t
 OTc0e45MXRFYrjWt2zjhRp62M1e024itg6Co5UjcWo71HIWb4PHayS/Fe/xsxTw9aPVy
 dS7E7CSiU+bNVVsAdpvtJNjmNy3akviXEz6nyrph+S+JRUOvvBkD+9xPLHUqL+7n3Cw1
 9w8g==
X-Gm-Message-State: AOAM53141bDxPAq26HHog9RcHbF8n/S3gRPaVX/ALaFNiOWlCU3M/WAa
 lW7JUhaIJ0QwrF6qYrtTiXgjRN7TeQ==
X-Google-Smtp-Source: ABdhPJz/lHZhoExKw+pEmYSTX9nMuZgv/vMzKp7Pn+A4p1zM//uhs61WzkSapB1XYHIPnLOJcX/J0w==
X-Received: by 2002:a9d:60db:: with SMTP id b27mr5245119otk.154.1641952328708; 
 Tue, 11 Jan 2022 17:52:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g2sm2293859oos.47.2022.01.11.17.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:52:08 -0800 (PST)
Received: (nullmailer pid 3900875 invoked by uid 1000);
 Wed, 12 Jan 2022 01:52:07 -0000
Date: Tue, 11 Jan 2022 19:52:07 -0600
From: Rob Herring <robh@kernel.org>
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: Add STARRY
 2081101QFH032011-53G
Message-ID: <Yd40Rxt3p7Dzuc4u@robh.at.kernel.org>
References: <20220107122208.3893-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20220107122208.3893-2-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107122208.3893-2-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, hsinyi@chromium.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Jan 2022 20:22:08 +0800, xiazhengqiao wrote:
> Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
> QFH032011-53G.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/innolux,himax8279d.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
