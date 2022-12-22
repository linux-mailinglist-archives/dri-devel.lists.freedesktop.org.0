Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620CC654717
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 21:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AD110E57C;
	Thu, 22 Dec 2022 20:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7F110E57C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 20:27:22 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id c129so2955617oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 12:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifO+UAb4xNHYoZtmeqbH6nY6NZq3pB8gzBwpCbepYe8=;
 b=N2pGU9nVV16vrikcSexzv44VBZbQ153eprxku3n5P+UUha3Jc83D7atERA97kNd1+s
 npAlTtdXTbcl8/adkwXubxY8/HaUQR8dek7zTc5TG/OyO4vObdOplayn+tCqO6WrXkMx
 llSTuoC2twa8wbROl2aZBzQTFTig4fWBYgVzEZoJ0vcVXhkCSg18tzAfy6DsNjdQ2qhp
 fUT1NWIZOnkN72TRQ//KfAgVYKm7SnWuurJyM16N1BQ0gcC/dK5HPETyrsmsbpH19nPL
 Klkvu52flndRXzwMHO+qfh+0DxzxhCX++/RbtXQdw2kJ9ZqZacWaLly2Jy3i86aGfRm8
 UMnQ==
X-Gm-Message-State: AFqh2koZhUNbHSXLVvF7ICo8ttomok6iFWxlWyVofy4gyxHOjAmZpt0J
 J+Rqxx7KJC+iln+tfd8Kpg==
X-Google-Smtp-Source: AMrXdXsNV2YU4gEBnEdlry3c9jg4+8vMg41WSp11kX/VLN3MsjK7Vxqq46+/Co64urW6ujdTjBb0Fg==
X-Received: by 2002:aca:3205:0:b0:35e:b08e:13e with SMTP id
 y5-20020aca3205000000b0035eb08e013emr8711520oiy.18.1671740841648; 
 Thu, 22 Dec 2022 12:27:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05687014c100b0013b92b3ac64sm687863oab.3.2022.12.22.12.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 12:27:21 -0800 (PST)
Received: (nullmailer pid 2067521 invoked by uid 1000);
 Thu, 22 Dec 2022 20:27:19 -0000
Date: Thu, 22 Dec 2022 14:27:19 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 07/17] dt-bindings: display: rockchip: convert
 analogix_dp-rockchip.txt to yaml
Message-ID: <167174083761.2067426.17125312795413534693.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <88a5a9e3-9bc8-5966-22ec-5bdb1fa7a5b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88a5a9e3-9bc8-5966-22ec-5bdb1fa7a5b1@gmail.com>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 alim.akhtar@samsung.com, linux-samsung-soc@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 jonas@kwiboo.se, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 15:27:35 +0100, Johan Jonker wrote:
> Convert analogix_dp-rockchip.txt to yaml.
> 
> Changed:
>   Add power-domains property
>   File name
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../display/rockchip/analogix_dp-rockchip.txt |  98 -----------------
>  .../rockchip/rockchip,analogix-dp.yaml        | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
