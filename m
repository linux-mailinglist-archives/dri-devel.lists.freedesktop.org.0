Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D1654716
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 21:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5F910E174;
	Thu, 22 Dec 2022 20:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9565710E174
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 20:26:26 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so1735242oti.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 12:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bNa5Kdmcwa+mXleBewekipXDfwkrNZzap+jetEOYl8=;
 b=bMfylRx2UO3R7yVMGznwt32uMjyhZYWWCN78SXd3E208g7eTuPPSccbeZD0Ks9bBId
 ndvU87nJlc65QILmECjk+gmetfydtJV2o7f7bQ6bTFB/RdNiNjYXi/LezMENzJilHACz
 21uWucX0CtZYK63Wbw4eYzVwfrrP6SYq7qy6SqGIuv7GoZXwB7wYQijucWMcvPonTyDc
 QisK+GWvNocX9TtNJntf2syYneWrqG4Qk6egarV/HqVTheaqIjhRVHpYHbsk/ynwWm7I
 P/NmYuKnvQYLjBvvdnZ8AU6j/CACoIfbovYE/qJmxo1wt0uOydmfL+jUQIWKGXWChOQB
 5uYA==
X-Gm-Message-State: AFqh2kpfhAw0dJmZmolh2sAXZ7dkVM5uk2ZOn2MzAG5JYPyupgjNkN6h
 qEddh8UBPPNgNg3aX18I3A==
X-Google-Smtp-Source: AMrXdXucxOZJROMeEnqXizAa6bJGOHQA+pgTrIZbg3P5Tml16wuho1SX/QIVObL8GR/stBrcV9KKJw==
X-Received: by 2002:a9d:6389:0:b0:661:dfeb:a975 with SMTP id
 w9-20020a9d6389000000b00661dfeba975mr3595710otk.32.1671740785784; 
 Thu, 22 Dec 2022 12:26:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e26-20020a9d6e1a000000b0066b9a6bf3bcsm758618otr.12.2022.12.22.12.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 12:26:25 -0800 (PST)
Received: (nullmailer pid 2066452 invoked by uid 1000);
 Thu, 22 Dec 2022 20:26:24 -0000
Date: Thu, 22 Dec 2022 14:26:24 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 06/17] dt-bindings: display: bridge: convert
 analogix_dp.txt to yaml
Message-ID: <167174078307.2066361.1514368429127273992.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <489e7bd3-fa26-885f-4104-8b0b29aa4f2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489e7bd3-fa26-885f-4104-8b0b29aa4f2b@gmail.com>
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
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, andrzej.hajda@intel.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 15:26:57 +0100, Johan Jonker wrote:
> Convert analogix_dp.txt to yaml for use as common document.
> 
> Changed:
>   Relexed requirements
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/display/bridge/analogix,dp.yaml  | 63 +++++++++++++++++++
>  .../bindings/display/bridge/analogix_dp.txt   | 51 ---------------
>  .../bindings/display/exynos/exynos_dp.txt     |  2 +-
>  3 files changed, 64 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
