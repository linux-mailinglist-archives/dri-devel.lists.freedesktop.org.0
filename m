Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A856A33CC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 21:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2694610E04E;
	Sun, 26 Feb 2023 20:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A11710E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 20:02:38 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id l2so2931711ilg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 12:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akmCneyUMoB8ho3IxV5YT6+TaNRpqIoh4jeP/iFgTzM=;
 b=xGjsWv6P2zosRjERIxBjPrbWXqEW7Hozm2mh+Ew9jlAHk+wZpR4QlIJPbOyUaNjjWM
 5SfRK2fix5xqnhbCPgKUD1Ikg6oi9bFoPJtvguquotuaFhFp2wGB3qPmIs3svBlV7Rbi
 iQQZTL3FW4Kj1tX1SEZngie3ovMCuQeC/EOv6qIEvJ4e4URMh8sF1UyTvIvycVElKKxd
 mWCiEpxq0lQc1imPBRp9+tDlRX9IvdjLvoB68SeW6kO/Z5tgUUZGzUpemo93H5AdBIV1
 f7vDzFQkTYz67TZJjGF9iMTjacK603ScsWYYdbEApsN9yV5+H1daGrUz8+le33T1D8cx
 zMJg==
X-Gm-Message-State: AO0yUKVBSY6gla9slN7uS5Fk57gTC4DP4IyKKmGgq0iB7xzQGlHJ1qBx
 cSLlhQj41/CNCTCTeqh+Uw==
X-Google-Smtp-Source: AK7set9NcSH7qwXuci8LROpmt4HvuuYoxFWgH8IKSb8xJtVSQoQMqOy7G4TeoDJJ/YuUAsSPj7JkQA==
X-Received: by 2002:a05:6e02:219b:b0:316:d855:fd25 with SMTP id
 j27-20020a056e02219b00b00316d855fd25mr18185646ila.21.1677441757770; 
 Sun, 26 Feb 2023 12:02:37 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a02a696000000b0038a5b48f3d4sm1513448jam.3.2023.02.26.12.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 12:02:37 -0800 (PST)
Received: (nullmailer pid 223061 invoked by uid 1000);
 Sun, 26 Feb 2023 20:02:33 -0000
Date: Sun, 26 Feb 2023 14:02:33 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: Start the info graphics with HS/VS
 change
Message-ID: <167744116816.210331.16899551131386757148.robh@kernel.org>
References: <20230221200407.16531-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221200407.16531-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 21 Feb 2023 21:04:07 +0100, Marek Vasut wrote:
> The VS signal change is synchronized to HS signal change, start the
> info graphics with that event, instead of having that event occur in
> the middle of it.
> 
> Scope trace of DPI bus with HS/VS active HIGH looks as follows:
>          ________________...__
> VS...___/__         __        \______...
> HS...___/  \_______/  \__...__/  \___...
>         ^                        ^
> 	|                        |
>         |    Used to start here -'
> 	|
> 	'--- Start info graphics here
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/panel/panel-timing.yaml  | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

