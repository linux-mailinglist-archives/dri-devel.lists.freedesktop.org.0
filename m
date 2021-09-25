Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A264D4184E4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 00:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289C6E484;
	Sat, 25 Sep 2021 22:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4256E488
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 22:16:36 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so12826995otb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 15:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FpW3DBFCE8qk3/WrOETm+elC+ikU+jNmzXfQ4H1gg0E=;
 b=r1cPJae/ECzPvXsQNrlW3KnZJp9goMDxLi9Y+qvwSaRReiiAfyAyT5aFKjZ6e8N601
 32S8VaOuUQeT1NfASLpRZH7YxkqnNALowfueJJXMdBOducGVhtrEd4KIP0E6PeEt2VaB
 h3oVLtKjTVYUsfZFZYogxF+DL8eHKCoPVpJjmhS0TKML1AsaChBcmg7zGC+u0Pdz3XGV
 SdEQvko8Z6AvLuuab27ozkf7LbBus1n0hx7n5beUvYZjKTjqUuwsf4gozgPbqQvQzKCQ
 bY3OloMNPTgOsSclVSMyrgCPUtn8eSExsuaCToJAs69S6wVStdPyYFpy4efldqlaLe8e
 IFxA==
X-Gm-Message-State: AOAM533N77duqXi6+m6URzGlUJ0Pi+rzfOqUQRI12AL5v22riM9Z3Gyi
 YSzGrdgevJP2BRoErf1wBQ==
X-Google-Smtp-Source: ABdhPJxDZmLtb6AEW6lYozXpuwFp7CVefOJn9HXZ8cCR5cQl8/2w5SChodyo8ByACA4nNEmpUmtxrw==
X-Received: by 2002:a9d:6c52:: with SMTP id g18mr10068166otq.75.1632608195370; 
 Sat, 25 Sep 2021 15:16:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 10sm587122oti.79.2021.09.25.15.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 15:16:34 -0700 (PDT)
Received: (nullmailer pid 3839366 invoked by uid 1000);
 Sat, 25 Sep 2021 22:16:30 -0000
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justinpopo6@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-media@vger.kernel.org,
 Doug Berger <opendmb@gmail.com>, devicetree@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Michael Chan <michael.chan@broadcom.com>,
 Russell King <linux@armlinux.org.uk>
In-Reply-To: <1632519891-26510-3-git-send-email-justinpopo6@gmail.com>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <1632519891-26510-3-git-send-email-justinpopo6@gmail.com>
Subject: Re: [PATCH net-next 2/5] dt-bindings: net: brcm,
 unimac-mdio: Add asp-v2.0
Date: Sat, 25 Sep 2021 17:16:30 -0500
Message-Id: <1632608190.786543.3839365.nullmailer@robh.at.kernel.org>
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

On Fri, 24 Sep 2021 14:44:48 -0700, Justin Chen wrote:
> The ASP 2.0 Ethernet controller uses a brcm unimac.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1532529


mdio@e14: #address-cells:0:0: 1 was expected
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-400.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml

mdio@e14: #size-cells:0:0: 0 was expected
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-400.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml

