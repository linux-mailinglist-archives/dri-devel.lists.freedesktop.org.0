Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22968A186
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F60B10E84C;
	Fri,  3 Feb 2023 18:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4910E84C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:22 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 14-20020a9d010e000000b0068bdddfa263so1610978otu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKqTtd06uef5ibtsjMifbrRQEy2r/fkXlh2L538fCSc=;
 b=M/YGHN4spjoRTw/KDD8PgKoXcpGrjRc+vHYC+AU2fpJorWhd0H/HWLW9jcpWcgSeYW
 CCkHmJ6fAE3cQmJms96IdWIS+wgfW4yQNyRnKppCUj7CvfGeWyOxoYXRDX05PutD9hE+
 MtOXVif42X+1e4o9kKoWYDm1SUJK0kbao4cz95OoXwuwGPEv9UJF+79MpPb5Odg7el2f
 pmY4mw6U5u10QYrWHT/h/Lfhsp8Ee6GtII4bz0AHj+EKvbkrSwp//47UmFXpjvav8g0Q
 qRM5xGGT8If/Q3xAmSGHeQILFb8IdJMwoQr9KY12s5kM8VKKxgFaTO6m+DD37IAB0caG
 SrQw==
X-Gm-Message-State: AO0yUKVwoXAolw2WCIbZURSJNAvhw2YQelg60lZIqyPtopt4ETY+ZH8V
 rBKll7f00t7nRFwhvPFs2w==
X-Google-Smtp-Source: AK7set+8hw6nat6H4DhyX2Limgqmen5W+zGdMAXZEu5LDxHEuhE4wlDY9lWj4NXoZichwA+bz/wc3A==
X-Received: by 2002:a05:6830:1e84:b0:670:9610:1ce4 with SMTP id
 n4-20020a0568301e8400b0067096101ce4mr6394077otr.24.1675448481741; 
 Fri, 03 Feb 2023 10:21:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05683022cc00b0068bcf7995aesm1367341otc.64.2023.02.03.10.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:21 -0800 (PST)
Received: (nullmailer pid 617539 invoked by uid 1000);
 Fri, 03 Feb 2023 18:21:19 -0000
Date: Fri, 3 Feb 2023 12:21:19 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Message-ID: <20230203182119.GA615242-robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, sw0312.kim@samsung.com,
 hjc@rock-chips.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 22, 2022 at 03:22:14PM +0100, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changed V3:
>   Filename matching compatible style
>   Drop "Regulator phandle for "
>   Specify properties and requirements per SoC
>   Sort order and restyle
> 
> Changed V2:
>   Fix title
> ---
>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>  2 files changed, 170 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt

What's the plan for these patches? Don't see them in linux-next still. 
Do you want me to take patches 1-8?

Rob
