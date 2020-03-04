Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF0179572
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 17:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4AF6EB3E;
	Wed,  4 Mar 2020 16:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E14C6EB3E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:35:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i14so2631124otp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 08:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h1Gvo7Uhl99kC+f2DHRk2dtpXA+8wwG3dDT0Nr8Q1sw=;
 b=CGuekwxedVKtN/uhVclNzBJprGWif/fKCOwOlZYRaDEphfr677mpQxZfd7mkSVqh6V
 fPkOQbVfuPiCCaeYX289DOxsax3juPt/zQr1ucu1M9aFoRgW2+ldXx9IHyep5pFP8B01
 tR8p/HuGlOKdbIN+M2MnDg3ZJWSMJ9EkTbXWUxLL7T6g9/fM9zlKNqHB6uDeaD0SpM8c
 G7/iKCUVkWatQu1nrxWsgDEELjHVRV2Acdl3pqquD2ymKHplUtMAemITWgTVZAP1AS1+
 015gzinfU00OLqGWuWgGxbO4l8FRRNR8DCJLBaoFTEK6gB4hHhIWyvug2e0R3SUUcAUT
 U+2Q==
X-Gm-Message-State: ANhLgQ0kkQ5X9UaiqmxhMUKIbCbZQbFtjuY2MnHP+hSQGBZndQ4DGb0h
 A5H5k/TbOhIDkx947AWtFw==
X-Google-Smtp-Source: ADFU+vvs0zKwSe7pdBbmhxfAEsM04vKmv9ZOGaPA/anuEGyMrANs8OpulogLb0VTYVxwyF6vIThI4w==
X-Received: by 2002:a9d:aa7:: with SMTP id 36mr3152106otq.52.1583339739892;
 Wed, 04 Mar 2020 08:35:39 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p24sm4959687oth.21.2020.03.04.08.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:35:39 -0800 (PST)
Received: (nullmailer pid 22504 invoked by uid 1000);
 Wed, 04 Mar 2020 16:35:38 -0000
Date: Wed, 4 Mar 2020 10:35:38 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Elida KD35T133
Message-ID: <20200304163538.GA22445@bogus>
References: <20200229151506.750242-1-heiko@sntech.de>
 <20200229151506.750242-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229151506.750242-2-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 francescolavra.fl@gmail.com, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Feb 2020 16:15:05 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The KD35T133 is a 3.5" 320x480 DSI display used in the RK3326-based
> Odroid Go Advance handheld device.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/elida,kd35t133.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
