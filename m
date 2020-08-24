Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DD250BB4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 00:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D46E5CF;
	Mon, 24 Aug 2020 22:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117176E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 22:32:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z17so10461107ioi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 15:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7GOlv4yP4CAwOVfNjNFni4AU3fJZ+QQ+53L/TEB0AXc=;
 b=HY7Lmx9sY6M1rWcd8DGrMciiZzjeP5u8CsyNknp8r9HSTf0KeN8a1hNEzmKnQEjsCZ
 ra+TWCvLpCtnynpkyw/vh68BBovmjspzkRcsa52Dnghq/vGx1+9Ohy3LBeA+unBevIxY
 Y0WlFhxj9AIrNbpqxqWU1FfKWiRItxxyn4o35aIsEkrvN28Bwa/Wy+jv3j6VA3OTeRzI
 mSx4Q9WX2FCSbVM5NZ3o+x/RwTKxllI/K5Fqo31l2czZqWdeHRQUEhpsOidaQ2wvsdI8
 YYMaOym2AWpjcimk8pM20Bugkb2TsqimTm0ANRgaMnFzVr5AOFz7qkNELq+hZqz4MfMi
 N+/Q==
X-Gm-Message-State: AOAM5315ki4SGSJhJtzcOihYA0W8Jvy6sy2rtAAbRh0SDfEVYENAxmMJ
 TRCOa0tmsaWiGaAgeiAoJA==
X-Google-Smtp-Source: ABdhPJxzhnRw08Jdre0AL6bo7DaBmWE+/fpQBJIESCpHF83NqG/EcpDmuVtkbdbNlf83c5aoBf1LWQ==
X-Received: by 2002:a6b:6515:: with SMTP id z21mr6629569iob.71.1598308331437; 
 Mon, 24 Aug 2020 15:32:11 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id a9sm7452434iol.9.2020.08.24.15.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:32:10 -0700 (PDT)
Received: (nullmailer pid 3439585 invoked by uid 1000);
 Mon, 24 Aug 2020 22:32:07 -0000
Date: Mon, 24 Aug 2020 16:32:07 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v1 1/2] ite-it6505 change trigger conditions
Message-ID: <20200824223126.GA3434984@bogus>
References: <1597054312-25538-1-git-send-email-allen.chen@ite.com.tw>
 <1597054312-25538-2-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597054312-25538-2-git-send-email-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 06:11:15PM +0800, allen wrote:
> it6505 changes trigger conditions.

Patches must have a Signed-off-by with a full name.


> ---
>  Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 2c50016..bf0e889 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -73,7 +73,7 @@ examples:
>  
>          dp-bridge@5c {
>              compatible = "ite,it6505";
> -            interrupts = <152 IRQ_TYPE_EDGE_FALLING 152 0>;
> +            interrupts = <152 IRQ_TYPE_LEVEL_LOW 152 0>;

How does this have 2 interrupts which are the same irq number, but 
different flags?

>              reg = <0x5c>;
>              pinctrl-names = "default";
>              pinctrl-0 = <&it6505_pins>;
> -- 
> 1.9.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
