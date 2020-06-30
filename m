Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA42104AF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C026E81E;
	Wed,  1 Jul 2020 07:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45CE6E121
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:49:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t25so19646914lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
 b=mJ07pMpRasorccttMvFeublKoWgl6moNVn/kgRrhUYBKSPeNY6rlr4P90R/rf/X6Fs
 /NQZ0KmwuJcIXRAdIjBzw2+q6vhzL3LoPDZRO161GLz4XO+AZrzR46hvG8LVrw1Y4ceE
 IaMvm2G+KzJPo4OkJTSvlAH797zL8HN47VvcJ4+BUXS9xv0CQo1pN8mESaMjTfssYcVz
 9pvQ2yQCtTxjHnrYX7GDwTj2qit7e4gPtLvL+jmtwoDtW8a47FNRiBYFzZZztab2W2fB
 2YsPMBa1nrbTBiDujLWmHYEQnyLEJKucC6nGdR+pntm8MWHjRyT7H7vCZZ2Yfe+8Gsu8
 KTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
 b=T611EyXbMv8K+p2b1p/N5IFCjd/I4MMjQ1Urgq+LIBSpLpUyQ5+QS6IW9s4G7Da2zM
 tuqTLgI62F0CORM/jtuWaL3Wy6XYI6W8HLn7Tu2+48J4g9cLSEOpVyxJeE3/pitt/5P+
 PXSexXqCUGvYqzxnA+1pMdQNAzNV1boJZFkH8t3h0MSPb7/IaefJpz20N6ZP6LGsOYMK
 YVG658hAMqgS/e2Qi6JYVPN4t4H2ZIXB1xYllOMYkLsByPOCGx4zIGnDf8IGTGL59Pb6
 qfXzDEfPSM9CzPLdP4bXKguM99Hr+PcZXzUh2qJ3WbUpwbsv4i2MXj94v+jH6xn9dPkX
 TPiQ==
X-Gm-Message-State: AOAM5314lZm+pfRrmz/oh8ZQeqNL9ygC/Z2DjSQCDob25fB/ewRT8zvA
 L8DjI4DnFQKD5bF6FOSUDZCj1w==
X-Google-Smtp-Source: ABdhPJwzNlAKj3F1zAIxQkau8KUphOIgeVAY6ZwKxOS0S8DxDn9IFc3GL96+N5Cq6VTL2/fqCBdQZw==
X-Received: by 2002:a05:651c:284:: with SMTP id
 b4mr508659ljo.283.1593550190979; 
 Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id a9sm1083806ljm.84.2020.06.30.13.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:49:49 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: media: renesas,fcp: Make
 power-domains mandatory
Message-ID: <20200630204949.GB2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for your work.

On 2020-06-21 03:47:28 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> =

> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,fcp.yaml
> index 9241bf3c5efc..eeca7e255420 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -38,6 +38,7 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - power-domains
>  =

>  additionalProperties: false
>  =

> -- =

> Regards,
> =

> Laurent Pinchart
> =


-- =

Regards,
Niklas S=F6derlund
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
