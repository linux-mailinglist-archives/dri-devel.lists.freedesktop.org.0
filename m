Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB63FCD22
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 21:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86B89875;
	Tue, 31 Aug 2021 19:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8B16E051
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 19:01:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v10so705737wrd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GaO4Y8XjQpzWxvDdexo754mM2cY3NapS9Dixf6RCivI=;
 b=YUG3gg4HztKsujLCsWJkVM63g5Ld67nElGVgmaaKpnO00peskYekUXADHXQacrLLGZ
 o4kXYmPzBOKFaZilUon4gZHiF50Ky/lT2mqJjuPaMZ+J8UbDEvFQz6btJTc7yvwOjRm2
 MsPulb8kG37VQyBoPlAQ93dGI1slLOtc4kRiF7UBlHF8R4bsNs2nMQ/vG2vU4YOWWNPf
 aHuHQqGdNBST9fzF0d4kW3VGCet8xSyjzRnp5/WwZlcEmkIMlcudjGv2ljcmAfGiLiFz
 DsbIDLvg6yBpIL6zjIqn+Yxlo2uiGL8StBibDApyH4aHAgaaYWn6iEKqIBmQxbjM94Mi
 uXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaO4Y8XjQpzWxvDdexo754mM2cY3NapS9Dixf6RCivI=;
 b=SitvNqcEFDnLBQra6UeVWFhBf3x9b/bZiMu+jRxdbCOOF3WKWs+gNi2bL7+yXa0pz1
 l5RGpsMwOgPLUHmtGx3CAUvqoQ6paCKf1Cotk790Y9kBiFezI6T5Yxdc9414+oHmPLih
 /6GyXcjUpT1V/BXWqhVjux4Cckb1seTLjC4kYBr0dM9iswUrE5HqV0ugRNebVMajy/1A
 K27uqm2KBuGsHu+biJqsj7R7cd9GmFHlT5qIoEA8Wmwa+/u/LpsU1hU3UwbHyev7xdKV
 e5A6vGsRFqORhkzzo9Ls1mVz6d+RI7icX8XQofll9J9MzXafBsbLo1F/0PjGGtjo7I5c
 Ecsw==
X-Gm-Message-State: AOAM530hdsmB/3GK+9asrdLkaqxmvTJkZALjeXc1UBMTnDX9/FkoDpLU
 MG626V5KcNDsMZPd9oBqPbM=
X-Google-Smtp-Source: ABdhPJxOmIjlk4xNGEooBmwcvg3/uM6eZEOaaAuISu6L6yMnHMyNxJUsSeX6S3KIALWZ26cW9yF9cQ==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr33391524wrz.77.1630436464829; 
 Tue, 31 Aug 2021 12:01:04 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id j17sm18906057wrh.67.2021.08.31.12.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 12:01:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: caihuoqing@baidu.com, Cai Huoqing <caihuoqing@baidu.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:01:03 +0200
Message-ID: <3342147.tElmWuj8HH@kista>
In-Reply-To: <20210831135740.4826-1-caihuoqing@baidu.com>
References: <20210831135740.4826-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi!

Dne torek, 31. avgust 2021 ob 15:57:39 CEST je Cai Huoqing napisal(a):
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


