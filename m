Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E66DF9F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02D10E040;
	Wed, 12 Apr 2023 15:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253EC10E040
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:27:37 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id j12so8026482oij.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681313256; x=1683905256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tiFpq4sA6fF2BqfKkfUZ9e15UpII/FjS4nr1bHhOlg=;
 b=KCQpmJlCNoJfGJhitJblbdoeuZ7ZfotwfzwKx5QLF3pX//rLKW9WKUT+AHTzVbp36i
 5JVcs2p1mYf349aCdNN0Yo6B7UDEDRroGjj773MbABbkrymJAM5Nm3oIAA46ASsFQUP/
 2lyHBEUT0OzzjyMA4aiya13GjVQ912oG/BgPNhLB5rqYExtUldVvZOPXT3eLMz3HBgRs
 Q+5D4U3Ug+4eZVUZcCkNGLOxk/gsiM1BaQDGHscSN+pUpEVE+GL9QQz6P7UzW0/rcBCk
 t/YNeeLN3mqVAQP49+DH4GhboEaXZhxQP5VHcYjXFnOKaXBf3sX6ntBge0O94aIDHkR5
 jR1A==
X-Gm-Message-State: AAQBX9cA9bahUKUcZtz0UQNXdgtT4XN/c83saIba7D2jJ770Vi/ZVT0y
 xg4vpVLKj13A8JhTsWT38Q==
X-Google-Smtp-Source: AKy350YoAMV/LXroNkH2jnTpdDTQzSM2asaZ9ChKfH1V8B9f07g5rmSXyaEzhLtYdQjuxLfXEW9oWQ==
X-Received: by 2002:a54:4615:0:b0:387:7651:e117 with SMTP id
 p21-20020a544615000000b003877651e117mr2925397oip.0.1681313255931; 
 Wed, 12 Apr 2023 08:27:35 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 4-20020a4a1404000000b005413e617935sm7178594ood.15.2023.04.12.08.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:27:35 -0700 (PDT)
Received: (nullmailer pid 2465553 invoked by uid 1000);
 Wed, 12 Apr 2023 15:27:34 -0000
Date: Wed, 12 Apr 2023 10:27:34 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
Message-ID: <168131325440.2465494.3673756262949452214.robh@kernel.org>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 11 Apr 2023 13:08:04 +0100, Biju Das wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.
> ---
>  .../devicetree/bindings/display/renesas,rzg2l-du.yaml    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

