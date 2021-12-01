Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB424658B4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 22:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E366E8DD;
	Wed,  1 Dec 2021 21:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71B66E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 21:57:55 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso37206980ots.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 13:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=//K6WrNNdMpHYOkOWh74IhNe5APWD9tbaI8fuCB3qaM=;
 b=4b96RNbHT7iUuy0BBNn/9e9J6xpHLyXT0T34/JUhq/BQT34K3qMgkg9ekH4fkUnrmG
 pxzV7P/ijBU7oVmhNLPW99d6Ipt8OaiEbj8mSL3n6TYXlP8k+vuGrbWS7QybYc8RHvT0
 bzDiQn4KVp7O75YbyZdMPfCGiuDQEACfw69MVTTuzrghDB/Lcl77EGrJCl6ayp+0ei2v
 ih3l8z5NvP6JT3gh27Y/K01kIfXzTTRZfaep3m0MiYhPJjgK6CNeLp3MKMezOpBDzasf
 8LUXc624AH71jtkfGys7QTTDaF/8Xq6UiLN68L8TbUB1K/wEwRdV3OndjYregd+8uLVX
 5sBg==
X-Gm-Message-State: AOAM530wXQoRkVpXH7VPxbs5vVHiDGFNUGZctXJH725gMbKTMYrcTucg
 5pggqENqw2FbgptZA1oIgQ==
X-Google-Smtp-Source: ABdhPJxU0ByCUmBkqgOAJ1D4kaYrkltxru1tMYSyrRfbzYfu6ugRNzCqfZ2w09Xc+nuehdoGMGvvQQ==
X-Received: by 2002:a05:6830:4391:: with SMTP id
 s17mr8280415otv.118.1638395874824; 
 Wed, 01 Dec 2021 13:57:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u136sm479201oie.13.2021.12.01.13.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 13:57:54 -0800 (PST)
Received: (nullmailer pid 2750212 invoked by uid 1000);
 Wed, 01 Dec 2021 21:57:53 -0000
Date: Wed, 1 Dec 2021 15:57:53 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: sitronix,st7735r: Remove
 spi-max-frequency limit
Message-ID: <Yafv4ZJ1gDWgWDT5@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-4-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 david@lechnology.com, dave.stevenson@raspberrypi.com,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Nov 2021 16:07:54 +0100, Noralf Trønnes wrote:
> The datasheet lists the minimum Serial clock cycle (Write) as 66ns which is
> 15MHz. Mostly it can do much better than that and is in fact often run at
> 32MHz. With a clever driver that runs configuration commands at a low speed
> and only the pixel data at the maximum speed the configuration can't be
> messed up by transfer errors and the speed is only limited by the amount of
> pixel glitches that one is able to tolerate.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.yaml         | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
