Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C03D69D2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 00:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CDD6E9C4;
	Mon, 26 Jul 2021 22:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560E96E9D3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 22:51:47 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id o7so9279205ilh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S3bndg0PWQudUwiPkf5sUqdpIG+ck3mRjPX7ERfAv2Q=;
 b=nFkdB98JoYnLRhpYra2mlmcce2yLpI+vv09SAxQ9WCIG2Ecc35+O6ErTg96/KCyw00
 AJpNkdZw30kYNRdwSNWUO6NNqWtqYj60eD6KEfQ9rDi6WykZGqqFyfjl/msPoKpjCjUb
 WI/r3FHYxPXjeBT2S90jvscIrTm1++UtxnaPCiD52WgOcbEHcArwHuA+0Q0y4LSJriFG
 UKSVzG61X2w+Dez1C74UEh0wugn1nF/fbosaSMbVFLd5aXFnzxwPkpMG0lAbMqcTLoFM
 2MnE4IeqsvhRU8lS27Di4wlH/sW31grCL2u+g+OjlmsjCAER29FbsUHhSMM8bUb2ai9N
 eMKw==
X-Gm-Message-State: AOAM531z2lVDGS0opjuPDeThhLHwK2tksKm0ckzRXM71VExAQoMydyu1
 TCQ5eIdWTUWrYn/O0IS5Hw==
X-Google-Smtp-Source: ABdhPJwfeJyxBqy2HaHqECAN0ktYBYR14COcSSRH65EFa47QJYrfFtFduZWq+Frg6rRYYLxxQDCUKg==
X-Received: by 2002:a92:7b08:: with SMTP id w8mr14888807ilc.190.1627339906631; 
 Mon, 26 Jul 2021 15:51:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m26sm752777ioo.23.2021.07.26.15.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 15:51:46 -0700 (PDT)
Received: (nullmailer pid 1024213 invoked by uid 1000);
 Mon, 26 Jul 2021 22:51:44 -0000
Date: Mon, 26 Jul 2021 16:51:44 -0600
From: Rob Herring <robh@kernel.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add DT bindings for QiShenglong
 Gopher 2b panel
Message-ID: <20210726225144.GA1020985@robh.at.kernel.org>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-3-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725221527.1771892-3-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 01:15:26AM +0300, Artjom Vejsel wrote:
> Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3624363938dd..e7f3db118c5d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -244,6 +244,8 @@ properties:
>        - powertip,ph800480t013-idf02
>          # QiaoDian XianShi Corporation 4"3 TFT LCD panel
>        - qiaodian,qd43003c0-40
> +        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
> +      - qishenglong,gopher2b-lcd-panel

Does 'gopher2b' refer to anything besides this panel? If not, then 
'-lcd-panel' is redundant. Otherwise, '-panel' is redundant. Every LCD 
is a panel.

>          # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
>        - rocktech,rk101ii01d-ct
>          # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
> -- 
> 2.32.0
> 
> 
