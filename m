Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C2474BD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE5A10E158;
	Tue, 14 Dec 2021 19:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0131D10E158
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 19:25:06 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso22078464otj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 11:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ehX+3DJbXBjGHccd4UxxHLFi5H4zFHeokElr31tDsV4=;
 b=LNN8CFo58XJP7SsM8JocLNS1hz8rWkx8Ekj/J/Mg9KASSUBxwf3IX9N9UHfk/hftkV
 OOB+J5yXaP5Oj2UKNDufRS+T/mMHQGkv6c94zykOqn5UBhfpg1brAMCpVaDljgCZTxEX
 dHKxSDQg83O055yW7XsbMfH3AkhQjXaxo7eNuxqJW3pfDLaL2iiizL0hJNiSA+mzudwS
 MXg8mphXtWV6yQhM60/8j1PGgpqaWUF12HTIf9Vvt8fAjFkcNVK/B7UwYngYoNtNH6A6
 TMCDrSnLOUrQ7m9G4B4OmP26qI91RvmU9FNgf8JfrNauI4ZjEYVY1WKZoO2i6bqQwztC
 OVLw==
X-Gm-Message-State: AOAM531dLozz2dFjJpJtZL9WLcS+aI2ZEdgYMTNpI078XeuxjnuP1RwH
 El/pYQbYWo5GOwKNmzZ/Fg==
X-Google-Smtp-Source: ABdhPJwu1jtseHaGInt4Zd2I+MrBQntRx58iFI0349+rwEjHZmbf1ZznDQ8wYliHroSvnVQAj6PUHQ==
X-Received: by 2002:a9d:a16:: with SMTP id 22mr5901834otg.57.1639509906121;
 Tue, 14 Dec 2021 11:25:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y17sm141839ote.48.2021.12.14.11.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 11:25:05 -0800 (PST)
Received: (nullmailer pid 3763381 invoked by uid 1000);
 Tue, 14 Dec 2021 19:25:04 -0000
Date: Tue, 14 Dec 2021 13:25:04 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Message-ID: <YbjvkCChcK29D7WD@robh.at.kernel.org>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208104026.421-2-biju.das.jz@bp.renesas.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, tomeu.vizoso@collabora.com,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Dec 2021 10:40:24 +0000, Biju Das wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
>  * minimum number of reset for the generic GPU is set to 1.
>  * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
>    SoC-specific conditional schemas.
> v1->v2:
>  * Updated minItems for resets as 2
>  * Documented optional property reset-names
>  * Documented reset-names as required property for RZ/G2L SoC.
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 

Applied, thanks!
