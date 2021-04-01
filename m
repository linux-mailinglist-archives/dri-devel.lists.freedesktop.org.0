Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5723516A4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 18:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220FC6E1FB;
	Thu,  1 Apr 2021 16:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3D6E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 16:12:23 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so2076421otr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 09:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q6dkaX8MCC1QWlhms6LKLDJBhv8fv/w3cbDi9ipTADQ=;
 b=TaVo5MjiWSae7Nig1+tkAs+az8jn6kE5f1FEuWhrDIEYmsafdDoSAEFK36PoP3aR7A
 E774tSL/6RuMWnANdBDzck09BNaQGPiuEHGsk79JgFTiAvaC0Vf1NEKnEreaudeaGNBY
 By9BbZpL9ynmhNv9rlcipDjzMqpbiwAchnU5zGjOUEL/ffAJTqljT56ugMYGThxYk+th
 +ZxjjHuqKVrYlBXo+ONj9CEmln7tHSACFiOecAlKdOJe17Xywo37cPOtJZE+MblTMYz/
 FdB1V9Ft3fW9ztMbjvHcJHnmcOJyzyFyH5VNf/6MiaXpncKGhD7X+YYh4a1tZV3B60vS
 /LVQ==
X-Gm-Message-State: AOAM5315CcHrabfv7Ce7wx2BshnbZp+EDhPu5yvnsJJrhley7nDdtQAZ
 gU5Rn+oB1YMTC69iza3RwA==
X-Google-Smtp-Source: ABdhPJyQS8ZYJmHSsmQe0gtNV4ljM0aMybfxwE16FwmOSPgDHIGJQ6KTnf9NOVhz5wJMxvHIf5PcFg==
X-Received: by 2002:a9d:70cf:: with SMTP id w15mr7805191otj.283.1617293542965; 
 Thu, 01 Apr 2021 09:12:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e15sm1210740otk.64.2021.04.01.09.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:12:22 -0700 (PDT)
Received: (nullmailer pid 530912 invoked by uid 1000);
 Thu, 01 Apr 2021 16:12:21 -0000
Date: Thu, 1 Apr 2021 11:12:21 -0500
From: Rob Herring <robh@kernel.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: display: sitronix, st7789v-dbi: Add
 Waveshare 2inch LCD module
Message-ID: <20210401161221.GA530733@robh.at.kernel.org>
References: <20210331030550.119493-1-zhangxuezhi3@gmail.com>
 <20210331030550.119493-3-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331030550.119493-3-zhangxuezhi3@gmail.com>
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
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kraxel@redhat.com,
 tzimmermann@suse.de, zhangxuezhi1@yulong.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Mar 2021 03:05:50 +0000, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> 
> Document support for the Waveshare 2inch LCD module display, which is a
> 240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.
> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
> v2:change compatible value.
> v3:change author name.
> v4:delete a maintainer.
> ---
>  .../display/sitronix,st7789v-dbi.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
